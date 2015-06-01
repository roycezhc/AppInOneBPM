using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class Admin_AU_POWERDICEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_MDLPOWER_DIC valObj = new SYS_MDLPOWER_DIC();
    public int count = 0;
    protected string title = "";
    protected string mdldir = "";
    Dictionary<string, string> dicCtrl = EnumInfo.OprCtrlTypeDic;
    Dictionary<string, string> dicCtrlDeal = EnumInfo.OprCtrlDealTypeDic;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        info_div.InnerHtml = "";
        if (!IsPostBack)
        {
            if (Request["MDL_ID"] != null)
            {
                txtMdlID.Value = Request["MDL_ID"];
            }
            foreach (KeyValuePair<string, string> v in dicCtrl)
            {
                selCtrlType.Items.Add(new ListItem(v.Value, v.Key));
            }
            foreach (KeyValuePair<string, string> v in dicCtrlDeal)
            {
                selDealType.Items.Add(new ListItem(v.Value, v.Key));
            }
            try
            {
                if (!string.IsNullOrEmpty(Request["keyid"]))
                {

                    valObj = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).GetRowData(SYS_MDLPOWER_DIC.Attribute.DIC_ID, Request["keyid"]);
                    if (valObj == null) return;
                    txtDIC_NAME.Value = Convert.ToString(valObj.DIC_NAME);//Convert.ToString                
                    try
                    {
                        selCtrlType.Value = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString                
                    }
                    catch { }
                    txtDIC_CODE.Value = Convert.ToString(valObj._DIC_CODE);//Convert.ToString                
                    selDealType.Value = Convert.ToString(valObj.DEAL_TYPE);//Convert.ToString                
                    txtMdlID.Value = Convert.ToString(valObj.PAGE_URL);//Convert.ToString
                }
            }
            catch (Exception ex)
            {
                info_div.InnerHtml = ex.Message;
            }
        }

    }
    protected void btnAddContinue_Click(object sender, EventArgs e)
    {
        try
        {
            SYS_MDLPOWER_DIC valObj = new SYS_MDLPOWER_DIC();
            if (txtDIC_NAME.Value != "")
                valObj.DIC_NAME = Convert.ToString(txtDIC_NAME.Value);
            if (selCtrlType.Value != "")
                valObj.CTRL_TYPE = selCtrlType.Value;
            if (txtDIC_CODE.Value != "")
                valObj.DIC_CODE = Convert.ToString(txtDIC_CODE.Value);
            if (selDealType.Value != "")
                valObj.DEAL_TYPE =selDealType.Value;
            if (txtMdlID.Value != "")
            {
                //valObj. = Convert.ToDecimal(txtMdlID.Value);
                string url = BLLTable<SYS_MODULE>.Factory(conn).GetOneValue(SYS_MODULE.Attribute.MDL_ID, txtMdlID.Value, SYS_MODULE.Attribute.PAGE_URL);
                if (!string.IsNullOrEmpty(url)) valObj.PAGE_URL = url;
            }
            if (!string.IsNullOrEmpty(Request["keyid"]))
            {
                valObj.DIC_ID = Convert.ToInt32(Request["keyid"]);
                count = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Update(valObj, SYS_MDLPOWER_DIC.Attribute.DIC_ID);
                info_div.InnerText = string.Format("修改成功，记录数{0}，记录：{1}", count, valObj.DIC_ID); info_div.Visible = true;
            }
            else
            {
                count = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Insert(valObj, SYS_MDLPOWER_DIC.Attribute.DIC_ID);
                info_div.InnerText = string.Format("添加成功，记录数{0}，记录：{1}", count, valObj.DIC_ID); info_div.Visible = true;
            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        if (lstCol[i] == SYS_MDLPOWER_DIC.Attribute.CTRL_TYPE)
                        {
                            val = EnumInfo.OprCtrlTypeDic[val.ToString()];
                        }
                        if (lstCol[i] == SYS_MDLPOWER_DIC.Attribute.DEAL_TYPE)
                        {
                            val = EnumInfo.OprCtrlDealTypeDic[val.ToString()];
                        }

                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
            }
        }
        catch (Exception ex)
        {
            info_div.InnerHtml = ex.Message;
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        btnAddContinue_Click(sender, e);
    }
}

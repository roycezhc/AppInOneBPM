using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.DAL.Base;
using AgileFrame.Core.WebSystem;

public partial class WEC_REQUESTDefault : BaseAdminPage
{
    WEC_REQUEST valObj = new WEC_REQUEST();
    int count = 0;
    public string keyid = "", kind = "", appUrl = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        appUrl = WebHelper.GetAppPath();
        HttpCookie linkTab = HttpContext.Current.Request.Cookies["LinkTab"];
        string vale = HttpUtility.UrlDecode(linkTab.Value);
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;

        if (!IsPostBack)
        {
            WEC_REQUEST cond = new WEC_REQUEST();
            cond.AID = Convert.ToInt32(userBase2.Curraid);
            cond.af_WhereSQL = " and kind<>'-1'";
            txtMEMO.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.TID, WEC_REQUEST.Attribute.TID, WEC_REQUEST.Attribute.KEYWORD, null, cond));                         
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.STATUS));
            try
            {
                cond = new WEC_REQUEST();
                cond.AID = Convert.ToInt32(userBase2.Curraid);
                cond.KIND = -1;
                valObj = BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(), cond);

                if (valObj != null)
                {

                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                

                    txtKEYWORD.Value = Convert.ToString(valObj.KEYWORD);//Convert.ToString                

                    txtMEMO.Value = Convert.ToString(valObj.MEMO);//Convert.ToString                

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtAID.Value = Convert.ToString(userBase2.Curraid);
                }

            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            WEC_REQUEST valObj = new WEC_REQUEST();

            WEC_REQUEST cond = new WEC_REQUEST();
            cond.KIND = -1;

            if (txtAID.Value != "")
                valObj.AID = Convert.ToDecimal(txtAID.Value);

            if (txtKEYWORD.Value != "")
                valObj.KEYWORD = Convert.ToString(txtKEYWORD.Value);

            if (txtMEMO.Value != "")
                valObj.MEMO = Convert.ToString(txtMEMO.Value);

            valObj.KIND = -1;

            if (txtSTATUS.Value != "")
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);

            if (txtADDTIME.Value != "")
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);

            if (BLLTable<WEC_REQUEST>.Count(cond) > 0)
            {
                //valObj.TID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_REQUEST>.Update(valObj, WEC_REQUEST.Attribute.KIND);
            }
            else
            {
                count = BLLTable<WEC_REQUEST>.Insert(valObj, WEC_REQUEST.Attribute.TID);
            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else
                {
                    ViewState["sbData"] += "," + sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK") != -1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

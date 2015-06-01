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
using AgileFrame.AppInOne.HR;
using System.Data;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;

public partial class Admin_WebSite_SiteColumn_SiteColumnEdit : BaseAdminPage
{
 
    WEC_COLUMN valObj = new WEC_COLUMN();
    int count = 0;
    string keyid = "", pid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            if (Request["toEdit"] != null)
            {
                keyid = Request["id"];
            }
            else
            {
                //增加
                title = "增设部门";
                pid = Request["id"];
                
            }
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {

            txtUP_FLAG.Items.AddRange(FormHelper.GetListItem(WEC_COLUMN.Attribute.UP_FLAG));
            WEC_MODEL cond = new WEC_MODEL();
            cond.TYPE = 2;
            txtMODEL_ID.Items.AddRange(FormHelper.GetListItem(WEC_MODEL.Attribute.ID, WEC_MODEL.Attribute.ID, WEC_MODEL.Attribute.NAME, null, cond));
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_COLUMN.Attribute.STATUS));
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            this.txtPID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_COLUMN>.GetRowData(WEC_COLUMN.Attribute.ID, keyid);
                    if (valObj == null) return;


                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToString                

                    txtPID.Value = Convert.ToString(valObj.PID);//Convert.ToString                

                    txtCOLUMN_NAME.Value = Convert.ToString(valObj.COLUMN_NAME);//Convert.ToString                

                    txtCOLUMN_DES.Value = Convert.ToString(valObj.COLUMN_DES);//Convert.ToString                

                    txtOUT_URL.Value = Convert.ToString(valObj.OUT_URL);//Convert.ToString     

                    txtPICURL.Src = valObj.PIC_URL;

                    txtSMALL_PIC.Src = valObj.SMALL_PIC;

                    txtUP_FLAG.Value = valObj.UP_FLAG.ToString();

                    txtMODEL_ID.Value = Convert.ToString(valObj.MODEL_ID);//Convert.ToDecimal                

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");

                    txtSORT_ID.Value = Convert.ToString(valObj.SORT_ID);//Convert.ToInt32
                }
                else
                {
                    txtID.Value = GetNewDeptID(pid);
                    txtPID.Value = pid;
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

            WEC_COLUMN valObj = new WEC_COLUMN();
            valObj.AID = Convert.ToInt32(userBase2.Curraid);

            if (txtID.Value != "")
                valObj.ID = Convert.ToString(txtID.Value);


            if (txtPID.Value != "")
                valObj.PID = Convert.ToString(txtPID.Value);


            if (txtCOLUMN_NAME.Value != "")
                valObj.COLUMN_NAME = Convert.ToString(txtCOLUMN_NAME.Value);


            if (txtCOLUMN_DES.Value != "")
                valObj.COLUMN_DES = Convert.ToString(txtCOLUMN_DES.Value);


            valObj.PIC_URL = hidPICURL.Value;
            valObj.SMALL_PIC = hidSMALL_PIC.Value;

            valObj.OUT_URL = Convert.ToString(txtOUT_URL.Value);


            if (txtUP_FLAG.Value != "")
                valObj.UP_FLAG = Convert.ToInt32(txtUP_FLAG.Value);

            if (txtMODEL_ID.Value != "")
            {
                valObj.MODEL_ID = Convert.ToDecimal(txtMODEL_ID.Value);
            }
            else
            {
                valObj.MODEL_ID = -1;
            }


            if (txtSTATUS.Value != "")
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);


            if (txtADDTIME.Value != "")
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);


            if (txtSORT_ID.Value != "")
                valObj.SORT_ID = Convert.ToInt32(txtSORT_ID.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToString(keyid);
                count = BLLTable<WEC_COLUMN>.Update(valObj, WEC_COLUMN.Attribute.ID);
            }
            else
            {

                count = BLLTable<WEC_COLUMN>.Insert(valObj);
                keyid = valObj.ID.ToString();

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
                if (btn.ID.IndexOf("_btnSave") != -1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "parent.reShowSubNodes();location.href='/OK.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "parent.reShowSubNodes();location.href='/OK.aspx';", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    public static string GetNewDeptID(string parentid)
    {
        if (parentid == "")
        {
            parentid = "0";
        }
        string code = "0";
        WEC_COLUMN objCond = new WEC_COLUMN();
        objCond.PID = parentid;
        object ooo = BLLTable<WEC_COLUMN>.Max(WEC_COLUMN.Attribute.ID, objCond);//010203
        string mcode = ooo == null ? "" : ooo.ToString();//010203
        if (mcode == null || mcode == "")
        {
            if (parentid == "0")
            {
                code = parentid + "1";
            }
            else
            {
                code = parentid + "01";
            }
        }
        else
        {

            string lasttwo = mcode.Substring(mcode.Length - 2);
            int ltwo = Convert.ToInt32(lasttwo, 16) + 1;
            string newlasttwo = Convert.ToString(ltwo, 16);
            if (newlasttwo.Length < 2)
            {
                newlasttwo = "0" + newlasttwo;
            }
            else if (newlasttwo.Length > 2)//编号后两位达到上限FF,只能遍历是否有空位
            {
                string prefore = mcode.Substring(0, mcode.Length - 2);
                objCond.OrderBy(WEC_COLUMN.Attribute.ID, Order.Asc);

                DataTable dt = BLLTable<WEC_COLUMN>.SelectForDataTable(new WEC_COLUMN(), objCond);
                DataView dv = new DataView();
                dv.Table = dt;
                string aaa = "";
                newlasttwo = "";
                for (int i = 1; i <= 255; i++)
                {
                    aaa = Convert.ToString(i, 16);
                    if (aaa.Length < 2)
                    {
                        aaa = "0" + aaa;
                    }
                    dv.RowFilter = "DEPT_ID='" + prefore + aaa + "'";
                    if (dv.Count <= 0)//找到空位
                    {
                        newlasttwo = aaa;
                        break;
                    }
                }
            }
            if (newlasttwo != "")//号码没有用完
            {
                code = mcode.Substring(0, mcode.Length - 2) + newlasttwo;
            }
        }
        return code;
    }

}


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
public partial class SYS_BILL_COLITEMEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_COLITEM valObj = new SYS_BILL_COLITEM();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected int colid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ITEM_ID"]))
        {
            keyid = Request["ITEM_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["ColID"]))
        {
            colid = int.Parse(Request["ColID"]);
        }
        if (!IsPostBack)
        {
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_BILL_COLITEM>.Factory(conn).GetRowData(SYS_BILL_COLITEM.Attribute.ITEM_ID, keyid);
                    if (valObj == null) return;


                    txtITEM_ID.Value = Convert.ToString(valObj.ITEM_ID);//Convert.ToInt32                

                    //txtCOL_ID.Value = Convert.ToString(valObj.COL_ID);//Convert.ToInt32                

                    txtVAL.Value = Convert.ToString(valObj.VAL);//Convert.ToString                

                    txtTXT.Value = Convert.ToString(valObj.TXT);//Convert.ToString                

                    txtSHOW_COL_REAL.Value = Convert.ToString(valObj.SHOW_COL_REAL);//Convert.ToString
                    if (!string.IsNullOrEmpty(valObj.VAL))
                    {
                        ckVal.Checked = true;
                    }
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "_valChg();", false);
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
            SYS_BILL_COLITEM valObj = new SYS_BILL_COLITEM();


            if (txtITEM_ID.Value != "")
                valObj.ITEM_ID = Convert.ToInt32(txtITEM_ID.Value);
            valObj.COL_ID = colid;

            if (ckVal.Checked == true)
            {
                if (txtVAL.Value != "")
                    valObj.VAL = Convert.ToString(txtVAL.Value);
            }
            else
            {
                valObj.VAL = "";
            }

            if (txtTXT.Value != "")
                valObj.TXT = Convert.ToString(txtTXT.Value);


            if (txtSHOW_COL_REAL.Value != "")
                valObj.SHOW_COL_REAL = Convert.ToString(txtSHOW_COL_REAL.Value);

            if (keyid != "")
            {
                valObj.ITEM_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_BILL_COLITEM>.Factory(conn).Update(valObj, SYS_BILL_COLITEM.Attribute.ITEM_ID);
            }
            else
            {
                count = BLLTable<SYS_BILL_COLITEM>.Factory(conn).Insert(valObj, SYS_BILL_COLITEM.Attribute.ITEM_ID);
                keyid = valObj.ITEM_ID.ToString();

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
                    if (ViewState["sbData"] != null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {


                    //txtITEM_ID.Value ="";


                    //txtCOL_ID.Value ="";


                    txtVAL.Value = "";


                    txtTXT.Value = "";


                    txtSHOW_COL_REAL.Value = "";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

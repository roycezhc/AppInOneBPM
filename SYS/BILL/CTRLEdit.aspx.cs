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
public partial class SYS_BILL_CTRLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_CTRL valObj =new SYS_BILL_CTRL();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["CTRL_ID"]))
        {
            keyid = Request["CTRL_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtCTRL_ID.Disabled = true;
            this.txtCTRL_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).GetRowData(SYS_BILL_CTRL.Attribute.CTRL_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtCTRL_ID.Value = Convert.ToString(valObj.CTRL_ID);//Convert.ToInt32                
                    
                    txtCTRL_NAME.Value = Convert.ToString(valObj.CTRL_NAME);//Convert.ToString                
                    
                    txtCTRL_CODE.Value = Convert.ToString(valObj.CTRL_CODE);//Convert.ToString                
                    
                    txtP_CTRL_ID.Value = Convert.ToString(valObj.P_CTRL_ID);//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                
                    
                    txtEL_HTML.Value = Convert.ToString(valObj.EL_HTML);//Convert.ToString                
                    
                    txtJS_CODE.Value = Convert.ToString(valObj.JS_CODE);//Convert.ToString
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
            SYS_BILL_CTRL valObj = new SYS_BILL_CTRL();
            
            
            if(txtCTRL_ID.Value !="" )
                valObj.CTRL_ID = Convert.ToInt32(txtCTRL_ID.Value);
            
            
            if(txtCTRL_NAME.Value !="" )
                valObj.CTRL_NAME = Convert.ToString(txtCTRL_NAME.Value);
            
            
            if(txtCTRL_CODE.Value !="" )
                valObj.CTRL_CODE = Convert.ToString(txtCTRL_CODE.Value);
            
            
            if(txtP_CTRL_ID.Value !="" )
                valObj.P_CTRL_ID = Convert.ToString(txtP_CTRL_ID.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);
            
            
            if(txtEL_HTML.Value !="" )
                valObj.EL_HTML = Convert.ToString(txtEL_HTML.Value);
            
            
            if(txtJS_CODE.Value !="" )
                valObj.JS_CODE = Convert.ToString(txtJS_CODE.Value);

            if (keyid != "")
            {
                valObj.CTRL_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_BILL_CTRL>.Factory(conn).Update(valObj, SYS_BILL_CTRL.Attribute.CTRL_ID);
            }
            else
            {
                count = BLLTable<SYS_BILL_CTRL>.Factory(conn).Insert(valObj, SYS_BILL_CTRL.Attribute.CTRL_ID);
                keyid = valObj.CTRL_ID.ToString();

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
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtCTRL_ID.Value ="";
                    
                    
                    txtCTRL_NAME.Value ="";
                    
                    
                    txtCTRL_CODE.Value ="";
                    
                    
                    txtP_CTRL_ID.Value ="";
                    
                    
                    txtSORT_NO.Value ="";
                    
                    
                    txtEL_HTML.Value ="";
                    
                    
                    txtJS_CODE.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

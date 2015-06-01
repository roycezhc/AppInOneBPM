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
public partial class SYS_BILL_TYPEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_TYPE valObj =new SYS_BILL_TYPE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["TYPE_ID"]))
        {
            keyid = Request["TYPE_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtTYPE_ID.Disabled = true;
            this.txtTYPE_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).GetRowData(SYS_BILL_TYPE.Attribute.TYPE_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTYPE_ID.Value = Convert.ToString(valObj.TYPE_ID);//Convert.ToInt32                
                    
                    txtTYPE_NAME.Value = Convert.ToString(valObj.TYPE_NAME);//Convert.ToString                
                    
                    txtTYPE_DES.Value = Convert.ToString(valObj.TYPE_DES);//Convert.ToString                
                    
                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32
                    txtBILL_NAME.Value = BLLTable<SYS_BILL>.Factory(conn).GetOneValue(SYS_BILL.Attribute.BILL_ID, valObj.BILL_ID, SYS_BILL.Attribute.BILL_NAME);
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
            SYS_BILL_TYPE valObj = new SYS_BILL_TYPE();
            
            
            if(txtTYPE_ID.Value !="" )
                valObj.TYPE_ID = Convert.ToInt32(txtTYPE_ID.Value);
            
            
            if(txtTYPE_NAME.Value !="" )
                valObj.TYPE_NAME = Convert.ToString(txtTYPE_NAME.Value);
            
            
            if(txtTYPE_DES.Value !="" )
                valObj.TYPE_DES = Convert.ToString(txtTYPE_DES.Value);
            
            
            if(txtBILL_ID.Value !="" )
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);

            if (keyid != "")
            {
                valObj.TYPE_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_BILL_TYPE>.Factory(conn).Update(valObj, SYS_BILL_TYPE.Attribute.TYPE_ID);
            }
            else
            {
                count = BLLTable<SYS_BILL_TYPE>.Factory(conn).Insert(valObj, SYS_BILL_TYPE.Attribute.TYPE_ID);
                keyid = valObj.TYPE_ID.ToString();

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
                    
                    
                    txtTYPE_ID.Value ="";
                    
                    
                    txtTYPE_NAME.Value ="";
                    
                    
                    txtTYPE_DES.Value ="";
                    
                    
                    txtBILL_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

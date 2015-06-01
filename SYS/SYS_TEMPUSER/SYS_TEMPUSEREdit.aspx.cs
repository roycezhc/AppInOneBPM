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
using AgileFrame.Core.WebSystem;
using System.Web.UI.HtmlControls;

public partial class SYS_TEMPUSEREdit : System.Web.UI.Page
{
    SYS_TEMPUSER valObj =new SYS_TEMPUSER();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            //SYS_TEMPUSER valObj = new SYS_TEMPUSER();
            
            
            //if(txtID.Value !="" )
            //    valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            //if(txtNAME.Value !="" )
            //    valObj.NAME = Convert.ToString(txtNAME.Value);
            
            
            //if(txtCONAME.Value !="" )
            //    valObj.CONAME = Convert.ToString(txtCONAME.Value);
            
            
            //if(txtPHONE.Value !="" )
            //    valObj.PHONE = Convert.ToString(txtPHONE.Value);


            //valObj.IP = GetIP();
       
            
            //if(txtLOGINNAME.Value !="" )
            //    valObj.LOGINNAME = Convert.ToString(txtLOGINNAME.Value);
            
            
            //if(txtPWD.Value !="" )
            //    valObj.PWD = Convert.ToString(txtPWD.Value);
            
            
            //if(txtUSER_ID.Value !="" )
            //    valObj.USER_ID = Convert.ToDecimal(txtUSER_ID.Value);

            //if (keyid != "")
            //{
            //    valObj.ID = Convert.ToDecimal(keyid);
            //    count = BLLTable<SYS_TEMPUSER>.Update(valObj, SYS_TEMPUSER.Attribute.ID);
            //}
            //else
            //{
            //    count = BLLTable<SYS_TEMPUSER>.Insert(valObj, SYS_TEMPUSER.Attribute.ID);
            //    keyid = valObj.ID.ToString();

            //}
            //if (count > 0)
            //{
            //    StringBuilder sbData = new StringBuilder("{valObj:''");
            //    List<AttributeItem> lstCol = valObj.af_AttributeItemList;
            //    for (int i = 0; i < lstCol.Count; i++)
            //    {
            //        object val = valObj.GetValue(lstCol[i]);
            //        if (val != null)
            //        {
            //            sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
            //        }
            //    }
            //    sbData.Append("}");
            //    if (ViewState["sbData"] == null)
            //    {
            //        ViewState["sbData"] = sbData.ToString();
            //    }
            //    else {
            //        ViewState["sbData"] += ","+sbData.ToString();
            //    }
            //    Button btn = (Button)sender;
            //    if (btn.ID.IndexOf("btnOK")!=-1)
            //    {
            //        if (ViewState["sbData"] == null)
            //        {
            //            string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
            //            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"" + dataStr + "\";window.close();", true);
            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"re\";window.close();", true);
            //        }
            //    }
            //    else
            //    {
                    
                    
            //        txtID.Value ="";
                    
                    
            //        txtNAME.Value ="";
                    
                    
            //        txtCONAME.Value ="";

            //        txtIP.Value ="";
                    
                    
            //        txtADDTIME.Value ="";
                    
                    
            //        txtLOGINNAME.Value ="";
                    
                    
            //        txtPWD.Value ="";
                    
                    
            //        txtUSER_ID.Value ="";
            //    }
            //}
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

    protected void btnCheckNum_Click(object sender, EventArgs e)
    {
    }
   
}

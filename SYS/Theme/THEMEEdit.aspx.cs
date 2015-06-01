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
public partial class SYS_THEMEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError();
        if (HttpContext.Current.Server.GetLastError() is HttpRequestValidationException)
        {
            //HttpContext.Current.Response.Write("ÇëÊäÈëºÏ·¨µÄ×Ö·û´®¡¾<a href=\"javascript:history.back(0);\">·µ»Ø</a>¡¿");
            //HttpContext.Current.Server.ClearError();
            return;
        }
    }
    SYS_THEME valObj =new SYS_THEME();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["THEME_ID"]))
        {
            keyid = Request["THEME_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_THEME>.Factory(conn).GetRowData(SYS_THEME.Attribute.THEME_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTHEME_ID.Value = Convert.ToString(valObj.THEME_ID);//Convert.ToInt32                
                    
                    txtTHEME_NAME.Value = Convert.ToString(valObj.THEME_NAME);//Convert.ToString                
                    
                    txtSYS_NAME.Value = Convert.ToString(valObj.SYS_NAME);//Convert.ToString                
                    
                    txtLOGIN_TIT.Value = Convert.ToString(valObj.LOGIN_TIT);//Convert.ToString                
                    
                    txtLOGIN_HTML.Value =valObj.LOGIN_HTML;//Convert.ToString                
                    
                    txtTECH_DES.Value = Convert.ToString(valObj.TECH_DES);//Convert.ToString                
                    
                    txtRIGHT_DES.Value = Convert.ToString(valObj.RIGHT_DES);//Convert.ToString                
                    
                    txtVERSION.Value = Convert.ToString(valObj.VERSION);//Convert.ToString
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
            SYS_THEME valObj = new SYS_THEME();
            
            
            if(txtTHEME_ID.Value !="" )
                valObj.THEME_ID = Convert.ToInt32(txtTHEME_ID.Value);
            
            
            if(txtTHEME_NAME.Value !="" )
                valObj.THEME_NAME = Convert.ToString(txtTHEME_NAME.Value);
            
            
            if(txtSYS_NAME.Value !="" )
                valObj.SYS_NAME = Convert.ToString(txtSYS_NAME.Value);
            
            
            if(txtLOGIN_TIT.Value !="" )
                valObj.LOGIN_TIT = Convert.ToString(txtLOGIN_TIT.Value);
            
            
            if(txtLOGIN_HTML.Value !="" )
                valObj.LOGIN_HTML = txtLOGIN_HTML.Value;
            
            
            if(txtTECH_DES.Value !="" )
                valObj.TECH_DES = Convert.ToString(txtTECH_DES.Value);
            
            
            if(txtRIGHT_DES.Value !="" )
                valObj.RIGHT_DES = Convert.ToString(txtRIGHT_DES.Value);
            
            
            if(txtVERSION.Value !="" )
                valObj.VERSION = Convert.ToString(txtVERSION.Value);

            if (keyid != "")
            {
                valObj.THEME_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_THEME>.Factory(conn).Update(valObj, SYS_THEME.Attribute.THEME_ID);
            }
            else
            {
                count = BLLTable<SYS_THEME>.Factory(conn).Insert(valObj, SYS_THEME.Attribute.THEME_ID);
                keyid = valObj.THEME_ID.ToString();

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
                    
                    
                    txtTHEME_ID.Value ="";
                    
                    
                    txtTHEME_NAME.Value ="";
                    
                    
                    txtSYS_NAME.Value ="";
                    
                    
                    txtLOGIN_TIT.Value ="";
                    
                    
                    txtLOGIN_HTML.Value ="";
                    
                    
                    txtTECH_DES.Value ="";
                    
                    
                    txtRIGHT_DES.Value ="";
                    
                    
                    txtVERSION.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

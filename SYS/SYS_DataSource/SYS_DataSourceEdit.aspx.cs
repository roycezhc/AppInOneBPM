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
public partial class SYS_DATASOURCEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_DATASOURCE valObj =new SYS_DATASOURCE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {


            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<SYS_DATASOURCE>.Factory(conn).GetRowData(SYS_DATASOURCE.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToString                
                    
                    txtSourceConnectString.Value = Convert.ToString(valObj.SourceConnectString);//Convert.ToString                
                    
                    txtSourceType.Value = Convert.ToString(valObj.SourceType);//Convert.ToString                
                    
                    txtSourceName.Value = Convert.ToString(valObj.SourceName);//Convert.ToString
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
            SYS_DATASOURCE valObj = new SYS_DATASOURCE();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToString(txtID.Value);
            
            
            if(txtSourceConnectString.Value !="" )
                valObj.SourceConnectString = Convert.ToString(txtSourceConnectString.Value);
            
            
            if(txtSourceType.Value !="" )
                valObj.SourceType = Convert.ToString(txtSourceType.Value);
            
            
            if(txtSourceName.Value !="" )
                valObj.SourceName = Convert.ToString(txtSourceName.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToString(keyid);
                count = BLLTable<SYS_DATASOURCE>.Factory(conn).Update(valObj, SYS_DATASOURCE.Attribute.ID);
            }
            else
            {
                count = BLLTable<SYS_DATASOURCE>.Factory(conn).Insert(valObj, SYS_DATASOURCE.Attribute.ID);
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
                    
                    
                    txtID.Value ="";
                    
                    
                    txtSourceConnectString.Value ="";
                    
                    
                    txtSourceType.Value ="";
                    
                    
                    txtSourceName.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

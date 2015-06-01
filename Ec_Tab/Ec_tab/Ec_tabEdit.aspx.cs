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

public partial class Ec_tabEdit : BaseAdminPage
{
    Ec_tab valObj =new Ec_tab();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Tabid"]))
        {
            keyid = Request["Tabid"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            

            this.txtTabid.Disabled = true; this.txtTabid.Value = "0";
            this.txtTabid.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<Ec_tab>.Factory(conn).GetRowData(Ec_tab.Attribute.Tabid, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTabid.Value = Convert.ToString(valObj.Tabid);//Convert.ToInt32                
                    
                    txtName.Value = Convert.ToString(valObj.Name);//Convert.ToString                
                    
                    txtPresence.Value = Convert.ToString(valObj.Presence);//Convert.ToInt32                
                    
                    txtTabsequence.Value = Convert.ToString(valObj.Tabsequence);//Convert.ToInt32                
                    
                    txtTablabel.Value = Convert.ToString(valObj.Tablabel);//Convert.ToString                
                    
                    txtModifiedby.Value = Convert.ToString(valObj.Modifiedby);//Convert.ToInt32                
                    
                    txtModifiedtime.Value = Convert.ToString(valObj.Modifiedtime);//Convert.ToInt32                
                    
                    txtCustomized.Value = Convert.ToString(valObj.Customized);//Convert.ToInt32                
                    
                    txtReportable.Value = Convert.ToString(valObj.Reportable);//Convert.ToInt32
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
            Ec_tab valObj = new Ec_tab();
            
            
            if(txtTabid.Value !="" )
                valObj.Tabid = Convert.ToInt32(txtTabid.Value);
            
            
            if(txtName.Value !="" )
                valObj.Name = Convert.ToString(txtName.Value);
            
            
            if(txtPresence.Value !="" )
                valObj.Presence = Convert.ToInt32(txtPresence.Value);
            
            
            if(txtTabsequence.Value !="" )
                valObj.Tabsequence = Convert.ToInt32(txtTabsequence.Value);
            
            
            if(txtTablabel.Value !="" )
                valObj.Tablabel = Convert.ToString(txtTablabel.Value);
            
            
            if(txtModifiedby.Value !="" )
                valObj.Modifiedby = Convert.ToInt32(txtModifiedby.Value);
            
            
            if(txtModifiedtime.Value !="" )
                valObj.Modifiedtime = Convert.ToInt32(txtModifiedtime.Value);
            
            
            if(txtCustomized.Value !="" )
                valObj.Customized = Convert.ToInt32(txtCustomized.Value);
            
            
            if(txtReportable.Value !="" )
                valObj.Reportable = Convert.ToInt32(txtReportable.Value);

            if (keyid != "")
            {
                valObj.Tabid = Convert.ToInt32(keyid);
                count = BLLTable<Ec_tab>.Factory(conn).Update(valObj, Ec_tab.Attribute.Tabid);
            }
            else
            {
                count = BLLTable<Ec_tab>.Factory(conn).Insert(valObj, Ec_tab.Attribute.Tabid);
                keyid = valObj.Tabid.ToString();

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
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"" + dataStr + "\";window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"re\";window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtTabid.Value ="";
                    
                    
                    txtName.Value ="";
                    
                    
                    txtPresence.Value ="";
                    
                    
                    txtTabsequence.Value ="";
                    
                    
                    txtTablabel.Value ="";
                    
                    
                    txtModifiedby.Value ="";
                    
                    
                    txtModifiedtime.Value ="";
                    
                    
                    txtCustomized.Value ="";
                    
                    
                    txtReportable.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

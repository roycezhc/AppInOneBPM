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

public partial class Ec_entitynameEdit : BaseAdminPage
{
    Ec_entityname valObj =new Ec_entityname();
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
                    valObj = BLLTable<Ec_entityname>.Factory(conn).GetRowData(Ec_entityname.Attribute.Tabid, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTabid.Value = Convert.ToString(valObj.Tabid);//Convert.ToInt32                
                    
                    txtModulename.Value = Convert.ToString(valObj.Modulename);//Convert.ToString                
                    
                    txtTablename.Value = Convert.ToString(valObj.Tablename);//Convert.ToString                
                    
                    txtFieldname.Value = Convert.ToString(valObj.Fieldname);//Convert.ToString                
                    
                    txtEntityidfield.Value = Convert.ToString(valObj.Entityidfield);//Convert.ToString                
                    
                    txtRemarks.Value = Convert.ToString(valObj.Remarks);//Convert.ToString
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
            Ec_entityname valObj = new Ec_entityname();
            
            
            if(txtTabid.Value !="" )
                valObj.Tabid = Convert.ToInt32(txtTabid.Value);
            
            
            if(txtModulename.Value !="" )
                valObj.Modulename = Convert.ToString(txtModulename.Value);
            
            
            if(txtTablename.Value !="" )
                valObj.Tablename = Convert.ToString(txtTablename.Value);
            
            
            if(txtFieldname.Value !="" )
                valObj.Fieldname = Convert.ToString(txtFieldname.Value);
            
            
            if(txtEntityidfield.Value !="" )
                valObj.Entityidfield = Convert.ToString(txtEntityidfield.Value);
            
            
            if(txtRemarks.Value !="" )
                valObj.Remarks = Convert.ToString(txtRemarks.Value);

            if (keyid != "")
            {
                valObj.Tabid = Convert.ToInt32(keyid);
                count = BLLTable<Ec_entityname>.Factory(conn).Update(valObj, Ec_entityname.Attribute.Tabid);
            }
            else
            {
                count = BLLTable<Ec_entityname>.Factory(conn).Insert(valObj, Ec_entityname.Attribute.Tabid);
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
                    
                    
                    txtModulename.Value ="";
                    
                    
                    txtTablename.Value ="";
                    
                    
                    txtFieldname.Value ="";
                    
                    
                    txtEntityidfield.Value ="";
                    
                    
                    txtRemarks.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

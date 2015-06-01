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

public partial class Ec_relatedlistsEdit : BaseAdminPage
{
    Ec_relatedlists valObj =new Ec_relatedlists();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Relation_id"]))
        {
            keyid = Request["Relation_id"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            

            this.txtRelation_id.Disabled = true; this.txtRelation_id.Value = "0";
            this.txtRelation_id.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<Ec_relatedlists>.Factory(conn).GetRowData(Ec_relatedlists.Attribute.Relation_id, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtRelation_id.Value = Convert.ToString(valObj.Relation_id);//Convert.ToInt32                
                    
                    txtTabid.Value = Convert.ToString(valObj.Tabid);//Convert.ToInt32                
                    
                    txtRelated_tabid.Value = Convert.ToString(valObj.Related_tabid);//Convert.ToInt32                
                    
                    txtName.Value = Convert.ToString(valObj.Name);//Convert.ToString                
                    
                    txtSequence.Value = Convert.ToString(valObj.Sequence);//Convert.ToInt32                
                    
                    txtLabel.Value = Convert.ToString(valObj.Label);//Convert.ToString                
                    
                    txtPresence.Value = Convert.ToString(valObj.Presence);//Convert.ToInt32                
                    
                    txtTabTableName.Value = Convert.ToString(valObj.TabTableName);//Convert.ToString                
                    
                    txtColumnName_PK.Value = Convert.ToString(valObj.ColumnName_PK);//Convert.ToString                
                    
                    txtColumnName_FK.Value = Convert.ToString(valObj.ColumnName_FK);//Convert.ToString                
                    
                    txtRelated_tabTableName.Value = Convert.ToString(valObj.Related_tabTableName);//Convert.ToString
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
            Ec_relatedlists valObj = new Ec_relatedlists();
            
            
            if(txtRelation_id.Value !="" )
                valObj.Relation_id = Convert.ToInt32(txtRelation_id.Value);
            
            
            if(txtTabid.Value !="" )
                valObj.Tabid = Convert.ToInt32(txtTabid.Value);
            
            
            if(txtRelated_tabid.Value !="" )
                valObj.Related_tabid = Convert.ToInt32(txtRelated_tabid.Value);
            
            
            if(txtName.Value !="" )
                valObj.Name = Convert.ToString(txtName.Value);
            
            
            if(txtSequence.Value !="" )
                valObj.Sequence = Convert.ToInt32(txtSequence.Value);
            
            
            if(txtLabel.Value !="" )
                valObj.Label = Convert.ToString(txtLabel.Value);
            
            
            if(txtPresence.Value !="" )
                valObj.Presence = Convert.ToInt32(txtPresence.Value);
            
            
            if(txtTabTableName.Value !="" )
                valObj.TabTableName = Convert.ToString(txtTabTableName.Value);
            
            
            if(txtColumnName_PK.Value !="" )
                valObj.ColumnName_PK = Convert.ToString(txtColumnName_PK.Value);
            
            
            if(txtColumnName_FK.Value !="" )
                valObj.ColumnName_FK = Convert.ToString(txtColumnName_FK.Value);
            
            
            if(txtRelated_tabTableName.Value !="" )
                valObj.Related_tabTableName = Convert.ToString(txtRelated_tabTableName.Value);

            if (keyid != "")
            {
                valObj.Relation_id = Convert.ToInt32(keyid);
                count = BLLTable<Ec_relatedlists>.Factory(conn).Update(valObj, Ec_relatedlists.Attribute.Relation_id);
            }
            else
            {
                count = BLLTable<Ec_relatedlists>.Factory(conn).Insert(valObj, Ec_relatedlists.Attribute.Relation_id);
                keyid = valObj.Relation_id.ToString();

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
                    
                    
                    txtRelation_id.Value ="";
                    
                    
                    txtTabid.Value ="";
                    
                    
                    txtRelated_tabid.Value ="";
                    
                    
                    txtName.Value ="";
                    
                    
                    txtSequence.Value ="";
                    
                    
                    txtLabel.Value ="";
                    
                    
                    txtPresence.Value ="";
                    
                    
                    txtTabTableName.Value ="";
                    
                    
                    txtColumnName_PK.Value ="";
                    
                    
                    txtColumnName_FK.Value ="";
                    
                    
                    txtRelated_tabTableName.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

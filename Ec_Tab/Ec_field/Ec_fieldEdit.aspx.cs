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

public partial class Ec_fieldEdit : BaseAdminPage
{
    Ec_field valObj =new Ec_field();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Fieldid"]))
        {
            keyid = Request["Fieldid"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
                                                                             
            txtUitype.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Uitype));                                       
            txtReadonly.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Readonly));             
            txtPresence.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Presence));             
            txtSelected.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Selected));                                                    
            txtDisplaytype.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Displaytype));                          
            txtQuickcreate.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Quickcreate));                          
            txtInfo_type.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Info_type));             
            txtCtrlType.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.CtrlType));

            this.txtFieldid.Disabled = true; this.txtFieldid.Value = "0";
            this.txtFieldid.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<Ec_field>.Factory(conn).GetRowData(Ec_field.Attribute.Fieldid, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtFieldid.Value = Convert.ToString(valObj.Fieldid);//Convert.ToInt32                
                    
                    txtTabid.Value = Convert.ToString(valObj.Tabid);//Convert.ToInt32                
                    
                    txtColumnname.Value = Convert.ToString(valObj.Columnname);//Convert.ToString                
                    
                    txtTablename.Value = Convert.ToString(valObj.Tablename);//Convert.ToString                
                    
                    txtGeneratedtype.Value = Convert.ToString(valObj.Generatedtype);//Convert.ToInt32                
                    
                    txtUitype.Value=valObj.Uitype.ToString();                
                    
                    txtFieldname.Value = Convert.ToString(valObj.Fieldname);//Convert.ToString                
                    
                    txtFieldlabel.Value = Convert.ToString(valObj.Fieldlabel);//Convert.ToString                
                    
                    txtReadonly.Value=valObj.Readonly.ToString();                
                    
                    txtPresence.Value=valObj.Presence.ToString();                
                    
                    txtSelected.Value=valObj.Selected.ToString();                
                    
                    txtMaximumlength.Value = Convert.ToString(valObj.Maximumlength);//Convert.ToInt32                
                    
                    txtSequence.Value = Convert.ToString(valObj.Sequence);//Convert.ToInt32                
                    
                    txtBlock.Value = Convert.ToString(valObj.Block);//Convert.ToInt32                
                    
                    txtDisplaytype.Value=valObj.Displaytype.ToString();                
                    
                    txtTypeofdata.Value = Convert.ToString(valObj.Typeofdata);//Convert.ToString                
                    
                    txtQuickcreate.Value=valObj.Quickcreate.ToString();                
                    
                    txtQuickcreatesequence.Value = Convert.ToString(valObj.Quickcreatesequence);//Convert.ToInt32                
                    
                    txtInfo_type.Value=valObj.Info_type.ToString();                
                    
                    txtCtrlType.Value=valObj.CtrlType.ToString();
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
            Ec_field valObj = new Ec_field();
            
            
            if(txtFieldid.Value !="" )
                valObj.Fieldid = Convert.ToInt32(txtFieldid.Value);
            
            
            if(txtTabid.Value !="" )
                valObj.Tabid = Convert.ToInt32(txtTabid.Value);
            
            
            if(txtColumnname.Value !="" )
                valObj.Columnname = Convert.ToString(txtColumnname.Value);
            
            
            if(txtTablename.Value !="" )
                valObj.Tablename = Convert.ToString(txtTablename.Value);
            
            
            if(txtGeneratedtype.Value !="" )
                valObj.Generatedtype = Convert.ToInt32(txtGeneratedtype.Value);
            
            
            if(txtUitype.Value !="" )
                valObj.Uitype = Convert.ToString(txtUitype.Value);
            
            
            if(txtFieldname.Value !="" )
                valObj.Fieldname = Convert.ToString(txtFieldname.Value);
            
            
            if(txtFieldlabel.Value !="" )
                valObj.Fieldlabel = Convert.ToString(txtFieldlabel.Value);
            
            
            if(txtReadonly.Value !="" )
                valObj.Readonly = Convert.ToInt32(txtReadonly.Value);
            
            
            if(txtPresence.Value !="" )
                valObj.Presence = Convert.ToInt32(txtPresence.Value);
            
            
            if(txtSelected.Value !="" )
                valObj.Selected = Convert.ToInt32(txtSelected.Value);
            
            
            if(txtMaximumlength.Value !="" )
                valObj.Maximumlength = Convert.ToInt32(txtMaximumlength.Value);
            
            
            if(txtSequence.Value !="" )
                valObj.Sequence = Convert.ToInt32(txtSequence.Value);
            
            
            if(txtBlock.Value !="" )
                valObj.Block = Convert.ToInt32(txtBlock.Value);
            
            
            if(txtDisplaytype.Value !="" )
                valObj.Displaytype = Convert.ToInt32(txtDisplaytype.Value);
            
            
            if(txtTypeofdata.Value !="" )
                valObj.Typeofdata = Convert.ToString(txtTypeofdata.Value);
            
            
            if(txtQuickcreate.Value !="" )
                valObj.Quickcreate = Convert.ToInt32(txtQuickcreate.Value);
            
            
            if(txtQuickcreatesequence.Value !="" )
                valObj.Quickcreatesequence = Convert.ToInt32(txtQuickcreatesequence.Value);
            
            
            if(txtInfo_type.Value !="" )
                valObj.Info_type = Convert.ToString(txtInfo_type.Value);
            
            
            if(txtCtrlType.Value !="" )
                valObj.CtrlType = Convert.ToString(txtCtrlType.Value);

            if (keyid != "")
            {
                valObj.Fieldid = Convert.ToInt32(keyid);
                count = BLLTable<Ec_field>.Factory(conn).Update(valObj, Ec_field.Attribute.Fieldid);
            }
            else
            {
                count = BLLTable<Ec_field>.Factory(conn).Insert(valObj, Ec_field.Attribute.Fieldid);
                keyid = valObj.Fieldid.ToString();

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
                    
                    
                    txtFieldid.Value ="";
                    
                    
                    txtTabid.Value ="";
                    
                    
                    txtColumnname.Value ="";
                    
                    
                    txtTablename.Value ="";
                    
                    
                    txtGeneratedtype.Value ="";
                    
                    
                    txtUitype.Value ="";
                    
                    
                    txtFieldname.Value ="";
                    
                    
                    txtFieldlabel.Value ="";
                    
                    
                    txtReadonly.Value ="";
                    
                    
                    txtPresence.Value ="";
                    
                    
                    txtSelected.Value ="";
                    
                    
                    txtMaximumlength.Value ="";
                    
                    
                    txtSequence.Value ="";
                    
                    
                    txtBlock.Value ="";
                    
                    
                    txtDisplaytype.Value ="";
                    
                    
                    txtTypeofdata.Value ="";
                    
                    
                    txtQuickcreate.Value ="";
                    
                    
                    txtQuickcreatesequence.Value ="";
                    
                    
                    txtInfo_type.Value ="";
                    
                    
                    txtCtrlType.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

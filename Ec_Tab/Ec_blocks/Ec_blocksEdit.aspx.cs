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

public partial class Ec_blocksEdit : BaseAdminPage
{
    Ec_blocks valObj =new Ec_blocks();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Blockid"]))
        {
            keyid = Request["Blockid"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            

            this.txtBlockid.Disabled = true; this.txtBlockid.Value = "0";
            this.txtBlockid.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<Ec_blocks>.Factory(conn).GetRowData(Ec_blocks.Attribute.Blockid, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtBlockid.Value = Convert.ToString(valObj.Blockid);//Convert.ToInt32                
                    
                    txtTabid.Value = Convert.ToString(valObj.Tabid);//Convert.ToInt32                
                    
                    txtBlocklabel.Value = Convert.ToString(valObj.Blocklabel);//Convert.ToString                
                    
                    txtSequence.Value = Convert.ToString(valObj.Sequence);//Convert.ToInt32                
                    
                    txtShow_title.Value = Convert.ToString(valObj.Show_title);//Convert.ToInt32    
                 
                    if (valObj.Visible == 1)
                        IsVisible.Checked = true;
                    else
                        NoVisible.Checked = true;

                    if (valObj.Create_view == 1)
                        IsCreate_view.Checked = true;
                    else
                        NoCreate_view.Checked = true;  
     
                    txtEdit_view.Value = Convert.ToString(valObj.Edit_view);//Convert.ToInt32                
                    
                    txtDetail_view.Value = Convert.ToString(valObj.Detail_view);//Convert.ToInt32
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
            Ec_blocks valObj = new Ec_blocks();
            
            
            if(txtBlockid.Value !="" )
                valObj.Blockid = Convert.ToInt32(txtBlockid.Value);
            
            
            if(txtTabid.Value !="" )
                valObj.Tabid = Convert.ToInt32(txtTabid.Value);
            
            
            if(txtBlocklabel.Value !="" )
                valObj.Blocklabel = Convert.ToString(txtBlocklabel.Value);
            
            
            if(txtSequence.Value !="" )
                valObj.Sequence = Convert.ToInt32(txtSequence.Value);
            
            
            if(txtShow_title.Value !="" )
                valObj.Show_title = Convert.ToInt32(txtShow_title.Value);


            //if ( Request.Form["IsVisible"]!="")
            //    valObj.Visible =Convert.ToInt32( Request.Form["IsVisible"]);

            //if (Request.Form["Create_view"]!= "")
            //    valObj.Create_view = Convert.ToInt32(Request.Form["Create_view"]);
            
            if(txtEdit_view.Value !="" )
                valObj.Edit_view = Convert.ToInt32(txtEdit_view.Value);
            
            
            if(txtDetail_view.Value !="" )
                valObj.Detail_view = Convert.ToInt32(txtDetail_view.Value);

            if (keyid != "")
            {
                valObj.Blockid = Convert.ToInt32(keyid);
                count = BLLTable<Ec_blocks>.Factory(conn).Update(valObj, Ec_blocks.Attribute.Blockid);
            }
            else
            {
                count = BLLTable<Ec_blocks>.Factory(conn).Insert(valObj, Ec_blocks.Attribute.Blockid);
                keyid = valObj.Blockid.ToString();

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
                    
                    
                    txtBlockid.Value ="";
                    
                    
                    txtTabid.Value ="";
                    
                    
                    txtBlocklabel.Value ="";
                    
                    
                    txtSequence.Value ="";
                    
                    
                    txtShow_title.Value ="";
                    
                    
                    //txtVisible.Value ="";
                    //IsCreate_view.Checked = true;


                    //IsVisible.Checked = true;
                    
                    //txtCreate_view.Value ="";
                    
                    
                    txtEdit_view.Value ="";
                    
                    
                    txtDetail_view.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

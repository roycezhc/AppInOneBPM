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
public partial class WF_STEP_FORM_TPLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_STEP_FORM_TPL valObj =new WF_STEP_FORM_TPL();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["STEP_FID"]))
        {
            keyid = Request["STEP_FID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtSTEP_FID.Disabled = true;
            this.txtSTEP_FID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<WF_STEP_FORM_TPL>.Factory(conn).GetRowData(WF_STEP_FORM_TPL.Attribute.STEP_FID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtSTEP_FID.Value = Convert.ToString(valObj.STEP_FID);//Convert.ToInt32                
                    
                    txtWFID.Value = Convert.ToString(valObj.WFID);//Convert.ToInt32                
                    
                    txtPROCID.Value = Convert.ToString(valObj.PROCID);//Convert.ToInt32                
                    
                    txtSTEP_ID.Value = Convert.ToString(valObj.STEP_ID);//Convert.ToInt32                
                    
                    txtFORM_ID.Value = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32                
                    
                    txtCOLUMN_ID.Value = Convert.ToString(valObj.COLUMN_ID);//Convert.ToInt32
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
            WF_STEP_FORM_TPL valObj = new WF_STEP_FORM_TPL();
            
            
            if(txtSTEP_FID.Value !="" )
                valObj.STEP_FID = Convert.ToInt32(txtSTEP_FID.Value);
            
            
            if(txtWFID.Value !="" )
                valObj.WFID = Convert.ToInt32(txtWFID.Value);
            
            
            if(txtPROCID.Value !="" )
                valObj.PROCID = Convert.ToInt32(txtPROCID.Value);
            
            
            if(txtSTEP_ID.Value !="" )
                valObj.STEP_ID = Convert.ToInt32(txtSTEP_ID.Value);
            
            
            if(txtFORM_ID.Value !="" )
                valObj.FORM_ID = Convert.ToInt32(txtFORM_ID.Value);
            
            
            if(txtCOLUMN_ID.Value !="" )
                valObj.COLUMN_ID = Convert.ToInt32(txtCOLUMN_ID.Value);

            if (keyid != "")
            {
                valObj.STEP_FID = Convert.ToInt32(keyid);
                count = BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Update(valObj, WF_STEP_FORM_TPL.Attribute.STEP_FID);
            }
            else
            {
                count = BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Insert(valObj, WF_STEP_FORM_TPL.Attribute.STEP_FID);
                keyid = valObj.STEP_FID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");

                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtSTEP_FID.Value ="";
                    
                    
                    txtWFID.Value ="";
                    
                    
                    txtPROCID.Value ="";
                    
                    
                    txtSTEP_ID.Value ="";
                    
                    
                    txtFORM_ID.Value ="";
                    
                    
                    txtCOLUMN_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

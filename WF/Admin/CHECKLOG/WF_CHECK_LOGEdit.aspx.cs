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
public partial class WF_CHECK_LOGEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_CHECK_LOG valObj =new WF_CHECK_LOG();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["LOG_ID"]))
        {
            keyid = Request["LOG_ID"];
        }
        if (!IsPostBack)
        {
            
                                                                                          
            txtRESULT.Items.AddRange(FormHelper.GetListItem(WF_CHECK_LOG.Attribute.RESULT));                                              
            txtCHECK_TIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtLOG_ID.Disabled = true;
            this.txtLOG_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<WF_CHECK_LOG>.Factory(conn).GetRowData(WF_CHECK_LOG.Attribute.LOG_ID, Request["LOG_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtLOG_ID.Value = Convert.ToString(valObj.LOG_ID);//Convert.ToInt32                
                    
                    txtWFCID.Value = Convert.ToString(valObj.WFID);//Convert.ToInt32                
                    
                    txtPROCID.Value = Convert.ToString(valObj.PROCID);//Convert.ToInt32                
                    
                    txtSTEP_ID.Value = Convert.ToString(valObj.STEP_ID);//Convert.ToInt32                

                    txtREC_ID.Value = Convert.ToString(valObj.RECID);//Convert.ToString                
                    
                    txtDETAIL_ID.Value = Convert.ToString(valObj.DETAIL_ID);//Convert.ToString                
                    
                    txtRESULT.Value=valObj.RESULT.ToString();                
                    
                    txtCHECKER.Value = Convert.ToString(valObj.CHECKER);//Convert.ToString                
                    
                    txtCHECK_TIME.Value = (valObj.CHECK_TIME == DateTime.MinValue) ? "" : valObj.CHECK_TIME.ToString("yyyy-MM-dd");                
                    
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString                
                    
                    txtRESULTS.Value = Convert.ToString(valObj.RESULTS);//Convert.ToString                
                    
                    txtCHECKERS.Value = Convert.ToString(valObj.CHECKERS);//Convert.ToString                
                    
                    txtCHECK_TIMES.Value = Convert.ToString(valObj.CHECK_TIMES);//Convert.ToString                
                    
                    txtNOTES.Value = Convert.ToString(valObj.NOTES);//Convert.ToString
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
            WF_CHECK_LOG valObj = new WF_CHECK_LOG();
            
            
            if(txtLOG_ID.Value !="" )
                valObj.LOG_ID = Convert.ToInt32(txtLOG_ID.Value);
            
            
            if(txtWFCID.Value !="" )
                valObj.WFID = Convert.ToInt32(txtWFCID.Value);
            
            
            if(txtPROCID.Value !="" )
                valObj.PROCID = Convert.ToInt32(txtPROCID.Value);
            
            
            if(txtSTEP_ID.Value !="" )
                valObj.STEP_ID = Convert.ToInt32(txtSTEP_ID.Value);
            
            
            if(txtREC_ID.Value !="" )
                valObj.RECID = Convert.ToInt32(txtREC_ID.Value);
            
            
            if(txtDETAIL_ID.Value !="" )
                valObj.DETAIL_ID = Convert.ToString(txtDETAIL_ID.Value);
            
            
            if(txtRESULT.Value !="" )
                valObj.RESULT = Convert.ToString(txtRESULT.Value);
            
            
            if(txtCHECKER.Value !="" )
                valObj.CHECKER = Convert.ToString(txtCHECKER.Value);
            
            
            if(txtCHECK_TIME.Value !="" )
                valObj.CHECK_TIME = Convert.ToDateTime(txtCHECK_TIME.Value);
            
            
            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);
            
            
            if(txtRESULTS.Value !="" )
                valObj.RESULTS = Convert.ToString(txtRESULTS.Value);
            
            
            if(txtCHECKERS.Value !="" )
                valObj.CHECKERS = Convert.ToString(txtCHECKERS.Value);
            
            
            if(txtCHECK_TIMES.Value !="" )
                valObj.CHECK_TIMES = Convert.ToString(txtCHECK_TIMES.Value);
            
            
            if(txtNOTES.Value !="" )
                valObj.NOTES = Convert.ToString(txtNOTES.Value);

            if (keyid != "")
            {
                valObj.LOG_ID = Convert.ToInt32(keyid);
                count = BLLTable<WF_CHECK_LOG>.Factory(conn).Update(valObj, WF_CHECK_LOG.Attribute.LOG_ID);
            }
            else
            {
                count = BLLTable<WF_CHECK_LOG>.Factory(conn).Insert(valObj, WF_CHECK_LOG.Attribute.LOG_ID);
                keyid = valObj.LOG_ID.ToString();

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
                    
                    
                    txtLOG_ID.Value ="";
                    
                    
                    txtWFCID.Value ="";
                    
                    
                    txtPROCID.Value ="";
                    
                    
                    txtSTEP_ID.Value ="";
                    
                    
                    txtREC_ID.Value ="";
                    
                    
                    txtDETAIL_ID.Value ="";
                    
                    
                    txtRESULT.Value ="";
                    
                    
                    txtCHECKER.Value ="";
                    
                    
                    txtCHECK_TIME.Value ="";
                    
                    
                    txtNOTE.Value ="";
                    
                    
                    txtRESULTS.Value ="";
                    
                    
                    txtCHECKERS.Value ="";
                    
                    
                    txtCHECK_TIMES.Value ="";
                    
                    
                    txtNOTES.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

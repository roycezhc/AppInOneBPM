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
public partial class KM_KNMAEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    KM_KNMA valObj =new KM_KNMA();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KNMA_ID"]))
        {
            keyid = Request["KNMA_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
                                                                
            txtCLASS_ID.Items.AddRange(FormHelper.GetListItem(KM_KNMA.Attribute.CLASS_ID));             
            txtUP_TYPE.Items.AddRange(FormHelper.GetListItem(KM_KNMA.Attribute.UP_TYPE));             
            txtEA_SIGN.Items.AddRange(FormHelper.GetListItem(KM_KNMA.Attribute.EA_SIGN));                                                                        
            txtADD_TIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtEDIT_TIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");                          
            txtCAN_EDIT.Items.AddRange(FormHelper.GetListItem(KM_KNMA.Attribute.CAN_EDIT));             
            txtCAN_COMMENTS.Items.AddRange(FormHelper.GetListItem(KM_KNMA.Attribute.CAN_COMMENTS));

            this.txtKNMA_ID.Disabled = true;
            this.txtKNMA_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<KM_KNMA>.Factory(conn).GetRowData(KM_KNMA.Attribute.KNMA_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtKNMA_ID.Value = Convert.ToString(valObj.KNMA_ID);//Convert.ToString                
                    
                    txtKNMA_NAME.Value = Convert.ToString(valObj.KNMA_NAME);//Convert.ToString                
                    
                    txtP_KNMA_ID.Value = Convert.ToString(valObj.P_KNMA_ID);//Convert.ToString                
                    
                    txtCONTENT.Value = Convert.ToString(valObj.CONTENT);//Convert.ToString                
                    
                    txtCLASS_ID.Value=valObj.CLASS_ID.ToString();                
                    
                    txtUP_TYPE.Value=valObj.UP_TYPE.ToString();                
                    
                    txtEA_SIGN.Value=valObj.EA_SIGN.ToString();                
                    
                    txtAUTHOR.Value = Convert.ToString(valObj.AUTHOR);//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToDecimal                
                    
                    txtDEPT_ID.Value = Convert.ToString(valObj.DEPT_ID);//Convert.ToString                
                    
                    txtADD_TIME.Value = (valObj.ADD_TIME == DateTime.MinValue) ? "" : valObj.ADD_TIME.ToString("yyyy-MM-dd");                
                    
                    txtEDIT_TIME.Value = (valObj.EDIT_TIME == DateTime.MinValue) ? "" : valObj.EDIT_TIME.ToString("yyyy-MM-dd");                
                    
                    txtPATH_ID.Value = Convert.ToString(valObj.PATH_ID);//Convert.ToString                
                    
                    txtCAN_EDIT.Value=valObj.CAN_EDIT.ToString();                
                    
                    txtCAN_COMMENTS.Value=valObj.CAN_COMMENTS.ToString();                
                    
                    txtADD_USER.Value = Convert.ToString(valObj.ADD_USER);//Convert.ToString                
                    
                    txtEDIT_USER.Value = Convert.ToString(valObj.EDIT_USER);//Convert.ToString                
                    
                    txtS_LEVEL.Value = Convert.ToString(valObj.S_LEVEL);//Convert.ToString                
                    
                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                
                    
                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                
                    
                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString                
                    
                    txtEXP4.Value = Convert.ToString(valObj.EXP4);//Convert.ToString
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
            KM_KNMA valObj = new KM_KNMA();
            
            
            if(txtKNMA_ID.Value !="" )
                valObj.KNMA_ID = Convert.ToString(txtKNMA_ID.Value);
            
            
            if(txtKNMA_NAME.Value !="" )
                valObj.KNMA_NAME = Convert.ToString(txtKNMA_NAME.Value);
            
            
            if(txtP_KNMA_ID.Value !="" )
                valObj.P_KNMA_ID = Convert.ToString(txtP_KNMA_ID.Value);
            
            
            if(txtCONTENT.Value !="" )
                valObj.CONTENT = Convert.ToString(txtCONTENT.Value);
            
            
            if(txtCLASS_ID.Value !="" )
                valObj.CLASS_ID = Convert.ToString(txtCLASS_ID.Value);
            
            
            if(txtUP_TYPE.Value !="" )
                valObj.UP_TYPE = Convert.ToString(txtUP_TYPE.Value);
            
            
            if(txtEA_SIGN.Value !="" )
                valObj.EA_SIGN = Convert.ToString(txtEA_SIGN.Value);
            
            
            if(txtAUTHOR.Value !="" )
                valObj.AUTHOR = Convert.ToString(txtAUTHOR.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToDecimal(txtSORT_NO.Value);
            
            
            if(txtDEPT_ID.Value !="" )
                valObj.DEPT_ID = Convert.ToString(txtDEPT_ID.Value);
            
            
            if(txtADD_TIME.Value !="" )
                valObj.ADD_TIME = Convert.ToDateTime(txtADD_TIME.Value);
            
            
            if(txtEDIT_TIME.Value !="" )
                valObj.EDIT_TIME = Convert.ToDateTime(txtEDIT_TIME.Value);
            
            
            if(txtPATH_ID.Value !="" )
                valObj.PATH_ID = Convert.ToString(txtPATH_ID.Value);
            
            
            if(txtCAN_EDIT.Value !="" )
                valObj.CAN_EDIT = Convert.ToString(txtCAN_EDIT.Value);
            
            
            if(txtCAN_COMMENTS.Value !="" )
                valObj.CAN_COMMENTS = Convert.ToString(txtCAN_COMMENTS.Value);
            
            
            if(txtADD_USER.Value !="" )
                valObj.ADD_USER = Convert.ToString(txtADD_USER.Value);
            
            
            if(txtEDIT_USER.Value !="" )
                valObj.EDIT_USER = Convert.ToString(txtEDIT_USER.Value);
            
            
            if(txtS_LEVEL.Value !="" )
                valObj.S_LEVEL = Convert.ToString(txtS_LEVEL.Value);
            
            
            if(txtEXP1.Value !="" )
                valObj.EXP1 = Convert.ToString(txtEXP1.Value);
            
            
            if(txtEXP2.Value !="" )
                valObj.EXP2 = Convert.ToString(txtEXP2.Value);
            
            
            if(txtEXP3.Value !="" )
                valObj.EXP3 = Convert.ToString(txtEXP3.Value);
            
            
            if(txtEXP4.Value !="" )
                valObj.EXP4 = Convert.ToString(txtEXP4.Value);

            if (keyid != "")
            {
                valObj.KNMA_ID = Convert.ToString(keyid);
                count = BLLTable<KM_KNMA>.Factory(conn).Update(valObj, KM_KNMA.Attribute.KNMA_ID);
            }
            else
            {
                count = BLLTable<KM_KNMA>.Factory(conn).Insert(valObj, KM_KNMA.Attribute.KNMA_ID);
                keyid = valObj.KNMA_ID.ToString();

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
                    
                    
                    txtKNMA_ID.Value ="";
                    
                    
                    txtKNMA_NAME.Value ="";
                    
                    
                    txtP_KNMA_ID.Value ="";
                    
                    
                    txtCONTENT.Value ="";
                    
                    
                    txtCLASS_ID.Value ="";
                    
                    
                    txtUP_TYPE.Value ="";
                    
                    
                    txtEA_SIGN.Value ="";
                    
                    
                    txtAUTHOR.Value ="";
                    
                    
                    txtSORT_NO.Value ="";
                    
                    
                    txtDEPT_ID.Value ="";
                    
                    
                    txtADD_TIME.Value ="";
                    
                    
                    txtEDIT_TIME.Value ="";
                    
                    
                    txtPATH_ID.Value ="";
                    
                    
                    txtCAN_EDIT.Value ="";
                    
                    
                    txtCAN_COMMENTS.Value ="";
                    
                    
                    txtADD_USER.Value ="";
                    
                    
                    txtEDIT_USER.Value ="";
                    
                    
                    txtS_LEVEL.Value ="";
                    
                    
                    txtEXP1.Value ="";
                    
                    
                    txtEXP2.Value ="";
                    
                    
                    txtEXP3.Value ="";
                    
                    
                    txtEXP4.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

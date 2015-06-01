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
public partial class HR_CHECKINOUTEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_CHECKINOUT valObj =new HR_CHECKINOUT();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["CHECKTIME"]))
        {
            keyid = Request["CHECKTIME"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
                                             
            txtCHECKTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtCHECKTIME.Disabled = true;
            this.txtCHECKTIME.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_CHECKINOUT>.Factory(conn).GetRowData(HR_CHECKINOUT.Attribute.CHECKTIME, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtUSERID.Value = Convert.ToString(valObj.USERID);//Convert.ToInt32                
                    
                    txtCHECKTIME.Value = (valObj.CHECKTIME == DateTime.MinValue) ? "" : valObj.CHECKTIME.ToString("yyyy-MM-dd");                
                    
                    txtSTAFF_ID.Value = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal                
                    
                    txtCHECKTYPE.Value = Convert.ToString(valObj.CHECKTYPE);//Convert.ToString                
                    
                    txtVERIFYCODE.Value = Convert.ToString(valObj.VERIFYCODE);//Convert.ToInt32                
                    
                    txtSENSORID.Value = Convert.ToString(valObj.SENSORID);//Convert.ToString
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
            HR_CHECKINOUT valObj = new HR_CHECKINOUT();
            
            
            if(txtUSERID.Value !="" )
                valObj.USERID = Convert.ToInt32(txtUSERID.Value);
            
            
            if(txtCHECKTIME.Value !="" )
                valObj.CHECKTIME = Convert.ToDateTime(txtCHECKTIME.Value);
            
            
            if(txtSTAFF_ID.Value !="" )
                valObj.STAFF_ID = Convert.ToDecimal(txtSTAFF_ID.Value);
            
            
            if(txtCHECKTYPE.Value !="" )
                valObj.CHECKTYPE = Convert.ToString(txtCHECKTYPE.Value);
            
            
            if(txtVERIFYCODE.Value !="" )
                valObj.VERIFYCODE = Convert.ToInt32(txtVERIFYCODE.Value);
            
            
            if(txtSENSORID.Value !="" )
                valObj.SENSORID = Convert.ToString(txtSENSORID.Value);

            if (keyid != "")
            {
                //valObj.CHECKTIME = Convert.ToInt32(keyid);
                count = BLLTable<HR_CHECKINOUT>.Factory(conn).Update(valObj, HR_CHECKINOUT.Attribute.CHECKTIME);
            }
            else
            {
                count = BLLTable<HR_CHECKINOUT>.Factory(conn).Insert(valObj, HR_CHECKINOUT.Attribute.CHECKTIME);
                keyid = valObj.CHECKTIME.ToString();

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
                    
                    
                    txtUSERID.Value ="";
                    
                    
                    txtCHECKTIME.Value ="";
                    
                    
                    txtSTAFF_ID.Value ="";
                    
                    
                    txtCHECKTYPE.Value ="";
                    
                    
                    txtVERIFYCODE.Value ="";
                    
                    
                    txtSENSORID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

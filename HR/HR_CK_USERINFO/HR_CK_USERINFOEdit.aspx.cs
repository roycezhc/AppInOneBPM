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
using AgileFrame.AppInOne.SYS;
public partial class HR_CK_USERINFOEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_CK_USERINFO valObj =new HR_CK_USERINFO();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["USERID"]))
        {
            keyid = Request["USERID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
                                                                                                                                        
            txtBIRTHDAY.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtHIREDDAY.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtUSERID.Disabled = true;
            this.txtUSERID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_CK_USERINFO>.Factory(conn).GetRowData(HR_CK_USERINFO.Attribute.USERID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtUSERID.Value = Convert.ToString(valObj.USERID);//Convert.ToInt32                

                    wucSelStaff1.Staff_ID = Convert.ToDecimal(valObj.STAFF_ID);
                    wucSelStaff1.Staff_NAME = Convert.ToString(valObj.NAME);
                    //txtSTAFF_ID.Value = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal                
                    
                    txtBADGENUMBER.Value = Convert.ToString(valObj.BADGENUMBER);//Convert.ToString                
                    
                    txtSSN.Value = Convert.ToString(valObj.SSN);//Convert.ToString                
                    
                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString                
                    
                    txtGENDER.Value = Convert.ToString(valObj.GENDER);//Convert.ToString                
                    
                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                
                    
                    txtPAGER.Value = Convert.ToString(valObj.PAGER);//Convert.ToString                
                    
                    txtBIRTHDAY.Value = (valObj.BIRTHDAY == DateTime.MinValue) ? "" : valObj.BIRTHDAY.ToString("yyyy-MM-dd");                
                    
                    txtHIREDDAY.Value = (valObj.HIREDDAY == DateTime.MinValue) ? "" : valObj.HIREDDAY.ToString("yyyy-MM-dd");                
                    
                    txtSTREET.Value = Convert.ToString(valObj.STREET);//Convert.ToString                
                    
                    txtCITY.Value = Convert.ToString(valObj.CITY);//Convert.ToString                
                    
                    txtSTATE.Value = Convert.ToString(valObj.STATE);//Convert.ToString                
                    
                    txtZIP.Value = Convert.ToString(valObj.ZIP);//Convert.ToString                
                    
                    txtOPHONE.Value = Convert.ToString(valObj.OPHONE);//Convert.ToString                
                    
                    txtFPHONE.Value = Convert.ToString(valObj.FPHONE);//Convert.ToString                
                    
                    txtVERIFICATIONMETHOD.Value = Convert.ToString(valObj.VERIFICATIONMETHOD);//Convert.ToInt16                
                    
                    txtDEFAULTDEPTID.Value = Convert.ToString(valObj.DEFAULTDEPTID);//Convert.ToInt16                
                    
                    txtSECURITYFLAGS.Value = Convert.ToString(valObj.SECURITYFLAGS);//Convert.ToInt16                
                    
                    txtATT.Value = Convert.ToString(valObj.ATT);//Convert.ToInt16                
                    
                    txtINLATE.Value = Convert.ToString(valObj.INLATE);//Convert.ToInt16                
                    
                    txtOUTEARLY.Value = Convert.ToString(valObj.OUTEARLY);//Convert.ToInt16                
                    
                    txtOVERTIME.Value = Convert.ToString(valObj.OVERTIME);//Convert.ToInt16                
                    
                    txtSEP.Value = Convert.ToString(valObj.SEP);//Convert.ToInt16                
                    
                    txtHOLIDAY.Value = Convert.ToString(valObj.HOLIDAY);//Convert.ToInt16                
                    
                    txtMINZU.Value = Convert.ToString(valObj.MINZU);//Convert.ToString                
                    
                    txtPASSWORD.Value = Convert.ToString(valObj.PASSWORD);//Convert.ToString                
                    
                    txtLUNCHDURATION.Value = Convert.ToString(valObj.LUNCHDURATION);//Convert.ToInt16                
                    
                    txtMVerifyPass.Value = Convert.ToString(valObj.MVerifyPass);//Convert.ToString                
                    
                    txtPHOTO.Value = Convert.ToString(valObj.PHOTO);//Convert.ToBase64CharArray
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
            HR_CK_USERINFO valObj = new HR_CK_USERINFO();
            
            
            if(txtUSERID.Value !="" )
                valObj.USERID = Convert.ToInt32(txtUSERID.Value);


            if (wucSelStaff1.Staff_ID > 0)
                valObj.STAFF_ID = Convert.ToDecimal(wucSelStaff1.Staff_ID);
            
            
            if(txtBADGENUMBER.Value !="" )
                valObj.BADGENUMBER = Convert.ToString(txtBADGENUMBER.Value);
            
            
            if(txtSSN.Value !="" )
                valObj.SSN = Convert.ToString(txtSSN.Value);
            
            
            if(txtNAME.Value !="" )
                valObj.NAME = Convert.ToString(txtNAME.Value);
            
            
            if(txtGENDER.Value !="" )
                valObj.GENDER = Convert.ToString(txtGENDER.Value);
            
            
            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);
            
            
            if(txtPAGER.Value !="" )
                valObj.PAGER = Convert.ToString(txtPAGER.Value);
            
            
            if(txtBIRTHDAY.Value !="" )
                valObj.BIRTHDAY = Convert.ToDateTime(txtBIRTHDAY.Value);
            
            
            if(txtHIREDDAY.Value !="" )
                valObj.HIREDDAY = Convert.ToDateTime(txtHIREDDAY.Value);
            
            
            if(txtSTREET.Value !="" )
                valObj.STREET = Convert.ToString(txtSTREET.Value);
            
            
            if(txtCITY.Value !="" )
                valObj.CITY = Convert.ToString(txtCITY.Value);
            
            
            if(txtSTATE.Value !="" )
                valObj.STATE = Convert.ToString(txtSTATE.Value);
            
            
            if(txtZIP.Value !="" )
                valObj.ZIP = Convert.ToString(txtZIP.Value);
            
            
            if(txtOPHONE.Value !="" )
                valObj.OPHONE = Convert.ToString(txtOPHONE.Value);
            
            
            if(txtFPHONE.Value !="" )
                valObj.FPHONE = Convert.ToString(txtFPHONE.Value);
            
            
            if(txtVERIFICATIONMETHOD.Value !="" )
                valObj.VERIFICATIONMETHOD = Convert.ToInt16(txtVERIFICATIONMETHOD.Value);
            
            
            if(txtDEFAULTDEPTID.Value !="" )
                valObj.DEFAULTDEPTID = Convert.ToInt16(txtDEFAULTDEPTID.Value);
            
            
            if(txtSECURITYFLAGS.Value !="" )
                valObj.SECURITYFLAGS = Convert.ToInt16(txtSECURITYFLAGS.Value);
            
            
            if(txtATT.Value !="" )
                valObj.ATT = Convert.ToInt16(txtATT.Value);
            
            
            if(txtINLATE.Value !="" )
                valObj.INLATE = Convert.ToInt16(txtINLATE.Value);
            
            
            if(txtOUTEARLY.Value !="" )
                valObj.OUTEARLY = Convert.ToInt16(txtOUTEARLY.Value);
            
            
            if(txtOVERTIME.Value !="" )
                valObj.OVERTIME = Convert.ToInt16(txtOVERTIME.Value);
            
            
            if(txtSEP.Value !="" )
                valObj.SEP = Convert.ToInt16(txtSEP.Value);
            
            
            if(txtHOLIDAY.Value !="" )
                valObj.HOLIDAY = Convert.ToInt16(txtHOLIDAY.Value);
            
            
            if(txtMINZU.Value !="" )
                valObj.MINZU = Convert.ToString(txtMINZU.Value);
            
            
            if(txtPASSWORD.Value !="" )
                valObj.PASSWORD = Convert.ToString(txtPASSWORD.Value);
            
            
            if(txtLUNCHDURATION.Value !="" )
                valObj.LUNCHDURATION = Convert.ToInt16(txtLUNCHDURATION.Value);
            
            
            if(txtMVerifyPass.Value !="" )
                valObj.MVerifyPass = Convert.ToString(txtMVerifyPass.Value);
            

            if (keyid != "")
            {
                valObj.USERID = Convert.ToInt32(keyid);
                count = BLLTable<HR_CK_USERINFO>.Factory(conn).Update(valObj, HR_CK_USERINFO.Attribute.USERID);
            }
            else
            {
                count = BLLTable<HR_CK_USERINFO>.Factory(conn).Insert(valObj, HR_CK_USERINFO.Attribute.USERID);
                keyid = valObj.USERID.ToString();

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


                    wucSelStaff1.Staff_ID = 0;
                    
                    
                    txtBADGENUMBER.Value ="";
                    
                    
                    txtSSN.Value ="";
                    
                    
                    txtNAME.Value ="";
                    
                    
                    txtGENDER.Value ="";
                    
                    
                    txtTITLE.Value ="";
                    
                    
                    txtPAGER.Value ="";
                    
                    
                    txtBIRTHDAY.Value ="";
                    
                    
                    txtHIREDDAY.Value ="";
                    
                    
                    txtSTREET.Value ="";
                    
                    
                    txtCITY.Value ="";
                    
                    
                    txtSTATE.Value ="";
                    
                    
                    txtZIP.Value ="";
                    
                    
                    txtOPHONE.Value ="";
                    
                    
                    txtFPHONE.Value ="";
                    
                    
                    txtVERIFICATIONMETHOD.Value ="";
                    
                    
                    txtDEFAULTDEPTID.Value ="";
                    
                    
                    txtSECURITYFLAGS.Value ="";
                    
                    
                    txtATT.Value ="";
                    
                    
                    txtINLATE.Value ="";
                    
                    
                    txtOUTEARLY.Value ="";
                    
                    
                    txtOVERTIME.Value ="";
                    
                    
                    txtSEP.Value ="";
                    
                    
                    txtHOLIDAY.Value ="";
                    
                    
                    txtMINZU.Value ="";
                    
                    
                    txtPASSWORD.Value ="";
                    
                    
                    txtLUNCHDURATION.Value ="";
                    
                    
                    txtMVerifyPass.Value ="";
                    
                    
                    txtPHOTO.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

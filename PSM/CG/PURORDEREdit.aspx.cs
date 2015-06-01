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
public partial class IM_PURORDEREdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    IM_PURORDER valObj =new IM_PURORDER();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["PORD_ID"]))
        {
            keyid = Request["PORD_ID"];
        }
        if (!IsPostBack)
        {
            
                                                          
            txtC_DATE.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                                                                                               
            txtARRIVAL_DATE.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtPORD_ID.Disabled = true;
            this.txtPORD_ID.Attributes.Add("class","dis");
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<IM_PURORDER>.Factory(conn).GetRowData(IM_PURORDER.Attribute.PORD_ID, Request["PORD_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtPORD_ID.Value = Convert.ToString(valObj.PORD_ID);//Convert.ToDecimal                
                    
                    txtPORD_NO.Value = Convert.ToString(valObj.PORD_NO);//Convert.ToString                
                    
                    txtC_DATE.Value = (valObj.C_DATE == DateTime.MinValue) ? "" : valObj.C_DATE.ToString("yyyy-MM-dd");                
                    
                    txtORG_ID.ORG_ID = Convert.ToString(valObj.ORG_ID);//Convert.ToString                

                    txtDEPT_ID.DEPT_ID = Convert.ToString(valObj.DEPT_ID);//Convert.ToString                
                    
                    txtSUP_ID.Value = Convert.ToString(valObj.SUP_ID);//Convert.ToDecimal                
                    
                    txtPERSON_HID.Staff_ID = valObj.PERSON_HID;//Convert.ToDecimal                
                    
                    txtTS_NO.Value = Convert.ToString(valObj.TS_NO);//Convert.ToString                
                    
                    txtGOODES_NUM.Value = Convert.ToString(valObj.GOODES_NUM);//Convert.ToDecimal                
                    
                    txtARRIVAL_DATE.Value = (valObj.ARRIVAL_DATE == DateTime.MinValue) ? "" : valObj.ARRIVAL_DATE.ToString("yyyy-MM-dd");                
                    
                    txtPACKAGE_TYPE.Value = Convert.ToString(valObj.PACKAGE_TYPE);//Convert.ToString                
                    
                    txtTS_DEPT.Value = Convert.ToString(valObj.TS_DEPT);//Convert.ToString                
                    
                    txtPHONE.Value = Convert.ToString(valObj.PHONE);//Convert.ToString                
                    
                    txtCOST_PEICE_FLAG.Value = Convert.ToString(valObj.COST_PEICE_FLAG);//Convert.ToString                
                    
                    txtSTOR_ID.STOR_ID = valObj.STOR_ID;//Convert.ToDecimal                
                    
                    txtDEDUCTION_RATE.Value = Convert.ToString(valObj.DEDUCTION_RATE);//Convert.ToDecimal                
                    
                    txtTAX_RATE.Value = Convert.ToString(valObj.TAX_RATE);//Convert.ToDecimal                
                    
                    txtCREATER.Value = Convert.ToString(valObj.CREATER);//Convert.ToString                
                    
                    txtCHECKER.Value = Convert.ToString(valObj.CHECKER);//Convert.ToString                
                    
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString                
                    
                    txtREMARK.Value = Convert.ToString(valObj.REMARK);//Convert.ToString                
                    
                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                
                    
                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                
                    
                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString
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
            IM_PURORDER valObj = new IM_PURORDER();
            
            
            if(txtPORD_ID.Value !="" )
                valObj.PORD_ID = Convert.ToDecimal(txtPORD_ID.Value);
            
            
            if(txtPORD_NO.Value !="" )
                valObj.PORD_NO = Convert.ToString(txtPORD_NO.Value);
            
            
            if(txtC_DATE.Value !="" )
                valObj.C_DATE = Convert.ToDateTime(txtC_DATE.Value);

            valObj.ORG_ID = txtORG_ID.ORG_ID;

            valObj.DEPT_ID = Convert.ToString(txtDEPT_ID.DEPT_ID);

            if(txtSUP_ID.Value !="" )
                valObj.SUP_ID = Convert.ToDecimal(txtSUP_ID.Value);
            
            
            valObj.PERSON_HID =txtPERSON_HID.Staff_ID;
            
            
            if(txtTS_NO.Value !="" )
                valObj.TS_NO = Convert.ToString(txtTS_NO.Value);
            
            
            if(txtGOODES_NUM.Value !="" )
                valObj.GOODES_NUM = Convert.ToDecimal(txtGOODES_NUM.Value);
            
            
            if(txtARRIVAL_DATE.Value !="" )
                valObj.ARRIVAL_DATE = Convert.ToDateTime(txtARRIVAL_DATE.Value);
            
            
            if(txtPACKAGE_TYPE.Value !="" )
                valObj.PACKAGE_TYPE = Convert.ToString(txtPACKAGE_TYPE.Value);
            
            
            if(txtTS_DEPT.Value !="" )
                valObj.TS_DEPT = Convert.ToString(txtTS_DEPT.Value);
            
            
            if(txtPHONE.Value !="" )
                valObj.PHONE = Convert.ToString(txtPHONE.Value);
            
            
            if(txtCOST_PEICE_FLAG.Value !="" )
                valObj.COST_PEICE_FLAG = Convert.ToString(txtCOST_PEICE_FLAG.Value);

            valObj.STOR_ID =txtSTOR_ID.STOR_ID;

            if(txtDEDUCTION_RATE.Value !="" )
                valObj.DEDUCTION_RATE = Convert.ToDecimal(txtDEDUCTION_RATE.Value);
            
            
            if(txtTAX_RATE.Value !="" )
                valObj.TAX_RATE = Convert.ToDecimal(txtTAX_RATE.Value);
            
            
            if(txtCREATER.Value !="" )
                valObj.CREATER = Convert.ToString(txtCREATER.Value);
            
            
            if(txtCHECKER.Value !="" )
                valObj.CHECKER = Convert.ToString(txtCHECKER.Value);
            
            
            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);
            
            
            if(txtREMARK.Value !="" )
                valObj.REMARK = Convert.ToString(txtREMARK.Value);
            
            
            if(txtEXP1.Value !="" )
                valObj.EXP1 = Convert.ToString(txtEXP1.Value);
            
            
            if(txtEXP2.Value !="" )
                valObj.EXP2 = Convert.ToString(txtEXP2.Value);
            
            
            if(txtEXP3.Value !="" )
                valObj.EXP3 = Convert.ToString(txtEXP3.Value);

            //Request.Url.

            if (keyid != "")
            {
                valObj.PORD_ID = Convert.ToInt32(keyid);
                count = BLLTable<IM_PURORDER>.Factory(conn).Update(valObj, IM_PURORDER.Attribute.PORD_ID);
            }
            else
            {
                count = BLLTable<IM_PURORDER>.Factory(conn).Insert(valObj, IM_PURORDER.Attribute.PORD_ID);
                keyid = valObj.PORD_ID.ToString();

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
                    #region
                    txtPORD_ID.Value ="";
                    txtPORD_NO.Value ="";
                    txtC_DATE.Value ="";
                    //txtORG_ID.Value ="";
                    //txtDEPT_ID.Value ="";
                    txtSUP_ID.Value ="";
                    //txtPERSON_HID.Value ="";
                    txtTS_NO.Value ="";
                    txtGOODES_NUM.Value ="";
                    txtARRIVAL_DATE.Value ="";
                    txtPACKAGE_TYPE.Value ="";
                    txtTS_DEPT.Value ="";
                    
                    
                    txtPHONE.Value ="";
                    
                    
                    txtCOST_PEICE_FLAG.Value ="";
                    
                    
                    //txtSTOR_ID.Value ="";
                    
                    
                    txtDEDUCTION_RATE.Value ="";
                    
                    
                    txtTAX_RATE.Value ="";
                    
                    
                    txtCREATER.Value ="";
                    
                    
                    txtCHECKER.Value ="";
                    
                    
                    txtNOTE.Value ="";
                    
                    
                    txtREMARK.Value ="";
                    
                    
                    txtEXP1.Value ="";
                    
                    
                    txtEXP2.Value ="";
                    
                    
                    txtEXP3.Value ="";
                    #endregion
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

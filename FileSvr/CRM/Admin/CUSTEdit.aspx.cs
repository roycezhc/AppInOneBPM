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
public partial class CRM_CUSTEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    CRM_CUST valObj =new CRM_CUST();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Cus_ID"]))
        {
            keyid = Request["Cus_ID"];
        }
        if (!IsPostBack)
        {
            
                                                                                                                                                                                                                            
            txtState.Items.AddRange(FormHelper.GetListItem(CRM_CUST.Attribute.State));             
            txtIsSign.Items.AddRange(FormHelper.GetListItem(CRM_CUST.Attribute.IsSign));                                 
            txtAddTime.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtEditTime.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtCus_ID.Disabled = true;
            this.txtCus_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<CRM_CUST>.Factory(conn).GetRowData(CRM_CUST.Attribute.Cus_ID, Request["Cus_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCus_ID.Value = Convert.ToString(valObj.Cus_ID);//Convert.ToInt32                
                    
                    txtCus_Name.Value = Convert.ToString(valObj.Cus_Name);//Convert.ToString                
                    
                    txtJob.Value = Convert.ToString(valObj.Job);//Convert.ToString                
                    
                    txtRelationTxt.Value = Convert.ToString(valObj.RelationTxt);//Convert.ToString                
                    
                    txtRecorder.Value = Convert.ToString(valObj.Recorder);//Convert.ToString                
                    
                    txtMobPhone.Value = Convert.ToString(valObj.MobPhone);//Convert.ToString                
                    
                    txtPhone.Value = Convert.ToString(valObj.Phone);//Convert.ToString                
                    
                    txtContactName.Value = Convert.ToString(valObj.ContactName);//Convert.ToString                
                    
                    txtShopName.Value = Convert.ToString(valObj.ShopName);//Convert.ToString                
                    
                    txtShopAddr.Value = Convert.ToString(valObj.ShopAddr);//Convert.ToString                
                    
                    txtQQ.Value = Convert.ToString(valObj.QQ);//Convert.ToString                
                    
                    txtWW.Value = Convert.ToString(valObj.WW);//Convert.ToString                
                    
                    txtEmail.Value = Convert.ToString(valObj.Email);//Convert.ToString                
                    
                    txtAddress.Value = Convert.ToString(valObj.Address);//Convert.ToString                
                    
                    txtTrade.Value = Convert.ToString(valObj.Trade);//Convert.ToString                
                    
                    txtType.Value = Convert.ToString(valObj.Type);//Convert.ToInt32                
                    
                    txtState.Value=valObj.State.ToString();                
                    
                    txtIsSign.Value=valObj.IsSign.ToString();                
                    
                    txtAddTime.Value = (valObj.AddTime == DateTime.MinValue) ? "" : valObj.AddTime.ToString("yyyy-MM-dd");                
                    
                    txtEditTime.Value = (valObj.EditTime == DateTime.MinValue) ? "" : valObj.EditTime.ToString("yyyy-MM-dd");                
                    
                    txtPATH.Value = Convert.ToString(valObj.PATH);//Convert.ToString                
                    
                    txtPNAME.Value = Convert.ToString(valObj.PNAME);//Convert.ToString
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
            CRM_CUST valObj = new CRM_CUST();
            
            
            if(txtCus_ID.Value !="" )
                valObj.Cus_ID = Convert.ToInt32(txtCus_ID.Value);
            
            
            if(txtCus_Name.Value !="" )
                valObj.Cus_Name = Convert.ToString(txtCus_Name.Value);
            
            
            if(txtJob.Value !="" )
                valObj.Job = Convert.ToString(txtJob.Value);
            
            
            if(txtRelationTxt.Value !="" )
                valObj.RelationTxt = Convert.ToString(txtRelationTxt.Value);
            
            
            if(txtRecorder.Value !="" )
                valObj.Recorder = Convert.ToString(txtRecorder.Value);
            
            
            if(txtMobPhone.Value !="" )
                valObj.MobPhone = Convert.ToString(txtMobPhone.Value);
            
            
            if(txtPhone.Value !="" )
                valObj.Phone = Convert.ToString(txtPhone.Value);
            
            
            if(txtContactName.Value !="" )
                valObj.ContactName = Convert.ToString(txtContactName.Value);
            
            
            if(txtShopName.Value !="" )
                valObj.ShopName = Convert.ToString(txtShopName.Value);
            
            
            if(txtShopAddr.Value !="" )
                valObj.ShopAddr = Convert.ToString(txtShopAddr.Value);
            
            
            if(txtQQ.Value !="" )
                valObj.QQ = Convert.ToString(txtQQ.Value);
            
            
            if(txtWW.Value !="" )
                valObj.WW = Convert.ToString(txtWW.Value);
            
            
            if(txtEmail.Value !="" )
                valObj.Email = Convert.ToString(txtEmail.Value);
            
            
            if(txtAddress.Value !="" )
                valObj.Address = Convert.ToString(txtAddress.Value);
            
            
            if(txtTrade.Value !="" )
                valObj.Trade = Convert.ToString(txtTrade.Value);
            
            
            if(txtType.Value !="" )
                valObj.Type = Convert.ToInt32(txtType.Value);
            
            
            if(txtState.Value !="" )
                valObj.State = Convert.ToInt32(txtState.Value);
            
            
            if(txtIsSign.Value !="" )
                valObj.IsSign = Convert.ToInt32(txtIsSign.Value);
            
            
            if(txtAddTime.Value !="" )
                valObj.AddTime = Convert.ToDateTime(txtAddTime.Value);
            
            
            if(txtEditTime.Value !="" )
                valObj.EditTime = Convert.ToDateTime(txtEditTime.Value);
            
            
            if(txtPATH.Value !="" )
                valObj.PATH = Convert.ToString(txtPATH.Value);
            
            
            if(txtPNAME.Value !="" )
                valObj.PNAME = Convert.ToString(txtPNAME.Value);

            if (keyid != "")
            {
                valObj.Cus_ID = Convert.ToInt32(keyid);
                count = BLLTable<CRM_CUST>.Factory(conn).Update(valObj, CRM_CUST.Attribute.Cus_ID);
            }
            else
            {
                count = BLLTable<CRM_CUST>.Factory(conn).Insert(valObj, CRM_CUST.Attribute.Cus_ID);
                keyid = valObj.Cus_ID.ToString();

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
                    
                    
                    txtCus_ID.Value ="";
                    
                    
                    txtCus_Name.Value ="";
                    
                    
                    txtJob.Value ="";
                    
                    
                    txtRelationTxt.Value ="";
                    
                    
                    txtRecorder.Value ="";
                    
                    
                    txtMobPhone.Value ="";
                    
                    
                    txtPhone.Value ="";
                    
                    
                    txtContactName.Value ="";
                    
                    
                    txtShopName.Value ="";
                    
                    
                    txtShopAddr.Value ="";
                    
                    
                    txtQQ.Value ="";
                    
                    
                    txtWW.Value ="";
                    
                    
                    txtEmail.Value ="";
                    
                    
                    txtAddress.Value ="";
                    
                    
                    txtTrade.Value ="";
                    
                    
                    txtType.Value ="";
                    
                    
                    txtState.Value ="";
                    
                    
                    txtIsSign.Value ="";
                    
                    
                    txtAddTime.Value ="";
                    
                    
                    txtEditTime.Value ="";
                    
                    
                    txtPATH.Value ="";
                    
                    
                    txtPNAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

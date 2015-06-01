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
public partial class CRM_CUSTOMEREdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    CRM_CUSTOMER valObj =new CRM_CUSTOMER();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏列代码
        //hideAttributeItemList = new List<AttributeItem>();
        //hideAttributeItemList.Add(CRM_CUSTOMER.Attribute.EXP1);
        //hideAttributeItemList.Add(CRM_CUSTOMER.Attribute.EXP2);
        //hideAttributeItemList.Add(CRM_CUSTOMER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideAttributeItemList);
        #endregion

        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["Cus_Id"]))
        {
            keyid = Request["Cus_Id"];
        }
        if (!IsPostBack)
        {
            
                                                                                                 
            txtBirthday.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                                                        
            txtLoadHighSeasTime.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtCus_Id.Disabled = true;
            this.txtCus_Id.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<CRM_CUSTOMER>.Factory(conn).GetRowData(CRM_CUSTOMER.Attribute.Cus_Id, Request["Cus_Id"]);
                    if(valObj==null) return ;
                    
                    
                    txtCompanyName.Value = Convert.ToString(valObj.CompanyName);//Convert.ToString                
                    
                    txtCompanyAddress.Value = Convert.ToString(valObj.CompanyAddress);//Convert.ToString                
                    
                    txtShopName.Value = Convert.ToString(valObj.ShopName);//Convert.ToString                
                    
                    txtShopNameURL.Value = Convert.ToString(valObj.ShopNameURL);//Convert.ToString                
                    
                    txtCustSex.Value = Convert.ToString(valObj.CustSex);//Convert.ToInt32                
                    
                    txtBirthday.Value = (valObj.Birthday == DateTime.MinValue) ? "" : valObj.Birthday.ToString("yyyy-MM-dd");                
                    
                    txtWangWangId.Value = Convert.ToString(valObj.WangWangId);//Convert.ToString                
                    
                    txtCustQQ.Value = Convert.ToString(valObj.CustQQ);//Convert.ToString                
                    
                    txtLastEditors.Value = Convert.ToString(valObj.LastEditors);//Convert.ToString                
                    
                    txtLoadHighSeasTime.Value = (valObj.LoadHighSeasTime == DateTime.MinValue) ? "" : valObj.LoadHighSeasTime.ToString("yyyy-MM-dd");                
                    
                    txtCus_Id.Value = Convert.ToString(valObj.Cus_Id);//Convert.ToInt32
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
            CRM_CUSTOMER valObj = new CRM_CUSTOMER();
            
            
            if(txtCompanyName.Value !="" )
                valObj.CompanyName = Convert.ToString(txtCompanyName.Value);
            
            
            if(txtCompanyAddress.Value !="" )
                valObj.CompanyAddress = Convert.ToString(txtCompanyAddress.Value);
            
            
            if(txtShopName.Value !="" )
                valObj.ShopName = Convert.ToString(txtShopName.Value);
            
            
            if(txtShopNameURL.Value !="" )
                valObj.ShopNameURL = Convert.ToString(txtShopNameURL.Value);
            
            
            if(txtCustSex.Value !="" )
                valObj.CustSex = Convert.ToInt32(txtCustSex.Value);
            
            
            if(txtBirthday.Value !="" )
                valObj.Birthday = Convert.ToDateTime(txtBirthday.Value);
            
            
            if(txtWangWangId.Value !="" )
                valObj.WangWangId = Convert.ToString(txtWangWangId.Value);
            
            
            if(txtCustQQ.Value !="" )
                valObj.CustQQ = Convert.ToString(txtCustQQ.Value);
            
            
            if(txtLastEditors.Value !="" )
                valObj.LastEditors = Convert.ToString(txtLastEditors.Value);
            
            
            if(txtLoadHighSeasTime.Value !="" )
                valObj.LoadHighSeasTime = Convert.ToDateTime(txtLoadHighSeasTime.Value);
            
            
            if(txtCus_Id.Value !="" )
                valObj.Cus_Id = Convert.ToInt32(txtCus_Id.Value);

            if (keyid != "")
            {
                valObj.Cus_Id = Convert.ToInt32(keyid);
                count = BLLTable<CRM_CUSTOMER>.Factory(conn).Update(valObj, CRM_CUSTOMER.Attribute.Cus_Id);
            }
            else
            {
                count = BLLTable<CRM_CUSTOMER>.Factory(conn).Insert(valObj, CRM_CUSTOMER.Attribute.Cus_Id);
                keyid = valObj.Cus_Id.ToString();

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
                    
                    
                    txtCompanyName.Value ="";
                    
                    
                    txtCompanyAddress.Value ="";
                    
                    
                    txtShopName.Value ="";
                    
                    
                    txtShopNameURL.Value ="";
                    
                    
                    txtCustSex.Value ="";
                    
                    
                    txtBirthday.Value ="";
                    
                    
                    txtWangWangId.Value ="";
                    
                    
                    txtCustQQ.Value ="";
                    
                    
                    txtLastEditors.Value ="";
                    
                    
                    txtLoadHighSeasTime.Value ="";
                    
                    
                    txtCus_Id.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

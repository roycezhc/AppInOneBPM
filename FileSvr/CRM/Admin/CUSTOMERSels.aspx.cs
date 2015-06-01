using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class CRM_CUSTOMERSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new CRM_CUSTOMER()._ZhName;

    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    CRM_CUSTOMER valObj = new CRM_CUSTOMER();
    CRM_CUSTOMER condObj = new CRM_CUSTOMER();
    List<CRM_CUSTOMER> listObj = new List<CRM_CUSTOMER>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP1);
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP2);
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP1);
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP2);
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP3);
        #endregion
        valObj.OrderBy(CRM_CUSTOMER.Attribute.Cus_Id, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                CRM_CUSTOMER roleOld = new CRM_CUSTOMER();
                roleOld.Where(CRM_CUSTOMER.Attribute.Cus_Id, Request["ids"].ToString());
                listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Cus_Id + "',Name:'" + listObj[i].Cus_Id + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].Cus_Id;
                }
            }
            try
            {

                listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repList.DataSource = listObj;
                repList.DataBind();
                aspPager.RecordCount = recount;
            }
            catch (Exception ex)
            {
                 litWarn.Text = ex.Message;
            }



        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new CRM_CUSTOMER();
        
        
        if(txtCompanyName.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.CompanyName, Convert.ToString(txtCompanyName.Value));
        
        
        if(txtCompanyAddress.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.CompanyAddress, Convert.ToString(txtCompanyAddress.Value));
        
        
        if(txtShopName.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.ShopName, Convert.ToString(txtShopName.Value));
        
        
        if(txtShopNameURL.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.ShopNameURL, Convert.ToString(txtShopNameURL.Value));
        
        
        if(txtCustSex.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.CustSex, Convert.ToInt32(txtCustSex.Value));
        
        
        if(txtBirthday.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.Birthday, Convert.ToDateTime(txtBirthday.Value));
        
        
        if(txtWangWangId.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.WangWangId, Convert.ToString(txtWangWangId.Value));
        
        
        if(txtCustQQ.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.CustQQ, Convert.ToString(txtCustQQ.Value));
        
        
        if(txtLastEditors.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.LastEditors, Convert.ToString(txtLastEditors.Value));
        
        
        if(txtLoadHighSeasTime.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.LoadHighSeasTime, Convert.ToDateTime(txtLoadHighSeasTime.Value));
        
        
        if(txtCus_Id.Value !="" )
            condObj.Like_OR(CRM_CUSTOMER.Attribute.Cus_Id, Convert.ToInt32(txtCus_Id.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repList.DataSource = listObj;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }

    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            recount = aspPager.RecordCount;
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<CRM_CUSTOMER>(hidCondition.Value);
            }
            List<CRM_CUSTOMER> listVal = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
            repList.DataSource = listVal;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (hidOld.Value != "")
        {
            HtmlInputCheckBox ck = (HtmlInputCheckBox)e.Item.FindControl("chkSel");
            string id = ck.Attributes["value"];

            if (IsInOld(hidInitIDS.Value, id, ','))
            {
                ck.Checked = true;
            }
        }
    }
}
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
public partial class CRM_CUSTSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new CRM_CUST()._ZhName;

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
    CRM_CUST valObj = new CRM_CUST();
    CRM_CUST condObj = new CRM_CUST();
    List<CRM_CUST> listObj = new List<CRM_CUST>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP3);
        #endregion
        condObj.OrderBy(CRM_CUST.Attribute.Cus_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                CRM_CUST roleOld = new CRM_CUST();
                roleOld.Where(CRM_CUST.Attribute.Cus_ID, Request["ids"].ToString());
                listObj = BLLTable<CRM_CUST>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Cus_ID + "',Name:'" + listObj[i].Cus_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].Cus_ID;
                }
            }
            try
            {

                listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new CRM_CUST();
        
        
        if(txtCus_ID.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Cus_ID, Convert.ToInt32(txtCus_ID.Value));
        
        
        if(txtCus_Name.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Cus_Name, Convert.ToString(txtCus_Name.Value));
        
        
        if(txtJob.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Job, Convert.ToString(txtJob.Value));
        
        
        if(txtRelationTxt.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.RelationTxt, Convert.ToString(txtRelationTxt.Value));
        
        
        if(txtRecorder.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Recorder, Convert.ToString(txtRecorder.Value));
        
        
        if(txtMobPhone.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.MobPhone, Convert.ToString(txtMobPhone.Value));
        
        
        if(txtPhone.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Phone, Convert.ToString(txtPhone.Value));
        
        
        if(txtContactName.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.ContactName, Convert.ToString(txtContactName.Value));
        
        
        if(txtShopName.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.ShopName, Convert.ToString(txtShopName.Value));
        
        
        if(txtShopAddr.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.ShopAddr, Convert.ToString(txtShopAddr.Value));
        
        
        if(txtQQ.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.QQ, Convert.ToString(txtQQ.Value));
        
        
        if(txtWW.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.WW, Convert.ToString(txtWW.Value));
        
        
        if(txtEmail.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Email, Convert.ToString(txtEmail.Value));
        
        
        if(txtAddress.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Address, Convert.ToString(txtAddress.Value));
        
        
        if(txtTrade.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Trade, Convert.ToString(txtTrade.Value));
        
        
        if(txtType.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.Type, Convert.ToInt32(txtType.Value));
        
        
        if(txtState.Value !="" )
            condObj.State = Convert.ToInt32(txtState.Value);
        
        
        if(txtIsSign.Value !="" )
            condObj.IsSign = Convert.ToInt32(txtIsSign.Value);
        
        
        if(txtAddTime.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.AddTime, Convert.ToDateTime(txtAddTime.Value));
        
        
        if(txtEditTime.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.EditTime, Convert.ToDateTime(txtEditTime.Value));
        
        
        if(txtPATH.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.PATH, Convert.ToString(txtPATH.Value));
        
        
        if(txtPNAME.Value !="" )
            condObj.Like_OR(CRM_CUST.Attribute.PNAME, Convert.ToString(txtPNAME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<CRM_CUST>(hidCondition.Value);
            }
            List<CRM_CUST> listVal = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
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

public partial class WEC_REQUEST_DETAILSels : BaseAdminPage
{
    public string title = new WEC_REQUEST_DETAIL()._ZhName;

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
    WEC_REQUEST_DETAIL valObj = new WEC_REQUEST_DETAIL();
    WEC_REQUEST_DETAIL condObj = new WEC_REQUEST_DETAIL();
    List<WEC_REQUEST_DETAIL> listObj = new List<WEC_REQUEST_DETAIL>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_REQUEST_DETAIL.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_REQUEST_DETAIL roleOld = new WEC_REQUEST_DETAIL();
                roleOld.Where(WEC_REQUEST_DETAIL.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_REQUEST_DETAIL>.Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].ID + "',Name:'" + listObj[i].ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].ID;
                }
            }
            try
            {

                listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_REQUEST_DETAIL();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtTID.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.TID, Convert.ToDecimal(txtTID.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtSORT_ID.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.SORT_ID, Convert.ToDecimal(txtSORT_ID.Value));
        
        
        if(txtPICURL.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
        
        
        if(txtTYPE_ID.Value !="" )
            condObj.TYPE_ID = Convert.ToString(txtTYPE_ID.Value);
        
        
        if(txtTYPE_VALUE.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE, Convert.ToString(txtTYPE_VALUE.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_REQUEST_DETAIL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_REQUEST_DETAIL>(hidCondition.Value);
            }
            List<WEC_REQUEST_DETAIL> listVal = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
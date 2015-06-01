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
public partial class TF_TABLESels2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_TABLE()._ZhName;

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
    TF_TABLE valObj = new TF_TABLE();
    TF_TABLE condObj = new TF_TABLE();
    List<TF_TABLE> listObj = new List<TF_TABLE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_TABLE.Attribute.TB_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_TABLE roleOld = new TF_TABLE();
                roleOld.Where(TF_TABLE.Attribute.TB_ID, Request["ids"].ToString());
                listObj = BLLTable<TF_TABLE>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].TB_ID + "',Name:'" + listObj[i].TB_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].TB_ID;
                }
            }
            try
            {

                listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_TABLE();
        
        
        if(txtTB_ID.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtTB_NAME.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.TB_NAME, Convert.ToString(txtTB_NAME.Value));
        
        
        if(txtCH_NAME.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.CH_NAME, Convert.ToString(txtCH_NAME.Value));
        
        
        if(txtM_TB_ID.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.M_TB_ID, Convert.ToInt32(txtM_TB_ID.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtTB_TYPE.Value !="" )
            condObj.TB_TYPE = Convert.ToInt32(txtTB_TYPE.Value);
        
        
        if(txtNOTE.Value !="" )
            condObj.Like_OR(TF_TABLE.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_TABLE>(hidCondition.Value);
            }
            List<TF_TABLE> listVal = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
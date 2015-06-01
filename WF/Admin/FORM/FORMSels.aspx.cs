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
public partial class WF_FORMSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_FORM()._ZhName;

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
    TF_FORM valObj = new TF_FORM();
    TF_FORM condObj = new TF_FORM();
    List<TF_FORM> listObj = new List<TF_FORM>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP1);
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP2);
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP1);
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP2);
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_FORM.Attribute.FORM_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_FORM roleOld = new TF_FORM();
                roleOld.Where(TF_FORM.Attribute.FORM_ID, Request["ids"].ToString());
                listObj = BLLTable<TF_FORM>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].FORM_ID + "',Name:'" + listObj[i].FORM_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].FORM_ID;
                }
            }
            try
            {

                listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_FORM();
        
        
        if(txtFORM_ID.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.FORM_ID, Convert.ToInt32(txtFORM_ID.Value));
        
        
        if(txtF_NAME.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.F_NAME, Convert.ToString(txtF_NAME.Value));
        
        
        if(txtTB_ID.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtTPL_EDIT.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TPL_EDIT, Convert.ToString(txtTPL_EDIT.Value));
        
        
        if(txtTPL_SHOW.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TPL_SHOW, Convert.ToString(txtTPL_SHOW.Value));
        
        
        if(txtTPL_PRINT.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TPL_PRINT, Convert.ToString(txtTPL_PRINT.Value));
        
        
        if(txtTPL_LIST.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TPL_LIST, Convert.ToString(txtTPL_LIST.Value));
        
        
        if(txtTB_IDS.Value !="" )
            condObj.Like_OR(TF_FORM.Attribute.TB_IDS, Convert.ToString(txtTB_IDS.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_FORM>(hidCondition.Value);
            }
            List<TF_FORM> listVal = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
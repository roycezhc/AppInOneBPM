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
public partial class WF_CTRL_TYPESels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_CTRL_TYPE()._ZhName;

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
    TF_CTRL_TYPE valObj = new TF_CTRL_TYPE();
    TF_CTRL_TYPE condObj = new TF_CTRL_TYPE();
    List<TF_CTRL_TYPE> listObj = new List<TF_CTRL_TYPE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_CTRL_TYPE roleOld = new TF_CTRL_TYPE();
                roleOld.Where(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Request["ids"].ToString());
                listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].CTRL_TYPE + "',Name:'" + listObj[i].CTRL_TYPE + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].CTRL_TYPE;
                }
            }
            try
            {

                listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_CTRL_TYPE();
        
        
        if(txtCTRL_TYPE.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));
        
        
        if(txtP_CTRL_TYPE.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.P_CTRL_TYPE, Convert.ToString(txtP_CTRL_TYPE.Value));
        
        
        if(txtCTRL_NAME.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.CTRL_NAME, Convert.ToString(txtCTRL_NAME.Value));
        
        
        if(txtEL_HTML.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.EL_HTML, Convert.ToString(txtEL_HTML.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtJS_CODE.Value !="" )
            condObj.Like_OR(TF_CTRL_TYPE.Attribute.JS_CODE, Convert.ToString(txtJS_CODE.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_CTRL_TYPE>(hidCondition.Value);
            }
            List<TF_CTRL_TYPE> listVal = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
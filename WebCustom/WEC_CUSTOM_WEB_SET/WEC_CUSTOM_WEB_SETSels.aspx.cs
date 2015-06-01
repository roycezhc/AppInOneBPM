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

public partial class WEC_CUSTOM_WEB_SETSels : BaseAdminPage
{
    public string title = new WEC_CUSTOM_WEB_SET()._ZhName;

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
    WEC_CUSTOM_WEB_SET valObj = new WEC_CUSTOM_WEB_SET();
    WEC_CUSTOM_WEB_SET condObj = new WEC_CUSTOM_WEB_SET();
    List<WEC_CUSTOM_WEB_SET> listObj = new List<WEC_CUSTOM_WEB_SET>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CUSTOM_WEB_SET.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_CUSTOM_WEB_SET.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_CUSTOM_WEB_SET roleOld = new WEC_CUSTOM_WEB_SET();
                roleOld.Where(WEC_CUSTOM_WEB_SET.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_CUSTOM_WEB_SET>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<WEC_CUSTOM_WEB_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_CUSTOM_WEB_SET();
        
        
        if(txtWEC_CUSTOM_WEB_SET_ID.Value !="" )
            condObj.Like(WEC_CUSTOM_WEB_SET.Attribute.ID, Convert.ToInt32(txtWEC_CUSTOM_WEB_SET_ID.Value));
        
        
        if(txtWEC_CUSTOM_WEB_SET_STAFF_ID.Value !="" )
            condObj.Like(WEC_CUSTOM_WEB_SET.Attribute.STAFF_ID, Convert.ToInt32(txtWEC_CUSTOM_WEB_SET_STAFF_ID.Value));
        
        
        if(txtWEC_CUSTOM_WEB_SET_A_ID.Value !="" )
            condObj.Like(WEC_CUSTOM_WEB_SET.Attribute.A_ID, Convert.ToInt32(txtWEC_CUSTOM_WEB_SET_A_ID.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_CUSTOM_WEB_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CUSTOM_WEB_SET>(hidCondition.Value);
            }
            List<WEC_CUSTOM_WEB_SET> listVal = BLLTable<WEC_CUSTOM_WEB_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
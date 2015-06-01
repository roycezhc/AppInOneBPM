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
public partial class SYS_DATASOURCESels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new SYS_DATASOURCE()._ZhName;

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
    SYS_DATASOURCE valObj = new SYS_DATASOURCE();
    SYS_DATASOURCE condObj = new SYS_DATASOURCE();
    List<SYS_DATASOURCE> listObj = new List<SYS_DATASOURCE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(SYS_DATASOURCE.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                SYS_DATASOURCE roleOld = new SYS_DATASOURCE();
                roleOld.Where(SYS_DATASOURCE.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new SYS_DATASOURCE();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(SYS_DATASOURCE.Attribute.ID, Convert.ToString(txtID.Value));
        
        
        if(txtSourceConnectString.Value !="" )
            condObj.Like_OR(SYS_DATASOURCE.Attribute.SourceConnectString, Convert.ToString(txtSourceConnectString.Value));
        
        
        if(txtSourceType.Value !="" )
            condObj.Like_OR(SYS_DATASOURCE.Attribute.SourceType, Convert.ToString(txtSourceType.Value));
        
        
        if(txtSourceName.Value !="" )
            condObj.Like_OR(SYS_DATASOURCE.Attribute.SourceName, Convert.ToString(txtSourceName.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_DATASOURCE>(hidCondition.Value);
            }
            List<SYS_DATASOURCE> listVal = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
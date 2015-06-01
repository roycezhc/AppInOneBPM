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

public partial class SYS_APPSels : BaseAdminPage
{
    public string title = new SYS_APP()._ZhName;

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
    SYS_APP valObj = new SYS_APP();
    SYS_APP condObj = new SYS_APP();
    List<SYS_APP> listObj = new List<SYS_APP>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP3);
        #endregion
        condObj.OrderBy(SYS_APP.Attribute.APP_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                SYS_APP roleOld = new SYS_APP();
                roleOld.Where(SYS_APP.Attribute.APP_ID, Request["ids"].ToString());
                listObj = BLLTable<SYS_APP>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].APP_ID + "',Name:'" + listObj[i].APP_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].APP_ID;
                }
            }
            try
            {

                listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new SYS_APP();
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.APP_ID = Convert.ToString(txtAPP_ID.Value);
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_ID.Value !="" )
            condObj.Like_OR(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_APP>(hidCondition.Value);
            }
            List<SYS_APP> listVal = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
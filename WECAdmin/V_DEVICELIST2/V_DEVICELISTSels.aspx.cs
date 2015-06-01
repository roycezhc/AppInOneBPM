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

public partial class V_DEVICELISTSels : BaseAdminPage
{
    public string title = new V_DEVICELIST()._ZhName;

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
    V_DEVICELIST valObj = new V_DEVICELIST();
    V_DEVICELIST condObj = new V_DEVICELIST();
    List<V_DEVICELIST> listObj = new List<V_DEVICELIST>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP1);
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP2);
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP1);
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP2);
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP3);
        #endregion
        condObj.OrderBy(V_DEVICELIST.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                V_DEVICELIST roleOld = new V_DEVICELIST();
                roleOld.Where(V_DEVICELIST.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<V_DEVICELIST>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new V_DEVICELIST();
        
        
        if(txtV_DEVICELIST_ID.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.ID, Convert.ToDecimal(txtV_DEVICELIST_ID.Value));
        
        
        if(txtV_DEVICELIST_USER_ID.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.USER_ID, Convert.ToDecimal(txtV_DEVICELIST_USER_ID.Value));
        
        
        if(txtV_DEVICELIST_DEVICE_ID.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.DEVICE_ID, Convert.ToString(txtV_DEVICELIST_DEVICE_ID.Value));
        
        
        if(txtV_DEVICELIST_KIND.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.KIND, Convert.ToInt32(txtV_DEVICELIST_KIND.Value));
        
        
        if(txtV_DEVICELIST_DEBUG.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.DEBUG, Convert.ToInt32(txtV_DEVICELIST_DEBUG.Value));
        
        
        if(txtV_DEVICELIST_STATUS.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.STATUS, Convert.ToInt32(txtV_DEVICELIST_STATUS.Value));
        
        
        if(txtV_DEVICELIST_AF_ADDTIEM.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.AF_ADDTIEM, Convert.ToDateTime(txtV_DEVICELIST_AF_ADDTIEM.Value));
        
        
        if(txtV_DEVICELIST_AF_EDITTIME.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.AF_EDITTIME, Convert.ToDateTime(txtV_DEVICELIST_AF_EDITTIME.Value));
        
        
        if(txtV_DEVICELIST_TOKEN_ID.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.TOKEN_ID, Convert.ToString(txtV_DEVICELIST_TOKEN_ID.Value));
        
        
        if(txtV_DEVICELIST_STAFF_NAME.Value !="" )
            condObj.Like(V_DEVICELIST.Attribute.STAFF_NAME, Convert.ToString(txtV_DEVICELIST_STAFF_NAME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<V_DEVICELIST>(hidCondition.Value);
            }
            List<V_DEVICELIST> listVal = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
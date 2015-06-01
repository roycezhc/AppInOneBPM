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

public partial class APP_STATISTICSSels : BaseAdminPage
{
    public string title = new APP_STATISTICS()._ZhName;

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
    APP_STATISTICS valObj = new APP_STATISTICS();
    APP_STATISTICS condObj = new APP_STATISTICS();
    List<APP_STATISTICS> listObj = new List<APP_STATISTICS>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP1);
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP2);
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP1);
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP2);
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP3);
        #endregion
        condObj.OrderBy(APP_STATISTICS.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                APP_STATISTICS roleOld = new APP_STATISTICS();
                roleOld.Where(APP_STATISTICS.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<APP_STATISTICS>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new APP_STATISTICS();
        
        
        if(txtAPP_STATISTICS_ID.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.ID, Convert.ToInt32(txtAPP_STATISTICS_ID.Value));
        
        
        if(txtAPP_STATISTICS_AF_ADDTIME.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.AF_ADDTIME, Convert.ToDateTime(txtAPP_STATISTICS_AF_ADDTIME.Value));
        
        
        if(txtAPP_STATISTICS_IP.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.IP, Convert.ToString(txtAPP_STATISTICS_IP.Value));
        
        
        if(txtAPP_STATISTICS_LONG.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.LONG, Convert.ToString(txtAPP_STATISTICS_LONG.Value));
        
        
        if(txtAPP_STATISTICS_LAT.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.LAT, Convert.ToString(txtAPP_STATISTICS_LAT.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_SYS.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_SYS, Convert.ToString(txtAPP_STATISTICS_DEVICE_SYS.Value));
        
        
        if(txtAPP_STATISTICS_VER_CODE.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.VER_CODE, Convert.ToString(txtAPP_STATISTICS_VER_CODE.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_MODEL.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_MODEL, Convert.ToString(txtAPP_STATISTICS_DEVICE_MODEL.Value));
        
        
        if(txtAPP_STATISTICS_STAFF_ID.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.STAFF_ID, Convert.ToDecimal(txtAPP_STATISTICS_STAFF_ID.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_ID.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_ID, Convert.ToString(txtAPP_STATISTICS_DEVICE_ID.Value));
        
        
        if(txtAPP_STATISTICS_VER_NAME.Value !="" )
            condObj.Like(APP_STATISTICS.Attribute.VER_NAME, Convert.ToString(txtAPP_STATISTICS_VER_NAME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<APP_STATISTICS>(hidCondition.Value);
            }
            List<APP_STATISTICS> listVal = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
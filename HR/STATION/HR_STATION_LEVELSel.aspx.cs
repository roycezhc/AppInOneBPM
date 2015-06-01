using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class HR_STATION_LEVELSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_LEVELSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_STATION_LEVELSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    HR_STATION_LEVEL valObj = new HR_STATION_LEVEL();
    HR_STATION_LEVEL condObj = new HR_STATION_LEVEL();
    List<HR_STATION_LEVEL> listObj = new List<HR_STATION_LEVEL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
        #endregion
        //多级数据表页面才用到
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<HR_STATION_LEVEL>(hidCondition.Value);
            }
            listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
        {
            condObj = new HR_STATION_LEVEL();

            
            
            if(txtLEVEL_ID.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.LEVEL_ID, Convert.ToDecimal(txtLEVEL_ID.Value));
            
            
            if(txtLEVEL_NAME.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.LEVEL_NAME, Convert.ToString(txtLEVEL_NAME.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        #region//多级数据表页面才用到，取消注释
        //pid = Request[hidSelID.Name];
        //HR_STATION_LEVEL valObj = BLLTable<HR_STATION_LEVEL>.GetRowData(HR_STATION_LEVEL.Attribute.LEVEL_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_LEVELSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

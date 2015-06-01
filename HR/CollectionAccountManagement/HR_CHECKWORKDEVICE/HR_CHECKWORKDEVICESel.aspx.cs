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
public partial class HR_CHECKWORKDEVICESel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKWORKDEVICESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_CHECKWORKDEVICESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    HR_CHECKWORKDEVICE valObj = new HR_CHECKWORKDEVICE();
    HR_CHECKWORKDEVICE condObj = new HR_CHECKWORKDEVICE();
    List<HR_CHECKWORKDEVICE> listObj = new List<HR_CHECKWORKDEVICE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        #endregion
        //多级数据表页面才用到
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = "设备选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHECKWORKDEVICE>(hidCondition.Value);
            }
            listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_CHECKWORKDEVICE();

            
            
            if(txtDeviceID.Value !="" )
                condObj.Like(HR_CHECKWORKDEVICE.Attribute.DeviceID, Convert.ToString(txtDeviceID.Value));
            
            
            if(txtORG_ID.Value !="" )
                condObj.Like(HR_CHECKWORKDEVICE.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
            
            
            if(txtUSE_FLAG.Value !="" )
                condObj.USE_FLAG = Convert.ToString(txtUSE_FLAG.Value);

            listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_CHECKWORKDEVICE valObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).GetRowData(HR_CHECKWORKDEVICE.Attribute.DeviceID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKWORKDEVICESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

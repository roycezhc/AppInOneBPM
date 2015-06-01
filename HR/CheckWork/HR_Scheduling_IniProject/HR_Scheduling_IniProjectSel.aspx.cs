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
public partial class HR_Scheduling_IniProjectSel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_Scheduling_IniProjectSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_Scheduling_IniProjectSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    HR_Scheduling_IniProject valObj = new HR_Scheduling_IniProject();
    HR_Scheduling_IniProject condObj = new HR_Scheduling_IniProject();
    List<HR_Scheduling_IniProject> listObj = new List<HR_Scheduling_IniProject>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP1);
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP2);
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP1);
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP2);
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP3);
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
                listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_Scheduling_IniProject>(hidCondition.Value);
            }
            listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_Scheduling_IniProject();

            
            
            if(txtID.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.ID, Convert.ToString(txtID.Value));
            
            
            if(txtSelBanciId.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.SelBanciId, Convert.ToString(txtSelBanciId.Value));
            
            
            if(txtXiuXi.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.XiuXi, Convert.ToString(txtXiuXi.Value));
            
            
            if(txtWorkDayType.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.WorkDayType, Convert.ToString(txtWorkDayType.Value));
            
            
            if(txtStartTime.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.StartTime, Convert.ToDateTime(txtStartTime.Value));
            
            
            if(txtEndTime.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.EndTime, Convert.ToDateTime(txtEndTime.Value));
            
            
            if(txtFuGaiOrZengBu.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu, Convert.ToInt32(txtFuGaiOrZengBu.Value));
            
            
            if(txtStaffID.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.StaffID, Convert.ToString(txtStaffID.Value));
            
            
            if(txtDeptID.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.DeptID, Convert.ToString(txtDeptID.Value));
            
            
            if(txtOrgID.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.OrgID, Convert.ToString(txtOrgID.Value));
            
            
            if(txtProjectName.Value !="" )
                condObj.Like(HR_Scheduling_IniProject.Attribute.ProjectName, Convert.ToString(txtProjectName.Value));

            listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_Scheduling_IniProject valObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).GetRowData(HR_Scheduling_IniProject.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_Scheduling_IniProjectSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

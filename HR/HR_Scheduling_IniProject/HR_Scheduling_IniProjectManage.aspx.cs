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
using AgileFrame.AppInOne.SYS;
public partial class HR_Scheduling_IniProjectManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_Scheduling_IniProjectManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("HR_Scheduling_IniProjectManage.aspx", path);
    }
    protected string pid="0";

    HR_Scheduling_IniProject valObj = new HR_Scheduling_IniProject();
    HR_Scheduling_IniProject condObj = new HR_Scheduling_IniProject();
    List<HR_Scheduling_IniProject> listObj = new List<HR_Scheduling_IniProject>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_Scheduling_IniProject condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_Scheduling_IniProject.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }
    HR_Scheduling_IniProject conIni = new HR_Scheduling_IniProject();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "排班生成管理";
        if (Request["staffid"] != null)
        {
            condObj.StaffID = Request["staffid"];
        }
        if (Request["deptid"] != null)
        {
            condObj.DeptID = Request["deptid"];
        }
        if (Request["orgid"] != null)
        {
            condObj.OrgID = Request["orgid"];
        }

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
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
                                
            txtStartTime.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtEndTime.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_Scheduling_IniProject>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
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

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_Scheduling_IniProject>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
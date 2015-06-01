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
public partial class V_SchedulingSchClassSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("V_SchedulingSchClassSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("V_SchedulingSchClassSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    V_SchedulingSchClass valObj = new V_SchedulingSchClass();
    V_SchedulingSchClass condObj = new V_SchedulingSchClass();
    List<V_SchedulingSchClass> listObj = new List<V_SchedulingSchClass>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP1);
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP2);
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP1);
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP2);
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP3);
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
                listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<V_SchedulingSchClass>(hidCondition.Value);
            }
            listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new V_SchedulingSchClass();

            
            
            if(txtSchName.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchName, Convert.ToString(txtSchName.Value));
            
            
            if(txtLateMinutes.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.LateMinutes, Convert.ToInt32(txtLateMinutes.Value));
            
            
            if(txtEarlyMinutes.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.EarlyMinutes, Convert.ToInt32(txtEarlyMinutes.Value));
            
            
            if(txtCheckIn.Value !="" )
                condObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
            
            
            if(txtCheckOut.Value !="" )
                condObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
            
            
            if(txtColor.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.Color, Convert.ToInt32(txtColor.Value));
            
            
            if(txtIsOvertime.Value !="" )
                condObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);
            
            
            if(txtYear.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchYear, Convert.ToInt32(txtYear.Value));
            
            
            if(txtMonth.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchMonth, Convert.ToInt16(txtMonth.Value));
            
            
            if(txtDay.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchDay, Convert.ToInt16(txtDay.Value));
            
            
            if(txtType.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchType, Convert.ToInt32(txtType.Value));
            
            
            if(txtSchClassid.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));
            
            
            if(txtStartHour.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.StartHour, Convert.ToInt32(txtStartHour.Value));
            
            
            if(txtStartMin.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.StartMin, Convert.ToInt32(txtStartMin.Value));
            
            
            if(txtEndHour.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.EndHour, Convert.ToInt32(txtEndHour.Value));
            
            
            if(txtEndMin.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.EndMin, Convert.ToInt32(txtEndMin.Value));
            
            
            if(txtCheckInHour1.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckInHour1, Convert.ToInt32(txtCheckInHour1.Value));
            
            
            if(txtCheckInMin1.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckInMin1, Convert.ToInt32(txtCheckInMin1.Value));
            
            
            if(txtCheckInHour2.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckInHour2, Convert.ToInt32(txtCheckInHour2.Value));
            
            
            if(txtCheckInMin2.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckInMin2, Convert.ToInt32(txtCheckInMin2.Value));
            
            
            if(txtCheckOutHour1.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckOutHour1, Convert.ToInt32(txtCheckOutHour1.Value));
            
            
            if(txtCheckOutMin1.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckOutMin1, Convert.ToInt32(txtCheckOutMin1.Value));
            
            
            if(txtCheckOutMin2.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckOutMin2, Convert.ToInt32(txtCheckOutMin2.Value));
            
            
            if(txtCheckOutHour2.Value !="" )
                condObj.Like(V_SchedulingSchClass.Attribute.CheckOutHour2, Convert.ToInt32(txtCheckOutHour2.Value));

            listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //V_SchedulingSchClass valObj = BLLTable<V_SchedulingSchClass>.Factory(conn).GetRowData(V_SchedulingSchClass.Attribute.SchName, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("V_SchedulingSchClassSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

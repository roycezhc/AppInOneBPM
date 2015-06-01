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
using System.Data;
using System.Web.UI.HtmlControls;
public partial class V_SchedulingSchClassManage:BaseAdminPage
{
    protected string pid="0";

    V_SchedulingSchClass valObj = new V_SchedulingSchClass();
    V_SchedulingSchClass condObj = new V_SchedulingSchClass();
    List<V_SchedulingSchClass> listObj = new List<V_SchedulingSchClass>();
    int recount = -1;//查询总记录数
    protected string title = "";
    public string spl = "|*|";
    public FormHelper formhelper = new FormHelper();
    private void BindList(V_SchedulingSchClass condObj)
    {
        List<V_SchedulingSchClass> vssList = BLLTable<V_SchedulingSchClass>.Factory(conn).Select(new V_SchedulingSchClass(), condObj);
        DataTable data = GetWorkViewHeadTable();
        repHead.DataSource = data.Columns;
        repHead.DataBind();
        Dictionary<string, DataRow> dic = new Dictionary<string, DataRow>();
        Dictionary<string, int> rigDic = new Dictionary<string, int>();
        data = GetWorkViewBodyTable();
        DateTime nowDt = DateTime.Now;
        foreach (V_SchedulingSchClass vs in vssList)
        {
            string date = vs._SchYear + "-" + vs._SchMonth.ToString().PadLeft(2, '0') + "-" + vs._SchDay.ToString().PadLeft(2, '0');
            if (!dic.ContainsKey(date))
                dic.Add(date, data.NewRow());
            if (!rigDic.ContainsKey(date))
                rigDic.Add(date, 0);

            DateTime curDate = new DateTime(vs._SchYear, vs._SchMonth, vs._SchDay);
            dic[date][0] = vs.STAFF_ID + spl;
            dic[date][1] = vs.STAFF_NAME + spl;
            dic[date][2] = date + spl + (curDate == new DateTime(nowDt.Year, nowDt.Month, nowDt.Day) ? "style='background-color:#eeeeaa;'" : "");
            dic[date][3] = CheckInOutHelper.ChineseByEnWeek(curDate) + spl + " style='text-align:center;text-indent:0px;'";
            dic[date][4] = dll_Type.Items[vs._SchType].Text + spl;
            DateTime otime = new DateTime(nowDt.Year, nowDt.Month, nowDt.Day, 0, 0, 0);
            DateTime stime = new DateTime(nowDt.Year, nowDt.Month, nowDt.Day, vs.StartHour, vs.StartMin, 0);
            DateTime etime = new DateTime(nowDt.Year, nowDt.Month, nowDt.Day, vs.EndHour, vs.EndMin, 0);
            int left = ((int)((stime - otime).TotalMinutes / 2.00 + 0.5));
            int wid = ((int)((etime - stime).TotalMinutes / 2.00 + 0.5)) - 1;
            left = left - rigDic[date];
            rigDic[date] = ((int)((stime - otime).TotalMinutes / 2 + 0.5)) + wid + 3;
            string sty = "style='float:left;clear:right;display:inline-block;margin-left:" + left + "px; width:" + wid + "px;height:20px; background-color:" + vs.Color + "'";
            string tit = "tag='";
            tit += "班次名称:" + vs.SchName + "<br />";
            tit += "时段:" + vs.StartHour + ":" + vs.StartMin + "-" + vs.EndHour + ":" + vs.EndMin + "<br />";
            tit += "计算量值:" + vs.SchNumber + "<br />";
            tit += "量值单位:" + formhelper.GetOptionText(HR_SchClass.Attribute.SchUnit, vs.SchUnit) + "<br />";
            tit += "是否计算为加班:" + (vs.IsOverTime ? "是" : "否") + "<br />";
            tit += "签到时间:" + (!vs.CheckIn?"不签到":(vs.CheckInHour1 + ":" + vs.CheckInMin1 + "-" + vs.CheckInHour2 + ":" + vs.CheckInMin2)) + "<br />";
            tit += "签退时间:" + (!vs.CheckOut ? "不签退" : (vs.CheckOutHour1 + ":" + vs.CheckOutMin1 + "-" + vs.CheckOutHour2 + ":" + vs.CheckOutMin2)) + "<br />";
            tit += "计迟到/早退分钟数:" + vs.LateMinutes + "/" + vs.EarlyMinutes + "<br />";
            tit += "'";
            string a = "<a " + tit + " " + sty + " onmousemove='showatooltip(\"tableatooltip\",this)' onmouseout='hideatooltip(\"tableatooltip\")'></a>";
            dic[date][5] += a;
        }

        foreach (string vs in dic.Keys)
        {
            dic[vs][5] += spl + " colspan='24' style='text-indent:0px;' ";
            data.Rows.Add(dic[vs]);
        }

        repList.DataSource = data.Rows;
        repList.DataBind();
    }

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
        title = "排版管理";
        repHead.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
        repList.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            dll_Year.Items.Clear();
            dll_Month.Items.Clear();
            dll_Day.Items.Clear();
            DateTime dt = DateTime.Now;
            for (int y = dt.Year - 25; y < dt.Year + 25; y++)
            {
                dll_Year.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }
            dll_Year.Text = dt.Year.ToString();

            dll_Month.Items.Add(new ListItem("未选择", "0"));
            for (int y = 1; y < 13; y++)
            {
                dll_Month.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }
            dll_Month.Text = dt.Month.ToString();

            DateTime ddt = new DateTime(dt.Year, dt.Month, 1);
            dll_Day.Items.Add(new ListItem("未选择", "0"));
            while (ddt.Month == dt.Month)
            {
                dll_Day.Items.Add(new ListItem(ddt.Day.ToString(), ddt.Day.ToString()));
                ddt = ddt.AddDays(1);
            }
            //dll_Day.Text = dt.Day.ToString();

            dll_Type.Items.AddRange(FormHelper.GetListItem(HR_Scheduling.Attribute.SchType));
            #endregion
            #region//数据初始化
            
            #endregion
            condObj = new V_SchedulingSchClass();
            condObj._SchYear = Convert.ToInt32(dll_Year.Text);
            condObj._SchMonth = Convert.ToInt16(dll_Month.Text);
            condObj.OrderBy(V_SchedulingSchClass.Attribute.SchDay, Order.Asc);
            
            BindList(condObj);            
        }
    }

    public string BindRow(RepeaterItem Container)
    {
        if (Container == null)
            return "";
        Repeater rep = Container.FindControl("repRow") as Repeater;
        if (rep == null)
            return "";
        DataRow dr = Container.DataItem as DataRow;
        if (dr == null || dr.ItemArray.Length < 3)
            return "";
        DateTime dt = DateTime.Now;
        rep.DataSource = dr.ItemArray;
        rep.DataBind();
        return dr[0].ToString();

        //if (dr[0].ToString() == dt.Year + "-" + dt.Month.ToString().PadLeft(2, '0') + "-" + dt.Day.ToString().PadLeft(2, '0'))
        //    return " style='background-color:#5e5e5e;' ";
        //else
        //    return "";
    }

    private DataTable GetWorkViewBodyTable()
    {
        DataTable data = new DataTable("WorkView");
        data.Columns.Add("员工编号");
        data.Columns.Add("姓名");
        data.Columns.Add("日期");
        data.Columns.Add("星期");
        data.Columns.Add("值班类型");
        data.Columns.Add("值班时间");
        return data;
    }

    private DataTable GetWorkViewHeadTable()
    {
        DataTable data = new DataTable("WorkView");
        data.Columns.Add("员工编号" + spl + "style='width:80px;'");
        data.Columns.Add("姓名" + spl + "style='width:80px;'");
        data.Columns.Add("日期" + spl + "style='width:80px;'");
        data.Columns.Add("星期" + spl + "style='width:40px;'");
        data.Columns.Add("值班类型" + spl + "style='width:80px;'");
        string sty = "style='text-align:left;width:29px; min-width:29px;max-width:29px; '";
        data.Columns.Add("00" + spl + "" + sty);
        data.Columns.Add("01" + spl + "" + sty);
        data.Columns.Add("02" + spl + "" + sty);
        data.Columns.Add("03" + spl + "" + sty);
        data.Columns.Add("04" + spl + "" + sty);
        data.Columns.Add("05" + spl + "" + sty);
        data.Columns.Add("06" + spl + "" + sty);
        data.Columns.Add("07" + spl + "" + sty);
        data.Columns.Add("08" + spl + "" + sty);
        data.Columns.Add("09" + spl + "" + sty);
        data.Columns.Add("10" + spl + "" + sty);
        data.Columns.Add("11" + spl + "" + sty);
        data.Columns.Add("12" + spl + "" + sty);
        data.Columns.Add("13" + spl + "" + sty);
        data.Columns.Add("14" + spl + "" + sty);
        data.Columns.Add("15" + spl + "" + sty);
        data.Columns.Add("16" + spl + "" + sty);
        data.Columns.Add("17" + spl + "" + sty);
        data.Columns.Add("18" + spl + "" + sty);
        data.Columns.Add("19" + spl + "" + sty);
        data.Columns.Add("20" + spl + "" + sty);
        data.Columns.Add("21" + spl + "" + sty);
        data.Columns.Add("22" + spl + "" + sty);
        data.Columns.Add("23" + spl + "" + sty);
        return data;
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

    private bool ischange = false;
    protected void dll_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!IsPostBack)
            return;
        if(ischange)
            return;
        ischange = true;
        DropDownList dll = sender as DropDownList;
        if (dll == null)
            return;
        condObj = new V_SchedulingSchClass();
        condObj.SchYear = Convert.ToInt32(dll_Year.Text);
        if (dll_Month.SelectedIndex >= 1)
            condObj.SchMonth = Convert.ToInt16(dll_Month.Text);

        if (dll.ID == "dll_Year" || dll.ID == "dll_Month")
        {
            int index = dll_Day.SelectedIndex;
            DateTime ddt = new DateTime(condObj.SchYear, condObj.SchMonth < 1 ? 1 : (condObj.SchMonth > 12 ? 12 : condObj.SchMonth), 1);
            dll_Day.Items.Clear();
            dll_Day.Items.Add(new ListItem("未选择", "0"));
            int maxDay = 0;
            int mon = ddt.Month;
            while (ddt.Month == mon)
            {
                dll_Day.Items.Add(new ListItem(ddt.Day.ToString(), ddt.Day.ToString()));
                ddt = ddt.AddDays(1);
                maxDay++;
            }
            if (index > maxDay)
                dll_Day.SelectedIndex = maxDay;
            else
                dll_Day.SelectedIndex = index;
        }

        if (dll_Day.SelectedIndex >= 1)
            condObj.SchDay = Convert.ToInt16(dll_Day.Text);
        if (dll_Type.SelectedIndex >= 1)
            condObj.SchType = Convert.ToInt16(dll_Type.SelectedValue);
        BindList(condObj);
        ischange = false;
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        DateTime dt = DateTime.Now;
        dll_Year.Text = dt.Year.ToString();
        dll_Month.Text = dt.Month.ToString();
        dll_Type.SelectedIndex = 0;
        dll_Day.SelectedIndex = 0;
        wucSelStaff1.Staff_NAME = "";
        wucSelStaff1.Staff_ID = 0;
        condObj = new V_SchedulingSchClass();
        condObj._SchYear = Convert.ToInt32(dll_Year.Text);
        condObj._SchMonth = Convert.ToInt16(dll_Month.Text);
        condObj.OrderBy(V_SchedulingSchClass.Attribute.SchDay, Order.Asc);
        BindList(condObj);            
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new V_SchedulingSchClass();
        if (wucSelStaff1.Staff_ID > 0)
            condObj.STAFF_ID = (int)wucSelStaff1.Staff_ID;
        if(dll_Year.SelectedIndex >= 1)
            condObj._SchYear = Convert.ToInt32(dll_Year.Text);
        if (dll_Month.SelectedIndex >= 1)
            condObj.SchMonth = Convert.ToInt16(dll_Month.Text);
        if (dll_Day.SelectedIndex >= 1)
            condObj.SchDay = Convert.ToInt16(dll_Day.Text);
        if (dll_Type.SelectedIndex >= 1)
            condObj.SchType = Convert.ToInt16(dll_Type.SelectedValue);
        condObj.OrderBy(V_SchedulingSchClass.Attribute.SchDay, Order.Asc);
        BindList(condObj);         
    }
}
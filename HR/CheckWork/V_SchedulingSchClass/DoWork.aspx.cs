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
using System.Globalization;
public partial class V_SchedulingSchClassDoWork: AgileFrame.AppInOne.Common.BaseAdminPage
{
    V_SchedulingSchClass valObj = new V_SchedulingSchClass();
    V_SchedulingSchClass condObj = new V_SchedulingSchClass();
    List<V_SchedulingSchClass> listObj = new List<V_SchedulingSchClass>();
    int recount = -1;//查询总记录数
    protected string title = "";
    public string spl = "|*|";
    string staffid = "";
    string deptid = "";
    string orgid = "";
    public FormHelper formhelper = new FormHelper();
    private Dictionary<DateTime, List<V_SchedulingSchClass>> GetScheduling(DateTime startTime, DateTime endTime, int type)
    {
        Dictionary<DateTime, List<V_SchedulingSchClass>> vsDic = new Dictionary<DateTime, List<V_SchedulingSchClass>>();
        Dictionary<DateTime, List<int>> vsidDic = new Dictionary<DateTime, List<int>>();

        V_SchedulingSchClass val = new V_SchedulingSchClass();
        val.SchYear = 0;
        val.SchMonth = 0;
        val.SchDay = 0;
        val.SchClassid = 0;
        val.SchType = 0;
        val.SchName = "";//(50)	Unchecked
        val.StartHour = 0;//	Unchecked
        val.StartMin = 0;//	Unchecked
        val.EndHour = 0;//	Unchecked
        val.EndMin = 0;//	Unchecked
        val.LateMinutes = 0;//	Checked
        val.EarlyMinutes = 0;//	Checked
        val.CheckIn = false;//	Checked
        val.CheckOut = false;//	Checked
        val.CheckInHour1 = 0;//	Checked
        val.CheckInMin1 = 0;//	Checked
        val.CheckInHour2 = 0;//	Checked
        val.CheckInMin2 = 0;//	Checked
        val.CheckOutHour1 = 0;//	Checked
        val.CheckOutMin1 = 0;//	Checked
        val.CheckOutHour2 = 0;//	Checked
        val.CheckOutMin2 = 0;//	Checked
        val.Color = "";//(10)	Checked
        val.IsOverTime = false;//	Unchecked
        val.SchNumber = 0;//	Unchecked
        val.SchUnit = 0;//	Unchecked
        
        V_SchedulingSchClass con = new V_SchedulingSchClass();
        if (type > 0)
            con.SchType = type;
        int staffidd = -1;
        if (staffid.Trim() != "" && int.TryParse(staffid, out staffidd))
            con.STAFF_ID = staffidd;
        else if (deptid.Trim() != "")
            con.Like(V_SchedulingSchClass.Attribute.DEPT_ID, deptid);
        else if (orgid.Trim() != "")
            con.Like(V_SchedulingSchClass.Attribute.ORG_ID, orgid);
        else
            con.STAFF_ID = (int)userBase.StaffID;
        string wher = " CAST(CAST({0} AS char(4)) + '-' + CAST({1} AS char(2)) + '-' + CAST({2} AS char(2)) as datetime) >= '{3}-{4}-{5}' and CAST(CAST({6} AS char(4)) + '-' + CAST({7} AS char(2)) + '-' + CAST({8} AS char(2)) as datetime) <= '{9}-{10}-{11}' ";
        con.Where(wher, V_SchedulingSchClass.Attribute.SchYear, V_SchedulingSchClass.Attribute.SchMonth, V_SchedulingSchClass.Attribute.SchDay,
                        startTime.Year, startTime.Month, startTime.Day,
                        V_SchedulingSchClass.Attribute.SchYear, V_SchedulingSchClass.Attribute.SchMonth, V_SchedulingSchClass.Attribute.SchDay,
                        endTime.Year, endTime.Month, endTime.Day);
        val.Distinct = true;
        con.Distinct = true;
        con.OrderBy(new List<OrderByItem>(new OrderByItem[] { 
                new OrderByItem(V_SchedulingSchClass.Attribute.StartHour, Order.Asc), 
                new OrderByItem(V_SchedulingSchClass.Attribute.StartMin, Order.Asc),
                new OrderByItem(V_SchedulingSchClass.Attribute.EndHour, Order.Asc), 
                new OrderByItem(V_SchedulingSchClass.Attribute.EndMin, Order.Asc) 
            }));
        List<V_SchedulingSchClass> vsList = BLLTable<V_SchedulingSchClass>.Factory(conn).Select(val, con);

        foreach (V_SchedulingSchClass vs in vsList)
        {
            DateTime date = new DateTime(vs.SchYear, vs.SchMonth, vs.SchDay);
            if (!vsDic.ContainsKey(date))
                vsDic.Add(date, new List<V_SchedulingSchClass>());
            if (!vsidDic.ContainsKey(date))
                vsidDic.Add(date, new List<int>());
            if (!vsidDic[date].Contains(vs.SchClassid))
            {
                vsidDic[date].Add(vs.SchClassid);
                vsDic[date].Add(vs);
            }
        }

        return vsDic;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dt = DateTime.Now;
        DateTime stime = new DateTime(dt.Year, dt.Month, 1);
        DateTime etime = new DateTime(dt.Year, dt.Month, 1).AddMonths(1).AddSeconds(-1);
        int type = -1;
        if (Request["start"] != null)
        {
            try
            {
                stime = DateTime.Parse(Request["start"]);
            }
            catch { }
        }
        if (Request["end"] != null)
        {
            try
            {
                etime = DateTime.Parse(Request["end"]);
            }
            catch { }
        }
        if (Request["type"] != null)
        {
            try
            {
                type = Convert.ToInt32(Request["type"]);
            }
            catch { }
        }

        if (Request["staffid"] != null)
        {
            try
            {
                staffid = Request["staffid"];
            }
            catch { }
        }
        if (Request["deptid"] != null)
        {
            try
            {
                deptid = Request["deptid"];
            }
            catch { }
        }
        if (Request["orgid"] != null)
        {
            try
            {
                orgid = Request["orgid"];
            }
            catch { }
        }

        V_HR_CK_USERINFO con = new V_HR_CK_USERINFO();
        decimal staffidd = -1;
        if (staffid.Trim() != "" && decimal.TryParse(staffid, out staffidd))
        {
            con.STAFF_ID = staffidd;
        }
        else if (deptid.Trim() != "")
            con.Like(V_HR_CK_USERINFO.Attribute.DEPT_ID, deptid);
        else if (orgid.Trim() != "")
            con.Like(V_HR_CK_USERINFO.Attribute.ORG_ID, orgid);
        else
            con.STAFF_ID = this.userBase.StaffID;

        //设置转换格式  需要引入命名空间：using System.Globalization;    
        string fmtDate = "ddd MMM d HH:mm:ss 'UTC'zz'00' yyyy";
        CultureInfo ciDate = CultureInfo.CreateSpecificCulture("en-US");
        //将C#时间转换成JS时间字符串    
        //string JSstring = DateTime.Now.ToString(fmtDate, ciDate);
        //将JS时间字符串转换成C#时间   
        //DateTime dt = DateTime.ParseExact("Wed Apr 7 14:40:41 UTC+0800 2010", fmtDate, ciDate);

        DataTable schData = GetWorkViewBodyTable();
        Dictionary<DateTime, List<V_SchedulingSchClass>> sch = GetScheduling(stime, etime, type);
        if (sch != null)
        {
            foreach (DateTime date in sch.Keys)
            {
                int index = 0;
                foreach (V_SchedulingSchClass vss in sch[date])
                {
                    index++;
                    DataRow dr = schData.NewRow();
                    dr["date"] = "date" + date.ToString("yyyy_MM_dd");// date.ToString(fmtDate, ciDate); ;
                    dr["id"] = date.ToString("yyyyMMdd") + index.ToString().PadLeft(2, '0');
                    dr["title"] = vss.SchName + (vss.IsOverTime?"[加班]":"");
                    dr["start"] = new DateTime(date.Year, date.Month, date.Day, vss.StartHour, vss.StartMin, 0).ToString("yyyy-MM-dd HH:mm:ss");
                    dr["end"] = new DateTime(date.Year, date.Month, date.Day, vss.EndHour, vss.EndMin, 0).ToString("yyyy-MM-dd HH:mm:ss");
                    dr["color"] = vss.Color;
                    dr["type"] = vss.SchType;
                    dr["typename"] = formhelper.GetOptionText(HR_Scheduling.Attribute.SchType, vss.SchType);
                    schData.Rows.Add(dr);
                }
            }
        }
        Response.Write("<?xml version=\"1.0\" standalone=\"yes\"?>\r\n");
        schData.WriteXml(Response.OutputStream);
        Response.End();
    }

    private DataTable GetWorkViewBodyTable()
    {
        DataTable data = new DataTable("event");
        data.Columns.Add("date");
        data.Columns.Add("id");
        data.Columns.Add("title");
        data.Columns.Add("start");
        data.Columns.Add("end");
        data.Columns.Add("color");
        data.Columns.Add("type");
        data.Columns.Add("typename");
        return data;
    }

    private DataTable GetWorkViewHeadTable()
    {
        DataTable data = new DataTable("WorkView");
        
        return data;
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
        }
    }
}
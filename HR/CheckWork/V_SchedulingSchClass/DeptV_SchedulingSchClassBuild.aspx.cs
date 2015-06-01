using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Data;
using System.Data.Sql;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using System.Data.SqlClient;
using AgileFrame.Core;
using AgileFrame.AppInOne.Common;

public partial class HR_CheckWork_V_SchedulingSchClass_DeptV_SchedulingSchClassBuild : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = "";
    public FormHelper formHelper = new FormHelper();
    HR_Scheduling_IniProject conIni = new HR_Scheduling_IniProject();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "排班生成管理";
        if (Request["staffid"] != null)
        {
            hidstaffid.Value = Request["staffid"];
            conIni.StaffID = Request["staffid"];
        }
        if (Request["deptid"] != null)
        {
            hiddeptid.Value = Request["deptid"];
            conIni.DeptID = Request["deptid"];
        }
        if (Request["orgid"] != null)
        {
            hidorgid.Value = Request["orgid"];
            conIni.OrgID = Request["orgid"];
        }
        if (Request["name"] != null)
        {
            title += "--" + System.Uri.UnescapeDataString(Request["name"]);
            hidname.Value = System.Uri.UnescapeDataString(Request["name"]);
        }
        else if (hidname.Value != "")
            title += "--" + System.Uri.UnescapeDataString(hidname.Value);
        else
            title += "--" + userBase.StaffName;        

        tbyWorkDayType.InnerHtml = System.Uri.UnescapeDataString(hidwdtype.Value);
        if (!IsPostBack)
        {
            DateTime dt = DateTime.Now;
            txtStartTime.Value = new DateTime(dt.Year, dt.Month, 1).ToString("yyyy-MM-dd");
            txtEndTime.Value = new DateTime(dt.Year+2, dt.Month, 1).ToString("yyyy-MM-dd"); //new DateTime(dt.Year, dt.Month, 1).AddYears(2).AddMonths(1).AddSeconds(-1).ToString("yyyy-MM-dd");
            txtXiuXi.Value = "6,7";

            dll_Type.Items.AddRange(FormHelper.GetListItem(HR_Scheduling.Attribute.SchType));
            LoadSCH();
            //加载配置方案
            HR_Scheduling_IniProject val = new HR_Scheduling_IniProject();
            val.Top(3); val.OrderBy(HR_Scheduling_IniProject.Attribute.ID, Order.Desc);
            List<HR_Scheduling_IniProject> listIni = BLLTable<HR_Scheduling_IniProject>.Factory(conn).Select(val, conIni);
            
            if (listIni.Count > 0)
            {
                rptIniProject.DataSource = listIni;
                rptIniProject.DataBind();                
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        string wran = "";
        litWarn.Visible = false;

        //值班类型设置
        string wdTypeHtml = tbyWorkDayType.InnerHtml;
        string[] wdTypeStrs = wdTypeHtml.ToLower().Contains("<tr>") ? wdTypeHtml.ToLower().Substring(wdTypeHtml.ToLower().IndexOf("<tr>")).Split(new string[] { "<tr>" }, StringSplitOptions.RemoveEmptyEntries) : new string[0];
        Dictionary<DateTime, int> dicWdType = new Dictionary<DateTime, int>();
        foreach (string wdTStr in wdTypeStrs)
        {
            string[] tds = wdTStr.ToLower().Substring(wdTStr.ToLower().IndexOf("<td>")).Split(new string[] { "<td>" }, StringSplitOptions.RemoveEmptyEntries);
            if (tds.Length < 3)
                continue;
            DateTime sd = DateTime.MinValue;
            DateTime ed = DateTime.MinValue;
            int ty = -1;
            if (!DateTime.TryParse(tds[0].Remove(tds[0].IndexOf('<'), tds[0].Length - tds[0].IndexOf('<')), out sd) || !DateTime.TryParse(tds[1].Remove(tds[1].IndexOf('<'), tds[1].Length - tds[1].IndexOf('<')), out ed) || !int.TryParse(tds[2].Remove(tds[2].IndexOf('<'), tds[2].Length - tds[2].IndexOf('<')), out ty))
                continue;
            sd = sd.Date;
            ed = ed.Date;
            while (sd <= ed)
            {
                if (!dicWdType.ContainsKey(sd))
                    dicWdType.Add(sd, ty);
                else
                    dicWdType[sd] = ty;
                sd = sd.AddDays(1);
            }
        }
        //休息日设置
        string[] weekStr = txtXiuXi.Value.Split(new char[] { ',', '，', ' ', ' ' }, StringSplitOptions.RemoveEmptyEntries);
        //是否 周一到周7之间
        bool isAllRight = true;
        int[] week = new int[weekStr.Length];
        for (int i = 0; i < weekStr.Length; i++)
        {
            if (!int.TryParse(weekStr[i].Replace(" ", ""), out week[i]))
                isAllRight = false;
            else if (week[i] < 1 || week[i] > 7)
                isAllRight = false;
        }

        HR_Scheduling_IniProject proj = new HR_Scheduling_IniProject();
        proj.WorkDayType = wdTypeHtml;
        proj.XiuXi = txtXiuXi.Value;
        proj.ProjectName = txtProjectName.Value;
        if (chkFuGai.Checked)
            proj.FuGaiOrZengBu = 1;
        else
            proj.FuGaiOrZengBu = 2;
        if (isAllRight)
        {
            string delschWhere = " 1=1 ";
            HR_STAFF stfVal = new HR_STAFF();
            stfVal.STAFF_ID = 0;
            HR_STAFF stfCon = new HR_STAFF();
            if (!string.IsNullOrEmpty(hidstaffid.Value.Trim()))
            {
                stfCon.STAFF_ID = decimal.Parse(hidstaffid.Value);
                delschWhere += " and HR_STAFF.STAFF_ID = " + stfCon.STAFF_ID;

                proj.StaffID = stfCon.STAFF_ID.ToString();
            }
            else if (!string.IsNullOrEmpty(hiddeptid.Value.Trim()))
            {
                stfCon.Like(HR_STAFF.Attribute.DEPT_ID, hiddeptid.Value);
                delschWhere += " and HR_STAFF.DEPT_ID like '" + hiddeptid.Value + "%'";

                proj.DeptID = stfCon.DEPT_ID;
            }
            else if (!string.IsNullOrEmpty(hidorgid.Value.Trim()))
            {
                stfCon.Like(HR_STAFF.Attribute.ORG_ID, hidorgid.Value);
                delschWhere += " and HR_STAFF.ORG_ID like '" + hidorgid.Value + "%'";

                proj.OrgID = stfCon.ORG_ID;
            }
            else
            {
                stfCon.STAFF_ID = userBase.StaffID;
                delschWhere += " and HR_STAFF.STAFF_ID = " + userBase.StaffID;

                proj.StaffID = stfCon.STAFF_ID.ToString();
            }
            List<HR_STAFF> stffs = BLLTable<HR_STAFF>.Factory(conn).Select(stfVal, stfCon);
            //外部传入选中的班次id
            string[] schidstr = hidSelBanciId.Value.TrimEnd(',').Split(',');
            proj.SelBanciId = hidSelBanciId.Value;
            List<int> schids = new List<int>();
            for (int i = 0; i < schidstr.Length; i++)
            {
                int sid = -1;
                if (int.TryParse(schidstr[i], out sid))
                    schids.Add(sid);
            }
            int stfCount = 0;
            int stfSch = 0;
            //开始时间
            DateTime sDate = DateTime.Parse(txtStartTime.Value);
            proj.StartTime = sDate;
            //结束时间
            DateTime eDate = DateTime.Parse(txtEndTime.Value);
            proj.EndTime = eDate;

            DateTime dt = sDate;
            //找出班次
            List<HR_Scheduling> schList = new List<HR_Scheduling>();
            foreach (HR_STAFF stf in stffs)
            {
                stfCount++;
                dt = sDate;
                while (dt.Date <= eDate.Date)
                {
                    foreach (int schid in schids)
                    {
                        HR_Scheduling sch = new HR_Scheduling();
                        sch._SchYear = dt.Date.Year;
                        sch._SchMonth = Convert.ToInt16(dt.Date.Month);
                        sch._SchDay = Convert.ToInt16(dt.Date.Day);
                        sch._STAFF_ID = Convert.ToInt32(stf.STAFF_ID);
                        sch._SchType = week.Contains(CheckInOutHelper.IndexOfWeekByEnWeek(dt)) ? 3 : 1;
                        if (dicWdType.ContainsKey(dt.Date))
                            sch._SchType = dicWdType[dt.Date];
                        sch._SchClassid = schid;
                        schList.Add(sch);
                    }
                    dt = dt.AddDays(1);
                    stfSch++;
                }
            }
            int buildCount = 0;
            int delsCount = 0;
            if (chkFuGai.Checked)
            {
                //HR_Scheduling delCon = new HR_Scheduling();
                //delCon.Top(1000);
                //string wher = " CAST(CAST({0} AS char(4)) + '-' + CAST({1} AS char(2)) + '-' + CAST({2} AS char(2)) as datetime) >= '{3}-{4}-{5}' and CAST(CAST({6} AS char(4)) + '-' + CAST({7} AS char(2)) + '-' + CAST({8} AS char(2)) as datetime) <= '{9}-{10}-{11}' ";
                //delCon.Where(wher, HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                //                sDate.Year, sDate.Month, sDate.Day,
                //                HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                //                eDate.Year, eDate.Month, eDate.Day);
                //Relation rt = new Relation(HR_STAFF.Attribute.STAFF_ID, HR_Scheduling.Attribute.STAFF_ID);
                //rt.AddCondition(stfCon);
                //while (BLLTable<HR_Scheduling>.Factory(conn).Delete(delCon, rt) > 0)
                //{
                //    continue;
                //}
                string wher = " delete top(1000) " +
                              " from HR_Scheduling " +
                              " where CAST(CAST({0} AS char(4)) + '-' + CAST({1} AS char(2)) + '-' + CAST({2} AS char(2)) as datetime) >= '{3}-{4}-{5}' and CAST(CAST({6} AS char(4)) + '-' + CAST({7} AS char(2)) + '-' + CAST({8} AS char(2)) as datetime) <= '{9}-{10}-{11}' " +
                              " and HR_Scheduling.staff_id in (select hr_staff.staff_id from hr_staff where " + delschWhere + ")";
                wher = string.Format(wher, HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                                sDate.Year, sDate.Month, sDate.Day,
                                HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                                eDate.Year, eDate.Month, eDate.Day);
                int delCount = BLLTable.ExecSQL(new HR_Scheduling(), wher, CommandType.Text);
                while (delCount > 0)
                {
                    delsCount += delCount;
                    delCount = BLLTable.ExecSQL(new HR_Scheduling(), wher, CommandType.Text);
                    continue;
                }
                DataTable dataTable = BLLTable<HR_Scheduling>.qDataTable("select * from " + HR_Scheduling.Attribute.SchDay.TableName + " where 1=2");
                List<DataRow> dataList = new List<DataRow>();
                foreach (HR_Scheduling sch in schList)
                {
                    DataRow dr = dataTable.NewRow();
                    foreach (DataColumn dc in dataTable.Columns)
                    {
                        dr[dc] = sch.GetValue(new AttributeItem(HR_Scheduling.Attribute.STAFF_ID.TableName, dc.ColumnName));
                    }
                    dataList.Add(dr);
                }

                try
                {
                    //将电量数据批量插入数据库
                    SqlBulkCopy sbc = new SqlBulkCopy(MyConfigurationSettings.GetValue("conn"));
                    sbc.BatchSize = 1000;
                    sbc.BulkCopyTimeout = (((dataList.Count) / 1000) + 1) * 3;
                    sbc.DestinationTableName = HR_Scheduling.Attribute.STAFF_ID.TableName;
                    sbc.WriteToServer(dataList.ToArray());
                    buildCount += dataList.Count;
                }
                catch { }
            }
            else
            {
                foreach (HR_Scheduling sch in schList)
                {
                    if (!BLLTable<HR_Scheduling>.Exists(sch))
                        buildCount += BLLTable<HR_Scheduling>.Factory(conn).Insert(sch, HR_Scheduling.Attribute.ID);
                }
            }
            int ret2 = BLLTable<HR_Scheduling_IniProject>.Factory(conn).Insert(proj, HR_Scheduling_IniProject.Attribute.ID);
            litScript.Text = "<script>alert('生成成功!" + (chkFuGai.Checked ? "覆盖" : "增补") + "生成" + buildCount + "条记录！删除" + delsCount
                + "条记录，保存" + ret2 + "个配置方案"
                + "');$('.main').unmask();</script>";
        }
        else
        {
            wran = "休息日输入有误！请参考提示输入。";
        }
        
        if (!string.IsNullOrEmpty(wran))
        {
            litWarn.Text = wran;
            litWarn.Visible = true;
            litScript.Text = "<script>alert('" + wran + "');$('.main').unmask();</script>";
        }
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

    private void LoadSCH()
    {
        HR_SchClass con = new HR_SchClass();
        con.OrderBy(new List<OrderByItem>(new OrderByItem[] { 
                new OrderByItem(HR_SchClass.Attribute.StartHour, Order.Asc), 
                new OrderByItem(HR_SchClass.Attribute.StartMin, Order.Asc),
                new OrderByItem(HR_SchClass.Attribute.EndHour, Order.Asc), 
                new OrderByItem(HR_SchClass.Attribute.EndMin, Order.Asc) 
            }));
        List<HR_SchClass> listObj = BLLTable<HR_SchClass>.Factory(conn).Select(new HR_SchClass(), con);
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        LoadSCH();
    }
}
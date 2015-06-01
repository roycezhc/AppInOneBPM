using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Data;
using System.Text;

public partial class CheckWork_WorkDayScheduling : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string title = "";
    public string spl = "|*|";
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "员工考勤统计";
        Page.Title = title;
        if (!IsPostBack)//zlg
        {
            DateTime ndt = DateTime.Now;
            DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
            txtStartTime.Value = mdt.ToString("yyyy-MM-dd");
            txtEndTime.Value = mdt.AddMonths(1).AddSeconds(-1).ToString("yyyy-MM-dd");
            if (userBase != null)
            {
                selStaff.Staff_ID = userBase.StaffID;
                selStaff.Staff_NAME = userBase.StaffName;
                selDept.DEPT_ID = userBase.DeptID;
                selDept.DEPT_NAME = userBase.DeptName;
            }

            BindList(selStaff.Staff_ID, selDept.DEPT_ID, mdt, mdt.AddMonths(1).AddSeconds(-1));
        }
    }

    private bool m_startAddKqqk = false;
    public string m_header1 = "";
    public string m_header2 = "";
    public string m_width = "";
    public string m_rows = "";
    public string m_resizelist = "";
    public string m_align = "";
    public void BindHerd(DataColumnCollection dcc)
    {
        if (dcc == null || dcc.Count < 1)
            return;
        int index = 0;
        string header1 = "";
        string header2 = "";
        string width = "";
        string resizelist = "";
        string align = "";
        foreach (DataColumn dc in dcc)
        {
            if (index < 7)
            {
                switch (index)
                {
                    case 0:
                        header1 += ",";
                        width += "40,";
                        break;
                    case 1:
                        header1 += "#cspan,";
                        width += "60,";
                        break;
                    case 2:
                        header1 += "#cspan,";
                        width += "80,";
                        break;
                    case 3:
                        header1 += "#cspan,";
                        width += "80,";
                        break;
                    case 4:
                        header1 += "#cspan,";
                        width += "120,";
                        break;
                    case 5:
                        header1 += "#cspan,";
                        width += "65,";
                        break;
                    case 6:
                        header1 += "<div style='float:right; padding-right:5px;'>日期</div>,";
                        width += "65,";
                        break;
                    default: break;
                }

                resizelist += "true,";
                header2 += "<div class='hdrcell' style='padding-left:5px;'>" + (string.IsNullOrEmpty(dc.ColumnName.TrimEnd(' ')) ? "-" : dc.ColumnName) + "</div>,";
                align += "left,";
                index++;
                continue;
            }
            DateTime dt = DateTime.MinValue;
            if (DateTime.TryParse(dc.ColumnName, out dt) && dt != DateTime.MinValue)
            {
                header1 += "<div style='margin-left:-7px;'>" + dt.Day.ToString().PadLeft(2,'0') + "</div>,";
                header2 += "<div class='hdrcell' style='padding-left:5px;'>" + CheckInOutHelper.ChineseByEnWeek(dt) + "</div>,";
                width += "27,";
                resizelist += "false,";
                align += "left,";
            }
            else
            {
                if (!m_startAddKqqk)
                {
                    header1 += "<div style='margin-left:-7px;'>出勤情况</div>,";
                    header2 += "<div class='hdrcell' style='padding-left:5px;'>" + (string.IsNullOrEmpty(dc.ColumnName.TrimEnd(' ')) ? "-" : dc.ColumnName) + "</div>,";
                    width += (dc.ColumnName.Length * 12 + 15) + ",";
                    m_startAddKqqk = true;
                    resizelist += "true,";
                    align += "left,";
                }
                else
                {
                    header1 += "#cspan,";
                    header2 += "<div class='hdrcell' style='padding-left:5px;'>" + (string.IsNullOrEmpty(dc.ColumnName.TrimEnd(' ')) ? "-" : dc.ColumnName) + "</div>,";
                    width += (dc.ColumnName.Length * 12 + 15) + ",";
                    resizelist += "true,";
                    align += "left,";
                }
            }
            index++;
        }

        m_header1 = "\"" + header1.TrimEnd(',') + "\"";
        m_header2 = "\"" + header2.TrimEnd(',') + "\"";
        m_width = "\"" + width.TrimEnd(',') + "\"";
        m_resizelist = "\"" + resizelist.TrimEnd(',') + "\"";
        m_align = "\"" + align.TrimEnd(',') + "\"";
    }

    public void BindRows(DataRowCollection drc)
    {
        if (drc == null || drc.Count < 1)
            return;

        List<List<DataRow>> drss = new List<List<DataRow>>();
        DataRow[] drcToArray = new DataRow[drc.Count];
        drc.CopyTo(drcToArray, 0);
        List<DataRow> drcToList = new List<DataRow>(drcToArray);
        int eyCount = 2;
        while (drcToList.Count >= eyCount)
        {
            drss.Add(new List<DataRow>(drcToList.GetRange(0, eyCount)));
            drcToList.RemoveRange(0, eyCount);
        }
        if(drcToList.Count > 0)
            drss.Add(new List<DataRow>(drcToList.ToArray()));
        StringBuilder sbs = new StringBuilder();
        int step = 1;
        int index = 1;
        foreach (List<DataRow> drs in drss)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("case " + (step - 1) + ":");
            if (step == 1)
                sb.Append("$(\"#gridbox1 .objbox\").mask(\"正在载入考勤信息,员工数量不同，载入时间不同，请耐心等候...\");$(\"#gridbox1 .gridbox .masked .loadmask-msg\").hide();");
            foreach (DataRow dr in drs)
            {
                sb.Append("mygrid.addRow(" + index + ",'");
                for (int i = 0; i < dr.ItemArray.Length; i++)
                {
                    sb.Append(dr.ItemArray[i] + (i < dr.ItemArray.Length - 1 ? "," : ""));
                }
                sb.Append("');");
                index++;
            }
            sb.Append("m_step++;setTimeout(\"loadGrid()\", 1);break;");
            sbs.Append(sb.ToString());
            step++;
        }
        m_rows = sbs.ToString();
    }

    private void BindList(decimal staffid, string deptid, DateTime sdate, DateTime edate)
    {
        string msg = "";
        DataTable data = CheckInOutHelper.ContrastAndReceiveTable(staffid, deptid, sdate, edate, ref msg);
        if (data == null)
            return;

        BindHerd(data.Columns);
        BindRows(data.Rows);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        DateTime ndt = DateTime.Now;
        DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1);
        DateTime sdate = mdt.Date;
        DateTime edate = mdt.AddMonths(1).AddSeconds(-1);
        DateTime.TryParse(txtStartTime.Value, out sdate);
        DateTime.TryParse(txtEndTime.Value, out edate);

        BindList(selStaff.Staff_ID, selDept.DEPT_ID, sdate, edate);
    }
}
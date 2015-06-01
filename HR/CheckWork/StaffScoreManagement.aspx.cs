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
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class HR_CheckWork_StaffScoreManagement : AgileFrame.AppInOne.Common.BaseAdminPage
{
    private List<List<string>> m_StaffAndScore = new List<List<string>>();
    protected string title = "";
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "员工评分统计";
        Page.Title = title;
        aspPager.PageSize = 20;
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

            BindList(mdt, mdt.AddMonths(1).AddSeconds(-1));
        }
    }

    private List<string> GetStaffScore(DateTime stime, DateTime etime, string staffid, string staffname)
    {
        WK_TaskInfo conObj = new WK_TaskInfo();
        conObj.Where(" {0} >= '{1}' and {2} <= '{3}' and ({4} like '%{5}%' or {6} like '%{7}%' or {8} like '%{9}%') ",
            WK_TaskInfo.Attribute.BeginTime.FieldName,
            stime.ToString("yyyy-MM-dd HH:mm:ss"),
            WK_TaskInfo.Attribute.EndTime.FieldName,
            etime.ToString("yyyy-MM-dd HH:mm:ss"),
            WK_TaskInfo.Attribute.PICEmpID.FieldName,
            ":" + staffid + ":1:" + staffname,
            WK_TaskInfo.Attribute.PICEmpID.FieldName,
            ":" + staffid + ":2:" + staffname,
            WK_TaskInfo.Attribute.PICEmpID.FieldName,
            ":" + staffid + ":3:" + staffname
            );
        WK_TaskInfo valObj = new WK_TaskInfo();
        valObj.CompRate = 0;
        valObj.ScoreNum = -1;
        valObj.ScoreNum_ME = -1;
        valObj.ScoreNum_BOSS = -1;
        List<WK_TaskInfo> tasks = BLLTable<WK_TaskInfo>.Factory(conn).Select(valObj, conObj);
        List<int> cr = new List<int>();
        List<int> sn = new List<int>();
        List<int> snme = new List<int>();
        List<int> snboss = new List<int>();
        foreach (WK_TaskInfo tk in tasks)
        {
            cr.Add(tk.CompRate);
            if (tk.ScoreNum >= 0)
                sn.Add(tk.ScoreNum_ME);
            if (tk.ScoreNum >= 0)
                snme.Add(tk.ScoreNum_ME);
            if (tk.ScoreNum_BOSS >= 0)
                snboss.Add(tk.ScoreNum_BOSS);
        }
        List<string> score = new List<string>();
        if (tasks.Count > 0)
        {
            score.Add(staffid);
            score.Add(staffname);
            score.Add(stime.ToString("yyyy-MM-dd HH:mm:ss"));
            score.Add(etime.ToString("yyyy-MM-dd HH:mm:ss"));
            score.Add(tasks.Count.ToString());
            score.Add(snme.Count > 0 ? (((snme.Sum() * 1.00) / snme.Count).ToString("F2") + " / " + snme.Count) : "-/-");
            score.Add(sn.Count > 0 ? (((sn.Sum() * 1.00) / sn.Count).ToString("F2") + " / " + sn.Count) : "-/-");
            score.Add(snboss.Count > 0 ? (((snboss.Sum() * 1.00) / snboss.Count).ToString("F2") + " / " + snboss.Count) : "-/-");
            score.Add(cr.Count > 0 ? ((cr.Sum() * 1.00) / cr.Count).ToString("F2") : "-");
        }
        return score;
    }

    private void BindList(DateTime stime, DateTime etime)
    {
        m_StaffAndScore = new List<List<string>>();
        if (selStaff.Staff_ID > 0)
        {
            List<string> sas = GetStaffScore(stime, etime, selStaff.Staff_ID.ToString(), selStaff.Staff_NAME);
            if (sas != null && sas.Count > 0)
                m_StaffAndScore.Add(sas);
        }
        else if (!string.IsNullOrEmpty(selDept.DEPT_ID))
        {
            HR_STAFF conObj = new HR_STAFF();
            conObj.Where("{0} like '{1}%' ", HR_STAFF.Attribute.DEPT_ID, selDept.DEPT_ID);
            HR_STAFF valObj = new HR_STAFF();
            valObj.STAFF_ID = 0;
            valObj.STAFF_NAME = "";
            List<HR_STAFF> staffs = BLLTable<HR_STAFF>.Factory(conn).Select(valObj, conObj);
            foreach (HR_STAFF s in staffs)
            {
                List<string> sas = GetStaffScore(stime, etime, s.STAFF_ID.ToString(), s.STAFF_NAME);
                if (sas != null && sas.Count > 0)
                    m_StaffAndScore.Add(sas);
            }
        }

        aspPager.RecordCount = m_StaffAndScore.Count;
        List<List<string>> sass = m_StaffAndScore.Count > 0 ? (m_StaffAndScore.GetRange(0, aspPager.CurrentPageIndex == aspPager.PageCount ? (m_StaffAndScore.Count) : aspPager.PageSize)) : new List<List<string>>();
        repList.DataSource = sass;
        repList.DataBind();
        ViewState["StaffAndScore"] = m_StaffAndScore;
        litScript.Text = "<script>$('.main').unmask();</script>";
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        DateTime ndt = DateTime.Now;
        DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
        DateTime sdate = mdt.Date;
        DateTime edate = mdt.AddMonths(1).AddSeconds(-1);
        DateTime.TryParse(txtStartTime.Value, out sdate);
        DateTime.TryParse(txtEndTime.Value, out edate);
        aspPager.CurrentPageIndex = 1;
        BindList(sdate, edate);
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        List<List<string>> staffAndScore = ViewState["StaffAndScore"] as List<List<string>>;
        if(staffAndScore == null || staffAndScore.Count < 1)
            return;
        try
        {
            int sindex = (aspPager.CurrentPageIndex - 1) * aspPager.PageSize;
            if(sindex >= staffAndScore.Count || staffAndScore.Count - sindex <= 0)
                return;
            List<List<string>> sas = staffAndScore.GetRange(sindex,aspPager.CurrentPageIndex == aspPager.PageCount?(staffAndScore.Count - sindex):aspPager.PageSize);
            repList.DataSource = sas;
            repList.DataBind();
        }
        catch{}
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
    }
}
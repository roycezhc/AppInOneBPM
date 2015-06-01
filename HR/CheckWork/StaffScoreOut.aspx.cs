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

public partial class HR_CheckWork_StaffScoreOut : AgileFrame.AppInOne.Common.BasePage
{
    private List<List<string>> m_StaffAndScore = new List<List<string>>();
    public FormHelper formhelper = new FormHelper();
    private int staffid = -1;
    private string deptid = "";
    private string staffname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime ndt = DateTime.Now;
            DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
            DateTime sdt = mdt;
            DateTime edt = mdt.AddMonths(1).AddSeconds(-1);
            DateTime.TryParse(Request["sdate"], out sdt);
            DateTime.TryParse(Request["edate"], out edt);
            int.TryParse(Request["staffid"], out staffid);
            deptid = Request["deptid"];
            if (string.IsNullOrEmpty(deptid))
                deptid = "0";
            staffname = Request["staffname"];

            //Response.Write(Request["condStr"]);
            BindList(sdt, edt);

            Response.Clear();
            Response.Buffer = true;
            //Response.Charset = "utf-8";
            Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}{1}.xls", HttpUtility.UrlEncode("员工绩效评分表"), DateTime.Now.ToString("yyyy-MM-dd")));
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");//设置输出流为简体中文
            //Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。 
            //wjn
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=gb2312>");

            try
            {
                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divList.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
            catch { }
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
        if (staffid > 0)
        {
            List<string> sas = GetStaffScore(stime, etime, staffid.ToString(), staffname);
            if (sas != null && sas.Count > 0)
                m_StaffAndScore.Add(sas);
        }
        else if (!string.IsNullOrEmpty(deptid))
        {
            HR_STAFF conObj = new HR_STAFF();
            conObj.Where("{0} like '{1}%' ", HR_STAFF.Attribute.DEPT_ID, deptid);
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
        repList.DataSource = m_StaffAndScore;
        repList.DataBind();
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
    }
}
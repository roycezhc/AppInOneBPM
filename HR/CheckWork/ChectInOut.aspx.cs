using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Data;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class CheckWork_ChectInOut : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string title = "";
    public string spl = "|*|";
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "打卡记录查看";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.PageSize = 20;
            selStaff.Staff_ID = userBase.StaffID;
            selStaff.Staff_NAME = userBase.StaffName;

            DateTime ndt = DateTime.Now;
            DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
            txtStartTime.Value = mdt.ToString("yyyy-MM-dd");
            txtEndTime.Value = mdt.AddMonths(1).AddSeconds(-1).ToString("yyyy-MM-dd");

            DataBind(selStaff.Staff_ID, mdt, mdt.AddMonths(1).AddSeconds(-1), 1);
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

    protected void DataBind(decimal staffid, DateTime sdate, DateTime edate, int pageIndex)
    {
        hidStaffid.Value = staffid.ToString();
        hidSdate.Value = sdate.ToString("yyyy-MM-dd HH:mm:ss");
        hidEdate.Value = edate.ToString("yyyy-MM-dd HH:mm:ss");

        V_USERCHECKINOUT ckVal = new V_USERCHECKINOUT();
        ckVal._USERID = 0;
        ckVal.NAME = "";
        ckVal.STAFF_ID = 0;
        ckVal.STAFF_NAME = "";
        ckVal.STAFF_NO = "";
        ckVal._VERIFYCODE = 0;
        ckVal._CHECKTIME = DateTime.MinValue;
        ckVal._CHECKTYPE = "";
        ckVal._SENSORID = "";
        V_USERCHECKINOUT ckCon = new V_USERCHECKINOUT();
        ckCon.STAFF_ID = staffid;
        //ckCon.Where(" {0}.{1} >= '{2}' and {3}.{4} <= '{5}' ", ckCon._ZhName, HR_CHECKINOUT.Attribute.CHECKTIME.FieldName, sdate.ToString("yyyy-MM-dd"), ckCon._ZhName, HR_CHECKINOUT.Attribute.CHECKTIME, edate.ToString("yyyy-MM-dd"));
        ckCon.Where(" {0} >= '{1}' and {2} <= '{3}' ", V_USERCHECKINOUT.Attribute.CHECKTIME.FieldName, sdate.ToString("yyyy-MM-dd"), V_USERCHECKINOUT.Attribute.CHECKTIME, edate.ToString("yyyy-MM-dd"));
        
        int rcount = -1;
        List<V_USERCHECKINOUT> ckList = BLLTable<V_USERCHECKINOUT>.Factory(conn).SelectByPage(ckVal, ckCon, aspPager.PageSize, pageIndex, ref rcount);

        aspPager.RecordCount = rcount;
        repList.DataSource = ckList;
        repList.DataBind();
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        decimal staffid = -1;
        DateTime sdate = new DateTime(2000, 1, 1);
        DateTime edate = new DateTime(2000, 1, 1);
        decimal.TryParse(hidStaffid.Value, out staffid);
        DateTime.TryParse(hidSdate.Value, out sdate);
        DateTime.TryParse(hidEdate.Value, out edate);
        DataBind(staffid, sdate, edate, aspPager.CurrentPageIndex);
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        aspPager.CurrentPageIndex = 1;

        DateTime ndt = DateTime.Now;
        DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
        DateTime sdate = mdt;
        DateTime edate = mdt.AddMonths(1).AddSeconds(-1);
        DateTime.TryParse(txtStartTime.Value, out sdate);
        DateTime.TryParse(txtEndTime.Value, out edate);

        DataBind(selStaff.Staff_ID, sdate, edate, aspPager.CurrentPageIndex);
    }
}
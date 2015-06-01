using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using System.Data;
using System.Data.SqlClient;
public partial class HR_SchedulingEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_Scheduling valObj =new HR_Scheduling();
    int count = 0;
    string keyid = "";
    protected string title = "";
    public int year = -1;
    public Int16 month = -1;
    public Int16 day = -1;
    public FormHelper formHelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "排班表编辑";
        Page.Title = title;

        if (!IsPostBack)
        {
            DateTime dt = DateTime.Now;
            txtStartTime.Value = new DateTime(dt.Year, dt.Month, 1).ToString("yyyy-MM-dd");
            txtEndTime.Value = new DateTime(dt.Year, dt.Month, 1).AddMonths(1).AddSeconds(-1).ToString("yyyy-MM-dd");

            txtType.Items.AddRange(FormHelper.GetListItem(HR_Scheduling.Attribute.SchType));
            txtType.Items.RemoveAt(0);

            LoadSCH();
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            HR_STAFF stfVal = new HR_STAFF();
            stfVal.STAFF_ID = 0;
            List<HR_STAFF> stffs = BLLTable<HR_STAFF>.Factory(conn).Select(stfVal, new HR_STAFF());
            string[] schidstr = hidSelBanciId.Value.TrimEnd(',').Split(',');
            List<int> schids = new List<int>();
            for (int i = 0; i < schidstr.Length; i++)
            {
                int sid = -1;
                if (int.TryParse(schidstr[i], out sid))
                    schids.Add(sid);
            }
            int stfCount = 0;
            int stfSch = 0;
            DateTime sDate = DateTime.Parse(txtStartTime.Value);
            DateTime eDate = DateTime.Parse(txtEndTime.Value);
            DateTime dt = sDate;
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
                        sch._SchType = Convert.ToInt32(txtType.Value);
                        sch._SchClassid = schid;
                        schList.Add(sch);
                    }
                    dt = dt.AddDays(1);
                    stfSch++;
                }
            }
            int buildCount = 0;
            HR_Scheduling delCon = new HR_Scheduling();
            delCon.Top(500);
            string wher = " CAST(CAST({0} AS char(4)) + '-' + CAST({1} AS char(2)) + '-' + CAST({2} AS char(2)) as datetime) >= '{3}-{4}-{5}' and CAST(CAST({6} AS char(4)) + '-' + CAST({7} AS char(2)) + '-' + CAST({8} AS char(2)) as datetime) <= '{9}-{10}-{11}' ";
            delCon.Where(wher, HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                            sDate.Year, sDate.Month, sDate.Day,
                            HR_Scheduling.Attribute.SchYear, HR_Scheduling.Attribute.SchMonth, HR_Scheduling.Attribute.SchDay,
                            eDate.Year, eDate.Month, eDate.Day);
            while (BLLTable<HR_Scheduling>.Factory(conn).Delete(delCon) > 0)
            {
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
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "$('.main').unmask();alert('成功修改" + buildCount + "条记录');", true);
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
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
        con.OrderBy(HR_SchClass.Attribute.StartHour, Order.Asc);
        con.OrderBy(HR_SchClass.Attribute.StartMin, Order.Asc);
        List<HR_SchClass> listObj = BLLTable<HR_SchClass>.Factory(conn).Select(new HR_SchClass(), con);
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        LoadSCH();
    }
}

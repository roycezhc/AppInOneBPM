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

public partial class HR_CheckWork_DeptSchedulingShow : AgileFrame.AppInOne.Common.BaseAdminPage
{
    private List<List<string>> m_StaffAndScore = new List<List<string>>();
    protected string title = "";
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "排班查看";
        Page.Title = title;
        if (Request["staffid"] != null)
        {
            hidstaffid.Value = Request["staffid"];
        }
        if (Request["deptid"] != null)
        {
            hiddeptid.Value = Request["deptid"];
        }
        if (Request["orgid"] != null)
        {
            hidorgid.Value = Request["orgid"];
        }
        if (Request["name"] != null)
        {
            title += "--" + System.Uri.UnescapeDataString(Request["name"]);
            hidname.Value = System.Uri.UnescapeDataString(Request["name"]);
        }
        else if (hidname.Value != "")
            title += System.Uri.UnescapeDataString(hidname.Value);
        else
            title += "--" + userBase.StaffName;
        if (!IsPostBack)
        {
            #region//默认属性初始化
            dll_Year.Items.Clear();
            dll_Month.Items.Clear();
            DateTime dt = DateTime.Now;
            for (int y = dt.Year - 25; y < dt.Year + 25; y++)
            {
                dll_Year.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }
            dll_Year.Value = dt.Year.ToString();

            dll_Month.Items.Add(new ListItem("未选择", "0"));
            for (int y = 1; y < 13; y++)
            {
                dll_Month.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }
            dll_Month.Value = dt.Month.ToString();
            //dll_Day.Text = dt.Day.ToString();

            dll_Type.Items.AddRange(FormHelper.GetListItem(HR_Scheduling.Attribute.SchType));
            #endregion

            HR_SchClass con = new HR_SchClass();
            con.OrderBy(new List<OrderByItem>(new OrderByItem[] { 
                new OrderByItem(HR_SchClass.Attribute.StartHour, Order.Asc), 
                new OrderByItem(HR_SchClass.Attribute.StartMin, Order.Asc),
                new OrderByItem(HR_SchClass.Attribute.EndHour, Order.Asc), 
                new OrderByItem(HR_SchClass.Attribute.EndMin, Order.Asc) 
            }));
            repList.DataSource = BLLTable<HR_SchClass>.Factory(conn).Select(new HR_SchClass(), con);
            repList.DataBind();
        }
    }
}
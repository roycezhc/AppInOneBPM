using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Common;
using AgileFrame.Orm.PersistenceLayer;
public partial class BILL_ExistsRecSel : AgileFrame.AppInOne.Common.BasePage
{
    string tbinfo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["tbinfo"] != null) {
            tbinfo = Request["tbinfo"];
        }
        BindList(1);
    }

    void BindList(int page)
    {
        string[] arr = tbinfo.Split(',');
        DataTable dt=BLLTable.qDataTable("", "select " + arr[1] + "," + arr[2] + " from " + arr[0]);
        if (dt != null)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                litList.Text += "<tr><td>" + dt.Rows[i][arr[1]].ToString() + "</td><td>" + dt.Rows[i][arr[2]].ToString() + "</td></tr>";
            }
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
       
        BindList(aspPager.CurrentPageIndex);
    }
}
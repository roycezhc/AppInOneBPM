using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class BILL_BillShow : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected int BillID
    {
        get {
            if (Request["BillID"] != null)
            {
                return int.Parse(Request["BillID"]);
            }
            else {
                return 0;
            }
        }
    }
    protected int KeyID
    {
        get
        {
            if (Request["KeyID"] != null)
            {
                return int.Parse(Request["KeyID"]);
            }
            else
            {
                return 0;
            }
        }
    }
    protected string backUrl = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        backUrl = "BillList.aspx?BillID=" + BillID;
        if (!IsPostBack) {
            hidAppPath.Value = WebHelper.GetAppPath();

            if (BillID > 0) {
                SYS_BILL_BLL billExd = new SYS_BILL_BLL(BillID);
                billExd.SetDefaultValue("DEPT_ID", userBase.DeptID);
                billExd.SetDefaultValue("STAFF_ID", userBase.StaffID.ToString());
                billExd.SetDefaultValue("STAFF_ID_ZD", userBase.StaffID.ToString());

                billExd.SetDefaultValue("ZDSJ",DateTime.Now.ToString("yyyy-MM-dd"));
                if (KeyID > 0)
                {
                   litBillForm.Text= billExd.HtmlShowForm(KeyID.ToString());
                   hidDetailRows.Value = billExd.GetSubNum().ToString();

                }
            }
        }
    }

}
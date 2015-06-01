using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class Admin_DEPT_DeptManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string expPath = "", depid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserBaseExd userExd = new UserBaseExd(userBase);
            depid = userBase.DeptID;
            //string mypaths = null;//
            string deptpathids = userExd.GetMyDeptPathIDS();
            //Response.Write(deptpathids);
            expPath = "0," + userBase.OrgID + "," + deptpathids.TrimStart("0,");
        }
    }
}

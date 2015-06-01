using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.AppInOne.Common;

public partial class Module_Admin_TF_TABLE_Default :BaseAdminPage
{
    TF_TABLE valObj = new TF_TABLE();
    TF_TABLE condObj = new TF_TABLE();
    List<TF_TABLE> listObj = new List<TF_TABLE>();
    int recount = -1;//查询总记录数
    protected string title = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Title = Repeater.Text;
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
    }
}
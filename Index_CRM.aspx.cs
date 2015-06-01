using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;

public partial class IndexNew_CRM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string appid = "1";
        this.Server.Transfer("Index.aspx?appid=" + appid, true);
        Response.End();
        return;
    }
}
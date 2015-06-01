using AgileFrame.AppInOne.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index_OA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string appid = "0";
        this.Server.Transfer("Index.aspx?appid=" + appid, true);
        Response.End();
        return;
    }
}
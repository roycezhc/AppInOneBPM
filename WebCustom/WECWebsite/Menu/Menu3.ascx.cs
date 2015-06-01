using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;

public partial class WECWebsite_Menu_Menu3 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected int aid = Common.GetReqIntValue("aid");
    protected void Page_Load(object sender, EventArgs e)
    {
        preUrl = WebHelper.GetAppPath();
    }
}
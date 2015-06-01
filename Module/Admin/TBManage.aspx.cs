using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;

public partial class SYS_WF_TBManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string af_js = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        af_js = System.IO.File.ReadAllText(Server.MapPath(WebHelper.GetAppPath()) + @"Lib/jsPlugin/af_table_tree.js");      
        

    }
}
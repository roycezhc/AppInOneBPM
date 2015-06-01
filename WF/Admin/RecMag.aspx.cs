using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;

public partial class WF_Admin_RecMag : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WF_INFO cond = new WF_INFO();
            cond.STATUS = "1";
            List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), cond);
            for (int i = 0; i < lst.Count; i++)
            {
                litWFS.Text += "<li><a href='RecManage.aspx?WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "list'}\" target='recmanage'>" + lst[i].WFCNAME + "</a></li>";
            }
        }
    }
}
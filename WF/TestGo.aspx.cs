using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core.EventAndDelegate;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core;
public partial class WF_TestGo : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SYS_USER ucond = new SYS_USER();
        ucond.USER_ID =decimal.Parse( Request["SID"]);
       SYS_USER val = BLLTable<SYS_USER>.Factory(conn).GetRowData(new SYS_USER(), ucond);

        if (val != null)
        {
            PowerHelper.SetCurLoginUser(val);
            Response.Redirect(Request["url"]);
        }
        else
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "用户名或密码错误！请重新输入。");
        }
    }
}
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

public partial class BILL_BillBack : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["DelByKeyID"] != null) {
            int kid = int.Parse(Request["DelByKeyID"]);
            int billid = int.Parse(Request["BillID"]);
            SYS_BILL_BLL bll = new SYS_BILL_BLL(billid);
            int re=bll.Delete(kid.ToString());

            if (re > 0)
            {
                Response.Write("{re:1,msg:'删除单据成功！'}");
            }
            else {
                Response.Write("{re:0,msg:'删除单据失败！'}");
            }
        }

        Response.End();
    }
}
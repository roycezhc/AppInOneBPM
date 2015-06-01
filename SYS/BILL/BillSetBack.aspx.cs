using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Common;

public partial class SYS_BILL_BillSetBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//导入字段
        if (Request["showInHead"] != null)
        {
            string colid = Request["id"];
            string billid = Request["pid"];
            SYS_BILL_COL ccc = new SYS_BILL_COL();
            ccc.COL_ID = int.Parse(colid);
            ccc.BILL_ID = int.Parse(billid);
            SYS_BILL_COL vvv = new SYS_BILL_COL();
            vvv.BILL_ISHEADER = "1";
            int re = BLLTable<SYS_BILL_COL>.Factory(conn).Update(vvv, ccc);
            if (re > 0)
            {
                Response.Write("{re:1,msg:'设置成功！'}");
            }
            else
            {
                Response.Write("{re:0,msg:'设置失败！'}");
            }
        }

        #endregion

        #region//导入字段
        if (Request["getBillHtml"] != null)
        {
            SYS_BILL_BLL bill = new SYS_BILL_BLL(int.Parse(Request["billid"]));
            Response.Write(bill.HtmlList(null) + "`"+bill.HtmlEditForm());
        }

        #endregion

        Response.End();

    }
}
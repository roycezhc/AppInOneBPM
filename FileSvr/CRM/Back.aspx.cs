using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core.EventAndDelegate;
using AgileFrame.AppInOne.Common;using AgileFrame.AppInOne.SYS;

public partial class CRM_Back : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["DelKeyID"] != null)
        {
            int re = BLLTable<CRM_CUST>.Factory(conn).Delete(CRM_CUST.Attribute.Cus_ID, Request["DelKeyID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        if (Request["DelKeyIDS"] != null)
        {
            CRM_CUST cond = new CRM_CUST();
            cond.In(CRM_CUST.Attribute.Cus_ID, Request["DelKeyIDS"]);
            int re = BLLTable<CRM_CUST>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }
        Response.End();
    }
}
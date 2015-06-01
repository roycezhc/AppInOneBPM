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
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SYS_BILL_RowFormular : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SYS_BILL_COL condObj = new SYS_BILL_COL();
        SYS_BILL_COL valObj = new SYS_BILL_COL();
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL_COL.Attribute.COL_ID, Order.Desc);

        if (Request["BillID"] != null)
        {
            if (Request["col"] != null)
            {
                condObj.BILL_ID = int.Parse(Request["BillID"]);
            }
            else
            {

                SYS_BILL billObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, Request["BillID"]);
                condObj.BILL_ID = billObj.P_BILL_ID;
                //List<SYS_BILL> listBill = BLLTable<SYS_BILL>.Factory(conn).Select(SYS_BILL.Attribute.P_BILL_ID, Request["BillID"]);
                //if (listBill != null)
                //{
                //    string ids = "0";
                //    for (int i = 0; i < listBill.Count; i++)
                //    {
                //        ids += "," + listBill[i].BILL_ID;
                //    }
                //    condObj.In(SYS_BILL_COL.Attribute.BILL_ID, ids);
                //}
            }
        }

        List<SYS_BILL_COL>  listObj = BLLTable<SYS_BILL_COL>.Factory(conn).Select(valObj, condObj);
        Repeater1.DataSource = listObj;
        Repeater1.DataBind();
    }
}
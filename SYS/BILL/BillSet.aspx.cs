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
public partial class SYS_BILL_BillSet : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showCHName(SYS_BILL_COL col)
    {
        if (!string.IsNullOrEmpty(col.DISPLAY_NAME))
        {
            return col.DISPLAY_NAME;
        }
        if (!string.IsNullOrEmpty(col.COL_NOTE))
        {
            return col.COL_NOTE;
        }
        return col.COL_NAME;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //SYS_BILL_EXD bill = new SYS_BILL_EXD(int.Parse(Request["BillID"]));

        //litView.Text = bill.HtmlEditForm();

        //litList.Text = bill.HtmlList();
        int billid = 0;
        if (Request["BillID"] != null)
        {
            billid = int.Parse(Request["BillID"]);

            List<SYS_BILL_COL> list = BLLTable<SYS_BILL_COL>.Factory(conn).Select(SYS_BILL_COL.Attribute.BILL_ID, billid);
            repBillCol.DataSource = list;
            repBillCol.DataBind();

            if (list.Count > 0)
            {
                SYS_BILL_BLL bill = new SYS_BILL_BLL(billid);
                litList.Text = bill.HtmlList(null);
                //litView.Text = bill.HtmlEditForm();
                for (int i = 0; i < 8; i++)
                {
                    litView.Text += "<tr id='tr_" + i + "'><td class='label' id='tr_" + i + "_1'>&nbsp;"+i+"</td><td>&nbsp;</td><td class='label' id='tr_" + i + "_2'>&nbsp;</td><td>&nbsp;a"+i+"</td></tr>";
                }
            }
        }

    }
}
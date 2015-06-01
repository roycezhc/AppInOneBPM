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
public partial class BILL_BillList : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected int BillID
    {
        get
        {
            if (Request["BillID"] != null)
            {
                return int.Parse(Request["BillID"]);
            }
            else
            {
                return 0;
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            hidAppPath.Value = WebHelper.GetAppPath();

            if (BillID > 0)
            {
                SYS_BILL_BLL billExd = new SYS_BILL_BLL(BillID);
                //此查询区可缓存
                litFind.Text = billExd.HtmlFindForm(new SYS_BILL_OBJ());
                //表体只可部分缓存
                litList.Text = billExd.HtmlList(new SYS_BILL_OBJ());
            }
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (BillID > 0)
        {
            SYS_BILL_BLL billExd = new SYS_BILL_BLL(BillID);
            SYS_BILL_OBJ condBill = billExd.GetBillObjByFindForm();
            //Response.Write(billExd.GetFindColsObjectString());
            litFind.Text = billExd.HtmlFindForm(condBill);
            litList.Text = billExd.HtmlList(condBill);
        }
    }
}
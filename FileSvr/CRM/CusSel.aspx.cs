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

public partial class PRCS_CusSel : AgileFrame.AppInOne.Common.BasePage
{
    CRM_CUST proValue = new CRM_CUST();
    CRM_CUST cusCond = new CRM_CUST();
    List<CRM_CUST> proList = new List<CRM_CUST>();
    int recount = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        cusCond.OrderBy(CRM_CUST.Attribute.Cus_ID, Order.Desc);//Cus_ID列名不明确

        if (!IsPostBack)
        {
            aspPager.PageSize = 12;

            try
            {
                proList = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(proValue, cusCond, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = proList;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                //PageHelper.Error(Page, ex);
            }
            aspPager.RecordCount = recount;
            aspPager.CurrentPageIndex = 1;

        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        proList = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(proValue, cusCond, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

        repCus.DataSource = proList;
        repCus.DataBind();
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        cusCond.Like(CRM_CUST.Attribute.Cus_Name, txtKey.Value);

        proList = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(proValue, cusCond, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = proList;
        repCus.DataBind();

        aspPager.RecordCount = recount;
        aspPager.CurrentPageIndex = 1;
    }
}

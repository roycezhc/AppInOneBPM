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
using AgileFrame.AppInOne.CMS;
public partial class CheckLog : AgileFrame.AppInOne.Common.BaseAdminPage
{

    WF_CHECK_LOG_TPL valObj = new WF_CHECK_LOG_TPL();
    WF_CHECK_LOG_TPL condObj = new WF_CHECK_LOG_TPL();
    List<WF_CHECK_LOG_TPL> listObj = new List<WF_CHECK_LOG_TPL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(WF_CHECK_LOG_TPL.Attribute.LOG_ID, Order.Asc);
        title = valObj._ZhName;
        Page.Title = title;

        condObj.WFID = Common.GetReqIntValue("wfId");
        condObj.PROCID = Common.GetReqIntValue("procId");
        condObj.RECID = Common.GetReqIntValue("recId");
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<WF_CHECK_LOG_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<WF_CHECK_LOG_TPL>(hidCondition.Value);
            }
            listObj = BLLTable<WF_CHECK_LOG_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        listObj = BLLTable<WF_CHECK_LOG_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

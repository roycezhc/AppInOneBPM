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
public partial class WF_STEP_TPLSel : AgileFrame.AppInOne.Common.BaseAdminPage
{

    WF_STEP_TPL valObj = new WF_STEP_TPL();
    WF_STEP_TPL condObj = new WF_STEP_TPL();
    List<WF_STEP_TPL> listObj = new List<WF_STEP_TPL>();
    protected string title = "";
    protected int procid = 0;
    protected string stepid = "";
    protected string selType = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            procid = int.Parse(Request["PROCID"]);
        }
        if (Request["STEP_ID"] != null)
        {
            stepid = Request["STEP_ID"];
        }
        title = valObj._ZhName + "Ñ¡Ôñ";
        Page.Title = title;
        if (!IsPostBack)
        {
            condObj.PROCID = procid;
            condObj.In(WF_STEP_TPL.Attribute.STEP_TYPE, "1,2");
            if (Request["selType"] != null) {
                condObj.STEP_TYPE = int.Parse(Request["selType"]);
                selType = Request["selType"];
            }
            try
            {
                listObj = BLLTable<WF_STEP_TPL>.Factory(conn).Select(valObj, condObj);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }


}

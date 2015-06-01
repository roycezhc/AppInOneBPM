using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_Admin_STEP_RoateSetting : AgileFrame.AppInOne.Common.BasePage
{
    protected int stepid = 0;
    protected int wfid=0;
    protected int procid=0;

    protected int previd = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PREV_ID"] != null)
        {
            previd = int.Parse(Request["PREV_ID"]);
        }
        if (Request["STEP_ID"] != null)
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        else {
            Response.Write("非法连接！");
            Response.End();
        }
        //Response.Write(previd.ToString());
        if (!IsPostBack) {
            WF_STEP_TPL valObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);

            wfid = valObj.WFID;
            procid = valObj.PROCID;

        }
    }
}
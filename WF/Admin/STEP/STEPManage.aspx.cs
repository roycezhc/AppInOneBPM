using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class WF_STEP_STEPManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected int wfid = 0;
    protected int procid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            if (!string.IsNullOrEmpty(Request["WFID"]))
            {
                wfid = int.Parse(Request["WFID"]);
            }
            else
            {
                Response.Write("非法连接！");
                Response.End();
            }
            if (!string.IsNullOrEmpty(Request["PROCID"]))
            {
                procid = int.Parse(Request["PROCID"]);
            }
            else
            {
                if (ViewState["PROCID"] != null)
                {
                    procid = Convert.ToInt32(ViewState["PROCID"]);
                   // litTitle.Text = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, procid).PROC_NAME;
                }
                else
                {
                    List<WF_PROCESS_TPL> lstProc = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(WF_PROCESS_TPL.Attribute.WFID, wfid);
                    if (lstProc.Count > 0)
                    {
                        procid = lstProc[0].PROCID;
                        //litTitle.Text = lstProc[0].PROC_NAME;
                    }
                    else
                    {
                        ScriptHelper.AlertAndGo(Page, "此流程未配置过程！", "../PROCESS/PROCESSManage.aspx?WFID=" + wfid);
                    }
                }
            }
        }
    }
}
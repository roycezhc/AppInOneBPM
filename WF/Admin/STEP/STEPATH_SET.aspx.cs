using System;
using System.Text;
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
using AgileFrame.AppInOne.WF;
public partial class STEP_STEPATH_SET : AgileFrame.AppInOne.Common.BaseAdminPage
{


    WF_STEP_TPL valObj = new WF_STEP_TPL();
    WF_STEP_TPL condObj = new WF_STEP_TPL();
    protected string title = "";
    protected int wfid = 0;
    protected int procid = 0;

    protected int beginID = 0;
    protected int endID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "管理  ";
        
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        else
        {
            if (!string.IsNullOrEmpty(Request["PROCID"]))
            {
                procid = int.Parse(Request["PROCID"]);
                WF_PROCESS_TPL proc = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, procid);
                wfid = proc.WFID;
                title += proc.PROC_NAME + "-";
            }
            else
            {
                Response.Write("非法连接！");
                Response.End();
            }
        }
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            procid = int.Parse(Request["PROCID"]);
        }
        else
        {

            List<WF_PROCESS_TPL> lstProc = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(WF_PROCESS_TPL.Attribute.WFID, wfid);
            if (lstProc.Count > 0)
            {
                procid = lstProc[0].PROCID;
                title += lstProc[0].PROC_NAME + "-";
            }
            else
            {
                ScriptHelper.AlertAndGo(Page, "此流程未配置过程！", "../PROCESS/PROCESSManage.aspx?WFID=" + wfid);
            }
        }
        if (!IsPostBack)
        {
            #region//数据初始化

            WF_STEP_TPL rule_b = new WF_STEP_TPL();
            rule_b.WFID = wfid;
            rule_b.PROCID = procid;
            rule_b.STEP_TYPE = 0;

            WF_STEP_TPL bObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(new WF_STEP_TPL(), rule_b);
            if (bObj==null)
            {

                rule_b.CONDITION = "";
                rule_b.FORMULAR = "";
                rule_b.STEP_NAME = "开始";
                BLLTable<WF_STEP_TPL>.Factory(conn).Insert(rule_b, WF_STEP_TPL.Attribute.STEP_ID);
                bObj = rule_b;
            }
            litB.Text = bObj.STEP_NAME;
            beginID = bObj.STEP_ID;
            
            WF_STEP_TPL rule_e = new WF_STEP_TPL();
            rule_e.WFID = wfid;
            rule_e.PROCID = procid;
            rule_e.STEP_TYPE = 3;

            WF_STEP_TPL eObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(new WF_STEP_TPL(), rule_e);
            if (eObj==null)
            {

                rule_e.CONDITION = "";
                rule_e.FORMULAR = "";
                rule_e.STEP_NAME = "结束";
                BLLTable<WF_STEP_TPL>.Factory(conn).Insert(rule_e, WF_STEP_TPL.Attribute.STEP_ID);
                eObj = rule_e;
            }
            litE.Text = eObj.STEP_NAME;
            endID = eObj.STEP_ID;

            WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, wfid);
            if (wf.STATUS != "1")
            {
                btnApplyTo.Enabled = false;
                btnApplyProc.Disabled = true;
            }
            #endregion

            Dictionary<int, WF_STEP_TPL> noUseSTep = new Dictionary<int, WF_STEP_TPL>();
            //流程图形设计器：
            litStepMap.Text = WFAdmin.ShowStepPathMap(wfid, procid, out noUseSTep);

            if (noUseSTep.Count > 0)
            {
                StringBuilder sbMap = new StringBuilder();
                foreach (KeyValuePair<int, WF_STEP_TPL> val in noUseSTep) {

                    string data = "{id:'" + val.Value.STEP_ID + "',name:'" + val.Value.STEP_NAME + "',type:'" + val.Value.STEP_TYPE + "'}";
                    sbMap.Append("<div class='step type-" + val.Value.STEP_TYPE + "' data=\"" + data + "\"><b>" + val.Value.STEP_NAME + "</b>");
                    sbMap.Append("</div>");
                }
                litSteps.Text = sbMap.ToString();
            }
        }
        Page.Title = title;
    }
    
    protected void btnApplyTo_Click(object sender, EventArgs e)
    {
        string outMsg = "";
        if (WFAdmin.IsProcessDBSetOK(wfid, procid, out outMsg) && WFAdmin.IsProcessSetComp(wfid, procid, false))
        {
            int re = WFAdmin.ApplyProcess(procid);
            if (re > 0)
            {
                litWarn.Text = "更新过程成功！";
                BLLTable<WF_INFO>.Factory(conn).Update(WF_INFO.Attribute.WFID, wfid, WF_INFO.Attribute.STATUS, 1);
            }
            else
            {
                litWarn.Text = "更新过程失败！";
            }
        }
        else
        {
            litWarn.Text = "过程未配置完成，不能执行此操作！";
        }
    }
    
    protected void btnAddProcess_Click(object sender, EventArgs e)
    {
        string outMsg = "";

        if (WFAdmin.IsProcessDBSetOK(wfid, procid,out outMsg) && WFAdmin.IsProcessSetComp(wfid, procid, false))
        {
            litWarn.Text = "应用过程成功！";
            btnApplyTo.Enabled = true;
            int re = WFAdmin.CloneProcess(procid);
            if (re > 0)
            {
                BLLTable<WF_INFO>.Factory(conn).Update(WF_INFO.Attribute.WFID, wfid, WF_INFO.Attribute.STATUS, 1);
            }
            else
            {
                litWarn.Text = "应用过程失败！";
            }
        }
        else
        {
            litWarn.Text = "过程未配置完成，不能执行此操作！";
        }

    }
    
    protected void btnCheckProc_Click(object sender, EventArgs e)
    {
        string outMsg = "";
        if (WFAdmin.IsProcessDBSetOK(wfid, procid, out outMsg) && WFAdmin.IsProcessSetComp(wfid, procid, false))
        {
            litWarn.Text = "过程配置正确！";
        }
        else {
            litWarn.Text = "过程配置错误！";
        }
    }
}
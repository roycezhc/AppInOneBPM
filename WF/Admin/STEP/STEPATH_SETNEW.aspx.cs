using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core;
using System.Web.UI.HtmlControls;

public partial class WF_Admin_STEP_STEPATH_SETNEW : BaseAdminPage
{
    protected string preUrl = "";
    protected string theme = "";
    protected string title = "";
    protected int wfid = 0;
    protected int procid = 0;
    public string htmlText = "";
    public string script = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        else
        {
            if (!string.IsNullOrEmpty(Request["PROCID"]))
            {
                procid = int.Parse(Request["PROCID"]);
                WF_PROCESS_TPL proc = BLLTable<WF_PROCESS_TPL>.GetRowData(WF_PROCESS_TPL.Attribute.PROCID, procid);
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

            List<WF_PROCESS_TPL> lstProc = BLLTable<WF_PROCESS_TPL>.Select(WF_PROCESS_TPL.Attribute.WFID, wfid);
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
        preUrl = WebHelper.GetAppPath();
        theme = preUrl + "Themes/" + BasePage._ThemeName;

        if (!IsPostBack)
        {
            string strJs = "";
            WF_STEP_TPL cond = new WF_STEP_TPL();
            cond.WFID = wfid;
            cond.PROCID = procid;


            List<WF_STEP_TPL> lstStep = BLLTable<WF_STEP_TPL>.Factory(conn).Select(new WF_STEP_TPL(), cond);

            foreach (WF_STEP_TPL step in lstStep)
            {
                if (step.STEP_TYPE == 0)
                {
                    htmlText += "<div class='node node-start' type =0 id='" + step.STEP_ID + "'style='left:" + step.BLOCKX + "px;top:" + step.BLOCKY + "px;' ><span>" + step.STEP_NAME + "</span></div>";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "',hollowCircle, { anchors: \"BottomCenter\",uuid:\'" + step.STEP_ID + "e\'  });";
                }
                else if (step.STEP_TYPE == 3)
                {
                    htmlText += "<div class='node node-end' type =3 id='" + step.STEP_ID + "'style='left:" + step.BLOCKX + "px;top:" + step.BLOCKY + "px;' ><span>" + step.STEP_NAME + "</span><div class='active-end'><span>" + step.STEP_NAME + "</span></div></div>";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "', solidCircle, { anchors: \"TopCenter\",uuid:\'" + step.STEP_ID + "s\'  });";
                }
                else if (step.STEP_TYPE == 2)
                {
                   // htmlText += "<div class='node node-route' type =2 id='" + step.STEP_ID + "'style='left:" + step.BLOCKX + "px;top:" + step.BLOCKY + "px;' ><span>" + step.STEP_NAME + "</span><div class='route-content'><span>" + step.STEP_NAME + "</span></div></div>";
                    htmlText += "<div class='node roate' type =2 id='" + step.STEP_ID + "'style='left:" + step.BLOCKX + "px;top:" + step.BLOCKY + "px;' ><span>" + step.STEP_NAME + "</span></div>";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "',  solidCircle,{ anchors: \"TopCenter\",uuid:\'" + step.STEP_ID + "s\'  });";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "', hollowCircle, { anchors: \"BottomCenter\",uuid:\'" + step.STEP_ID + "e\'  });";
                }
                else
                {
                    htmlText += "<div class='node node-active' type =1 id='" + step.STEP_ID + "'style='left:" + step.BLOCKX + "px;top:" + step.BLOCKY + "px;' ><span>" + step.STEP_NAME + "</span><div class='active-content'><span>" + step.STEP_NAME + "</span></div></div>";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "',hollowCircle, { anchors: \"BottomCenter\",uuid:\'" + step.STEP_ID + "e\'  });";
                    strJs += "jsPlumb.addEndpoint('" + step.STEP_ID + "', solidCircle, { anchors: \"TopCenter\" ,uuid:\'" + step.STEP_ID + "s\' });";
                }
                strJs += "jsPlumb.draggable('" + step.STEP_ID + "');";
                strJs += "doubleclick(" + step.STEP_ID + "," + step.STEP_TYPE + ");";
            }

            WF_STEPATH_TPL condP = new WF_STEPATH_TPL();
            condP.WFID = wfid;
            condP.PROCID = procid;

            List<WF_STEPATH_TPL> lstPath = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(new WF_STEPATH_TPL(), condP);
            foreach (WF_STEPATH_TPL path in lstPath)
            {
                //strJs += "jsPlumb.bind(\"connection\",function (connInfo, originalEvent) {	connInfo.connection.setLabel(\" \")});";
                strJs += "jsPlumb.connect({ uuids:[ \"" + path.STEP_ID + "e\",  \"" + path.NEXT_ID +
                            "s\"], detachable:true});";
            }
            //{uuids:["Window2BottomCenter", "Window3TopCenter"], editable:true}
            //HtmlGenericControl sss = new HtmlGenericControl();
            //sss.Attributes.Add("src", "/lib/StepCtr/StepCtr.js");
            //sss.Attributes.Add("type", "text/javascript");

            //Page.Header.Controls.AddAt(4, sss);
           // Response.Write("<script src=\"" + ResolveUrl("~/lib/jquery/jquery-1.11.1.min.js") + "\" type=\"text/javascript\"></script>");
           // Response.Write("<script src=\"" + ResolveUrl("~/lib/StepCtr/StepCtr.js") + "\" type=\"text/javascript\"></script>");
          

            script = "jsPlumb.ready(function () {" + strJs + "});";
           // ClientScript.RegisterStartupScript(this.GetType(), "myscript", script, true);

        }
    }
}
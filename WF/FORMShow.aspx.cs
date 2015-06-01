using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_BASEFORMShow : AgileFrame.AppInOne.Common.BaseAdminPage
{

    int count = 0;
    protected decimal recid = 0;
    protected string title = "信息提交";
    public string htmlText = "", script = "", theme = "";
    protected int WF_OBJ_ID
    {
        get {
            if (ViewState["WF_OBJ_ID"] != null)
            {
                return Convert.ToInt32(ViewState["WF_OBJ_ID"]);
            }
            return 0;
        }
        set {
            ViewState["WF_OBJ_ID"] = value;
        }
    }
    protected int PROCID
    {
        get
        {
            if (ViewState["PROCID"] != null)
            {
                return Convert.ToInt32(ViewState["PROCID"]);
            }
            return 0;
        }
        set
        {
            ViewState["PROCID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        theme = WebHelper.GetAppPath() + "Themes/" + BasePage._ThemeName;

        if (!string.IsNullOrEmpty(Request["RECID"]))
        {
            recid = decimal.Parse(Request["RECID"]);
        }
        else
        {
            Response.Write("非法连接！");
            Response.End();
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            WF_OBJ_ID = int.Parse(Request["WFID"]);
        }
        if (!IsPostBack)
        {
           
            //try
            //{
            hideButton();
           
            ViewState["CHECK_INFO"] = "";
            StringBuilder sbDetail = new StringBuilder();
            if (recid > 0)
            {
                WF_FORMBASE valObj = BLLTable<WF_FORMBASE>.Factory(conn).GetRowData(WF_FORMBASE.Attribute.RECID, recid);
                if (WF_OBJ_ID <= 0 && valObj != null)
                {
                    WF_OBJ_ID = valObj.WFID;
                }
                if (WF_OBJ_ID <= 0)
                {
                    return;
                }

                //WFINFO_EXD wfExd = new WFINFO_EXD(WFID, valObj.PROCID);
                //WFORM_EXD wform = wfExd.GetFORM();
                WFOBJECT_BLL wfbll = new WFOBJECT_BLL(WF_OBJ_ID, recid);
                litTitle.Text = valObj.RECNAME;
                WFRecordInfo recObj = new WFRecordInfo(valObj, true);
                if (recObj.HadRecord == false)
                {
                    Response.Write("您要查看的申请记录不存在！");
                    Response.End();
                    return;
                }
                PROCID = valObj.PROCID;
                title = valObj.RECNAME;
                //zlg
                if (MyDebugger.IsAttached)
                {
                    title += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|" + wfbll.FORM_BLL.DbTable.TB_NAME 
                        + "|" + wfbll.WFExd.Base._FORM_TB + "|" + wfbll.WFExd.Base._FILE_TB;
                }
                //CHECK_INFO 为空，是有问题的。
                if (!string.IsNullOrEmpty(valObj.CHECK_INFO))
                {
                    ViewState["CHECK_INFO"] = valObj.CHECK_INFO;
                }
                else
                {
                    "".ToString();
                }
                if (sbDetail.Length > 1)
                {
                    ViewState["HadDetail"] = true;
                    litDetail.Text = sbDetail.ToString();
                }
                
                if ((valObj.STATUS == WFEnum.RecStatus.Submit.ToString("d") 
                    || valObj.STATUS == WFEnum.RecStatus.NoAccept.ToString("d")
                    || valObj.STATUS == WFEnum.RecStatus.Stoped.ToString("d")) && valObj.CSTAFF_ID == userBase.StaffID)
                {
                    btnSubmit.Enabled = true;
                    if (valObj.STATUS == WFEnum.RecStatus.NoAccept.ToString("d")) {
                        btnSubmit.Text = "重新提交";
                    }
                    if (valObj.STATUS == WFEnum.RecStatus.Stoped.ToString("d"))
                    {
                        btnSubmit.Text = "重新启动";
                    }
                }
                else
                {
                    btnSubmit.Enabled = false;
                }
                bool canStop = valObj.STATUS == WFEnum.RecStatus.Checking.ToString("d") && valObj.CSTAFF_ID == userBase.StaffID;

                btnStop.Enabled = canStop;

                if ((valObj.STATUS == WFEnum.RecStatus.Submit.ToString("d") || valObj.STATUS == WFEnum.RecStatus.NoAccept.ToString("d") || valObj.STATUS == WFEnum.RecStatus.Stoped.ToString("d")) && valObj.CSTAFF_ID == userBase.StaffID)
                {
                    btnToEdit.Enabled = true;
                }
                else {
                    btnToEdit.Enabled = false; 
                }
               
                if (valObj.PROCID > 0) {
                    ViewState["PROCID"] = valObj.PROCID;
                }
                
                //jinsj  从字段中获取HTML
                //litDetail.Text = wfbll.FORM_BLL.WF_HtmlShowForm(recObj);// wform.HtmlShowForm(recObj);// WFRecord.ShowRecordDetail(wfid, recid, recObj);
                string status = valObj.STATUS;
                status = WFEnum.GetRecStatus(status);
                litDetail.Text = valObj.HTML_TEXT.Replace("!STATUS!", status);// wform.HtmlShowForm(recObj);// WFRecord.ShowRecordDetail(wfid, recid, recObj);
                if (!string.IsNullOrEmpty(valObj.ANNEX_FILE))
                {
                    string[] lstAnnex = valObj.ANNEX_FILE.Split(',');
                    string html = "";
                    foreach (string strAnnex in lstAnnex)
                    {
                        html += "<a href='" + WebHelper.GetAppPath() + strAnnex + "' target='_blank'>" + strAnnex.Substring(strAnnex.LastIndexOf("/") + 1) + "</a></br>";
                    }
                    //litAnnex.Text = "<dl class='row'><dt>附件：</dt><dd><a href='" + WebHelper.GetAppPath() + valObj.ANNEX_FILE + "' target='_blank'>" + valObj.ANNEX_FILE.Substring(valObj.ANNEX_FILE.LastIndexOf("/") + 1) + "</a></dd></dl>";
                    string tempStr="<tr><td class='lbl'><label>员工名：</label></td><td colspan='4'><span>陈焕许</span></td></tr>";
                    tempStr = StringHelper.ReplaceNonCase(tempStr, "员工名", "附件");
                    litAnnex.Text = StringHelper.ReplaceNonCase(tempStr, "陈焕许", html);                    
                }

                bool hadPower = false;
                litWFPath.Text = wfbll.HtmlWFTextMapNew(recid, userBase.StaffID, ref hadPower);// wfExd.HtmlWFTextMap(recid, userBase.StaffID, ref hadPower);// WFHtml.ShowProcessTextMap(wfid, valObj.PROCID, recid, userBase.StaffID, ref hadPower);
                //获取流程图
                htmlText = wfbll.GetStepPath(recid, ref  script);
                //zlg
                if (!hadPower)
                    hadPower = (userBase.UserName == "sys");

                btnToCheck.Enabled = hadPower && (valObj.STATUS == WFEnum.RecStatus.Checking.ToString("d") || valObj.STATUS == WFEnum.RecStatus.ReCheck.ToString("d"));// && (ViewState["PROCID"] != null);
                //Response.Write(hadPower.ToString());
               
            }
            //}
            //catch (Exception ex)
            //{
            //    litWarn.Text = ex.Message; txtREASON.Value = "00000000";
            //}

            if (Request["fromTab"] != null)
            {
                btnBack.Value = "关闭";
            }

            if (Request["notice"] != null)
            {
                hideButton();
                btnBack.Value = "关闭";
            }
        }
    }
    private void hideButton()
    {
        btnBack.Visible = true;
        btnStop.Enabled = false;
        btnToCheck.Enabled = false;
        btnToEdit.Enabled = false;
        btnSubmit.Enabled = false;
    }

    protected void btnToCheck_Click(object sender, EventArgs e)
    {
        string backUrl = HttpUtility.UrlEncode("FormList.aspx?WFID=" + WF_OBJ_ID);
        if (preUrl != "") {
            backUrl = HttpUtility.UrlEncode(preUrl);
        }

        string chckerUrl = WebHelper.GetAppPath() + "WF/Check.aspx?WFID=" + WF_OBJ_ID + "&PROCID=" + ViewState["PROCID"].ToString() + "&RECID=" + recid + "&preUrl=" + backUrl;
        Response.Redirect(chckerUrl, false);
    }
    protected void btnToORIG_Click(object sender, EventArgs e)
    {
        WFRecordInfo recObj = new WFRecordInfo(WF_OBJ_ID,recid);
        recObj.AddWFTempToTB(WF_OBJ_ID, recid);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (recid > 0)
        {
            WFOBJECT_BLL wfbll = new WFOBJECT_BLL(WF_OBJ_ID, recid);
            string err = "";
            //bool ck = wfbll.WF_CheckStepChecker(recid, out err);
            bool ck = true;
            if (ck == false)
            {
                AgileFrame.Core.ScriptHelper.Alert(Page, err + " 无法提交。");
            }
            else
            {
                string chckerUrl = WebHelper.GetAppPath() + "WF/Checkers.aspx?Submit=1&WFID=" + WF_OBJ_ID + "&PROCID=" + PROCID + "&RECID=" + recid;
                Response.Redirect(chckerUrl, false);
            }

        }
    }
   

    protected void btnStop_Click(object sender, EventArgs e)
    {
        WFRecordInfo recObj = new WFRecordInfo(WF_OBJ_ID,recid);
        recObj.UpdateSTATUS(recid, WFEnum.RecStatus.Stoped.ToString("d"));

        string chckerUrl = WebHelper.GetAppPath() + "WF/FORMList.aspx?Mine=1&WFID=" + WF_OBJ_ID;
        Response.Redirect(chckerUrl, false);
    }
    protected void btnToEdit_Click(object sender, EventArgs e)
    {
        string chckerUrl = WebHelper.GetAppPath() + "WF/Edit.aspx?WFID=" + WF_OBJ_ID + "&RECID=" + recid;
        Response.Redirect(chckerUrl, false);
    }
}

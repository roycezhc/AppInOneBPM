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
public partial class WF_BASEFORMPrint : AgileFrame.AppInOne.Common.BaseAdminPage
{

    int count = 0;
    protected decimal recid = 0;
    protected string title = "信息提交";
    protected int WFOBJ_ID
    {
        get {
            if (ViewState["WFID"]!=null)
            {
                return Convert.ToInt32(ViewState["WFID"]);
            }
            return 0;
        }
        set {
            ViewState["WFID"] = value;
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
            WFOBJ_ID = int.Parse(Request["WFID"]);
        }
        if (!IsPostBack)
        {
           
            //try
            //{

           
            ViewState["CHECK_INFO"] = "";
            StringBuilder sbDetail = new StringBuilder();
            if (recid > 0)
            {
                WF_FORMBASE valObj = BLLTable<WF_FORMBASE>.Factory(conn).GetRowData(WF_FORMBASE.Attribute.RECID, recid);
                if (WFOBJ_ID <= 0)
                {
                    WFOBJ_ID = valObj.WFID;
                }
                WFOBJECT_BLL wfbll = new WFOBJECT_BLL(WFOBJ_ID);
                FORM_BLL formbll = wfbll.FORM_BLL;

                //WFINFO_EXD wfExd = wfbll.WFExd;// new WFINFO_EXD(WFID, valObj.PROCID);
                //WFORM_EXD wform = wfExd.GetFORM();
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
                if (!string.IsNullOrEmpty(valObj.CHECK_INFO))
                {
                    ViewState["CHECK_INFO"] = valObj.CHECK_INFO;
                }
                if (sbDetail.Length > 1)
                {
                    ViewState["HadDetail"] = true;
                    litDetail.Text = sbDetail.ToString();
                }

                if (valObj.PROCID > 0) {
                    ViewState["PROCID"] = valObj.PROCID;
                }
                litDetail.Text = formbll.WF_HtmlShowForm(recObj);// WFRecord.ShowRecordDetail(wfid, recid, recObj);
                if (!string.IsNullOrEmpty(valObj.ANNEX_FILE))
                {
                    //litAnnex.Text = "<dl class='row'><dt>附件：</dt><dd><a href='" + WebHelper.GetAppPath() + valObj.ANNEX_FILE + "' target='_blank'>" + valObj.ANNEX_FILE.Substring(valObj.ANNEX_FILE.LastIndexOf("/") + 1) + "</a></dd></dl>";
                    string tempStr = "<tr><td class='lbl'><label>员工名：</label></td><td colspan='4'><span>陈焕许</span></td></tr>";
                    tempStr = StringHelper.ReplaceNonCase(tempStr, "员工名", "附件");
                    litAnnex.Text = StringHelper.ReplaceNonCase(tempStr, "陈焕许", "<a href='" + WebHelper.GetAppPath() + valObj.ANNEX_FILE + "' target='_blank'>" + valObj.ANNEX_FILE.Substring(valObj.ANNEX_FILE.LastIndexOf("/") + 1) + "</a>");
                }

                bool hadPower = false;
                litWFPath.Text = wfbll.HtmlWFTextMap(recid, userBase.StaffID, ref hadPower);// WFHtml.ShowProcessTextMap(wfid, valObj.PROCID, recid, userBase.StaffID, ref hadPower);

               
            }
            //}
            //catch (Exception ex)
            //{
            //    litWarn.Text = ex.Message; txtREASON.Value = "00000000";
            //}

        }
    }
}

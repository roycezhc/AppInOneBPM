using System;
using System.Collections.Generic;
using System.Data;
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
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
public partial class WF_BASEFORMList:BaseAdminPage
{
    protected string showStepState(string status, string checkinfo, decimal recid, int wfid)
    {
        //string ck = "";
        string str = WFCKLOG_EXD.ShowCheckInfo(status, checkinfo, recid, userBase.StaffID.ToString());//
        //替换"审批"的url
        str = str.Replace("{URL}", WebHelper.GetAppPath() + "WF/Check.aspx?WFID=" + wfid + "&RECID=" + recid + "&preUrl=" + curUrl);
        return str;
    }
    protected string clickUrl(string status, string checkinfo, decimal recid, int wfid, string recName)
    {
        //string ck = "";
        string url = "";
        string str = WFCKLOG_EXD.ShowCheckInfo(status, checkinfo, recid, userBase.StaffID.ToString());//
        if (str.IndexOf("{URL}") >= 0)//其他人审批
        {
            url = "<a  href='" + WebHelper.GetAppPath() + "WF/Check.aspx?WFID=" + wfid + "&RECID=" + recid + "&preUrl=" + curUrl + "'>" + StringHelper.GetCenterString(recName,"]","2") + "</a>";
        }
        else//本人审批
        {
            url = "<a  href='FORMShow.aspx?RECID=" + recid + "&preUrl=" + curUrl + "'>" + StringHelper.GetCenterString(recName, "]", "2") + "</a>";
        }
        return url;
    }

    WF_FORMBASE valObj = new WF_FORMBASE();
    WF_FORMBASE condObj = new WF_FORMBASE();

    List<WF_FORMBASE> listObj = new List<WF_FORMBASE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    protected int wfid = 0;
    decimal staff_id = 0;
    protected string appPath = "";
    private void BindList(WF_FORMBASE condObj, int curPage)
    {
        staff_id = getStaffID();
        if (Request["mine"] != null||Request["mime"]!=null)
        {
            condObj.Where(" (CSTAFF_ID='" + staff_id + "' or STAFF_ID='" + staff_id + "')");
        }
        if (wfid > 0)
        {
            condObj.WFID = wfid;
        }
        if (Request["getType"] == "-1")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":");
            title = "我参与的申请列表";
        }
        if (Request["getType"] == "0")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":0");
            condObj.Where("STATUS='"+WFEnum.RecStatus.Checking.ToString("d")+"'");
            title = "待我处理的申请列表";
        }
        else if (Request["getType"] == "1")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":1");
            title = "我通过的申请列表";
        }
        else if (Request["getType"] == "2")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":2");
            title = "我退回的申请列表";
        }
        else if (Request["getType"] == "3")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":3");
            title = "我停止的申请列表";
        }
        else if (Request["getType"] == "CK")
        {
            condObj.Like(WF_FORMBASE.Attribute.CHECKERS, staff_id + ":CK");
            title = "我审核过的申请列表";
        }

        if (!string.IsNullOrEmpty(Request["TypeID"]))
        {
            List<WF_INFO> wflist = BLLTable<WF_INFO>.Factory(conn).Select(WF_INFO.Attribute.TYPE_ID, Request["TypeID"]);
            if (wflist != null)
            {
                string ids = "";
                for (int i = 0; i < wflist.Count; i++)
                {
                    ids += ids == "" ? wflist[i].WFID.ToString() : "," + wflist[i].WFID;
                }
                if (ids != "")
                {
                    condObj.In(WF_FORMBASE.Attribute.WFID, ids);
                }
            }
        }
        valObj.af_PageBy(WF_FORMBASE.Attribute.RECID, Order.Desc);

        listObj = BLLTable<WF_FORMBASE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);

        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }
    decimal getStaffID() {
        if (ViewState["STAFF_ID"] != null)
        {
            return Convert.ToDecimal(ViewState["STAFF_ID"]);
        }
        else {
            return userBase.GetStaff().STAFF_ID;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        title ="申请单列表";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        appPath = WebHelper.GetAppPath();
        if (!IsPostBack)
        {
            staff_id = userBase.GetStaff().STAFF_ID;
            if (wfid > 0)
            {
                title = BLLTable<WF_INFO>.Factory(conn).GetOneValue(WF_INFO.Attribute.WFID, wfid, WF_INFO.Attribute.WFCNAME);
            }
            //如果没存在这个员工怎么处理，staff_id == 0

            ////////////
            //WF_INFO cond = new WF_INFO();
            //cond.STATUS = "1";
            //List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), cond);

            WF_WFOBJECT cond = new WF_WFOBJECT();
            cond.STATUS = 1;
            List<WF_WFOBJECT> lst = BLLTable<WF_WFOBJECT>.Factory(conn).Select(new WF_WFOBJECT(), cond);
            
            WF_TYPE condType = new WF_TYPE();
            condType.STATUS = 1;
            List<WF_TYPE> lstType = BLLTable<WF_TYPE>.Factory(conn).Select(new WF_TYPE(), condType);
            string url = Page.Request.Url.AbsoluteUri;
            int iii = url.IndexOf("?");
            if (iii == -1)
            {
                url = "FORMList.aspx?";
            }
            else {
                url = "FORMList.aspx" + url.Substring(iii);
            }
            for (int i = 0; i < lstType.Count; i++)
            {
                var lll = lst.Where(l => l._TYPE_ID == lstType[i]._TYPE_ID);
                litMenu.Text += "<li><a>" + lstType[i].TYPE_NAME + "</a><ul>";
                foreach (WF_WFOBJECT l in lll)
                {
                    string purl = url + "&WFID="+l.WF_OBJ_ID;
                    litMenu.Text += "<li><a href='" + purl + "' data=\"{key:'wf" + l.WF_OBJ_ID + "mylist'}\">" + l.WF_OBJ_NAME  + "管理</a></li>";
                }
                litMenu.Text += "</ul></li>";
            }
            ////////////

            ViewState["STAFF_ID"] = staff_id;
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;

            #endregion

            #region//数据初始化

            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_FORMBASE.Attribute.STATUS));
            #endregion

            BindList(condObj, 1);

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_FORMBASE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = GetCondObj();
        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);

        BindList(GetCondObj(), aspPager.CurrentPageIndex);
    }

    public WF_FORMBASE GetCondObj()
    {
        WF_FORMBASE ccc = new WF_FORMBASE();
        if (txtRECNO.Value != "")
            ccc.Like(WF_FORMBASE.Attribute.RECNO, Convert.ToString(txtRECNO.Value));

        if (txtDEPT_NAME.Value != "")
            ccc.Like(WF_FORMBASE.Attribute.DEPT_NAME, Convert.ToString(txtDEPT_NAME.Value));


        if (txtSTAFF_NAME.Value != "")
            ccc.Like(WF_FORMBASE.Attribute.STAFF_NAME, Convert.ToString(txtSTAFF_NAME.Value));



        if (txtCSTAFF_NAME.Value != "")
            ccc.Like(WF_FORMBASE.Attribute.CSTAFF_NAME, Convert.ToString(txtCSTAFF_NAME.Value));

        if (txtSTATUS.Value != "")
            ccc.STATUS = Convert.ToString(txtSTATUS.Value);

        hidCondition.Value = ccc.ToJson(20);

        return ccc;
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
                   }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Text.RegularExpressions;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
public partial class WF_MOREList:BaseAdminPage
{
    //http://localhost:6222/Site/WF/FORMList.aspx?mine=1&WFID=34&fromTab=wf34mylist&r=0.9013923459428217

    //UserBase userBase = new UserBase();
    protected string showStepState(string status,string checkinfo,decimal recid,int wfid)
    {
        //string ck = "";
        string str = WFCKLOG_EXD.ShowCheckInfo(status, checkinfo, recid, userBase.StaffID.ToString());//
        str = str.Replace("{URL}",WebHelper.GetAppPath()+"WF/Check.aspx?WFID="+wfid+"&RECID="+recid+"&preUrl="+curUrl);
        return str;
    }

    public string showRECNAME(object recname)
    {
        if (recname == null)
        {
            return "";
        }
        string str = recname.ToString();
        string ppp = @"\[.+\](\D+)\d+";
        Regex reg = new Regex(ppp, RegexOptions.IgnoreCase);
        Match m = reg.Match(str);
        if (m.Groups.Count == 2)
        {
            string str1 = m.Groups[0].Value;
            string str2 = m.Groups[1].Value;

            str = str1.Replace(str2, "");
        }

        return str;
    }


    List<WF_FORMBASE> listObj = new List<WF_FORMBASE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    protected int wf_obj_id = 0;
    decimal staff_id = 0;
    //WFORM_EXD bllform = null;
    protected string strTHS = "";
    protected string strCOLS = "";
    protected string appPath = "";
    private void BindList(int curPage)
    {
        string strWhere = "";
        staff_id = getStaffID();
        if (Request["mine"] != null||Request["mime"]!=null)
        {
            //condObj.STAFF_ID = staff_id;
            //strWhere += " and wfbase.STAFF_ID=" + staff_id;
            strWhere += " and (wfbase.STAFF_ID=" + staff_id + " or wfbase.CSTAFF_ID=" + staff_id + ")";
        }
        if (wfobj !=null)
        {
           // condObj.WFID = wfobj.WFID_SRC;
            strWhere += " and wfbase.WFID=" + wfobj.WFID_SRC;
        }
       
        if (Request["getType"] == "-1")
        {
            strWhere += " and wfbase.CHECKERS like ':" + staff_id + ":'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":");
            title = "我参与的申请列表";
        }
        if (Request["getType"] == "0")
        {
            strWhere += " and wfbase.CHECKERS like ':" + staff_id + ":0'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":0");
            //condObj.Where("STATUS='"+WFEnum.RecStatus.Checking.ToString("d")+"'");
            title = "待我处理的申请列表";
        }
        else if (Request["getType"] == "1")
        {
            strWhere += " and wfbase.CHECKERS like ':" + staff_id + ":1'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":1");
            title = "我通过的申请列表";
        }
        else if (Request["getType"] == "2")
        {
            strWhere += " and wfbase.CHECKERS like ':" + staff_id + ":2'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":2");
            title = "我退回的申请列表";
        }
        else if (Request["getType"] == "3")
        {
            strWhere += " and wfbase.CHECKERS like ':" + staff_id + ":3'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, ":" + staff_id + ":3");
            title = "我停止的申请列表";
        }
        else if (Request["getType"] == "CK")
        {
            strWhere += " and wfbase.CHECKERS like '" + staff_id + ":CK'";
            //condObj.Like(WF_FORMBASE.Attribute.CHECKERS, staff_id + ":CK");
            title = "我审核过的申请列表";
        }
        if (bllform != null)//zlg
        {
            //repList.DataSource = bllform.Select(condObj, Request["getType"], staff_id, aspPager.PageSize, curPage, ref recount, out strTHS, out strCOLS);
            DataTable dt = bllform.WF_SelectByPage(wf_obj_id, 12, 1, ref recount, strWhere, out strCOLS);
            repList.DataSource = dt;
            //在合同里增加 金额 字段
            string[] arr = StringHelper.GetStringArray(strCOLS, ',');
            if (arr != null)
            {
                for (int i = 0; i < arr.Length; i++)
                {
                    string[] aaa = arr[i].Split(':');
                    if (aaa.Length > 1)
                        strTHS += "<th style='color:red'>" + aaa[1] + "</th>";
                }
            }

            repList.DataBind();
            aspPager.RecordCount = recount;
        }
       // Response.Write(strCOLS);
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
    FORM_BLL bllform = null;
    WF_WFOBJECT wfobj = null;
    WFOBJECT_BLL wfbll = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        title ="申请单列表";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wf_obj_id = int.Parse(Request["WFID"]);
            wfbll = new WFOBJECT_BLL(wf_obj_id);
            if (wfbll.Base != null)
            {
                bllform = wfbll.FORM_BLL;
                wfobj = wfbll.Base;
            }
            else
            {
                return;
            }
        }
        else
        {
            return;
        }
        appPath = WebHelper.GetAppPath();
        if (!IsPostBack)
        {
            staff_id = userBase.GetStaff().STAFF_ID;
            title = wfbll.Base._WF_OBJ_NAME;
           ////////////
            WF_INFO cond = new WF_INFO();
            cond.STATUS = "1";
            List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), cond);

            List<WF_TYPE> lstType = BLLTable<WF_TYPE>.Factory(conn).Select(new WF_TYPE(), new WF_TYPE());
            for (int i = 0; i < lstType.Count; i++)
            {
                var lll = lst.Where(l => l._TYPE_ID == lstType[i]._TYPE_ID);
                litMenu.Text += "<li><a>" + lstType[i].TYPE_NAME + "</a><ul>";
                foreach (WF_INFO l in lll)
                {
                    litMenu.Text += "<li><a href='" + appPath + "WF/FORMList.aspx?mine=1&WFID=" + l.WFID + "' data=\"{key:'wf" + l.WFID + "mylist'}\">" + l.WFCNAME + "管理</a></li>";
                }
                litMenu.Text += "</ul></li>";
            }
            ////////////

            //如果没存在这个员工怎么处理，staff_id == 0

            ViewState["STAFF_ID"] = staff_id;
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//.WebCtrls
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;

            #endregion

            #region//数据初始化

            //txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_FORMBASE.Attribute.STATUS));
            #endregion

            BindList(1);

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
           // condObj = JsonServiceBase.FromJson<WF_FORMBASE>(hidCondition.Value);
        }
        BindList(aspPager.CurrentPageIndex);
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        //condObj = GetCondObj();
        BindList(1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);

        BindList(aspPager.CurrentPageIndex);
    }


    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            Literal litCols = (Literal)e.Item.FindControl("litCols");
            DataRowView dr = (DataRowView)e.Item.DataItem;
            string[]arr=StringHelper.GetStringArray(strCOLS,',');
            if (arr != null) {
                for (int i = 0; i < arr.Length; i++) {
                    string[] aaa = arr[i].Split(':');
                    if (aaa[0] != "")
                    {
                        litCols.Text += "<td>" + dr[aaa[0]] + "</td>";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
}
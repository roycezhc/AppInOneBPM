using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;

public partial class IndexNew :BaseAdminPage
{
    //protected string SiteName
    //{
    //    get
    //    {
    //        //string sname = MyConfigurationSettings.GetValue<string>("SiteName");
    //        //if (!string.IsNullOrEmpty(sname)) return sname; else return "App-In-One管理平台专业版";
            
    //    }
    //}
    public string sqlconstr = "";
    public string appPath = "", titleOrLogoHtml = "";
    protected string theme ="";
    string pid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        string title = "OA(协同办公)";

        if (Request["pid"] != null)
        {
            pid = Convert.ToString(Request["pid"]);
        }
        switch (pid)
        {
            case "1": title = "CRM(客户关系管理)"; break;
            case "2": title = "WeChat(微信)"; break;
            default: break;
        }

        appPath = WebHelper.GetAppPath();
        if (!IsPostBack) {
            SYS_THEME themeObj = BLLTable<SYS_THEME>.Factory(conn).GetRowData(SYS_THEME.Attribute.THEME_NAME, _ThemeName);
            if (theme != null && themeObj != null && !string.IsNullOrEmpty(themeObj.LOGIN_HTML))
            {
                theme = themeObj.THEME_NAME;
            }
            else
            {
                theme = BasePage._ThemeName;
            }
            if (theme.Equals("PMMS"))//logo图形
            {
                titleOrLogoHtml = "<div id=\"logo\" style=\"background:url({logoUrl}) 0 -10px;\"></div>"
                    .Replace("{logoUrl}", "Themes/" + theme + "/img/main_logo.jpg");
            }
            else
            {
                //titleOrLogoHtml = "<h1 title='企业级基础管理平台" + sqlconstr + "'>{litSiteName}</h1>"
                //    .Replace("{litSiteName}", themeObj.SYS_NAME); 
            }
            litName.Text = userBase.RealName == "" ? userBase.UserName : userBase.RealName;
            if (userBase.DeptName != "")
            {
                litName.Text = userBase.DeptName + "--" + litName.Text;
            }
            litNameExd.Text = userBase.UserName;
            ModuleHelper md = new ModuleHelper(conn);
            md.pid = pid;
            //litMenu.Text = md.ShowMemuHtml(userBase);

            if (pid.Equals("1"))
            {
                litMenu.Text += "<span class=\"insertimage sel\"><a href=\"index_crm.aspx\">政务通</a></span>";
                litMenu.Text += "<span class=\"insertimage\"><a href=\"index_wec.aspx\">生意通</a></span>";
            }
            else if (pid.Equals("2"))
            {
                litMenu.Text += "<span class=\"insertimage\"><a href=\"index_crm.aspx\">政务通</a></span>";
                litMenu.Text += "<span class=\"insertimage sel\"><a href=\"index_wec.aspx\">生意通</a></span>";
            }

           // litLeftNav.Text = md.ShowLeftNavHtml(userBase);
            //if (litMenu.Text != "") {
            //    litMenu.Text += "<li style='width:20px;min-width:20px;'></li>"; 
            //}

            //DEL START 添加权限管理 jin-shenjian 2013/11/26
            //sqlconstr = DoSqlHelper.Factory("conn").ConnectStr.Replace("sa", "*").Replace("chintchint", "*")
            //     .Replace("Password", "*").Replace("Persist Security Info=True;", "");

            ////WF_INFO cond = new WF_INFO();
            //WF_WFOBJECT cond = new WF_WFOBJECT();
            //cond.STATUS = 1;
            ////List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), cond);
            //List<WF_WFOBJECT> lst = BLLTable<WF_WFOBJECT>.Factory(conn).Select(new WF_WFOBJECT(), cond);

            //List<WF_TYPE> lstType = BLLTable<WF_TYPE>.Factory(conn).Select(new WF_TYPE(), new WF_TYPE());
            //for (int i = 0; i < lstType.Count; i++) {
            //    var lll = lst.Where(l => l._TYPE_ID == lstType[i]._TYPE_ID);
            //    litNewWF.Text += "<li><div><a>" + lstType[i].TYPE_NAME + "</a></div><ul>";
            //    LitMyWF.Text += "<li><div><a href='WF/FORMBaseList.aspx?mine=1&TypeID=" + lstType[i].TYPE_ID + "' data=\"{key:'wf_" + lstType[i].TYPE_ID + "'}\">" + lstType[i].TYPE_NAME + "</a></div><ul>";
            //    foreach (WF_WFOBJECT l in lll)
            //    {
            //        litNewWF.Text += "<li><a href='" + appPath + "WF/Edit.aspx?WFID=" + l.WF_OBJ_ID + "' data=\"{key:'wf" + l.WF_OBJ_ID + "new'}\">" + l.WF_OBJ_NAME + "</a></li>";

            //        LitMyWF.Text += "<li><a href='" + appPath + "WF/FORMList.aspx?mine=1&WFID=" + l.WF_OBJ_ID + "' data=\"{key:'wf" + l.WF_OBJ_ID + "mylist'}\">" + l.WF_OBJ_NAME + "管理</a></li>";
            //    }
            //    litNewWF.Text += "</ul></li>";
            //    LitMyWF.Text += "</ul></li>";
            //}
            //    //for (int i = 0; i < lst.Count; i++)
            //    //{
            //    //    //litWFS.Text += "<li><a href='" + WebHelper.GetAppPath() + "WF/FORMList.aspx?WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "list'}\">" + lst[i].WFCNAME + "管理</a></li>";
            //    //    litNewWF.Text += "<li><a href='" + appPath + "WF/Edit.aspx?WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "new'}\">" + lst[i].WFCNAME + "</a></li>";

            //    //    LitMyWF.Text += "<li><a href='" + appPath + "WF/FORMList.aspx?mine=1&WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "mylist'}\">" + lst[i].WFCNAME + "管理</a></li>";
            //    //}
            //litWFSP.Text += "<li><a href='" + appPath + "WF/FormBaseList.aspx?getType=0' data=\"{key:'dsh'}\">待审核</a></li>";
            //litWFSP.Text += "<li><a href='" + appPath + "WF/FormBaseList.aspx?getType=1' data=\"{key:'wtg'}\">我通过</a></li>";
            //litWFSP.Text += "<li><a href='" + appPath + "WF/FormBaseList.aspx?getType=2' data=\"{key:'wfj'}\">我否决</a></li>";
            //litWFSP.Text += "<li><a href='" + appPath + "WF/FormBaseList.aspx?getType=CK' data=\"{key:'wcl'}\">我处理</a></li>";

            //DEL END 添加权限管理 jin-shenjian 2013/11/26
        }
        this.DataBind();
    }
}
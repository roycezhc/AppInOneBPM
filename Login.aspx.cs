using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;

using AgileFrame.AppInOne.SYS;
using AgileFrame.Common;

public partial class _Login : BasePage
{
    protected string name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
       // EntityFactory.CheckEntityAndDB("WEC");
        if (Request["preUrl"] != null)
        {
            preUrl = Request["preUrl"]; 
        }
        //系统帐套
        if (MyConfigurationSettings.GetValue<string>("CloudSystem")=="1")
        {
            if (DataBase.Factory(BasePage.cloudConn).Exist("A8Account"))
            {
                A8Account val = new A8Account();
                List<A8Account> list1 = BLLTable<A8Account>.Factory(BasePage.cloudConn).Select(val);
                if (list1.Count > 0)
                {
                    HtmlSelect sel1 = new HtmlSelect();
                    sel1.Items.AddRange(FormHelper.GetListItem(A8Account.Attribute.ConnectStr, A8Account.Attribute.ConnectStr, A8Account.Attribute.FullName));
                    //sel1.InnerHtml;
                }
            }
        }
        //系统皮肤
        SYS_THEME theme = BLLTable<SYS_THEME>.Factory(conn).GetRowData(SYS_THEME.Attribute.THEME_NAME, _ThemeName);
        if (theme != null && !string.IsNullOrEmpty(theme.LOGIN_HTML))
        {
            Literal lll = new Literal();

            
            if (Request.Cookies["SYS_USER_USER_NAME"] != null)
            {
                name = Request.Cookies["SYS_USER_USER_NAME"].Value;
            }
            if (MyDebugger.IsAttached)//调试时加快速度
            {
                theme.LOGIN_HTML = theme.LOGIN_HTML.Replace("<%=name %>", "sys");
                theme.LOGIN_HTML = theme.LOGIN_HTML.Replace("name=\"password\"", "name=\"password\" value='123456'");
            }
            theme.LOGIN_HTML = theme.LOGIN_HTML.Replace("<%=name %>", name);

            //原模版有个脚本错误，屏蔽此问题
            //ie下密码为明文
            theme.LOGIN_HTML = theme.LOGIN_HTML.Replace("name=\"password\" type=\"text\"", "name=\"password\" type=\"password");

            lll.Text = theme.LOGIN_HTML;
            phLogin.Controls.Add(lll);

            string appPath = WebHelper.GetAppPath();
            HtmlLink css = new HtmlLink();
            css.Href = appPath + "Themes/" + _ThemeName + "/index.css";
            css.Attributes.Add("rel", "stylesheet");
            css.Attributes.Add("type", "text/css");
           
            this.Page.Header.Controls.Add(css);

            if (AgileFrame.Core.MyConfigurationSettings.GetValue("User_IsRunMode") == "Developer")
            {
                css = new HtmlLink();
                css.Href = appPath + "Themes/" + _ThemeName + "/dev_index.css";
                css.Attributes.Add("rel", "stylesheet");
                css.Attributes.Add("type", "text/css");
                this.Page.Header.Controls.Add(css);
            }
        }
        else
        {
            phLogin.Controls.Add(TemplateControl.LoadControl("~/Themes/" + _ThemeName + "/Login.ascx"));
        }

        //string strIdentity = User.Identity.Name;
        //if (!string.IsNullOrEmpty(strIdentity))
        //{
        //    SYS_USER user = new SYS_USER();
        //    user = BLLTable<SYS_USER>.Factory(conn).GetRowData(SYS_USER.Attribute.USER_NAME, strIdentity);
        //    if (user != null)
        //    {
        //        bool tostaff = PowerHelper.SetCurLoginUser(user);
        //        if (tostaff == true)
        //        {
        //            Response.Redirect("Index.aspx");
        //        }
        //        else
        //        {
        //            AgileFrame.Core.ScriptHelper.Alert(Page, "您的用户未与员工信息关联，请联系管理员处理。");
        //        }
        //    }
        //}
        //if (MyDebugger.IsAttached)
        //{
        //    Response.Redirect("LoginBack.aspx?username=sys&password=123456");
        //}
    }
}
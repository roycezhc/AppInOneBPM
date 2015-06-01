using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class SYS_webrepass : BaseAdminPage
{
    protected static string SiteName
    {
        get
        {
            string sname = MyConfigurationSettings.GetValue<string>("SiteName");
            if (!string.IsNullOrEmpty(sname)) return sname; else return "App-In-One管理平台专业版";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        txtName.Text = userBase.UserName;
        if (Request["out"] != null)
        {
            Session.RemoveAll();

        }
        if (PowerHelper.IsTimeOut())
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtPass.Value == "" || txtPassRe.Value == "" || txtPassOld.Value == "")
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "旧密码，新密码，重复输入密码都不能为空。");
            return;
        }

        if (txtPass.Value != txtPassRe.Value)
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "两次密码输入不一样！请重新输入。");
            return;
        }
        SYS_USER ucond = new SYS_USER();
        ucond.USER_NAME = txtName.Text;
        ucond.PASS = StringHelperExd.StringToMD5(txtPassOld.Value);
        SYS_USER val = BLLTable<SYS_USER>.Factory(conn).GetRowData(new SYS_USER(), ucond);

        if (val != null)
        {
            //PowerHelper.SetCurLoginUser(val);
            SYS_USER uuuPass = new SYS_USER();
            uuuPass.PASS = StringHelperExd.StringToMD5(txtPass.Value);
            BLLTable<SYS_USER>.Factory(conn).Update(SYS_USER.Attribute.USER_ID, val.USER_ID, SYS_USER.Attribute.PASS, StringHelperExd.StringToMD5(txtPass.Value));
            if (Request["ckPass"] == null)
            {
                if (Request["preUrl"] != null)
                {
                    Response.Redirect(Request["preUrl"]);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.Alert(Page, "修改成功！");
                    Response.Write("<script language='javascript'>window.close();</script>");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 'yes';}else{window.returnValue = 'yes';};window.close();", true);
            }
        }
        else
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "旧密码错误！请重新输入。");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("../Index.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core.EventAndDelegate;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.Common;
public partial class SuperMan : AgileFrame.AppInOne.Common.BasePage
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["out"] != null)
        {
            Session.RemoveAll();
        }
    }
    protected void btnSysInit_Click(object sender, EventArgs e)
    {
        if (password.Value == "" || username.Value == "")
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "授权号和密码不能为空。");
            return;
        }
        if(password.Value!="chintchint")
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "授权号和密码错误。");
            return;
        }
        SYS_USER ucond = new SYS_USER();
        ucond.USER_NAME = "sys";
        SYS_USER val = BLLTable<SYS_USER>.Factory(conn).GetRowData(new SYS_USER(), ucond);

        if (val == null || val.IsNull())
        {
            ucond.PASS = StringHelperExd.StringToMD5("123456");
            ucond.USER_TYPE = "1";
            ucond.USE_FLAG = "1";
            ucond._ADDTIME = DateTime.Now;
            ucond._EDITTIME = DateTime.Now;
            ucond._EMAIL = "sys@163.com";
            int ret1 = BLLTable<SYS_USER>.Factory(conn).Insert(ucond, SYS_USER.Attribute.USER_ID);
            AgileFrame.Core.ScriptHelper.Alert(this, "插入超级管理员sys账户成功");
        }
        else
        {
            ucond.PASS = StringHelperExd.StringToMD5("123456");
            ucond.USER_TYPE = "1";
            ucond.USE_FLAG = "1";
            ucond._ADDTIME = DateTime.Now;
            ucond._EDITTIME = DateTime.Now;
            ucond._EMAIL = "sys@163.com";
            int ret1 = BLLTable<SYS_USER>.Factory(conn).Update(ucond, SYS_USER.Attribute.USER_ID);
            AgileFrame.Core.ScriptHelper.Alert(this, "超级管理员sys账户已存在，并重新进行了密码初始化");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (password.Value == "" || username.Value == "")
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "用户名和密码不能为空。");
            return;
        }
        
        SYS_USER ucond = new SYS_USER();
        ucond.USER_NAME = username.Value;
        ucond.PASS = StringHelperExd.StringToMD5(password.Value); 
        SYS_USER val=BLLTable<SYS_USER>.Factory(conn).GetRowData(new SYS_USER(), ucond);

        if (val != null)
        {
            bool tostaff=PowerHelper.SetCurLoginUser(val);
            if (tostaff == true)
            {
                if (Request["ckPass"] == null)
                {
                    if (Request["preUrl"] != null)
                    {
                        Response.Redirect(Request["preUrl"]);
                    }
                    else
                    {
                        Response.Redirect("Index.aspx");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 'yes';}else{window.returnValue = 'yes';};window.close();", true);
                }
            }
            else {
                AgileFrame.Core.ScriptHelper.Alert(Page, "您的用户未与员工信息关联，请联系管理员处理。");
            }
        }
        else {
            AgileFrame.Core.ScriptHelper.Alert(Page, "用户名或密码错误！请重新输入。");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SYS_USER ucond = new SYS_USER();
        ucond.USER_NAME ="test";
        ucond.PASS = StringHelperExd.StringToMD5("123456");
        SYS_USER val = BLLTable<SYS_USER>.Factory(conn).GetRowData(new SYS_USER(), ucond);

        if (val != null)
        {
            PowerHelper.SetCurLoginUser(val);
            if (Request["ckPass"] == null)
            {
                if (Request["preUrl"] != null)
                {
                    Response.Redirect(Request["preUrl"]);
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 'yes';}else{window.returnValue = 'yes';};window.close();", true);
            }
        }
        else
        {
            AgileFrame.Core.ScriptHelper.Alert(Page, "用户名或密码错误！请重新输入。");
        }
    }
}
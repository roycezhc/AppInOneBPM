using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
/// <summary>
/// SupportAdminPage 的摘要说明
/// </summary>
public class SupportAdminPage : System.Web.UI.Page
{
    protected int pageSize = 7;
     protected Vp_admin currAdmin = null;
        //保存
	    
        protected void Page_Init(object sender, EventArgs e)
        {
            currAdmin = (Vp_admin)Session["currAdmin"];
            if (currAdmin == null)
            {
                Session["preUrl"] = Request.RawUrl;
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {
                string preUrl = Session["preUrl"] + "";
                //获取当前用户的

                if (!string.IsNullOrEmpty(preUrl))
                {
                    Session["preUrl"] = "";
                    Response.Redirect(preUrl);
                }
            }
       
        }
}
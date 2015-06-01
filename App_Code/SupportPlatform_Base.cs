using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.RFCLIB;
/// <summary>
/// SupportPlatform_Base 的摘要说明
/// 判断当前用户是否存在 不存在则返回登录界面
/// </summary>
public class SupportPlatform_Base :  System.Web.UI.Page
{
    protected Vp_users currUser = null;
    //保存
    protected  List<V_VENDOR_RECEIVER> receiverList = new  List<V_VENDOR_RECEIVER>();
	public SupportPlatform_Base()
	{

	}
    protected void Page_Init(object sender, EventArgs e)
    {
        currUser = (Vp_users)Session["currUser"];
        if (currUser == null)
        {
            Session["preUrl"] = Request.RawUrl;
            Response.Redirect("login.aspx");
        }
        else { 
            string preUrl=Session["preUrl"]+"";
            //获取当前用户的
           receiverList= GYSUtil.getReceiveList(currUser.Vendor);

            if (!string.IsNullOrEmpty(preUrl))
            {
                Session["preUrl"] = "";
                Response.Redirect(preUrl);
            }
        }
       
    }

   
}
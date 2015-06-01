using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using System.IO;
using System.Data.OleDb;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Data;

public partial class HR_CK_USERINFO_DoWork : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string doType = Request["dotype"];
        string userid = Server.UrlDecode(Request["userid"]);
        if (string.IsNullOrEmpty(doType) || string.IsNullOrEmpty(userid))
        {
            Response.Write("user id is null");
            Response.End();
            return;
        }

        if (doType == "doUpdateCKUSERINFOStff")
        {
            try
            {
                string stfid = Server.UrlDecode(Request["stfid"]);
                HR_CK_USERINFO user = new HR_CK_USERINFO();
                user._USERID = Convert.ToInt32(userid);
                if (!string.IsNullOrEmpty(stfid) && stfid != "-")
                {
                    HR_CK_USERINFO userCon = new HR_CK_USERINFO();
                    userCon.STAFF_ID = Convert.ToInt32(stfid);
                    if (BLLTable<HR_CK_USERINFO>.Exists(userCon))
                    {
                        Response.Write("该员工已有对应关系！");
                    }
                    else
                    {
                        user.STAFF_ID = Convert.ToInt32(stfid);
                        if (BLLTable<HR_CK_USERINFO>.Factory(conn).Update(user, HR_CK_USERINFO.Attribute.USERID) > 0)
                            Response.Write("操作成功");
                        else
                            Response.Write("操作失败");
                    }
                }
                else
                {
                    user.STAFF_ID = 0;
                    if (BLLTable<HR_CK_USERINFO>.Factory(conn).Update(user, HR_CK_USERINFO.Attribute.USERID) > 0)
                        Response.Write("操作成功");
                    else
                        Response.Write("操作失败");
                }
            }
            catch (Exception ex)
            {
                Response.Write("操作失败！\r\n原因如下：\r\n----------\r\n" + ex.Message);
                Response.End();
            }
            Response.End();
        }
        else
        {
            Response.Write("不支持的操作！");
            Response.End();
            return;
        }
        Response.End();
    }
}
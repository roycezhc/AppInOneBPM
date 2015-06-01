using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;//.WebCtrls;
public partial class CRM_Index : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //litUser.Text = "<a>" + userBase.RealName + "</a><span>(" + userBase.UserName + ")</span>";

        if (userBase.UserType.ToString() == EnumInfo.SYS_UserType.Common.ToString("d"))
        {

            li_AddNewCust.Visible = true;
        }
        else if (userBase.UserType.ToString() == EnumInfo.SYS_UserType.Admin.ToString("d"))
        {

            li_AddNewCust.Visible = true;
        }
        else if (userBase.UserType.ToString() == EnumInfo.SYS_UserType.SYS.ToString("d"))
        {

            li_AddNewCust.Visible = true;

        }
        else
        {
            //zlg chx userBase.UserType=0
            li_AddNewCust.Visible = false;
            
        }
        //Response.Write( userBase.GetStaff().SName);
        //Regex reg = new Regex(@"[a-zA-Z-\\\|_]");
        //Response.Write(reg.IsMatch("\\").ToString());
        if (!IsPostBack)
        {
            //liMyProjects.Text = ProjectHelper.GetMyWorkingProjectsLiHtml(5);
            //liMySubmits.Text = ProjectHelper.GetMySubmitProjectsLiHtml(5);               
        }
    }
}
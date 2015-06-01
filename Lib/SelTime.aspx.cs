using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
public partial class Lib_SelTime : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request["type"]))
            {
                string js1 = @"
            document.getElementById('SimpleDateTime1_selMinute').style.display = 'none';
";
                string js2 = @"
            document.getElementById('SimpleDateTime1_selHour').style.display = 'none';
";
                SimpleDateTime1.FindControl("selMinute").Visible = false;
                SimpleDateTime1.FindControl("selHour").Visible = false;

                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "type1", js1);
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "onload", js2);

            }
            if (!string.IsNullOrEmpty(Request["old"]))
            {
                SimpleDateTime1.DateTimeString = Request["old"];
            }
            else
            {
                SimpleDateTime1.DateTimeString = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        string datetime = SimpleDateTime1.DateTimeString;
        if (!string.IsNullOrEmpty(Request["type"]))
            datetime = SimpleDateTime1.DateTime.ToString("yyyy年MM月dd日");
        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "if (window.opener){window.opener.returnValue = '" + datetime + "';$(window.opener.me).val('" + datetime + "');}else{window.returnValue = '" + datetime + "';}window.close();", true);
        //function cb(){alert('aaa');$(me).val(result);}
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public static string GetIP()
    {
        string result = "";
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }

        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.UserHostAddress != null)
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
        }
        return result;
    }
}
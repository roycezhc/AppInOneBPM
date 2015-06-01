using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class SYS_Power_Power :BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "utf-8";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文
        Response.ContentType = "text/javascript";

        this.EnableViewState = false;
        //System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("alert('" + userBase .RealName+ "');");

        Response.Write(sb.ToString());
        Response.End();
    }
}
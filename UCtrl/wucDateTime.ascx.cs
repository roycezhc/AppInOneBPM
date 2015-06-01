using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UCtrl_wucDateTime : AgileFrame.AppInOne.Common.BaseUserControl
{
    /// <summary>
    /// 获取或设置时间字符串
    /// </summary>
    public string DateTimeString
    {
        get
        {
            return txtDate.Value + " " + txtHour.Value + ":" + txtMinute.Value + ":"+txtSecond.Value;
        }
        set
        {
            string[] arr = value.Split(' ');
            txtDate.Value = arr[0];
            string[] aaa = arr[1].Split(':');
            txtHour.Value = aaa[0];
            txtMinute.Value = aaa[1];
            txtSecond.Value=aaa[2];
        }
    }
    //获取或设置时间
    public DateTime DateTime
    {
        get
        {
            return DateTime.Parse(txtDate.Value + " " + txtHour.Value + ":" + txtMinute.Value + ":" + txtSecond.Value);
        }
        set
        {
            string[] arr = value.ToString("yyyy-MM-dd HH:mm:ss").Split(' ');
            txtDate.Value = arr[0];
            string[] aaa = arr[1].Split(':');
            txtHour.Value = aaa[0];
            txtMinute.Value = aaa[1];
            txtSecond.Value = aaa[2];
        }
    }

    public string dirPre = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int rootDepth = Request.Url.Segments.Length - 2;
            if (Request.ApplicationPath.Length > 1)
            {
                rootDepth -= 1;
            }
            for (int i = 0; i < rootDepth; i++)
            {
                dirPre += "../";
            }
            bool hadReg = false;
            //for (int i = 0; i < Page.Header.Controls.Count; i++)
            //{
            //    //Response.Write(Page.Header.Controls[i].GetType()+"<br/>");
            //    if (Page.Header.Controls[i].GetType() == typeof(HtmlLink))
            //    {
            //        HtmlLink cssLink = (HtmlLink)(Page.Header.Controls[i]);
            //        string linkStr = cssLink.Attributes["src"];
            //        if (linkStr.IndexOf("My97DP/WdatePicker.js") != -1)
            //        {
            //            hadReg = true;
            //            break;
            //        }
            //    }
            //}
            if (hadReg == false)
            {
                //LiteralControl lit = new LiteralControl();
                //lit.Text = "<script src=\"" + dirPre + "Lib/JSCal2/js/jscal2.js\" type=\"text/javascript\"></script><script src=\"" + dirPre + "Lib/JSCal2/js/lang/cn.js\" type=\"text/javascript\"></script>";
                
                //HtmlLink linkCss = new HtmlLink();
                //string linkCssUrlPre = "";
                //if (dirPre != "")
                //{
                //    linkCssUrlPre = dirPre.Substring(3);
                //}
                //linkCss.Attributes.Add("href", linkCssUrlPre + "Lib/JSCal2/css/win2k.css");
                //linkCss.Attributes.Add("rel", "stylesheet");
                //linkCss.Attributes.Add("type", "text/css");
               
                //Page.Header.Controls.Add(lit);
                //Page.Header.Controls.Add(linkCss);
                //LiteralControl lit = new LiteralControl();
                //lit.Text = "<script src=\"" + dirPre + "Lib/MyDP/seldate.js\" type=\"text/javascript\"></script>";

                //Page.Header.Controls.Add(lit);

                if (!Page.ClientScript.IsClientScriptIncludeRegistered("seldate"))
                {
                    Page.ClientScript.RegisterClientScriptInclude("seldate", dirPre + "Lib/MyDP/seldate.js");

                }
                
            }
            txtDate.Style.Add("background", "url(" + dirPre + "Lib/Img/date.gif) no-repeat right center");
        }
    }
}

using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class UCtrl_wucTimeInput : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected bool _needSecond = false;
    public bool NeedSecond
    {
        get { return _needSecond; }
        set
        {
            _needSecond = value;
        }
    }

    public int Hour
    {
        set { txtHour.Value = value.ToString(); }
        get
        {
            return int.Parse(txtHour.Value);
        }
    }

    public int Minute
    {
        set { txtMinute.Value = value.ToString(); }
        get
        {
            return int.Parse(txtMinute.Value);
        }
    }
    /// <summary>
    /// 获取或设置时间字符串
    /// </summary>
    public string TimeString
    {
        get
        {
            return txtHour.Value + ":" + txtMinute.Value + ":" + txtSecond.Value;
        }
        set
        {
            string[] aaa = value.Split(':');
            txtHour.Value = aaa[0];
            txtMinute.Value = aaa[1];
            txtSecond.Value = aaa[2];
        }
    }
    //获取或设置时间
    public DateTime DateTime
    {
        get
        {
            return DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd") + " " + txtHour.Value + ":" + txtMinute.Value + ":" + txtSecond.Value);
        }
        set
        {
            string[] aaa = value.ToString("HH:mm:ss").Split(':');
            txtHour.Value = aaa[0];
            txtMinute.Value = aaa[1];
            txtSecond.Value = aaa[2];
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClientScriptManager cm = Page.ClientScript;
            if (!cm.IsClientScriptBlockRegistered("wucTimeInput_ascx"))
            {
                cm.RegisterClientScriptBlock(this.GetType(), "wucTimeInput_ascx", @"<script type='text/javascript'>function isNum(el,min,max){
   if(el.value==''){return;}
    var re=/\d{1,2}/.test(el.value);
    if(re==true){
       var a=parseInt(el.value);
       if(!(a>=min&&a<=max)){
          alert('请输入'+min+'到'+max+'之间的值');
          el.value='00';el.focus();
       }
    }else{
        alert('请输入数字！');
        el.value='00';el.focus();
    }
}</script>");
            }
        }
    }
}

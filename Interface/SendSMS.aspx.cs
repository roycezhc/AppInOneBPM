using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.CMS;

public partial class Interface_SendSMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ChannelSerial channel =new ChannelSerial();
        //下发验证码
        try
        {
            string strMsg = "";
            strMsg = Common.GetReqStrValue("msg");
            SMS sms = new SMS();
            channel = new ChannelSerial();
            channel.PortName = "COM4";
            if (channel.Open() == false)
            {
                Response.Write("-101");
                Response.End();
            }
            sms.CenterNo = "8613800571500";
            sms.Channel = channel;
            sms.SendMessage(Common.GetReqStrValue("tel"), strMsg);
            channel.Close();
        }
        catch
        {
            channel.Close();
            Response.Write("-102");
            Response.End();
        }

        Response.Write("0");
        Response.End();
    }
}
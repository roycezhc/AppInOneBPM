using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Xml;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Web.Script.Serialization;
using AgileFrame.Core;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string echostr = "", signature = "", timestamp = "", nonce = "", ToUserName = "";

        echostr = GetReqStrValue("echostr");

        signature = GetReqStrValue("signature");

        timestamp = GetReqStrValue("timestamp");

        nonce = GetReqStrValue("nonce");

        ToUserName = GetReqStrValue("ToUserName");

        string sha = SHA1("123456" + timestamp + nonce);

        try
        {

            //收到的消息
            StreamReader reader = new StreamReader(Request.InputStream);
            String xmlData = reader.ReadToEnd();

            XmlDocument userData = new XmlDocument();
            userData.LoadXml(xmlData);

            XmlNode msgType = userData.SelectSingleNode("//MsgType");
            String msgType_str = msgType.InnerText;
            XmlNode toUserName_node = userData.SelectSingleNode("//ToUserName");
            String toUserName = toUserName_node.InnerText;
            XmlNode fromUserName_node = userData.SelectSingleNode("//FromUserName");
            String fromUserName = fromUserName_node.InnerText;
            WeiXinUtil wx = new WeiXinUtil(toUserName);
            //测试信息
            string file1 = Path.Combine(CorePath.ExecutingPath, "1.txt");
            StreamWriter sw = new StreamWriter(file1);
            sw.WriteLine("echostr=" + echostr);
            sw.WriteLine("signature=" + signature);
            sw.WriteLine("timestamp=" + timestamp);
            sw.WriteLine("nonce=" + nonce);
            sw.WriteLine("sha=" + sha);
            sw.WriteLine("url=" + Request.Url.ToString());
            sw.WriteLine("xmlData=" + xmlData);
            sw.WriteLine("txt=" + msgType_str);
            sw.Close();

            //用户发送文本信息
            if (msgType_str.Equals("text"))
            {

                wx.responseTextRequest(userData, fromUserName, toUserName, Response);
            }
            else if (msgType_str.Equals("image"))
            {
                wx.responseImageRequest(userData, fromUserName, toUserName, Response);
            }
            //事件
            else if (msgType_str.Equals("event"))
            {
                XmlNode event_node = userData.SelectSingleNode("//Event");
                String event_str = event_node.InnerText;
                if (event_str.Equals("subscribe"))
                {
                    wx.responseSubscribe(userData, fromUserName, toUserName, Response);
                }
                else if (event_str.Equals("unsubscribe"))//取消订阅消息，用于解绑用户，用户不在接受发送的消息
                {
                    //取消关注时 向表WEC_XX_MESSAGE存入取消关注信息
                    wx.saveUserMessage(fromUserName, 1, "", 0, toUserName);

                    wx.responseText("欢迎下次订阅", fromUserName, toUserName, Response);
                }
                else if (event_str.Equals("CLICK"))
                {

                    XmlNode key = userData.SelectSingleNode("//EventKey");
                    String key_str = key.InnerText;
                    WEC_REQUEST wec_request = wx.getWECREQUEST(key_str);
                    //StreamWriter sw2 = new StreamWriter("c:\\3.txt");
                    ////sw2.WriteLine("aaaa=" + key_str + "   " );
                    //sw2.WriteLine("aaaa=" + wec_request.KIND + "   " + wec_request);
                    //sw2.Close();

                    if (wec_request != null)
                    {

                        wx.responseByWecRequest(wec_request, fromUserName, toUserName, Response);
                    }
                }
                else if (event_str.Equals("LOCATION"))
                {

                    XmlNode latitude = userData.SelectSingleNode("//Latitude");
                    String latitude_str = latitude.InnerText;
                    XmlNode longitude = userData.SelectSingleNode("//Longitude");
                    String longitude_str = longitude.InnerText;
                    XmlNode precision = userData.SelectSingleNode("//Precision");
                    String precision_str = precision.InnerText;
                    LocationUtil.setLocation(fromUserName, "{Latitude:\"" + latitude_str + "\",Longitude:\"" + longitude_str + "\",Precision:\"" + precision_str + "\"}");
                }
                else if (event_str.Equals("SCAN"))
                {
                    XmlNode key = userData.SelectSingleNode("//EventKey");
                    string channel_id = key.InnerText;
                    wx.saveUserMessage(fromUserName, 2, "", Convert.ToInt32(channel_id), toUserName);
                }
            }
            else if (msgType_str.Equals("location"))
            {
                wx.saveLocationMessage(userData, fromUserName);
            }

        }
        catch (Exception ex)
        {
            string file1 = Path.Combine(CorePath.ExecutingPath, "2.txt");
            StreamWriter sw = new StreamWriter(file1);
            sw.WriteLine("ex=" + ex.Message);
            sw.Close();
            Response.Write(echostr);
            return;
        }
    }
   

    /// <summary>
    /// 
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    private static string SHA1(string text)
    {
        byte[] cleanBytes = Encoding.Default.GetBytes(text);
        byte[] hashedBytes = System.Security.Cryptography.SHA1.Create().ComputeHash(cleanBytes);
        return BitConverter.ToString(hashedBytes).Replace("-", "");
    }
    /// <summary>
    /// 获取string Request对象
    /// </summary>
    /// <param name="strKey"></param>
    /// <returns></returns>
    public static string GetReqStrValue(string strKey)
    {
        string GetReqValue = "";
        GetReqValue = System.Web.HttpContext.Current.Request.QueryString[strKey];
        if (GetReqValue == null || GetReqValue == "")
        {
            GetReqValue = System.Web.HttpContext.Current.Request.Form[strKey];
        }
        return UrnHtml(GetReqValue);
    }
    /// <summary>
    /// 过滤特殊字符
    /// </summary>
    /// <param name="strHtml"></param>
    /// <returns></returns>
    public static string UrnHtml(string strHtml)
    {
        if (strHtml == null)
        {
            return "";
        }
        else
        {
            strHtml = strHtml.Trim();
            /*
            string[] aryReg ={ "'", "<", ">", "%", "\"\"", ",", ".", ">=", "=<", "-", "_", ";", "||", "[", "]", "&", "/", "-", "|", " ", };
            for (int i = 0; i < aryReg.Length; i++)
            {
                strHtml = strHtml.Replace(aryReg[i], string.Empty);
            }
           */
            return strHtml;
        }
    }
}
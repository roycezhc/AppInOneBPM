using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Web.Script.Serialization;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.IO;
using System.Xml;
using System.Web.UI;
using AgileFrame.Orm.PersistenceLayer.Model;
/// <summary>
///WeiXinUtil 的摘要说明
/// </summary>
public class WeiXinUtil
{
    static Dictionary<string, WeiXinUtil> WeiXinUtilDic = new Dictionary<string, WeiXinUtil>();
    
    public static WeiXinUtil Factory(string APPID, string APPSECRET)
    {
        return Factory(APPID + "_" + APPSECRET);
    }
    public static WeiXinUtil Factory(Page page)
    {
        string APPID_APPSECRET = Convert.ToString(page.Session["APPID_APPSECRET"]);
        if (!string.IsNullOrEmpty(APPID_APPSECRET)
            && APPID_APPSECRET.Length >= "wx69c300b3e390be5b_3c06a3f6eb8a562b278583dff8b9da1c".Length)
        {
            return Factory(APPID_APPSECRET);
        }
        else
            return Factory(APPID_Ceshi + "_" + APPSECRET_Ceshi);
    }
    public static WeiXinUtil Factory(string APPID_APPSECRET)
    {
        WeiXinUtil wx;
        if (!WeiXinUtilDic.TryGetValue(APPID_APPSECRET, out wx))
        {
            string APPID = null;
            string APPSECRET = null;
            if (APPID_APPSECRET.Contains("_"))
            {
                string[] strs1 = APPID_APPSECRET.Split('_');
                APPID = strs1[0];
                APPSECRET = strs1[1];
                wx = new WeiXinUtil(APPID, APPSECRET);
            }
        }
        return wx;
    }    
    private static string APPID_Ceshi = "wx8dead4f2f46ea61b";//wx8dead4f2f46ea61b 乐成街道 //wx69c300b3e390be5b 测试账户
    private static string APPSECRET_Ceshi = "462fd0c5ade529968fb557617db93a9d";//462fd0c5ade529968fb557617db93a9d//3c06a3f6eb8a562b278583dff8b9da1c
    //gh_8e78e17c1035
    //默认使用测试账户
    private string APPID = "wx8dead4f2f46ea61b";//wx8dead4f2f46ea61b 乐成街道 //wx69c300b3e390be5b 测试账户
    private string APPSECRET = "462fd0c5ade529968fb557617db93a9d";//462fd0c5ade529968fb557617db93a9d//3c06a3f6eb8a562b278583dff8b9da1c
	private  WEC_PUBLICLIST wx_publiclist;
    public WeiXinUtil()
	{
		
	}
    public WeiXinUtil(string sourceId)
    {
        WEC_PUBLICLIST conf = new WEC_PUBLICLIST();
        conf.PLC_SOURCEID = sourceId;
        this.wx_publiclist = BLLTable<WEC_PUBLICLIST>.GetRowData(new WEC_PUBLICLIST(),conf);
    }
    public WeiXinUtil(string APPID, string APPSECRET)
    {
        this.APPID = APPID;
        this.APPSECRET = APPSECRET;
    }
    /// <summary>
    /// 当用户发送信息或者订阅时保存用户信息
    /// ygh 2014/4/24
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="type"></param>
    public void saveUser(string openid,int type,int channelid,string toUserName) {
        string access_token = HttpUtil.getAccessToken(this.APPID, this.APPSECRET);
        string user_info = HttpUtil.httpForm("", "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + access_token + "&openid=" + openid + "&lang=zh_CN", "GET");
        JavaScriptSerializer jss= new JavaScriptSerializer();
        Dictionary<string, object> map = (Dictionary<string, object>)jss.DeserializeObject(user_info);
        WEC_U_USER user = new WEC_U_USER();
        WEC_PUBLICLIST conf = new WEC_PUBLICLIST();
        conf.PLC_SOURCEID = toUserName;
        WEC_PUBLICLIST publiclist= BLLTable<WEC_PUBLICLIST>.GetRowData(new WEC_PUBLICLIST(),conf);
        user.AID = publiclist.AID;//用户所订阅公众号ID
        user.OPENID = openid;
        //如果公众号没有访问用户信息的借口的权限则报错，则不包含以下键值
        if(map.ContainsKey("nickname")){
            user.USERNAME = (string)map["nickname"];
        
            int sex=(int)map["sex"];
            if(sex==0){
                user.SEX = "未知";
            }else if(sex==1){
                user.SEX = "男";
            }else if(sex==2){
                user.SEX = "女";
            }
            user.ADDTIME = GetTime(map["subscribe_time"]+"");
        }
        if (!isExist(user))
        {
            BLLTable<WEC_U_USER>.Insert(user, WEC_U_USER.Attribute.ID);
        }
        else {
            BLLTable<WEC_U_USER>.Update(user, WEC_U_USER.Attribute.ID);
        }
        saveUserMessage(openid,type,"",channelid,toUserName);
    }

    /// <summary>
    /// 时间戳转为C#格式时间
    /// ygh 2014/3/12
    /// </summary>
    /// <param name="timeStamp">Unix时间戳格式</param>
    /// <returns>C#格式时间</returns>
    public DateTime GetTime(string timeStamp)
    {
        DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        long lTime = long.Parse(timeStamp + "0000000");
        TimeSpan toNow = new TimeSpan(lTime);
        return dtStart.Add(toNow);
    }
    /// <summary>
    /// 根据openid判断 WEC_U_USER是否已存在
    /// </summary>
    /// <param name="user"></param>
    /// <returns></returns>
    public Boolean isExist(WEC_U_USER user) {

        WEC_U_USER conf = new WEC_U_USER();
        conf.AID = wx_publiclist.AID;
        conf.OPENID = user.OPENID;
        WEC_U_USER u = BLLTable<WEC_U_USER>.GetRowData(conf);
        if(u!=null){
            return true;
        }
        return false;
    }
    /// <summary>
    /// 保存用户信息
    /// ygh 2014/3/16
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="type"></param>
    /// <param name="content"></param>
    /// <param name="channelid"></param>
    public void saveUserMessage(string openid,int type,string content,int channelid,string toUserName) {
        string access_token = HttpUtil.getAccessToken(this.APPID, this.APPSECRET);
        string user_info = HttpUtil.httpForm("", "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + access_token + "&openid=" + openid + "&lang=zh_CN", "GET");
       
        JavaScriptSerializer jss = new JavaScriptSerializer();
        Dictionary<string, object> map = (Dictionary<string, object>)jss.DeserializeObject(user_info);
        WEC_XX_MESSAGE message = new WEC_XX_MESSAGE();

        message.OPENID = openid;
       
        message.TYPE = type;
        WEC_PUBLICLIST conf = new WEC_PUBLICLIST();
        conf.PLC_SOURCEID = toUserName;
        WEC_PUBLICLIST publiclist= BLLTable<WEC_PUBLICLIST>.GetRowData(new WEC_PUBLICLIST(),conf);
        message.AID = publiclist.AID;//公众号编号，
        message.ADDTIME = DateTime.Now;
      
        if(type!=1){
            if (map.ContainsKey("province"))
            {
                message.PROVINCE = (string)map["province"];
                message.CITY = (string)map["city"];
                message.COUNTRY = (string)map["country"];
                message.HEADIMGURL = (string)map["headimgurl"];
                message.CHANNELID = channelid;
            }
        }
        if(type==2||type==3){
          
            message.S_CONTENT = content;
            WEC_WZ_LOCATION conf2= new WEC_WZ_LOCATION();
            conf2.OPENID = openid;
            conf2.af_WhereSQL = " ORDER BY ADDTIME";
            WEC_WZ_LOCATION location=BLLTable<WEC_WZ_LOCATION>.GetRowData(new WEC_WZ_LOCATION(),conf2);
           if(location!=null){
                message.LATITUDE = location.LATITUDE;
                message.LONGITUDE = location.LONGITUDE;
                message.PRECISION = location.PRECISION;
                message.CHANNELID = channelid;
           }
        }
        BLLTable<WEC_XX_MESSAGE>.Insert(message, WEC_XX_MESSAGE.Attribute.ID);
    }
    /// <summary>
    /// 更新微信服务器上的多媒体资源文件
    /// ygh 2014/3/17
    /// </summary>
    /// <param name="media"></param>
    /// <param name="conf"></param>
    /// <param name="type"></param>
    public void updateMedia(WEC_REQUEST_MEDIA media,WEC_REQUEST_MEDIA conf,string type) {
        string filepath = media.FILENAME;
        string content = HttpUtil.uploadFile(filepath, HttpUtil.getAccessToken(this.APPID, this.APPSECRET), type);
        StreamWriter sw = new StreamWriter(@"c:\4.txt");
        sw.Write("content:"+content);
        JavaScriptSerializer a = new JavaScriptSerializer();
        Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(content);
        string media_id = (string)o["media_id"];
        WEC_REQUEST_MEDIA update = new WEC_REQUEST_MEDIA();
        update.MEIDAID = media_id;
        BLLTable<WEC_REQUEST_MEDIA>.Update(update, conf);
    }
 
    /// <summary>
    /// 通过KIND得到WEC_REQUEST
    /// </summary>
    /// <param name="kind"></param>
    /// <returns></returns>
    public WEC_REQUEST getWecRequestByKind(int kind)
    {
        WEC_REQUEST conf = new WEC_REQUEST();
        conf.KIND = kind;
        conf.STATUS = 0;
        conf.AID = wx_publiclist.AID;
        
        return BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(), conf);
    }
   
    /// <summary>
    /// 得到默认回复消息
    /// ygh 2014/3/10
    /// </summary>
    /// <returns></returns>
    public WEC_REQUEST getDefaultWecRequest()
    {
        WEC_REQUEST wec_request = getWecRequestByKind(-1);
      
        if (wec_request == null)
        {
            return null;
        }
        string key_world = wec_request.KEYWORD;
        WEC_REQUEST conf = new WEC_REQUEST();
        conf.KEYWORD = key_world;
        conf.af_WhereSQL = "AND KIND <>-1";
        conf.AID = wx_publiclist.AID;
        wec_request = BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(), conf);
        return wec_request;

    }
    /// <summary>
    /// ygh 2014/4/29
    /// 根据时间选择客服离线消息(如果当前有多个匹配，按时间排序，选择最近一个)
    /// 回复客服离线消息
    /// </summary>
    public void responseCSExitMsg(string fromUserName, string toUserName, HttpResponse Response)
    {
        WEC_CS_DEFAULTRESPONSE conf = new WEC_CS_DEFAULTRESPONSE();
        conf.af_WhereSQL = " AND STARTTIME<GETDATE() AND ENDTIME>GETDATE()";
        WEC_CS_DEFAULTRESPONSE cs_response= BLLTable<WEC_CS_DEFAULTRESPONSE>.GetRowData(new WEC_CS_DEFAULTRESPONSE(),conf);
        responseText(cs_response.MSGCONTENT, fromUserName, toUserName, Response);
    }
    /// <summary>
    /// 获取WEC_REQUEST对象
    /// 找不到或找到但是状态为禁止，都返回null
    /// //ygh 2014/3/7
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public WEC_REQUEST getWECREQUEST(string content_str)
    {
        WEC_REQUEST cond = new WEC_REQUEST();
        cond.KEYWORD = content_str;
        cond.OrderBy("TID desc");
        WEC_REQUEST objVal = BLLTable<WEC_REQUEST>.GetRowData(cond);
      
        if (objVal == null || objVal.STATUS == 1)
        {
            WEC_REQUEST cond1 = new WEC_REQUEST();
            cond1.MATCH_TYPE = 1;//1为包含匹配
            cond1.af_WhereSQL = "AND CHARINDEX(KEYWORD,'" + content_str + "') >0";
            cond1.OrderBy("TID desc");
            WEC_REQUEST objVal1 = BLLTable<WEC_REQUEST>.GetRowData(cond1);
            if (objVal1 == null || objVal1.STATUS == 1)
            {
                return null;
            }
            return objVal1;
        }
        //List<WEC_REQUEST> lst = BLLTable<WEC_REQUEST>.Select(new WEC_REQUEST(), cond);
        //cond1.Like(WEC_REQUEST.Attribute.KEYWORD, content_str);
        return objVal;
    }
    /// <summary>
    /// 根据KIND不同进行相对应处理
    /// ygh 2014/3/17
    /// </summary>
    /// <param name="wec_request"></param>
    /// <param name="fromUserName"></param>
    /// <param name="toUserName"></param>
    /// <param name="Response"></param>
    public void responseByWecRequest(WEC_REQUEST wec_request, string fromUserName, string toUserName, HttpResponse Response)
    {
        //不为0,则为禁止，返回null


        if (wec_request.STATUS != 0)
        {
            return;
        }
        //文本回复
        if (wec_request.KIND == 2)
        {
            responseText(wec_request.MEMO, fromUserName, toUserName, Response);
        }
        //图文回复
        else if (wec_request.KIND == 3)
        {
            responseTextANDImage(wec_request, fromUserName, toUserName, Response);
        }

        //图片回复
        else if (wec_request.KIND == 5)
        {
            responseMediaFile(wec_request, fromUserName, toUserName, Response, "image");
        }
        //语音回复
        else if (wec_request.KIND == 6)
        {
            responseMediaFile(wec_request, fromUserName, toUserName, Response, "voice");
        }
        //视频回复
        else if (wec_request.KIND == 7)
        {
            responseMediaFile(wec_request, fromUserName, toUserName, Response, "video");
        }
         //活动回复
        else if (wec_request.KIND==8)
        {
            responseActivity(wec_request, fromUserName, toUserName, Response);
        }
        //关注时文本回复
        else if (wec_request.KIND == 0)
        {
            responseText(wec_request.MEMO, fromUserName, toUserName, Response);
        }
        //关注时图文回复
        else if (wec_request.KIND == 1)
        {
            responseTextANDImage(wec_request, fromUserName, toUserName, Response);
        }
    }

    /// <summary>
    /// 回复多媒体文件
    /// 2014/3/14 ygh
    /// </summary>
    /// <param name="wec_request"></param>
    /// <param name="toUserName"></param>
    /// <param name="fromUserName"></param>
    /// <param name="Response"></param>
    public void responseMediaFile(WEC_REQUEST wec_request, string toUserName, string fromUserName, HttpResponse Response, string type)
    {
        
        WEC_REQUEST_MEDIA conf = new WEC_REQUEST_MEDIA();
        conf.TID = wec_request.TID;
        conf.OrderBy("ADDTIME desc");
        WEC_REQUEST_MEDIA media = BLLTable<WEC_REQUEST_MEDIA>.GetRowData(new WEC_REQUEST_MEDIA(), conf);
        if (media == null) { return; }
        string mediaid = media.MEIDAID;
        DateTime addtime = media.ADDTIME;
        if (addtime.AddDays(3) < DateTime.Now)
        {
            //当时间超过3天 微信服务器自动删除用户上传的多媒体文件，所以3天后 用户再次访问的时候，我们需要再次上传
            updateMedia(media, conf, type);
        }

        string response_content = "<xml>" +
                  "<ToUserName><![CDATA[" + toUserName + "]]></ToUserName>" +
                  "<FromUserName><![CDATA[" + fromUserName + "]]></FromUserName>" +
                  "<CreateTime>" + DateTime.Now.Millisecond + "</CreateTime>" +
                  "<MsgType><![CDATA[" + type + "]]></MsgType>" +
                   "<Image>" +
                   "<MediaId><![CDATA[" + mediaid + "]]></MediaId>" +
                    "</Image>" +
                  "</xml>";
    
        Response.Write(response_content);

    }
    /// <summary>
    /// 回复图文消息
    /// //ygh 2014/3/10
    /// </summary>
    /// <param name="wec_request"></param>
    /// <param name="fromUserName"></param>
    /// <param name="toUserName"></param>
    /// <param name="Response"></param>
    public void responseTextANDImage(WEC_REQUEST wec_request, string toUserName, string fromUserName, HttpResponse Response)
    {
        WEC_REQUEST_DETAIL conf = new WEC_REQUEST_DETAIL();
        conf.TID = wec_request.TID;
        List<WEC_REQUEST_DETAIL> listObj = BLLTable<WEC_REQUEST_DETAIL>.Select(new WEC_REQUEST_DETAIL(), conf);
        string response_content = "<xml>" +
                                        "<ToUserName><![CDATA[" + toUserName + "]]></ToUserName>" +
                                        "<FromUserName><![CDATA[" + fromUserName + "]]></FromUserName>" +
                                        "<CreateTime>12345678</CreateTime>" +
                                        "<MsgType><![CDATA[news]]></MsgType>" +
                                        "<ArticleCount>" + listObj.Count + "</ArticleCount>" +
                                        "<Articles>";
        foreach (WEC_REQUEST_DETAIL detail in listObj)
        {
            //string picurl = detail.PICURL;
            //picurl = picurl.Substring(picurl.IndexOf('/')+1);
            //picurl = picurl.Substring(picurl.IndexOf('/') + 1);
            response_content += "<item>" +
                                        "<Title><![CDATA[" + detail.TITLE + "]]></Title> " +
                                        "<Description><![CDATA["+detail.NOTE+"]]></Description>" +
                                        "<PicUrl><![CDATA[http://115.29.224.227/"+ detail.PICURL + "]]></PicUrl>" +
                                        "<Url><![CDATA["+detail.URL+"]]></Url>" +
                                  "</item>";


        }
        response_content += "</Articles>" +
                                 "</xml>";

        StreamWriter sw2 = new StreamWriter("c:\\4.txt");
        sw2.WriteLine("response_content=" + response_content);
        sw2.Close();
        Response.Write(response_content);

    }
    /// <summary>
    /// 当回复类型为文本类型时调用
    /// //ygh 2014/3/7
    /// </summary>
    /// <param name="medo"></param>
    public void responseText(string medo, string toUserName, string fromUserName, HttpResponse Response)
    {
        
        string response_content = "<xml>" +
                    "<ToUserName><![CDATA[" + toUserName + "]]></ToUserName>" +
                    "<FromUserName><![CDATA[" + fromUserName + "]]></FromUserName>" +
                    "<CreateTime>" + DateTime.Now.Millisecond + "</CreateTime>" +
                    "<MsgType><![CDATA[text]]></MsgType>" +
                    "<Content><![CDATA[" + medo + "]]></Content>" +
                    "</xml>";
        StreamWriter sw = new StreamWriter(@"c:\a.txt");
        sw.Write(response_content);
        sw.Close();
        Response.Write(response_content);
    }
    /// <summary>
    /// 回复活动图文信息
    /// ygh 2014/4/1
    /// </summary>
    /// <param name="medo"></param>
    /// <param name="toUserName"></param>
    /// <param name="fromUserName"></param>
    /// <param name="Response"></param>
    public void responseActivity(WEC_REQUEST wec_request, string toUserName, string fromUserName, HttpResponse Response)
    {

        V_WEC_ACTIVITY conf = new V_WEC_ACTIVITY();
        conf.R_ID = wec_request.TID;
        conf.OrderBy("R_ID desc");
        V_WEC_ACTIVITY activity = BLLTable<V_WEC_ACTIVITY>.GetRowData(new V_WEC_ACTIVITY(),conf);
        string start_end_time = activity.TIME;
        string[] strs=start_end_time.Split('-');
        string now = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
        now=now.Replace('-','/');

        if(string.Compare(now, strs[0])<0){
            return;
        }
        string response_content = "<xml>" +
                                        "<ToUserName><![CDATA[" + toUserName + "]]></ToUserName>" +
                                        "<FromUserName><![CDATA[" + fromUserName + "]]></FromUserName>" +
                                        "<CreateTime>12345678</CreateTime>" +
                                        "<MsgType><![CDATA[news]]></MsgType>" +
                                        "<ArticleCount>1</ArticleCount>" +
                                        "<Articles>";
        if (string.Compare(now, strs[0]) > 0 && string.Compare(now, strs[1]) < 0)
        {
            response_content += "<item>" +
                                            "<Title><![CDATA[" + activity.NAME + "]]></Title> " +
                                            "<Description><![CDATA[" + activity.DESCRIPTION + "]]></Description>" +
                                            "<PicUrl><![CDATA[http://115.29.224.227" + activity.START_PICURL + "]]></PicUrl>";

           
            if (activity.KIND == 1)
            {
                response_content += "<Url><![CDATA[http://115.29.224.227/WECAdmin/ReCall/WEC_ACTIVITY/guaguaka.aspx?a_id=" + activity.ID + "&open_id=" + toUserName + "]]></Url>";
            }
            else if(activity.KIND==2){
                response_content += "<Url><![CDATA[http://115.29.224.227/WECAdmin/ReCall/WEC_ACTIVITY/dazhuanpan.aspx?a_id=" + activity.ID + "&open_id=" + toUserName + "]]></Url>";
            }else if(activity.KIND==0){
                response_content += "<Url><![CDATA[http://115.29.224.227/WECAdmin/ReCall/WEC_ACTIVITY/youhuiquan.aspx?a_id=" + activity.ID + "&open_id=" + toUserName + "]]></Url>";
            }
                  response_content += "</item>";
        }else if(string.Compare(now, strs[1]) > 0){
             response_content += "<item>" +
                                            "<Title><![CDATA[" + activity.END_THEME + "]]></Title> " +
                                            "<Description><![CDATA[" + activity.END_INSTRUCTION + "]]></Description>" +
                                            "<PicUrl><![CDATA[http://115.29.224.227" + activity.END_PICURL + "]]></PicUrl>" +
                                            "<Url><![CDATA[" + activity.TYPE_VALUE + "]]></Url>" +
                                 "</item>";
        }

      
        response_content += "</Articles>" +
                                 "</xml>";

        StreamWriter sw2 = new StreamWriter("c:\\4.txt");
        sw2.WriteLine("kind=" + activity.KIND);
        sw2.WriteLine(now);
        sw2.Close();
        Response.Write(response_content);

    }
    /// <summary>
    /// 得到订阅时返回文本
    /// ygh 2014/3/10
    /// 
    /// </summary>
    /// <returns></returns>
    public string getSubscribeText()
    {
        WEC_REQUEST cond = new WEC_REQUEST();
        cond.KIND = 0;
        WEC_REQUEST objVal = BLLTable<WEC_REQUEST>.GetRowData(cond);
        return objVal.MEMO;
    }

    /// <summary>
    /// 回复用户订阅事件
    /// ygh 2014/3/17
    /// </summary>
    /// <param name="userData"></param>
    /// <param name="fromUserName"></param>
    /// <param name="toUserName"></param>
    /// <param name="Response"></param>
    public void responseSubscribe(XmlDocument userData, string fromUserName, string toUserName, HttpResponse Response)
    {
        //当用户订阅时，往WEC_U_USER添加用户
        XmlNode ticket = userData.SelectSingleNode("//Ticket");
        if (ticket != null && !ticket.Equals(""))
        {
            XmlNode event_key = userData.SelectSingleNode("//EventKey");

            saveUser(fromUserName, 0, Convert.ToInt32(event_key.InnerText.Substring(event_key.InnerText.IndexOf("_") + 1)),toUserName);
        }
        else
        {
            saveUser(fromUserName, 0, 0,toUserName);
        }

        //订阅发送，欢迎订阅消息
        WEC_REQUEST wec_request = getWecRequestByKind(-1);
        if (wec_request == null) { return; }
        string type = wec_request.MEMO;
        WEC_REQUEST conf = new WEC_REQUEST();
        conf.TID = Convert.ToDecimal(type);
        WEC_REQUEST wec_request2 = BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(), conf);
        if(wec_request2!=null){
            responseByWecRequest(wec_request2, fromUserName, toUserName, Response);
        }
    }
    /// <summary>
    /// 回复用户的文本信息
    /// ygh 2014/3/17
    /// </summary>
    /// <param name="userData"></param>
    /// <param name="fromUserName"></param>
    /// <param name="toUserName"></param>
    /// <param name="Response"></param>
    public void responseTextRequest(XmlDocument userData, string fromUserName, string toUserName, HttpResponse Response)
    {
        XmlNode content = userData.SelectSingleNode("//Content");
        string content_str = content.InnerText;
       
        //不管用户发送的是否为关键字，先将记录保存到数据库
       
        saveUserMessage(fromUserName, 2, content_str, 0,toUserName);
    
        WEC_REQUEST wec_request = getWECREQUEST(content_str);
        
        if (wec_request != null)
        {
            responseByWecRequest(wec_request, fromUserName, toUserName, Response);
        }
        //未匹配到关键词，返回默认(未匹配返回客服离线消息)ygh 2014/4/29
        else
        {
            responseCSExitMsg(fromUserName,toUserName,Response);
            //WEC_REQUEST wec_request2 = getDefaultWecRequest();
           
            //判断默认值的关键字对于的WEC_REQUEST 是否存在
            //if (wec_request2 != null)
            //{
            //    responseByWecRequest(wec_request2, fromUserName, toUserName, Response);
            //}

        }
    }

    /// <summary>
    /// 回复用户图片信息
    /// 先保存图片
    /// ygh 2014/3/26
    /// </summary>
    /// <param name="userData"></param>
    /// <param name="fromUserName"></param>
    /// <param name="toUserName"></param>
    /// <param name="Response"></param>
    public void responseImageRequest(XmlDocument userData, string fromUserName, string toUserName, HttpResponse Response)
    {
        XmlNode picurl = userData.SelectSingleNode("//PicUrl");
        string picurl_str = picurl.InnerText;
        XmlNode mediaid = userData.SelectSingleNode("//MediaId");
        string mediaid_str = mediaid.InnerText;
        string content_str = picurl_str ;
        saveUserMessage(fromUserName, 3, content_str, 0,toUserName);
    }
    /// <summary>
    /// 保存用户发送的地址信息
    /// ygh 2014/3/17
    /// </summary>
    /// <param name="userData"></param>
    /// <param name="fromUserName"></param>
    public void saveLocationMessage(XmlDocument userData,string fromUserName)
    {
        XmlNode latitude = userData.SelectSingleNode("//Location_X");
        string latitude_str = latitude.InnerText;
        XmlNode longitude = userData.SelectSingleNode("//Location_Y");
        string longitude_str = longitude.InnerText;
        XmlNode precision = userData.SelectSingleNode("//Scale");
        string precision_str = precision.InnerText;
        XmlNode label = userData.SelectSingleNode("//Label");
        string label_str = label.InnerText;
        //label_str=label_str.Replace(' ','|');
        //label_str=HttpUtility.UrlEncode(label_str);

        //StreamWriter sw2 = new StreamWriter("c:\\3.txt");
        ////sw2.WriteLine("aaaa=" + key_str + "   " );
        //sw2.WriteLine("{Latitude:\"" + latitude_str + "\",Longitude:\"" + longitude_str + "\",Precision:\"" + precision_str + "\",Label:\"" + label_str + "\"}");
        //sw2.Close();
        LocationUtil.setAddress(fromUserName, "{Latitude:\"" + latitude_str + "\",Longitude:\"" + longitude_str + "\",Precision:\"" + precision_str + "\",Label:\"" + label_str + "\"}");
    }

    public string getImageTicket(string json,string url) {
        string content=HttpUtil.httpForm(json,url,"POST");
        JavaScriptSerializer jss = new JavaScriptSerializer();
        Dictionary<string, object> map = (Dictionary<string, object>)jss.DeserializeObject(content);
        if(map.ContainsKey("ticket")){
            return (string)map["ticket"];
        }
        return "";
    }
    public bool getCode(string path,int scene_id) {
      
        string ticket=getImageTicket("{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": "+scene_id+"}}}", "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + HttpUtil.getAccessToken(APPID, APPSECRET));
       if(!ticket.Equals("")){
           HttpUtil.getImageStream("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket, path);
       }
        //FileStream fs = new FileStream(path, FileMode.Create);
        //byte[] buf=new byte[1024*4];
        //int count = 0;
        //while ((count = stream.Read(buf, 0, buf.Length)) != -1)
        //{
        //    fs.Write(buf,0,count);
        //}
        return true;
    }

    /// <summary>
    /// 客服人工回复用户消息（文本）
    /// ygh 2014/3/26
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="content"></param>
    public void actificialResponseText(string openid,string content) {
       
        HttpUtil.httpForm("{\"touser\":\"" + openid + "\",\"msgtype\":\"text\",\"text\":{\"content\":\"" + content + "\"}}", "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + HttpUtil.getAccessToken(APPID, APPSECRET), "POST");
    }
    /// <summary>
    /// 客服人工回复用户消息（图片）
    /// ygh 2014/3/26
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="content"></param>
    public void actificialResponseImg(string openid, string path) {
        string content = HttpUtil.uploadFile(path, HttpUtil.getAccessToken(this.APPID, this.APPSECRET), "image");
        JavaScriptSerializer a = new JavaScriptSerializer();
        Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(content);
        string media_id = (string)o["media_id"];
        HttpUtil.httpForm("{\"touser\":\"" + openid + "\",\"msgtype\":\"image\",\"image\":{\"media_id\":\"" + media_id + "\"}}", "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + HttpUtil.getAccessToken(APPID, APPSECRET), "POST");
    }
    /// <summary>
    /// 2014/4/14 ygh
    /// 得到AccessToken
    /// </summary>
    /// <returns></returns>
    public string getAccessToken() {
        return HttpUtil.getAccessToken(this.APPID,this.APPSECRET);
    }

}

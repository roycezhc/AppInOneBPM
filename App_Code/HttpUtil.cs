using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Net;
using System.IO;
using System.Text;

/// <summary>
///HttpUtil 的摘要说明
/// </summary>
public class HttpUtil
{
    [Serializable]
    public class Button
    {
        public string name { get; set; }
    }
    [Serializable]
    public class SubButton : Button
    {
        public string type { get; set; }
        public string key { get; set; }
        public string url { get; set; }
    }
    [Serializable]
    public class Menu : Button
    {
        public List<Button> sub_button = new List<Button>();
    }
    [Serializable]
    public class WeixinMenu
    {
        public List<Button> button { get; set; }
    }
	public HttpUtil()
	{
		
	}
    /// <summary>
    /// 接受请求的网站是UTF-8编码，Http Post请求参数也需要用UTF-8编码
    /// HttpUtility.UrlEncode(merId, myEncoding)
    /// </summary>
    /// <param name="url">访问地址，不带参数</param>
    /// <param name="para">参数字符串</param>
    /// <returns></returns>
    public static string HtmlFromUrl(string url, string type, string aid)
    {
        String sResult = "";
        try
        {
            List<Button> menus = new List<Button>();
            List<WEC_MENU> listObj = new List<WEC_MENU>();
            WEC_MENU conf = new WEC_MENU();
            conf.PID = "0";
            conf.AID = Convert.ToDecimal(aid
);
            listObj = BLLTable<WEC_MENU>.Select(new WEC_MENU(), conf);
            foreach (WEC_MENU me in listObj)
            {
                if (me.STATUS == 1) { continue; }
                Menu m = new Menu();
                m.name = me.MENU_NAME;
                conf.PID = me.ID;
                List<WEC_MENU> listObj2 = new List<WEC_MENU>();
                listObj2 = BLLTable<WEC_MENU>.Select(new WEC_MENU(), conf);
                foreach (WEC_MENU me2 in listObj2)
                {
                    if (me2.STATUS == 1) { continue; }
                    SubButton sub_btn = new SubButton();
                   
                    sub_btn.type = me2.MENU_TYPE;
                    sub_btn.name = me2.MENU_NAME;
                    if (me2.MENU_TYPE.Equals("click")) 
                    {
                        WEC_REQUEST conf2 = new WEC_REQUEST();
                        conf2.TID = Convert.ToDecimal(me2.MENU_KEY);
                        sub_btn.key = BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(),conf2).KEYWORD;
                        sub_btn.url = "";
                    }
                    else if (me2.MENU_TYPE.Equals("view"))
                    {
                        sub_btn.key = "";
                        sub_btn.url = me2.URL;
                    }
                    m.sub_button.Add(sub_btn);
                }
                if (m.sub_button.Count == 0)
                {
                    SubButton sub = new SubButton();
                    sub.name = me.MENU_NAME;
                   // sub.key = me.MENU_KEY;
                    sub.type = me.MENU_TYPE;
                   // sub.url = me.URL;
                    if (me.MENU_TYPE.Equals("click"))
                    {
                        WEC_REQUEST conf2 = new WEC_REQUEST();
                        conf2.TID = Convert.ToDecimal(me.MENU_KEY);
                        sub.key = BLLTable<WEC_REQUEST>.GetRowData(new WEC_REQUEST(), conf2).KEYWORD;
                        sub.url = "";
                    }
                    else if (me.MENU_TYPE.Equals("view"))
                    {
                        sub.key = "";
                        sub.url = me.URL;
                    }
                    menus.Add(sub);
                }
                else
                {
                    menus.Add(m);
                }

            }
            //menus.Add(
            //    new Menu()
            //    {
            //        name = "求职招聘",
            //        sub_button = new SubButton[]
            //            {
            //                new SubButton()
            //                {
            //                    name = "求职",
            //                    key = "menu_qiuzhi",
            //                    type = "click"
            //                },
            //                new SubButton()
            //                {
            //                    name = "招聘",
            //                    key = "menu_zhaopin",
            //                    type = "click"
            //                }
            //            }
            //    });

            WeixinMenu weixinMenu = new WeixinMenu() { button = menus };
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string menusString = jss.Serialize(weixinMenu);
            //  byte[] postBytes = Encoding.UTF8.GetBytes(menusString);
            //    HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            //    request.Method = "POST";
            //    request.ContentType = "application/x-www-form-urlencoded";
            //    request.ContentLength = postBytes.Length;
            //    using (Stream reqStream = request.GetRequestStream())
            //    {
            //        reqStream.Write(postBytes, 0, postBytes.Length);
            //    }
            //    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            //    System.IO.Stream responseStream = response.GetResponseStream();
            //    System.IO.StreamReader sr = new System.IO.StreamReader(responseStream, System.Text.Encoding.GetEncoding("utf-8"));
            //    string responseText = sr.ReadToEnd();
            //    sr.Close();
            //    sr.Dispose();
            //    responseStream.Close();
            //    string jsonData = responseText;
            //    //MenuResult menuResult = jss.Deserialize<MenuResult>(jsonData);
            //    //return url + "\n" + menuResult.Errcode + "\n" + menuResult.Errmsg;
            //    return url;
            //ASCIIEncoding encoding = new ASCIIEncoding();

            return httpForm(menusString,url,type);

        }
        catch (Exception e)
        {
            sResult = e.Message;
            return sResult;

        }
    }
    /// <summary>
    /// 向参数url发送type类型http的请求，请求参数为param
    /// </summary>
    /// <param name="param"></param>
    /// <param name="url"></param>
    /// <param name="type"></param>
    /// <returns></returns>
    public static string httpForm(string param,string url,string type) {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
       if(type.Equals("GET")){
           request.Method = type;
       }
       else{
            byte[] data = Encoding.UTF8.GetBytes(param);
            request.Method = type;
            request.ContentType = "application/x-www-form-urlencoded;";
            request.ContentLength = data.Length;
            Stream stream = request.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();
       }

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
        string content = reader.ReadToEnd();
        return content;

    }

    public static string postMsgToCloud(string datajson,string url) {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        byte[] data = Encoding.UTF8.GetBytes(datajson);
        request.Method = "POST";
        request.Headers.Add("X-AVOSCloud-Application-Id", "1hh7727ipaic8bbevrrny6m5t8vw8e7gjayahrhn7ruf4p5q");
        request.Headers.Add("X-AVOSCloud-Application-Key", "wg9gxyqf7jgbbsvnqi7fhcr4mh4hwzxm1jmjvb476y94yy2u");
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        Stream stream = request.GetRequestStream();
        stream.Write(data, 0, data.Length);
        stream.Close();
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
        string content = reader.ReadToEnd();
        return content;
    }
    /// <summary>
    /// 传入appid和secret获取accesstoken
    /// </summary>
    /// <param name="appid"></param>
    /// <param name="secret"></param>
    /// <returns></returns>
    public static string getAccessToken(string appid,string secret) {
        string param = "";
        string url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appid+"&secret="+secret;
        StreamWriter sw = new StreamWriter(@"c:\e.txt");
        sw.Write(""+url);
        sw.Close();
        string content=httpForm(param,url,"GET");

        JavaScriptSerializer a = new JavaScriptSerializer();
        Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(content);
        string access_token = (string)o["access_token"];
        return access_token;
    }

    /// <summary>
    /// 获取string Request对象
    /// </summary>
    /// <param name="strKey"></param>
    /// <returns></returns>
    public static string GetReqStrValue(string strKey)
    {
        string GetReqValue = "";
        GetReqValue = System.Web.HttpContext.Current.Request.QueryString[strKey];       //get
        if (GetReqValue == null || GetReqValue == "")
        {
            GetReqValue = System.Web.HttpContext.Current.Request.Form[strKey];          //post
        }
        return UrnHtml(GetReqValue);
    }

    /// <summary>
    /// 判断是否有该参数
    /// </summary>
    /// <param name="strKey"></param>
    /// <returns></returns>
    public static bool HasReqStr(string strKey)
    {
        string GetReqValue1 = System.Web.HttpContext.Current.Request.QueryString[strKey];
        string GetReqValue2 = System.Web.HttpContext.Current.Request.Form[strKey];
        if (GetReqValue1 == null && GetReqValue2 == null)
        {
            return false;
        }
        return true;
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

    public static string uploadFile(string filename,string access_token,string type) {
        WebClient c = new WebClient();
        //string filename = @"文件路径";
     
        byte[] result = c.UploadFile(new Uri(String.Format("http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token="+access_token+"&type="+type)), filename);
        string resultjson = Encoding.Default.GetString(result);
        return resultjson;
    }

    /// <summary>
    /// 还有点问题 这个方法
    /// </summary>
    /// <param name="url"></param>
    /// <param name="poststr"></param>
    /// <param name="fileformname"></param>
    /// <param name="filepath"></param>
    /// <param name="cookie"></param>
    /// <returns></returns>
     public static string HttpUploadFile(string url, string poststr,string  fileformname, string filepath, string cookie) 
     {

         // 这个可以是改变的，也可以是下面这个固定的字符串 
         string boundary = "—————————7d930d1a850658";

         // 创建request对象 
         HttpWebRequest webrequest = (HttpWebRequest)WebRequest.Create(url); 
         webrequest.ContentType = "multipart/form-data"; 
         webrequest.Method = "POST"; 
         webrequest.Headers.Add("Cookie: " + cookie); 
        // webrequest.Referer = refre;

         // 构造发送数据 
         StringBuilder sb = new StringBuilder();

         // 文本域的数据，将user=eking&pass=123456  格式的文本域拆分 ，然后构造 
         foreach (string c in poststr.Split('&'))
         {
             string[] item = c.Split('=');
             if (item.Length != 2)
             {
                 break;
             }
             string name = item[0];
             string value = item[1];
             sb.Append("–" + boundary);
             sb.Append("\r\n");
             sb.Append("Content-Disposition: form-data; name=\"" + name + "\"");
             sb.Append("\r\n\r\n");
             sb.Append(value);
             sb.Append("\r\n");
         }

        // 文件域的数据 
         sb.Append("–" + boundary); 
         sb.Append("\r\n"); 
         sb.Append("Content-Disposition: form-data; name=\"media\";filename=\"" + filepath + "\""); 
         sb.Append("\r\n");

         sb.Append("Content-Type: "); 
         sb.Append("image/jpg"); 
          sb.Append("\r\n\r\n");

         string postHeader = sb.ToString(); 
         byte[] postHeaderBytes = Encoding.UTF8.GetBytes(postHeader);

        //构造尾部数据 
         byte[] boundaryBytes = Encoding.ASCII.GetBytes("\r\n–" + boundary + "–\r\n");
         filepath=filepath.Replace('\\', '/');
         FileStream fileStream = new FileStream(filepath, FileMode.Open, FileAccess.Read);
         long length = postHeaderBytes.Length + fileStream.Length + boundaryBytes.Length;
         webrequest.ContentLength = length;

         Stream requestStream = webrequest.GetRequestStream();

         // 输入头部数据 
         requestStream.Write(postHeaderBytes, 0, postHeaderBytes.Length);

         // 输入文件流数据 
         byte[] buffer = new Byte[fileStream.Length]; 
         int bytesRead = 0; 
         while ((bytesRead = fileStream.Read(buffer, 0, buffer.Length)) != 0) 
             requestStream.Write(buffer, 0, bytesRead);

         // 输入尾部数据 
         requestStream.Write(boundaryBytes, 0, boundaryBytes.Length); 
         WebResponse responce = webrequest.GetResponse(); 
         Stream s = responce.GetResponseStream(); 
         StreamReader sr = new StreamReader(s);

         // 返回数据流(源码) 
         return sr.ReadToEnd(); 
     }

     public static void getImageStream(string url,string path) {
         WebClient wc = new WebClient();
         wc.DownloadFile(url,path);
        // HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
         
        
        //byte[] data = Encoding.UTF8.GetBytes("");
        //request.Method = "POST";
        //request.ContentType = "application/x-www-form-urlencoded;";
        //request.ContentLength = data.Length;
        //Stream stream = request.GetRequestStream();
        //stream.Write(data, 0, data.Length);
        //stream.Close();
         

        // HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        // return response.GetResponseStream();
     }

    /// <summary>
    /// 返回当前的菜单json
    /// </summary>
    /// <param name="token"></param>
    /// <returns></returns>
     //public static Dictionary<string, object> getCurrMenu(string token) { 
     //   string content=httpForm("","https://api.weixin.qq.com/cgi-bin/menu/get?access_token="+token,"GET");
     //   JavaScriptSerializer a = new JavaScriptSerializer();
     //   Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(content);
     //   return o;
     //}
    /// <summary>
    /// 参数编码
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
     public static string UrlEncode(string str)
     {
         StringBuilder builder = new StringBuilder();
         foreach (char c in str)
         {
             if (HttpUtility.UrlEncode(c.ToString()).Length > 1)
             {
                 builder.Append(HttpUtility.UrlEncode(c.ToString()).ToUpper());
             }
             else
             {
                 builder.Append(c);
             }
         }
         return builder.ToString();
     }



     public static string leanCloudPush(string url,string msg) {
         HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
         byte[] data = Encoding.UTF8.GetBytes(msg);
        request.Method = "POST";
        request.Headers.Add("X-AVOSCloud-Application-Id", "1hh7727ipaic8bbevrrny6m5t8vw8e7gjayahrhn7ruf4p5q");
        request.Headers.Add("X-AVOSCloud-Application-Key", "wg9gxyqf7jgbbsvnqi7fhcr4mh4hwzxm1jmjvb476y94yy2u");
        request.ContentType = "application/json";
        request.ContentLength = data.Length;
        Stream stream = request.GetRequestStream();
        stream.Write(data, 0, data.Length);
        stream.Close();

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
        string content = reader.ReadToEnd();
        return content;
     }
}
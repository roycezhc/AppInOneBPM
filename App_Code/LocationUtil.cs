using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

/// <summary>
///LocationUtil 的摘要说明
/// </summary>
public class LocationUtil
{

   // public static Dictionary<string, Dictionary<string, string>> userLocation=new Dictionary<string,Dictionary<string,string>>();
    /// <summary>
    /// 设置自动上发的地址
    /// ygh 2014/3/12
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="location"></param>
    public static void setLocation(string openid,string location) {
        JavaScriptSerializer a = new JavaScriptSerializer();
        Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(location);
        WEC_WZ_LOCATION userLocation = new WEC_WZ_LOCATION();
        userLocation.OPENID = openid;
        userLocation.LATITUDE=(string)o["Latitude"];
        userLocation.LONGITUDE=(string)o["Longitude"];
        userLocation.PRECISION=(string)o["Precision"];
        userLocation.ADDTIME = DateTime.Now;
        BLLTable<WEC_WZ_LOCATION>.Insert(userLocation,WEC_WZ_LOCATION.Attribute.ID);
    }
    /// <summary>
    /// 用户主动上发地址
    /// ygh 2014/3/12
    /// </summary>
    /// <param name="openid"></param>
    /// <param name="location"></param>
    public static void setAddress(string openid, string location)
    {
        JavaScriptSerializer a = new JavaScriptSerializer();
        Dictionary<string, object> o = (Dictionary<string, object>)a.DeserializeObject(location);
        WEC_WZ_LOCATION userLocation = new WEC_WZ_LOCATION();
        userLocation.OPENID = openid;
        userLocation.LATITUDE = (string)o["Latitude"];
        userLocation.LONGITUDE = (string)o["Longitude"];
        userLocation.PRECISION = (string)o["Precision"];
        userLocation.LABEL = (string)o["Label"];
        userLocation.ADDTIME = DateTime.Now;
        BLLTable<WEC_WZ_LOCATION>.Insert(userLocation, WEC_WZ_LOCATION.Attribute.ID);
    }
}
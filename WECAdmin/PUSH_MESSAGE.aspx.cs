using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Globalization;
using JdSoft.Apple.Apns.Notifications;
public partial class WECAdmin_PUSH_MESSAGE : System.Web.UI.Page
{
    private string pushtype = "";
    private string staffid = "";
    private string pushtime = "";
    private string timetype = "";
    private string message = "";
    private APP_PUSHMESSAGE valObj = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        pushtype = HttpUtil.GetReqStrValue("pushtype");
        if (!string.IsNullOrEmpty(pushtype))
        {
            staffid = HttpUtil.GetReqStrValue("staffid");
            pushtime = HttpUtil.GetReqStrValue("pushtime");
            timetype = HttpUtil.GetReqStrValue("timetype");
            message = HttpUtil.GetReqStrValue("message");

            valObj = new APP_PUSHMESSAGE();
            valObj.ADDTIME = DateTime.Now;
            valObj.PUSHTYPE = Convert.ToInt32(pushtype);
            if(!string.IsNullOrEmpty(staffid)){
                valObj.STAFFID = Convert.ToDecimal(staffid);
            }
            valObj.TIMETYPE = Convert.ToInt32(timetype);
            valObj.MESSAGE = message;
            if(!string.IsNullOrEmpty(pushtime)){
                valObj.PUSHTIME = DateTime.ParseExact(pushtime, "yyyy-MM-ddTHH:mm", CultureInfo.CurrentCulture, DateTimeStyles.None);
            }
            BLLTable<APP_PUSHMESSAGE>.Insert(valObj, APP_PUSHMESSAGE.Attribute.ID);
            if (valObj.PUSHTIME != null)
            {
                TimeSpan ts1 = new TimeSpan(valObj.PUSHTIME.Ticks);
                TimeSpan ts2 = new TimeSpan(DateTime.Now.Ticks);
                TimeSpan ts = ts1.Subtract(ts2).Duration();
                System.Timers.Timer myTimer = new System.Timers.Timer(ts.TotalMilliseconds);
                myTimer.Elapsed += new System.Timers.ElapsedEventHandler(OnTimedEvent);
                myTimer.AutoReset = false;
                myTimer.Enabled = true;
                myTimer.Start();
            }
            else {
                sendByTime();
            }
        }
    }
    private void OnTimedEvent(object source, System.Timers.ElapsedEventArgs e)
    {
        sendByTime();
    }

    public void sendByTime() {
        
        switch (pushtype)
        {
            case "0":
                sendMessageToAndroid(message, null);
                sendMessageToIOS(message, null, valObj.ID);
                break;//全部
            case "1":
                sendMessageToAndroid(message, null);
                break;//Android
            case "2":
                sendMessageToIOS(message, null, valObj.ID);
                break;//IOS
            case "3":
                APP_DEVICELIST conf = new APP_DEVICELIST();
                conf.USER_ID = Convert.ToInt32(staffid);
                conf.STATUS = 0;
                List<APP_DEVICELIST> deviceList = BLLTable<APP_DEVICELIST>.Select( new APP_DEVICELIST(),conf);
                foreach (APP_DEVICELIST device in deviceList)
                {
                    if (device.KIND == 0)
                    {
                        sendMessageToIOS(message, device.TOKEN_ID, valObj.ID);
                    }
                    else
                    {
                        sendMessageToAndroid(message, staffid);
                    }
                }
                break;//指定
        }
    }
    public void sendMessageToAndroid(string message,string staffid) {
        string url = "https://leancloud.cn/1.1/push";
        string datajson = "";
        if (!string.IsNullOrEmpty(staffid))
        {
            datajson = "{\"data\":{\"alert\":\"" + message + "\",\"title\":\"您有一条来自服务器的新消息！\"},\"where\":{\"staffId\":\"" + staffid + "\"}}";
        }
        else
        {
            datajson = "{\"data\":{\"alert\":\"" + message + "\",\"title\":\"您有一条来自服务器的新消息！\"}}";
        }
        HttpUtil.postMsgToCloud(datajson, url);
    }
    public void sendMessageToIOS(string message,string tokenid,int messageid) {
        bool sandbox = true;
        string p12File = "test.p12";
        string p12FilePassword = "123";

        string p12Filename = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, p12File);

        NotificationService service = new NotificationService(sandbox, p12Filename, p12FilePassword, 1);

        service.SendRetries = 5; //5 retries before generating notificationfailed event
        service.ReconnectDelay = 5000; //5 seconds
        if (!string.IsNullOrEmpty(tokenid))
        {
            Notification alertNotification = new Notification(tokenid);
            alertNotification.Payload.Alert.Body = "您有一条来自服务器的新消息！";
            alertNotification.Payload.Sound = "default";
            alertNotification.Payload.Badge = 1;
            alertNotification.Payload.AddCustom("kind", "1");
            alertNotification.Payload.AddCustom("messageId", messageid);
            alertNotification.Payload.AddCustom("fromId", -1);
            //alertNotification.Payload.AddCustom(txtName3.Value, txtVaule3.Value);
            //Queue the notification to be sent
            if (service.QueueNotification(alertNotification))
            { }
            else

            { }
        }
        else
        {
            APP_DEVICELIST conf = new APP_DEVICELIST();
            conf.KIND = 0;
            conf.STATUS = 0;
            List<APP_DEVICELIST> devicelist = BLLTable<APP_DEVICELIST>.Select(new APP_DEVICELIST(),conf);
            foreach (APP_DEVICELIST device in devicelist)
            {
                Notification alertNotification = new Notification(device.TOKEN_ID);

                alertNotification.Payload.Alert.Body = "您有一条来自服务器的新消息！";
                alertNotification.Payload.Sound = "default";
                alertNotification.Payload.Badge = 1;
                alertNotification.Payload.AddCustom("kind", "1");
                alertNotification.Payload.AddCustom("messageId", Convert.ToString(messageid));
                alertNotification.Payload.AddCustom("fromId", -1);
                //alertNotification.Payload.AddCustom(txtName3.Value, txtVaule3.Value);

                //Queue the notification to be sent
                if (service.QueueNotification(alertNotification))
                { }
                else

                { }
            }
        }
        service.Close();

        service.Dispose();
    }

}
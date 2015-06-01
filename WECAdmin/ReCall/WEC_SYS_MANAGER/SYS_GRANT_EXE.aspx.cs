using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TestCase;
using System.ServiceModel;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;


public partial class SYS_GRANT_EXE : BaseAdminPage
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        string result = "";
        string username = HttpUtil.GetReqStrValue("username");
        string password = HttpUtil.GetReqStrValue("password");
        string imgVerify = HttpUtil.GetReqStrValue("imgVerify");
        string num = Convert.ToString(Request["num"]);
        string num2 = HttpUtil.GetReqStrValue("num");
        string serverFilePath = @"E:\AppInOne_Solution\Site\UploadFiles\WecHeader";
        WEC_PUBLICLIST wec1 = new WEC_PUBLICLIST();
        try
        {
            TestCase.IServiceChannel iService = ChannelFactory<TestCase.IServiceChannel>.CreateChannel(new NetTcpBinding(SecurityMode.None), new EndpointAddress("net.tcp://localhost:8081/TestCase.WecService"));
         
            iService.OperationTimeout = new TimeSpan(1, 0, 5);
            iService.Open(new TimeSpan(0, 0, 10));

            if ("1".Equals(num))
            {
                result = iService.wecAddUser(username, password, imgVerify, serverFilePath);
            }
            else
            {
                result = iService.getStatus(username, password, ref wec1);
                //
                if(wec1._PLC_SOURCEID!=null)
                {
                    WEC_PUBLICLIST cond1 = new WEC_PUBLICLIST();
                    cond1._PLC_SOURCEID = wec1._PLC_SOURCEID;
                    if (wec1.APPID != null)
                        cond1.APPID = wec1.APPID;
                    if (wec1.APPSESECRET != null)
                        cond1.APPSESECRET = wec1.APPSESECRET;
                    if (wec1.IsNotNull() && cond1.IsNotNull())
                    {
                        if (BLLTable<WEC_PUBLICLIST>.Factory(conn).Exists(cond1))
                        {
                            //BLLTable<WEC_PUBLICLIST>.Factory(conn).Update(wec1, cond1);
                        }
                        else
                        {
                            BLLTable<WEC_PUBLICLIST>.Factory(conn).Insert(wec1, WEC_PUBLICLIST.Attribute.AID);
                        }
                    }
                }
            }
             Response.Write("{\"result\":\"" + result + "\"}");
         }catch(Exception ee){
             Response.Write("{\"result\":\"绑定出错\"}");
         }
    }
}
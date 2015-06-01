using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Text;
using System.Web.Script.Serialization;

public partial class WECAdmin_WebSite_Menu_MenuTree : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // string token=WeiXinUtil.Factory(this).getAccessToken();
        //Dictionary<string, List<MenuButton>> o = HttpUtil.getCurrMenu(token);
       // string content = HttpUtil.httpForm("", "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=" + token, "GET");
        //JavaScriptSerializer a = new JavaScriptSerializer();
        //Dictionary<string, List<MenuButton>> o = (Dictionary<string, List<MenuButton>>)a.DeserializeObject(content);
        if (!IsPostBack)
        {
           
            //List<WEC_HELPER> lstChnl = new List<WEC_HELPER>();
            //if (o.ContainsKey("menu")) {
                
            //}
            WEC_HELPER objVal = new WEC_HELPER();
            WEC_HELPER objCond = new WEC_HELPER();
            objCond.PID = "0";
      
            objVal.OrderBy(WEC_HELPER.Attribute.SORT_ID, Order.Asc);
            List<WEC_HELPER> lstChnl = BLLTable<WEC_HELPER>.Select(objVal, objCond);
            StringBuilder sb = new StringBuilder();
            if (lstChnl.Count > 0)
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:9999,name:'帮助文档管理'}\" class=\"root\"><div class=\"opened\"><b></b><em></em><a href=\"#\">帮助文档管理</a></div>");
                sb.Append("<ul>");
                for (int i = 0; i < lstChnl.Count; i++)
                {
                    StringBuilder sbData = new StringBuilder();
                    string licls = "";
                    if (i == lstChnl.Count - 1)
                    {
                        licls = "last";
                    }

                    if (licls != "") { licls = " class='" + licls + "'"; }
                     objCond = new WEC_HELPER();
                    objCond.PID = lstChnl[i].ID;
                   
                    int subcount = BLLTable<WEC_HELPER>.Factory(conn).Select(new WEC_HELPER(), objCond).Count;
                    sbData.Append("{rid:'0',id:'").Append(lstChnl[i].ID.ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].PID).Append("',no:").Append(lstChnl[i].SORT_ID.ToString());
                    sbData.Append(",sc:").Append(subcount);
                    sbData.Append(",name:'").Append(lstChnl[i].TITLE).Append("'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em></em><a href='#'>" + lstChnl[i].TITLE + "</a></div></li>");
                }
                sb.Append("</ul>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'',sc:0,name:'帮助文档管理'}\" class=\"root\"><div><b></b><em></em><a href=\"#\">帮助文档管理</a></div></li>");

            }
            litChnl.Text = sb.ToString();
        }
    }
 
}
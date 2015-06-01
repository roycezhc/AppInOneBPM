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

public partial class Admin_WebSite_SiteColumn_SiteColumnTree : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public int aid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            aid = Convert.ToInt32(HttpUtil.GetReqStrValue("aid"));
            WEC_CUSTOM_COLUMN objVal = new WEC_CUSTOM_COLUMN();
            WEC_CUSTOM_COLUMN objCond = new WEC_CUSTOM_COLUMN();
            objCond.PID = "0";
            objCond.AID = Convert.ToInt32(aid);
            objVal.OrderBy(WEC_CUSTOM_COLUMN.Attribute.SORT_ID, Order.Asc);
            List<WEC_CUSTOM_COLUMN> lstChnl = BLLTable<WEC_CUSTOM_COLUMN>.Select(objVal, objCond);
            StringBuilder sb = new StringBuilder();
            if (lstChnl.Count > 0)
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:9999,name:'站点栏目管理'}\" class=\"root\"><div class=\"opened\"><b></b><em></em><a href=\"#\">站点栏目管理</a></div>");
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
                    objCond = new WEC_CUSTOM_COLUMN();
                    objCond.PID = lstChnl[i].ID;
                    objCond.AID = Convert.ToInt32(aid);
                    int subcount = BLLTable<WEC_CUSTOM_COLUMN>.Factory(conn).Select(new WEC_CUSTOM_COLUMN(), objCond).Count;
                    sbData.Append("{rid:'0',id:'").Append(lstChnl[i].ID.ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].PID).Append("',no:").Append(lstChnl[i].SORT_ID.ToString());
                    sbData.Append(",sc:").Append(subcount);
                    sbData.Append(",aid:").Append(aid);
                    sbData.Append(",name:'").Append(lstChnl[i].COLUMN_NAME).Append("'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em></em><a href='#'>" + lstChnl[i].COLUMN_NAME + "</a></div></li>");
                }
                sb.Append("</ul>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'',sc:0,name:'站点栏目管理'}\" class=\"root\"><div><b></b><em></em><a href=\"#\">站点栏目管理</a></div></li>");

            }
            litChnl.Text = sb.ToString();
        }
    }
}
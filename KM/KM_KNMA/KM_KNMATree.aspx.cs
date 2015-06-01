using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using System.Text;

public partial class KM_KNMATree :BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KM_KNMA objVal1 = new KM_KNMA();
            KM_KNMA objCond2 = new KM_KNMA();
            objCond2.P_KNMA_ID = "0";
            objVal1.OrderBy(KM_KNMA.Attribute.SORT_NO, Order.Asc);
            List<KM_KNMA> lstChnl = BLLTable<KM_KNMA>.Factory(conn).Select(objVal1, objCond2);
            StringBuilder sb = new StringBuilder();
            if (lstChnl.Count > 0)
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'知识管理',ntype:''}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">知识管理</a><a href='KM_KNMATree.aspx'>刷新</a></div>");
                sb.Append("<ul>");
                for (int i = 0; i < lstChnl.Count; i++)
                {
                    StringBuilder sbData = new StringBuilder();
                    string licls = "";
                    if (i == lstChnl.Count - 1)
                    {
                        licls = "last";
                    }
                    decimal subcount = 1;// lstChnl[i].SUB_NUM;
                    if (subcount == 0)
                    {
                        if (licls != "") { licls += " "; }
                        licls += "leaf";
                    }
                    if (licls != "") { licls = " class='" + licls + "'"; }

                    sbData.Append("{id:'").Append(lstChnl[i].KNMA_ID.ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].P_KNMA_ID).Append("',no:").Append(lstChnl[i].SORT_NO.ToString());
                    sbData.Append(",sc:").Append(subcount.ToString());
                    sbData.Append(",name:'").Append(lstChnl[i].KNMA_ID).Append("',ntype:'org'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].KNMA_ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em class='node_org'></em><a href='#'>" + lstChnl[i].KNMA_NAME + "</a></div></li>");
                }
                sb.Append("</ul></li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'知识管理',ntype:''}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">知识管理</a><a href='KM_KNMATree.aspx'>刷新</a></div></li>");

            }
            litChnl.Text = sb.ToString();

        }
    }
}
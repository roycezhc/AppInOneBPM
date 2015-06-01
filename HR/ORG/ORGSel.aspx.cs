using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class Admin_Dept_Sel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HR_ORG objVal = new HR_ORG();
            HR_ORG objCond = new HR_ORG();
            objCond.P_ORG_ID = "0";
            objVal.OrderBy(HR_ORG.Attribute.ORG_ID, Order.Asc);
            List<HR_ORG> lstChnl = BLLTable<HR_ORG>.Factory(conn).Select(objVal,objCond);
            StringBuilder sb = new StringBuilder();
            if (lstChnl.Count > 0)
            {
                sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'机构选择'}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">机构选择</a></div>");
                sb.Append("<ul>");
                for (int i = 0; i < lstChnl.Count; i++)
                {
                    StringBuilder sbData = new StringBuilder();
                    string licls = "";
                    if (i == lstChnl.Count - 1)
                    {
                        licls = "last";
                    }
                    int subcount = BLLTable<HR_ORG>.Factory(conn).Select(HR_ORG.Attribute.P_ORG_ID, lstChnl[i].ORG_ID).Count;

                    if (subcount<1)
                    {
                        if (licls != "") { licls += " "; }
                        licls += "leaf";
                    }
                    if (licls != "") { licls = " class='" + licls + "'"; }
                    sbData.Append("{rid:'0',id:'").Append(lstChnl[i].ORG_ID.ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].P_ORG_ID).Append("',no:").Append(lstChnl[i].ORG_ID.ToString());
                    sbData.Append(",sc:").Append(subcount.ToString());
                    sbData.Append(",name:'").Append(lstChnl[i].ORG_NAME).Append("'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].ORG_ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em></em><a href='#'>" + lstChnl[i].ORG_NAME + "</a></div></li>");
                }
                sb.Append("</ul>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'机构选择'}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">机构选择</a></div></li>");

            }
            litChnl.Text = sb.ToString();
        }
    }
}

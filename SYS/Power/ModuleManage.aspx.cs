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

public partial class Admin_SYS_MenuManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //dics.Add("4", "");
        if (!IsPostBack)
        {
            string title = "";
            SYS_APP app1 = base.getApp();

            if (app1!=null)
            {
                this.Title = app1.APP_LABEL;
            }
            
            SYS_MODULE objVal2 = new SYS_MODULE();
            SYS_MODULE objCond2 = new SYS_MODULE();
            objCond2.P_MDL_ID = appid;
            objVal2.OrderBy(SYS_MODULE.Attribute.SORT_NO, Order.Asc);
            List<SYS_MODULE> lstChnl2 = BLLTable<SYS_MODULE>.Factory(conn).Select(objVal2, objCond2);


            SYS_MODULE objVal = new SYS_MODULE();//("SYS_MODULE", "MDL_ID,MDL_NAME,P_MDL_ID,PAGE_URL,SORT_NO,NEED_POWER,MDL_TYPE,REAL_PAGES,USE_FLAG,PATH,PNAME,SNAME,RNAME");
            SYS_MODULE objCond = new SYS_MODULE();//"SYS_MODULE", "MDL_ID,MDL_NAME,P_MDL_ID,PAGE_URL,SORT_NO,NEED_POWER,MDL_TYPE,REAL_PAGES,USE_FLAG,PATH,PNAME,SNAME,RNAME");
            objCond.SetValue(SYS_MODULE.Attribute.P_MDL_ID, appid);
            objVal.OrderBy(SYS_MODULE.Attribute.SORT_NO, Order.Asc);
            List<SYS_MODULE> lstChnl = BLLTable<SYS_MODULE>.Factory(conn).Select(objVal, objCond);

            StringBuilder sb = new StringBuilder();            
            if (lstChnl.Count > 0)
            {
                //一级
                sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'" + appid + "',pid:'" + appid + "',sc:0,name:'" + title + "模块管理'}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">" + title + "模块管理</a></div>");
                sb.Append("<ul>");
                for (int i = 0; i < lstChnl.Count; i++)
                {
                    StringBuilder sbData = new StringBuilder();
                    string licls = "";
                    if (i == lstChnl.Count - 1)
                    {
                        licls = "last";
                    }
                    //二级
                    int subcount = BLLTable<ITableImplement>.Factory(conn).Select(SYS_MODULE.Attribute.P_MDL_ID, lstChnl[i].GetValue(SYS_MODULE.Attribute.MDL_ID)).Count;
                    if (subcount == 0)
                    {
                        if (licls != "") { licls += " "; }
                        licls += "leaf";
                    }
                    if (licls != "") { licls = " class='" + licls + "'"; }

                    sbData.Append("{rid:'0',id:'").Append(lstChnl[i].GetValue(SYS_MODULE.Attribute.MDL_ID).ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].GetValue(SYS_MODULE.Attribute.P_MDL_ID)).Append("',no:").Append(lstChnl[i].GetValue(SYS_MODULE.Attribute.SORT_NO).ToString());
                    sbData.Append(",sc:").Append(subcount.ToString());
                    sbData.Append(",name:'").Append(lstChnl[i].GetValue(SYS_MODULE.Attribute.MDL_NAME)).Append("'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].GetValue(SYS_MODULE.Attribute.MDL_ID) + "' data=\"" + sbData.ToString() + "\"><div><b></b><em></em><a href='#'>" + lstChnl[i].GetValue(SYS_MODULE.Attribute.MDL_NAME) + "</a></div></li>");
                }
                sb.Append("</ul>");
                sb.Append("</li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'" + appid + "',pid:'" + appid + "',sc:0,name:'" + title + "模块管理'}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">" + title + "模块管理</a></div></li>");

            }
            //litChnl.Text = sb.ToString();
        }

        //AttributeItem MDL_ID = new AttributeItem("SYS_MODULE", "MDL_ID");//记录id
        //AttributeItem MDL_NAME = new AttributeItem("SYS_MODULE", "MDL_NAME");//记录名称
        //AttributeItem P_MDL_ID = new AttributeItem("SYS_MODULE", "P_MDL_ID");//父id
        //AttributeItem PAGE_URL = new AttributeItem("SYS_MODULE", "PAGE_URL");//默认首页--应该划分出其他几个模版页。
        //AttributeItem SORT_NO = new AttributeItem("SYS_MODULE", "SORT_NO");//排序字段
        //AttributeItem NEED_POWER = new AttributeItem("SYS_MODULE", "NEED_POWER");//是否需要权限

        //AttributeItem MDL_TYPE = new AttributeItem("SYS_MODULE", "MDL_TYPE");//类型、分类
        //AttributeItem REAL_PAGES = new AttributeItem("SYS_MODULE", "REAL_PAGES");//相关页面
        //AttributeItem USE_FLAG = new AttributeItem("SYS_MODULE", "USE_FLAG");//是否启用
        //AttributeItem PATH = new AttributeItem("SYS_MODULE", "PATH");//层级ID路径
        //AttributeItem PNAME = new AttributeItem("SYS_MODULE", "PNAME");//层级名称路径
        //AttributeItem SNAME = new AttributeItem("SYS_MODULE", "SNAME");//简称
        //AttributeItem RNAME = new AttributeItem("SYS_MODULE", "RNAME");//助记码
    }
}

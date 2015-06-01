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
public partial class HR_CollectionAccountManagement_CollOrgManger2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string title = "多系统组织机构综合管理";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = title;
        if (!IsPostBack)
        {
            HR_ORG objVal = new HR_ORG();
            HR_ORG objCond = new HR_ORG();
            objCond.P_ORG_ID = "0";
            objVal.OrderBy(HR_ORG.Attribute.SORT_NO, Order.Asc);
            List<HR_ORG> lstChnl = BLLTable<HR_ORG>.Factory(conn).Select(objVal, objCond);
            StringBuilder sb = new StringBuilder();
            if (lstChnl.Count > 0)
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'组织机构管理',ntype:'root'}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\" onclick='gotoMangerOrg()'>组织机构管理</a><a href='CollOrgManger.aspx'>刷新</a></div>");
                sb.Append("<ul>");
                for (int i = 0; i < lstChnl.Count; i++)
                {
                    StringBuilder sbData = new StringBuilder();
                    string licls = "";
                    if (i == lstChnl.Count - 1)
                    {
                        licls = "last";
                    }
                    decimal subcount = lstChnl[i].SUB_NUM;
                    if (subcount == 0)
                    {
                        if (licls != "") { licls += " "; }
                        licls += "leaf";
                    }
                    if (licls != "") { licls = " class='" + licls + "'"; }

                    sbData.Append("{id:'").Append(lstChnl[i].ORG_ID.ToString());
                    sbData.Append("',pid:'").Append(lstChnl[i].P_ORG_ID).Append("',no:").Append(lstChnl[i].SORT_NO.ToString());
                    sbData.Append(",sc:").Append(subcount.ToString());
                    sbData.Append(",name:'").Append(lstChnl[i].ORG_NAME).Append("',ntype:'org'}");

                    sb.Append("<li " + licls + " id='node_" + lstChnl[i].ORG_ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em class='node_org'></em><a href='#'>" + lstChnl[i].ORG_NAME + "</a></div></li>");
                }
                sb.Append("</ul></li>");
            }
            else
            {
                sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'组织机构管理',ntype:'root'}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\" onclick='gotoMangerOrg()'>组织机构管理</a><a href='CollOrgManger.aspx'>刷新</a></div></li>");

            }
            litChnl.Text = sb.ToString();

            //HR_DEPT objVal = new HR_DEPT();
            //HR_DEPT objCond = new HR_DEPT();
            //objCond.P_DEPT_ID = "0";
            //objVal.OrderBy(HR_DEPT.Attribute.SORT_NO, Order.Asc);
            //List<HR_DEPT> lstChnl = BLLTable<HR_DEPT>.Factory(conn).Select(objVal,objCond);
            //StringBuilder sb = new StringBuilder();
            //if (lstChnl.Count > 0)
            //{
            //    sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'部门管理',ntype:''}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">部门管理</a></div>");
            //    sb.Append("<ul>");
            //    for (int i = 0; i < lstChnl.Count; i++)
            //    {
            //        StringBuilder sbData = new StringBuilder();
            //        string licls = "";
            //        if (i == lstChnl.Count - 1)
            //        {
            //            licls = "last";
            //        }
            //        int subcount = BLLTable<HR_DEPT>.Factory(conn).Select(HR_DEPT.Attribute.P_DEPT_ID, lstChnl[i].DEPT_ID).Count;
            //        //if (subcount == 0)
            //        //{
            //        //    if (licls != "") { licls += " "; }
            //        //    licls += "leaf";
            //        //}
            //        if (licls != "") { licls = " class='" + licls + "'"; }

            //        sbData.Append("{rid:'0',id:'").Append(lstChnl[i].DEPT_ID.ToString());
            //        sbData.Append("',pid:'").Append(lstChnl[i].P_DEPT_ID).Append("',no:").Append(lstChnl[i].SORT_NO.ToString());
            //        sbData.Append(",sc:").Append(subcount.ToString());
            //        sbData.Append(",name:'").Append(lstChnl[i].DEPT_NAME).Append("',ntype:'dept'}");

            //        sb.Append("<li " + licls + " id='node_" + lstChnl[i].DEPT_ID + "' data=\"" + sbData.ToString() + "\"><div><b></b><em class='node_dept'></em><a href='#'>" + lstChnl[i].DEPT_NAME + "</a></div></li>");
            //    }
            //    sb.Append("</ul>");
            //    sb.Append("</li>");
            //}
            //else
            //{
            //    sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'部门管理',ntype:''}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">部门管理</a></div></li>");

            //}
            //litChnl.Text = sb.ToString();
        }
    }
}

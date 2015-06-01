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
/// <summary>
/// 模版示例
/// </summary>
public partial class UCtrl_Dept_Sel : AgileFrame.AppInOne.Common.BasePage
{
    #region 模板式输入参数

    protected string DBTableName = "";//表名
    protected string ID_FIELD = "";//表的id
    protected string NAME_FIELD = "";//表的名称
    protected string PID_FIELD = "";//表的父对象id
    protected string IsTypeTree = "";//是否为树结构
    ITableImplement itable = null;
    ITableImplement itable_P = null;

    private bool initParam()
    {
        if (string.IsNullOrEmpty(Request["template"]))//表名
            DBTableName = Convert.ToString(Request["template"]);
        if (string.IsNullOrEmpty(Request["template_id"]))//表的id
            ID_FIELD = Convert.ToString(Request["template_id"]);
        if (string.IsNullOrEmpty(Request["template_name"]))//表的名称
            NAME_FIELD = Convert.ToString(Request["template_name"]);
        if (string.IsNullOrEmpty(Request["template_pid"]))//表的父对象id
            PID_FIELD = Convert.ToString(Request["template_pid"]);
        if (string.IsNullOrEmpty(Request["template_type"]))//是否为树结构
            IsTypeTree = Convert.ToString(Request["template_type"]);

        itable = new ITableImplementHelper(conn).Factory(DBTableName);
        if (string.IsNullOrEmpty(DBTableName)
            ||string.IsNullOrEmpty(ID_FIELD)
            || string.IsNullOrEmpty(NAME_FIELD)
            ||itable == null || itable.IsNull()
            )
        {
            return false;
        }
        return true;
    }

    private string getParamStr()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("&template=").Append(DBTableName);
        sb.Append("&template_id=").Append(ID_FIELD);
        sb.Append("&template_name=").Append(NAME_FIELD);
        sb.Append("&template_pid=").Append(PID_FIELD);
        sb.Append("&template_type=").Append(IsTypeTree);
        return sb.ToString();
    }

    #endregion

    protected string moreP = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            StringBuilder sb = new StringBuilder();

            if (!initParam()) return;//zlg

            if (Request["ORG_ID"] != null)//如果不为null，则找到自己所在的机构。
            {
                ITableImplement objVal = new ITableImplementHelper(conn).Factory("HR_DEPT");
                ITableImplement objCond = new ITableImplementHelper(conn).Factory("HR_DEPT");
                //objCond.Where("ORG_ID like '" + Request["ORG_ID"] + "%'");
                objCond.SetValue("P_DEPT_ID", "0");
                objCond.SetValue("ORG_ID", Request["ORG_ID"]);
                moreP = "?ORG_ID=" + Request["ORG_ID"];

                objVal.OrderBy(new AttributeItem("HR_DEPT", "DEPT_ID"), Order.Asc);
                List<ITableImplement> lstChnl = BLLTable<ITableImplement>.Factory(conn).Select(objVal, objCond);

                if (lstChnl.Count > 0)
                {
                    sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'对象选择',ntype:''}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">对象选择</a></div>");
                    sb.Append("<ul>");
                    for (int i = 0; i < lstChnl.Count; i++)
                    {
                        StringBuilder sbData = new StringBuilder();
                        string licls = "";
                        if (i == lstChnl.Count - 1)
                        {
                            licls = "last";
                        }
                        ITableImplement objCond1 = new ITableImplementHelper(conn).Factory("HR_DEPT");        
                        objCond1.SetValue("P_DEPT_ID", lstChnl[i].GetValue("DEPT_ID"));
                        int subcount = BLLTable.Factory(conn).Count(objCond1);
                        if (subcount < 1)
                        {
                            if (licls != "") { licls += " "; }
                            licls += "leaf";
                        }
                        if (licls != "") { licls = " class='" + licls + "'"; }

                        sbData.Append("{rid:'0',id:'").Append(lstChnl[i].GetValue("DEPT_ID").ToString());
                        sbData.Append("',pid:'").Append(lstChnl[i].GetValue("P_DEPT_ID")).Append("',no:'").Append(lstChnl[i].GetValue("DEPT_ID").ToString());
                        sbData.Append("',sc:").Append(subcount.ToString());
                        sbData.Append(",name:'").Append(lstChnl[i].GetValue("DEPT_NAME")).Append("',ntype:'dept'}");

                        sb.Append("<li " + licls + " id='node_" + lstChnl[i].GetValue("DEPT_ID") + "' data=\"" + sbData.ToString() + "\"><div><b></b><em></em><a href='#'>" + lstChnl[i].GetValue("DEPT_NAME") + "</a></div></li>");
                    }
                    sb.Append("</ul>");
                    sb.Append("</li>");
                }
                else
                {
                    sb.Append("<li id=\"root_0\" data=\"{rid:'0',id:'0',pid:'0',sc:0,name:'部门选择',ntype:''}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">部门选择</a></div></li>");

                }
            }
            else {
                HR_ORG objVal = new HR_ORG();
                HR_ORG objCond = new HR_ORG();
                objCond.P_ORG_ID = "0";
                objVal.OrderBy(HR_ORG.Attribute.SORT_NO, Order.Asc);
                List<HR_ORG> lstChnl = BLLTable<HR_ORG>.Factory(conn).Select(objVal, objCond);
                if (lstChnl.Count > 0)
                {
                    sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'机构部门管理',ntype:''}\" class=\"root\" exp='2'><div class=\"opened root\"><b></b><em></em><a href=\"#\">机构部门管理</a><a href='DeptManage.aspx'>刷新</a></div>");
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
                    sb.Append("<li id=\"root_0\" data=\"{id:'0',pid:'0',sc:0,name:'机构部门管理',ntype:''}\" class=\"root\"><div class='root'><b></b><em></em><a href=\"#\">机构部门管理</a><a href='DeptManage.aspx'>刷新</a></div></li>");

                }
            }
            litChnl.Text = sb.ToString();
        }
    }
}

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
public partial class HR_STATIONManage:BaseAdminPage
{
    protected string pid="0";

    HR_STATION valObj = new HR_STATION();
    HR_STATION condObj = new HR_STATION();
    List<HR_STATION> listObj = new List<HR_STATION>();
    int recount = -1;//查询总记录数
    protected string title = "";
    string ntype = "";
    protected string org = "";
    protected string dept = "";
    protected string name = "";
    private void BindList(HR_STATION condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_STATION.Attribute.STATION_ID, Order.Asc);

        #region//数据权限条件

        #endregion
        //condObj.PID = decimal.Parse(pid);
        if (org != "")
        {
            condObj.DEPT_ID = "0";
            condObj.ORG_ID = org;

        } if (dept != "")
        {
            condObj.DEPT_ID = dept;

        }

        Relation r1 = new Relation(HR_STATION.Attribute.LEVEL_ID, HR_STATION_LEVEL.Attribute.LEVEL_ID);
        Relation r2 = new Relation(HR_STATION.Attribute.TYPE_ID, HR_STATION_TYPE.Attribute.TYPE_ID);

        List<Relation> lstRelatio = new List<Relation>();
        lstRelatio.Add(r1);
        lstRelatio.Add(r2);

        HR_STATION_TYPE valType = new HR_STATION_TYPE();
        valType.TYPE_NAME = "";
        HR_STATION_LEVEL valLevel = new HR_STATION_LEVEL();
        valLevel.LEVEL_NAME = "";
        List<ITableImplement> lstTable = new List<ITableImplement>();
        lstTable.Add(valType);
        lstTable.Add(valLevel);

        List<ITableImplement> lstCond = new List<ITableImplement>();
        lstCond.Add(condObj);

        List<HR_STATION> listObj = BLLTable<HR_STATION>.Factory(conn).Select(valObj, lstRelatio, lstTable, lstCond);

        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        title = "部门的岗位信息管理";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["name"]))
        {
            name = Request["name"];
        }
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["ntype"] != null)
        {
            ntype = Request["ntype"];
        }
        if (ntype == "org") {
            org = Request["id"];
        }
        if (ntype == "dept")
        {
            dept = Request["id"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.

            aspPager.PageSize = 30;

            #endregion
            #region//数据初始化
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_STATION>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
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
public partial class HR_DEPT_MANAGERManage:BaseAdminPage
{
    HR_DEPT_MANAGER valObj = new HR_DEPT_MANAGER();
    HR_DEPT_MANAGER condObj = new HR_DEPT_MANAGER();
    List<HR_DEPT_MANAGER> listObj = new List<HR_DEPT_MANAGER>();
    protected string title = "";
    protected string deptid = "";
    protected string name = "";
    private void BindList(HR_DEPT_MANAGER condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_DEPT_MANAGER.Attribute.DEPT_ID, Order.Desc);
        condObj.DEPT_ID = deptid;

        listObj = BLLTable<HR_DEPT_MANAGER>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["name"]))
        {
            name = Request["name"];
        }
        if (!string.IsNullOrEmpty(Request["id"])) {
            deptid = Request["id"];
        }
        if (!string.IsNullOrEmpty(Request["DEPT_ID"]))
        {
            deptid = Request["DEPT_ID"];
        }
        if (!IsPostBack)
        {
            BindList(condObj);            
        }
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
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
public partial class SYS_BILL_COLITEMManage:BaseAdminPage
{

    protected int pid=0;

    SYS_BILL_COLITEM valObj = new SYS_BILL_COLITEM();
    SYS_BILL_COLITEM condObj = new SYS_BILL_COLITEM();
    List<SYS_BILL_COLITEM> listObj = new List<SYS_BILL_COLITEM>();
    protected string title = "";
    private void BindList(SYS_BILL_COLITEM condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL_COLITEM.Attribute.ITEM_ID, Order.Desc);

        condObj.COL_ID = pid;
        listObj = BLLTable<SYS_BILL_COLITEM>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        

        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["ColID"] != null)
        {
            pid = int.Parse(Request["ColID"]);
        }
        if (!IsPostBack)
        {

            BindList(condObj, 1);            

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
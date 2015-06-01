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
public partial class SYS_BILL_RELAManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_RELA valObj = new SYS_BILL_RELA();
    SYS_BILL_RELA condObj = new SYS_BILL_RELA();
    List<SYS_BILL_RELA> listObj = new List<SYS_BILL_RELA>();
    protected string title = "";
    protected int billid = 0;
    private void BindList(SYS_BILL_RELA condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL_RELA.Attribute.BILL_ID, Order.Desc);

        listObj = BLLTable<SYS_BILL_RELA>.Factory(conn).Select(valObj, condObj);
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            billid = int.Parse(Request["id"]);
        }
        title = valObj._ZhName + "管理";
        Page.Title = title;

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
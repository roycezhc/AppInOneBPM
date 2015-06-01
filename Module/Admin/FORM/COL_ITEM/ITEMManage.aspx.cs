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
public partial class WF_F_COLUMN_ITEMManage : AgileFrame.AppInOne.Common.BaseAdminPage
{


    TF_F_COLUMN_ITEM valObj = new TF_F_COLUMN_ITEM();
    TF_F_COLUMN_ITEM condObj = new TF_F_COLUMN_ITEM();
    List<TF_F_COLUMN_ITEM> listObj = new List<TF_F_COLUMN_ITEM>();
    protected string title = "";
    protected string colid = "";
    private void BindList(TF_F_COLUMN_ITEM condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Order.Desc);

        if (colid!="")
        {
            condObj.COLUMN_ID = int.Parse(colid);
            listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).Select(valObj, condObj);
            repList.DataSource = listObj;
            repList.DataBind();
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ColID"] != null)
        {
            colid = Request["ColID"];
        }
        title = valObj._ZhName + "管理";
        Page.Title = title;

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
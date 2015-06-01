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
public partial class SYS_BILL_OPRLOGManage : AgileFrame.AppInOne.Common.BaseAdminPage
{

    SYS_BILL_OPRLOG valObj = new SYS_BILL_OPRLOG();
    SYS_BILL_OPRLOG condObj = new SYS_BILL_OPRLOG();
    List<SYS_BILL_OPRLOG> listObj = new List<SYS_BILL_OPRLOG>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_BILL_OPRLOG condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL_OPRLOG.Attribute.LOG_ID, Order.Desc);

        listObj = BLLTable<SYS_BILL_OPRLOG>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 30;
            #endregion

            BindList(condObj, 1);

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL_OPRLOG>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new SYS_BILL_OPRLOG();
        if (txtTABLE_NAME.Value != "")
            condObj.Like(SYS_BILL_OPRLOG.Attribute.TABLE_NAME, Convert.ToString(txtTABLE_NAME.Value));

        if (txtDB_SRC_NAME.Value != "")
            condObj.Like(SYS_BILL_OPRLOG.Attribute.DB_SRC_NAME, Convert.ToString(txtDB_SRC_NAME.Value));

        if (txtOPR_TYPE.Value != "")
            condObj.Like(SYS_BILL_OPRLOG.Attribute.OPR_TYPE, Convert.ToString(txtOPR_TYPE.Value));


        if (txtSTATUS.Value != "")
            condObj.Like(SYS_BILL_OPRLOG.Attribute.STATUS, Convert.ToString(txtSTATUS.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL_OPRLOG>(hidCondition.Value);
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
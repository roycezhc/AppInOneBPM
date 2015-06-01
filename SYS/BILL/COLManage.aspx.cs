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
public partial class SYS_BILL_COLManage : AgileFrame.AppInOne.Common.BaseAdminPage
{

    protected string pid = "0";

    SYS_BILL_COL valObj = new SYS_BILL_COL();
    SYS_BILL_COL condObj = new SYS_BILL_COL();
    List<SYS_BILL_COL> listObj = new List<SYS_BILL_COL>();

    protected int billid = 0;
    protected string title = "";
    private void BindList(SYS_BILL_COL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL_COL.Attribute.COL_ID, Order.Desc);

        condObj.BILL_ID = billid;
        condObj.Where("COL_NAME not in('BILL_ID')");
        listObj = BLLTable<SYS_BILL_COL>.Factory(conn).Select(valObj, condObj);
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["ntype"] != null && Request["ntype"].IndexOf("bill") != -1)
        {
            billid = int.Parse(Request["id"]);
        }
        if (!IsPostBack)
        {

            #region//数据初始化

            #endregion

            BindList(condObj);

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL_COL>(hidCondition.Value);
        }
        BindList(condObj);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new SYS_BILL_COL();

        if (txtCOL_NAME.Value != "")
            condObj.Like(SYS_BILL_COL.Attribute.COL_NAME, Convert.ToString(txtCOL_NAME.Value));

        if (txtDATA_TYPE.Value != "")
            condObj.Like(SYS_BILL_COL.Attribute.DATA_TYPE, Convert.ToString(txtDATA_TYPE.Value));

        if (txtBILL_ISHEADER.Value != "")
            condObj.BILL_ISHEADER = txtBILL_ISHEADER.Value;

        if (txtFORM_SHOW.Value != "")
            condObj.FORM_SHOW = txtFORM_SHOW.Value;


        if (txtFORM_NEED.Value != "")
            condObj.FORM_NEED = txtFORM_NEED.Value;


        if (txtFORM_ONEROW.Value != "")
            condObj.FORM_ONEROW = txtFORM_ONEROW.Value;

        if (txtSEARCH_INBILL.Value != "")
            condObj.SEARCH_INBILL = txtSEARCH_INBILL.Value;

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj);
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
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

public partial class KM_KNMAList : AgileFrame.AppInOne.Common.BaseAdminPage
{
    KM_KNMA valObj = new KM_KNMA();
    KM_KNMA condObj = new KM_KNMA();
    List<KM_KNMA> listObj = new List<KM_KNMA>();
    int recount = -1;//查询总记录数
    protected string title = "";
    protected string ntype = "";
    protected string fromid = "0";
    private void BindList(KM_KNMA condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(KM_KNMA.Attribute.KNMA_ID, Order.Desc);
        //if (Request["KNMA_IDS"] != null)
        //{
        //    condObj.In(WK_TaskScore.Attribute.ScoreID, Request["KNMA_IDS"]);
        //}
        //else
        //{
        //    string dtpts = userBase.MyDeptIDS;
        //    dtpts = "'" + dtpts.Replace(",", "','") + "'";
        //    condObj.Where("(PICDptID in(" + dtpts + ") or PICEmpID like '%" + userBase.StaffID + "%')");
        //}
        listObj = BLLTable<KM_KNMA>.Factory(conn).Select(valObj, condObj);
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "管理";
        //Response.Write(preUrl);
        if (Request["ntype"] != null)
        {
            ntype = Request["ntype"];
            if (Request["id"] != null)
            {
                fromid = Request["id"];
            }
        }
        if (!IsPostBack)
        {
            BindList(condObj);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<KM_KNMA>(hidCondition.Value);
        }
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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class KM_KNMAReal : AgileFrame.AppInOne.Common.BasePage
{
    KM_KNMA valObj = new KM_KNMA();
    KM_KNMA condObj = new KM_KNMA();
    List<KM_KNMA> listObj = new List<KM_KNMA>();
    protected string hideEditLinkClsName = "";
    string mulids = "";
    string oneid = "";
    private void BindList(KM_KNMA condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(KM_KNMA.Attribute.KNMA_ID, Order.Desc);

        listObj = BLLTable<KM_KNMA>.Factory(conn).Select(valObj, condObj);     

        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["show"] != null)
        {
            hideEditLinkClsName = "hide";
        }
        if (!IsPostBack)
        {

            //if (!string.IsNullOrEmpty(Request["oneid"]))
            //{
            //    oneid = Request["oneid"];
            //    hidOneID.Value = oneid;
            //    List<SYS_USERROLE> lst = BLLTable<SYS_USERROLE>.Factory(conn).Select(SYS_USERROLE.Attribute.USER_ID, oneid);
            //    if (lst.Count > 0)
            //    {
            //        for (int i = 0; i < lst.Count; i++)
            //        {
            //            mulids += mulids == "" ? lst[i].KNMA_ID.ToString() : "," + lst[i].KNMA_ID;
            //        }
            //    }
            //}

            if (!string.IsNullOrEmpty(Request["mulids"]))
            {
                if (mulids != "") {
                    mulids += ",";
                }
                mulids += Request["mulids"];
               
            }
            hidMulIDS.Value = mulids;
            if (mulids != "")
            {
                condObj.In(KM_KNMA.Attribute.KNMA_ID, mulids);
                BindList(condObj);
            }
        }
    }
}
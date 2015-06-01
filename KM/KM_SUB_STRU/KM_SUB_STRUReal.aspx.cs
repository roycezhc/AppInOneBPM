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

public partial class KM_SUB_STRUReal : AgileFrame.AppInOne.Common.BasePage
{
    KM_SUB_STRU valObj = new KM_SUB_STRU();
    KM_SUB_STRU condObj = new KM_SUB_STRU();
    List<KM_SUB_STRU> listObj = new List<KM_SUB_STRU>();
    protected string hideEditLinkClsName = "";
    string mulids = "";
    string oneid = "";
    private void BindList(KM_SUB_STRU condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(KM_SUB_STRU.Attribute.SUB_ID, Order.Desc);

        listObj = BLLTable<KM_SUB_STRU>.Factory(conn).Select(valObj, condObj);     

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
            //            mulids += mulids == "" ? lst[i].SUB_ID.ToString() : "," + lst[i].SUB_ID;
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
                condObj.In(KM_SUB_STRU.Attribute.SUB_ID, mulids);
                BindList(condObj);
            }
        }
    }
}
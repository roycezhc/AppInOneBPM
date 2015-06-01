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

public partial class HR_STAFFReal : AgileFrame.AppInOne.Common.BasePage
{
    HR_STAFF valObj = new HR_STAFF();
    HR_STAFF condObj = new HR_STAFF();
    List<HR_STAFF> listObj = new List<HR_STAFF>();
    protected string hideEditLinkClsName = "";
    string mulids = "";
    string oneid = "";
    private void BindList(HR_STAFF condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);

        listObj = BLLTable<HR_STAFF>.Factory(conn).Select(valObj, condObj);     

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
            //            mulids += mulids == "" ? lst[i].STAFF_ID.ToString() : "," + lst[i].STAFF_ID;
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
                condObj.In(HR_STAFF.Attribute.STAFF_ID, mulids);
                BindList(condObj);
            }
        }
    }
}
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
public partial class SYS_UserRole : AgileFrame.AppInOne.Common.BasePage
{
    SYS_ROLE valObj = new SYS_ROLE();
    SYS_ROLE condObj = new SYS_ROLE();
    List<SYS_ROLE> listObj = new List<SYS_ROLE>();
    protected string hideEditLinkClsName = "";
    string mulids = "";
    string oneid = "";
    private void BindList(SYS_ROLE condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_ROLE.Attribute.ROLE_ID, Order.Desc);

        listObj = BLLTable<SYS_ROLE>.Factory(conn).Select(valObj, condObj);     

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
            if (!string.IsNullOrEmpty(Request["oneid"]))
            {
                oneid = Request["oneid"];
                hidOneID.Value = oneid;
                List<SYS_USERROLE> lst = BLLTable<SYS_USERROLE>.Factory(conn).Select(SYS_USERROLE.Attribute.USER_ID, oneid);
                if (lst.Count > 0)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        mulids += mulids == "" ? lst[i].ROLE_ID.ToString() : "," + lst[i].ROLE_ID;
                    }
                }
            }

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
                condObj.In(SYS_ROLE.Attribute.ROLE_ID, mulids);
                BindList(condObj);
            }
        }
    }
}
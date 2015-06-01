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
public partial class WF_STEP_FORM_TPLManage:BaseAdminPage
{

    V_STEP_FORM_TPL valObj = new V_STEP_FORM_TPL();
    V_STEP_FORM_TPL condObj = new V_STEP_FORM_TPL();
    List<V_STEP_FORM_TPL> listObj = new List<V_STEP_FORM_TPL>();
    protected string title = "";
    protected int stepid = 0;

    protected string formid = "0";
    private void BindList(V_STEP_FORM_TPL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(V_STEP_FORM_TPL.Attribute.STEP_FID, Order.Desc);
        
        listObj = BLLTable<V_STEP_FORM_TPL>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = "活动维护的栏目";
        Page.Title = title;
        if (Request["STEP_ID"] != null)
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        else {
            Response.Write("非法连接！");
            Response.End();
        }
        
        if (!IsPostBack)
        {
            #region//数据初始化
            WF_STEP_TPL valObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);

            WF_WFOBJECT obj = new WF_WFOBJECT();
            obj._WFID_SRC = valObj.WFID;
            List<WF_WFOBJECT> lst = BLLTable<WF_WFOBJECT>.Factory(conn).Select(new WF_WFOBJECT(), obj);
            if (lst.Count>0)
                formid = lst[0].FORM_ID.ToString();
            #endregion
            condObj.STEP_ID = stepid;
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
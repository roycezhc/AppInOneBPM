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
using AgileFrame.AppInOne.WF;
public partial class WF_CHECKER_TPLManage:BaseAdminPage
{

    WF_CHECKER_TPL valObj = new WF_CHECKER_TPL();
    WF_CHECKER_TPL condObj = new WF_CHECKER_TPL();
    List<WF_CHECKER_TPL> listObj = new List<WF_CHECKER_TPL>();
    protected int stepid = 0;
    protected int wfid=0;
    protected string title = "";
    private void BindList(WF_CHECKER_TPL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WF_CHECKER_TPL.Attribute.CHECKER_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WF_CHECKER_TPL>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["STEP_ID"]))
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化


            #endregion
            #region//数据初始化

 
            #endregion
            condObj.STEP_ID = stepid;
            BindList(condObj);            

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        condObj.STEP_ID = stepid;
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
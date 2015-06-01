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
public partial class WF_PROCESS_TPLManage:BaseAdminPage
{

    WF_PROCESS_TPL valObj = new WF_PROCESS_TPL();
    WF_PROCESS_TPL condObj = new WF_PROCESS_TPL();
    List<WF_PROCESS_TPL> listObj = new List<WF_PROCESS_TPL>();
    protected string title = "";
    protected int wfid = 0;
    private void BindList(WF_PROCESS_TPL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WF_PROCESS_TPL.Attribute.PROCID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        condObj.WFID = wfid;

        listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        

        title = valObj._ZhName + "管理";
        Page.Title = title;
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
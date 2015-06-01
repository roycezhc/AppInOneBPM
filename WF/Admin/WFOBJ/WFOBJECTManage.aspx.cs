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
public partial class WF_WFOBJECTManage:BaseAdminPage
{

    WF_WFOBJECT valObj = new WF_WFOBJECT();
    WF_WFOBJECT condObj = new WF_WFOBJECT();
    List<WF_WFOBJECT> listObj = new List<WF_WFOBJECT>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WF_WFOBJECT condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WF_WFOBJECT.Attribute.WF_OBJ_ID, Order.Desc);
        

        listObj = BLLTable<WF_WFOBJECT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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

            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.

            aspPager.PageSize = 30;

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_WFOBJECT>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WF_WFOBJECT();


        if(txtWF_OBJ_NAME.Value !="" )
            condObj.Like(WF_WFOBJECT.Attribute.WF_OBJ_NAME, Convert.ToString(txtWF_OBJ_NAME.Value));
        

        if(txtTYPE_ID.Value !="" )
            condObj.Like(WF_WFOBJECT.Attribute.TYPE_ID, Convert.ToInt32(txtTYPE_ID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.Like(WF_WFOBJECT.Attribute.STATUS, Convert.ToInt32(txtSTATUS.Value));
        
        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
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
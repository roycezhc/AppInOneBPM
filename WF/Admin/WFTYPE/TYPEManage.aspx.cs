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
public partial class WF_TYPEManage:BaseAdminPage
{

    WF_TYPE valObj = new WF_TYPE();
    WF_TYPE condObj = new WF_TYPE();
    List<WF_TYPE> listObj = new List<WF_TYPE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WF_TYPE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WF_TYPE.Attribute.TYPE_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion

        listObj = BLLTable<WF_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 30;
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_TYPE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WF_TYPE();


        if(txtTYPE_NAME.Value !="" )
            condObj.Like(WF_TYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
        
        
        if(txtCREATER.Value !="" )
            condObj.Like(WF_TYPE.Attribute.CREATER, Convert.ToString(txtCREATER.Value));
        

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
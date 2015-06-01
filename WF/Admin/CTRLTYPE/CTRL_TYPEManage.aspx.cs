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
public partial class WF_CTRL_TYPEManage:BaseAdminPage
{

    TF_CTRL_TYPE valObj = new TF_CTRL_TYPE();
    TF_CTRL_TYPE condObj = new TF_CTRL_TYPE();
    List<TF_CTRL_TYPE> listObj = new List<TF_CTRL_TYPE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(TF_CTRL_TYPE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;

            #endregion
            #region//数据初始化
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_CTRL_TYPE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_CTRL_TYPE();

        
        
        if(txtCTRL_TYPE.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));
        
        
        if(txtP_CTRL_TYPE.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.P_CTRL_TYPE, Convert.ToString(txtP_CTRL_TYPE.Value));
        
        
        if(txtCTRL_NAME.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.CTRL_NAME, Convert.ToString(txtCTRL_NAME.Value));
        
        
        if(txtEL_HTML.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.EL_HTML, Convert.ToString(txtEL_HTML.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtJS_CODE.Value !="" )
            condObj.Like(TF_CTRL_TYPE.Attribute.JS_CODE, Convert.ToString(txtJS_CODE.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_CTRL_TYPE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
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
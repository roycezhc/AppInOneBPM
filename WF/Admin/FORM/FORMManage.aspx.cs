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
public partial class WF_FORMManage:BaseAdminPage
{


    TF_FORM valObj = new TF_FORM();
    TF_FORM condObj = new TF_FORM();
    List<TF_FORM> listObj = new List<TF_FORM>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(TF_FORM condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_FORM.Attribute.FORM_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP1);
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP2);
        //hideTableColumnList.Add(TF_FORM.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP1);
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP2);
        //hideFindColumnList.Add(TF_FORM.Attribute.EXP3);
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
            condObj = JsonServiceBase.FromJson<TF_FORM>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_FORM();

        
        
        if(txtFORM_ID.Value !="" )
            condObj.Like(TF_FORM.Attribute.FORM_ID, Convert.ToInt32(txtFORM_ID.Value));
        
        
        if(txtF_NAME.Value !="" )
            condObj.Like(TF_FORM.Attribute.F_NAME, Convert.ToString(txtF_NAME.Value));
        
        
        if(txtTB_ID.Value !="" )
            condObj.Like(TF_FORM.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtTPL_EDIT.Value !="" )
            condObj.Like(TF_FORM.Attribute.TPL_EDIT, Convert.ToString(txtTPL_EDIT.Value));
        
        
        if(txtTPL_SHOW.Value !="" )
            condObj.Like(TF_FORM.Attribute.TPL_SHOW, Convert.ToString(txtTPL_SHOW.Value));
        
        
        if(txtTPL_PRINT.Value !="" )
            condObj.Like(TF_FORM.Attribute.TPL_PRINT, Convert.ToString(txtTPL_PRINT.Value));
        
        
        if(txtTPL_LIST.Value !="" )
            condObj.Like(TF_FORM.Attribute.TPL_LIST, Convert.ToString(txtTPL_LIST.Value));
        
        
        if(txtTB_IDS.Value !="" )
            condObj.Like(TF_FORM.Attribute.TB_IDS, Convert.ToString(txtTB_IDS.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_FORM>(hidCondition.Value);
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
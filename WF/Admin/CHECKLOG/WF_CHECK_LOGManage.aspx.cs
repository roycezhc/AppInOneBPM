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
public partial class WF_CHECK_LOGManage:BaseAdminPage
{

    WF_CHECK_LOG valObj = new WF_CHECK_LOG();
    WF_CHECK_LOG condObj = new WF_CHECK_LOG();
    List<WF_CHECK_LOG> listObj = new List<WF_CHECK_LOG>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WF_CHECK_LOG condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WF_CHECK_LOG.Attribute.LOG_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WF_CHECK_LOG>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_CHECK_LOG.Attribute.EXP1);
        //hideTableColumnList.Add(WF_CHECK_LOG.Attribute.EXP2);
        //hideTableColumnList.Add(WF_CHECK_LOG.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_CHECK_LOG.Attribute.EXP1);
        //hideFindColumnList.Add(WF_CHECK_LOG.Attribute.EXP2);
        //hideFindColumnList.Add(WF_CHECK_LOG.Attribute.EXP3);
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
            
            txtRESULT.Items.AddRange(FormHelper.GetListItem(WF_CHECK_LOG.Attribute.RESULT));                    
            txtCHECK_TIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_CHECK_LOG>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WF_CHECK_LOG();

        
        
        if(txtLOG_ID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.LOG_ID, Convert.ToInt32(txtLOG_ID.Value));
        
        
        if(txtWFCID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.WFID, Convert.ToInt32(txtWFCID.Value));
        
        
        if(txtPROCID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.PROCID, Convert.ToInt32(txtPROCID.Value));
        
        
        if(txtSTEP_ID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.STEP_ID, Convert.ToInt32(txtSTEP_ID.Value));
        
        
        if(txtREC_ID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.RECID, Convert.ToString(txtREC_ID.Value));
        
        
        if(txtDETAIL_ID.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.DETAIL_ID, Convert.ToString(txtDETAIL_ID.Value));
        
        
        if(txtRESULT.Value !="" )
            condObj.RESULT = Convert.ToString(txtRESULT.Value);
        
        
        if(txtCHECKER.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.CHECKER, Convert.ToString(txtCHECKER.Value));
        
        
        if(txtCHECK_TIME.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.CHECK_TIME, Convert.ToDateTime(txtCHECK_TIME.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtRESULTS.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.RESULTS, Convert.ToString(txtRESULTS.Value));
        
        
        if(txtCHECKERS.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.CHECKERS, Convert.ToString(txtCHECKERS.Value));
        
        
        if(txtCHECK_TIMES.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.CHECK_TIMES, Convert.ToString(txtCHECK_TIMES.Value));
        
        
        if(txtNOTES.Value !="" )
            condObj.Like(WF_CHECK_LOG.Attribute.NOTES, Convert.ToString(txtNOTES.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_CHECK_LOG>(hidCondition.Value);
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
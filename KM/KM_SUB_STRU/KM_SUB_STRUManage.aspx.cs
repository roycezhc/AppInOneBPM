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

public partial class KM_SUB_STRUManage : AgileFrame.AppInOne.Common.BasePage
{
    KM_SUB_STRU valObj = new KM_SUB_STRU();
    KM_SUB_STRU condObj = new KM_SUB_STRU();
    List<KM_SUB_STRU> listObj = new List<KM_SUB_STRU>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(KM_SUB_STRU condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(KM_SUB_STRU.Attribute.SUB_ID, Order.Desc);
        listObj = BLLTable<KM_SUB_STRU>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
            //aspPager.ShowInputBox = ZTYB.HZYF.WebCommon.WebCtrls.ShowInputBox.Auto;
            txtPageNum.Value = "30";
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
            condObj = JsonServiceBase.FromJson<KM_SUB_STRU>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new KM_SUB_STRU();

        
        
        if(txtSUB_ID.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_ID, Convert.ToString(txtSUB_ID.Value));
        
        
        if(txtSUB_NAME.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_NAME, Convert.ToString(txtSUB_NAME.Value));
        
        
        if(txtK_SUB_ID.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.K_SUB_ID, Convert.ToString(txtK_SUB_ID.Value));
        
        
        if(txtSUB_CONTENT.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_CONTENT, Convert.ToString(txtSUB_CONTENT.Value));
        
        
        if(txtSUB_CLASS_ID.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_CLASS_ID, Convert.ToString(txtSUB_CLASS_ID.Value));
        
        
        if(txtSUB_EA_SIGN.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_EA_SIGN, Convert.ToString(txtSUB_EA_SIGN.Value));
        
        
        if(txtSUB_AUTHOR.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_AUTHOR, Convert.ToString(txtSUB_AUTHOR.Value));
        
        
        if(txtSUB_IS_READ.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_IS_READ, Convert.ToString(txtSUB_IS_READ.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SORT_NO, Convert.ToDecimal(txtSORT_NO.Value));
        
        
        if(txtIDPATH.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.IDPATH, Convert.ToString(txtIDPATH.Value));
        
        
        if(txtKNAME.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.KNAME, Convert.ToString(txtKNAME.Value));
        
        
        if(txtSNAME.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SNAME, Convert.ToString(txtSNAME.Value));
        
        
        if(txtRNAME.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.RNAME, Convert.ToString(txtRNAME.Value));
        
        
        if(txtSUB_NUM.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUB_NUM, Convert.ToDecimal(txtSUB_NUM.Value));
        
        
        if(txtSUBOBJECT_NUM.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.SUBOBJECT_NUM, Convert.ToDecimal(txtSUBOBJECT_NUM.Value));
        
        
        if(txtUSE_FLAG.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.USE_FLAG, Convert.ToString(txtUSE_FLAG.Value));
        
        
        if(txtEXP1.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.EXP1, Convert.ToString(txtEXP1.Value));
        
        
        if(txtEXP2.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.EXP2, Convert.ToString(txtEXP2.Value));
        
        
        if(txtEXP3.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.EXP3, Convert.ToString(txtEXP3.Value));
        
        
        if(txtEXP4.Value !="" )
            condObj.Like(KM_SUB_STRU.Attribute.EXP4, Convert.ToString(txtEXP4.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<KM_SUB_STRU>(hidCondition.Value);
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
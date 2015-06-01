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

public partial class WEC_ACTIVITY_SNCODEManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_ACTIVITY_SNCODEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_ACTIVITY_SNCODEManage.aspx", path);
    }
    protected string pid="0";

    WEC_ACTIVITY_SNCODE valObj = new WEC_ACTIVITY_SNCODE();
    WEC_ACTIVITY_SNCODE condObj = new WEC_ACTIVITY_SNCODE();
    List<WEC_ACTIVITY_SNCODE> listObj = new List<WEC_ACTIVITY_SNCODE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_ACTIVITY_SNCODE condObj, int curPage)
    {
        condObj.A_ID = Convert.ToInt32(HttpUtil.GetReqStrValue("a_id"));
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_ACTIVITY_SNCODE.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WEC_ACTIVITY_SNCODE>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            //aspPager.ShowInputBox = AgileFrame.Core.WebSystem.WebCtrls.ShowInputBox.Auto;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
            
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_ACTIVITY_SNCODE.Attribute.STATUS));                    
            txtZJ_TIME.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtSY_TIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_ACTIVITY_SNCODE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_ACTIVITY_SNCODE();

        
        
        if(txtID.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtSN_CODE.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.SN_CODE, Convert.ToString(txtSN_CODE.Value));
        
        
        if(txtAWARD_TYPE.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE, Convert.ToString(txtAWARD_TYPE.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtPHONE.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
        
        
        if(txtWX_CODE.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.WX_CODE, Convert.ToString(txtWX_CODE.Value));
        
        
        if(txtZJ_TIME.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME, Convert.ToDateTime(txtZJ_TIME.Value));
        
        
        if(txtSY_TIME.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.SY_TIME, Convert.ToDateTime(txtSY_TIME.Value));
        
        
        if(txtA_ID.Value !="" )
            condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.A_ID, Convert.ToDecimal(txtA_ID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_ACTIVITY_SNCODE>(hidCondition.Value);
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
    protected void btn_Send(object sender, EventArgs e)
    {

    }
    protected void btn_Consume(object sender, EventArgs e)
    {

    }
}
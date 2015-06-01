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
public partial class SYS_BILLManage:BaseAdminPage
{

    protected string pid="0";

    SYS_BILL valObj = new SYS_BILL();
    SYS_BILL condObj = new SYS_BILL();
    List<SYS_BILL> listObj = new List<SYS_BILL>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_BILL condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_BILL.Attribute.BILL_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<SYS_BILL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_BILL.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_BILL.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_BILL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_BILL.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_BILL.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_BILL.Attribute.EXP3);
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
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
                                
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_BILL();


        if(txtBILL_NAME.Value !="" )
            condObj.Like(SYS_BILL.Attribute.BILL_NAME, Convert.ToString(txtBILL_NAME.Value));
        
        
        if(txtBILL_TYPE.Value !="" )
            condObj.Like(SYS_BILL.Attribute.BILL_TYPE, Convert.ToString(txtBILL_TYPE.Value));

        if(txtADDTIME.Value !="" )
            condObj.Like(SYS_BILL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        if(txtADDER.Value !="" )
            condObj.Like(SYS_BILL.Attribute.ADDER, Convert.ToString(txtADDER.Value));
        
        
        if(txtTABLE_NAME.Value !="" )
            condObj.Like(SYS_BILL.Attribute.TABLE_NAME, Convert.ToString(txtTABLE_NAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL>(hidCondition.Value);
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
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
public partial class HR_CHECKINOUTManage:BaseAdminPage
{

    HR_CHECKINOUT valObj = new HR_CHECKINOUT();
    HR_CHECKINOUT condObj = new HR_CHECKINOUT();
    List<HR_CHECKINOUT> listObj = new List<HR_CHECKINOUT>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_CHECKINOUT condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_CHECKINOUT.Attribute.CHECKTIME, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
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
                                
            txtCHECKTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHECKINOUT>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_CHECKINOUT();

        
        
        if(txtUSERID.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
        
        
        if(txtCHECKTIME.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.CHECKTIME, Convert.ToDateTime(txtCHECKTIME.Value));
        
        
        if(txtSTAFF_ID.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
        
        
        if(txtCHECKTYPE.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.CHECKTYPE, Convert.ToString(txtCHECKTYPE.Value));
        
        
        if(txtVERIFYCODE.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.VERIFYCODE, Convert.ToInt32(txtVERIFYCODE.Value));
        
        
        if(txtSENSORID.Value !="" )
            condObj.Like(HR_CHECKINOUT.Attribute.SENSORID, Convert.ToString(txtSENSORID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHECKINOUT>(hidCondition.Value);
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
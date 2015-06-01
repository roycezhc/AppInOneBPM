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
public partial class HR_CK_USERINFOManage:BaseAdminPage
{

    HR_CK_USERINFO valObj = new HR_CK_USERINFO();
    HR_CK_USERINFO condObj = new HR_CK_USERINFO();
    List<HR_CK_USERINFO> listObj = new List<HR_CK_USERINFO>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_CK_USERINFO condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_CK_USERINFO.Attribute.USERID, Order.Asc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        HR_STAFF otherVal = new HR_STAFF();
        otherVal.STAFF_NAME = "";
        Relation r2 = new Relation(HR_STAFF.Attribute.STAFF_ID, HR_CK_USERINFO.Attribute.STAFF_ID, RelationType.RightJoin);
        if (!string.IsNullOrEmpty(txtSTAFF_NAME.Value) || !string.IsNullOrEmpty(txtSTAFF_NO.Value))
        {
            HR_STAFF otherCon = new HR_STAFF();
            if (!string.IsNullOrEmpty(txtSTAFF_NAME.Value))
                otherCon.Like(HR_STAFF.Attribute.STAFF_NAME, txtSTAFF_NAME.Value);
            if (!string.IsNullOrEmpty(txtSTAFF_NO.Value))
                otherCon.Like(HR_STAFF.Attribute.STAFF_NO, txtSTAFF_NO.Value);
            listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, new List<Relation>(new Relation[] { r2 }), new List<ITableImplement>(new ITableImplement[] { otherVal }), new List<ITableImplement>(new ITableImplement[] { condObj, otherCon }), aspPager.PageSize, curPage, ref recount);
        }
        else
            listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, r2, otherVal, condObj, aspPager.PageSize, curPage, ref recount);      
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "20";
            aspPager.PageSize = 20;

            #endregion
            #region//数据初始化
                                
            //txtBIRTHDAY.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            //txtHIREDDAY.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CK_USERINFO>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        int uid = -1;
        condObj = new HR_CK_USERINFO();
        if (txtUSERID.Value != "" && int.TryParse(txtUSERID.Value, out uid))
            condObj.USERID = Convert.ToInt32(txtUSERID.Value);
        if (txtSTAFF_ID.Value != "" && int.TryParse(txtSTAFF_ID.Value, out uid))
            condObj.STAFF_ID = Convert.ToInt32(txtSTAFF_ID.Value);
        if (txtBADGENUMBER.Value != "")
            condObj.Like(HR_CK_USERINFO.Attribute.BADGENUMBER, txtBADGENUMBER.Value);
        if (txtSSN.Value != "")
            condObj.Like(HR_CK_USERINFO.Attribute.SSN, txtSSN.Value);
        if (txtNAME.Value != "")
            condObj.Like(HR_CK_USERINFO.Attribute.NAME, txtNAME.Value);

        hidCondition.Value = condObj.ToJson(20);
        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CK_USERINFO>(hidCondition.Value);
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
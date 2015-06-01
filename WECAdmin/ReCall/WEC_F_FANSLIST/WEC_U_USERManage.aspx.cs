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

public partial class WEC_U_USERManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_U_USERManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_U_USERManage.aspx", path);
    }
    protected string pid="0";

    WEC_U_USER valObj = new WEC_U_USER();
    WEC_U_USER condObj = new WEC_U_USER();
    List<WEC_U_USER> listObj = new List<WEC_U_USER>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_U_USER condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_U_USER.Attribute.ID, Order.Desc);
        valObj.Distinct = true;
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
        condObj.AID = Convert.ToDecimal(userBase2.Curraid);
        listObj = BLLTable<WEC_U_USER>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_U_USER.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_U_USER.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_U_USER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_U_USER.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_U_USER.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_U_USER.Attribute.EXP3);
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
            //#region//数据初始化
                                
            //txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            //#endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_U_USER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_U_USER();

        
        
        //if(txtID.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        //if(txtOPENID.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.OPENID, Convert.ToString(txtOPENID.Value));
        
        
        //if(txtUSERNAME.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.USERNAME, Convert.ToString(txtUSERNAME.Value));
        
        
        //if(txtSEX.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.SEX, Convert.ToString(txtSEX.Value));
        
        
        //if(txtCOMMENT.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.COMMENT, Convert.ToString(txtCOMMENT.Value));
        
        
        //if(txtADDTIME.Value !="" )
        //    condObj.Like(WEC_U_USER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_U_USER>(hidCondition.Value);
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
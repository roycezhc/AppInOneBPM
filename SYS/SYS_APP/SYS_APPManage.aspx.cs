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

public partial class SYS_APPManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_APPManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("SYS_APPManage.aspx", path);
    }
    protected string pid="0";

    SYS_APP valObj = new SYS_APP();
    SYS_APP condObj = new SYS_APP();
    List<SYS_APP> listObj = new List<SYS_APP>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_APP condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_APP.Attribute.APP_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_APP.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_APP.Attribute.EXP3);
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
            
            txtIsBigSystem.Items.AddRange(FormHelper.GetListItem(SYS_APP.Attribute.IsBigSystem));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_APP>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_APP();

        
        
        if(txtAPP_ID.Value != "" )
            condObj.Like(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
        
        
        if(txtAPP_NAME.Value != "" )
            condObj.Like(SYS_APP.Attribute.APP_NAME, Convert.ToString(txtAPP_NAME.Value));
        
        
        if(txtAPP_LABEL.Value != "" )
            condObj.Like(SYS_APP.Attribute.APP_LABEL, Convert.ToString(txtAPP_LABEL.Value));
        
        
        if(txtDEFAULT_URL.Value != "" )
            condObj.Like(SYS_APP.Attribute.DEFAULT_URL, Convert.ToString(txtDEFAULT_URL.Value));
        
        
        if(txtDEFAULT_URL_NAME.Value != "" )
            condObj.Like(SYS_APP.Attribute.DEFAULT_URL_NAME, Convert.ToString(txtDEFAULT_URL_NAME.Value));
        
        
        if(txtIsBigSystem.Value != "" )
            condObj.IsBigSystem = Convert.ToBoolean(txtIsBigSystem.Value);
        
        
        if(txtNote.Value != "" )
            condObj.Like(SYS_APP.Attribute.Note, Convert.ToString(txtNote.Value));
        
        
        if(txtAPP_IMG.Value != "" )
            condObj.Like(SYS_APP.Attribute.APP_IMG, Convert.ToString(txtAPP_IMG.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_APP>(hidCondition.Value);
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
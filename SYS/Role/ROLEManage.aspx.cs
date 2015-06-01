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
public partial class SYS_ROLE_ManageMulti : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("ROLEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("ROLEManage.aspx", path);
    }
    SYS_ROLE valObj = new SYS_ROLE();
    SYS_ROLE condObj = new SYS_ROLE();
    List<SYS_ROLE> listObj = new List<SYS_ROLE>();
    /// <summary>查询总记录数</summary>
    int recount = -1;
    protected string title = new SYS_ROLE()._ZhName;
    /// <summary>操作结果计数</summary>
    public int count = 0;
    /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    
    protected Dictionary<string, string> CP_TYPE_CODEDict = new Dictionary<string, string>();
    protected Dictionary<string, string> STATUS_CODEDict = new Dictionary<string, string>();

    protected string pid = "0";
    private void BindList(SYS_ROLE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_ROLE.Attribute.ROLE_ID, Order.Desc);

        condObj.PID = decimal.Parse(pid);
        listObj = BLLTable<SYS_ROLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);

        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount; hidCondition.Value = condObj.ToJson(20);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        string title = valObj._ZhName;
        if (!IsPostBack)
        {
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            aspPager.PageSize = 30;

            BindList(condObj, 1);
            aspPager.CurrentPageIndex = 1;
        }

    }


    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_ROLE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_ROLE();
        
        if(txtROLE_NAME.Value !="" )
            condObj.Like(SYS_ROLE.Attribute.ROLE_NAME, Convert.ToString(txtROLE_NAME.Value));
        if(txtCREATER.Value !="" )
            condObj.Like(SYS_ROLE.Attribute.CREATER, Convert.ToString(txtCREATER.Value));
        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }
    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_ROLE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {}
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
   
}
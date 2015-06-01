using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class cmd123wj_ROLEManage_crm_wj : AgileFrame.AppInOne.Common.BaseAdminPage//System.Web.UI.Page
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
    public string listHtml = "";
    protected string pid = "0";
    private void BindList(SYS_ROLE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_ROLE.Attribute.ROLE_ID, Order.Desc);
        
        condObj.PID = decimal.Parse(pid);
        listObj = BLLTable<SYS_ROLE>.Factory(conn).SelectByPage(valObj, condObj, 20, curPage, ref recount);

        cdcatalog.DataSource = listObj;
        cdcatalog.DataBind();
       // aspPager.RecordCount = recount; hidCondition.Value = condObj.ToJson(20);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        string title = valObj._ZhName;
        loadselect();
        if (!IsPostBack)
        {
           
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            //aspPager.PageSize = 30;

            BindList(condObj, 1);
           // aspPager.CurrentPageIndex = 1;
        }

    }
    private void loadselect()
    {
        List<SYS_ROLE> list = BLLTable<SYS_ROLE>.Select();
        //<div class="smowner-scope-div" onmouseover="this.className='smowner-scope-over';" onmouseout="this.className='smowner-scope-div'" onclick="setViewScopeinfo_click('listviewscope','all_to_me','12','Accounts');" style="color:#32A636">所有客户</div>
        listHtml = "<div class=\"smowner-scope-div\" onmouseover=\"this.className='smowner-scope-over';\" onmouseout=\"this.className='smowner-scope-div'\" onclick=\"setViewScopeinfo_click('listviewscope','current_user','12','Accounts');\" style=\"color:\">所有选项</div> ";
        foreach (SYS_ROLE sy in list)
        {
            listHtml += "<div class=\"smowner-scope-div\" onmouseover=\"this.className='smowner-scope-over';\" onmouseout=\"this.className='smowner-scope-div'\" onclick=\"setViewScopeinfo_click('listviewscope','current_user','12','Accounts');\" style=\"color:\">{logoUrl}</div> ".Replace("{logoUrl}", sy.ROLE_NAME.ToString());
        }
        //alert(listHtml);
    }
   

   
   
}
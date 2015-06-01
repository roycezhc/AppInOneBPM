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

public partial class V_DEVICELISTManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("V_DEVICELISTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("V_DEVICELISTManage.aspx", path);
    }
    protected string pid="0";

    V_DEVICELIST valObj = new V_DEVICELIST();
    V_DEVICELIST condObj = new V_DEVICELIST();
    List<V_DEVICELIST> listObj = new List<V_DEVICELIST>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(V_DEVICELIST condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(V_DEVICELIST.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP1);
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP2);
        //hideTableColumnList.Add(V_DEVICELIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP1);
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP2);
        //hideFindColumnList.Add(V_DEVICELIST.Attribute.EXP3);
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
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_DEVICELIST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new V_DEVICELIST();

        
        
        if(txtV_DEVICELIST_ID.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.ID, Convert.ToDecimal(txtV_DEVICELIST_ID.Value));
        
        
        if(txtV_DEVICELIST_USER_ID.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.USER_ID, Convert.ToDecimal(txtV_DEVICELIST_USER_ID.Value));
        
        
        if(txtV_DEVICELIST_DEVICE_ID.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.DEVICE_ID, Convert.ToString(txtV_DEVICELIST_DEVICE_ID.Value));
        
        
        if(txtV_DEVICELIST_KIND.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.KIND, Convert.ToInt32(txtV_DEVICELIST_KIND.Value));
        
        
        if(txtV_DEVICELIST_DEBUG.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.DEBUG, Convert.ToInt32(txtV_DEVICELIST_DEBUG.Value));
        
        
        if(txtV_DEVICELIST_STATUS.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.STATUS, Convert.ToInt32(txtV_DEVICELIST_STATUS.Value));
        
        
        if(txtV_DEVICELIST_AF_ADDTIEM.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.AF_ADDTIEM, Convert.ToDateTime(txtV_DEVICELIST_AF_ADDTIEM.Value));
        
        
        if(txtV_DEVICELIST_AF_EDITTIME.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.AF_EDITTIME, Convert.ToDateTime(txtV_DEVICELIST_AF_EDITTIME.Value));
        
        
        if(txtV_DEVICELIST_TOKEN_ID.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.TOKEN_ID, Convert.ToString(txtV_DEVICELIST_TOKEN_ID.Value));
        
        
        if(txtV_DEVICELIST_STAFF_NAME.Value != "" )
            condObj.Like(V_DEVICELIST.Attribute.STAFF_NAME, Convert.ToString(txtV_DEVICELIST_STAFF_NAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_DEVICELIST>(hidCondition.Value);
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
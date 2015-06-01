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

public partial class V_DEVICELISTSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("V_DEVICELISTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("V_DEVICELISTSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    V_DEVICELIST valObj = new V_DEVICELIST();
    V_DEVICELIST condObj = new V_DEVICELIST();
    List<V_DEVICELIST> listObj = new List<V_DEVICELIST>();
    int recount = -1;
    protected string title = "";
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
        //多级数据表页面才用到
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<V_DEVICELIST>(hidCondition.Value);
            }
            listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
        {
            condObj = new V_DEVICELIST();

            
            
            if(txtV_DEVICELIST_ID.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.ID, Convert.ToDecimal(txtV_DEVICELIST_ID.Value));
            
            
            if(txtV_DEVICELIST_USER_ID.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.USER_ID, Convert.ToDecimal(txtV_DEVICELIST_USER_ID.Value));
            
            
            if(txtV_DEVICELIST_DEVICE_ID.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.DEVICE_ID, Convert.ToString(txtV_DEVICELIST_DEVICE_ID.Value));
            
            
            if(txtV_DEVICELIST_KIND.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.KIND, Convert.ToInt32(txtV_DEVICELIST_KIND.Value));
            
            
            if(txtV_DEVICELIST_DEBUG.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.DEBUG, Convert.ToInt32(txtV_DEVICELIST_DEBUG.Value));
            
            
            if(txtV_DEVICELIST_STATUS.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.STATUS, Convert.ToInt32(txtV_DEVICELIST_STATUS.Value));
            
            
            if(txtV_DEVICELIST_AF_ADDTIEM.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.AF_ADDTIEM, Convert.ToDateTime(txtV_DEVICELIST_AF_ADDTIEM.Value));
            
            
            if(txtV_DEVICELIST_AF_EDITTIME.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.AF_EDITTIME, Convert.ToDateTime(txtV_DEVICELIST_AF_EDITTIME.Value));
            
            
            if(txtV_DEVICELIST_TOKEN_ID.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.TOKEN_ID, Convert.ToString(txtV_DEVICELIST_TOKEN_ID.Value));
            
            
            if(txtV_DEVICELIST_STAFF_NAME.Value !="" )
                condObj.Like(V_DEVICELIST.Attribute.STAFF_NAME, Convert.ToString(txtV_DEVICELIST_STAFF_NAME.Value));

            listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        #region//多级数据表页面才用到，取消注释
        //pid = Request[hidSelID.Name];
        //V_DEVICELIST valObj = BLLTable<V_DEVICELIST>.Factory(conn).GetRowData(V_DEVICELIST.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("V_DEVICELISTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<V_DEVICELIST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

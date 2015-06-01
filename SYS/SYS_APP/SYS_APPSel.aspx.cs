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

public partial class SYS_APPSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_APPSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_APPSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    SYS_APP valObj = new SYS_APP();
    SYS_APP condObj = new SYS_APP();
    List<SYS_APP> listObj = new List<SYS_APP>();
    int recount = -1;
    protected string title = "";
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
                listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_APP>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_APP();

            
            
            if(txtAPP_ID.Value !="" )
                condObj.Like(SYS_APP.Attribute.APP_ID, Convert.ToString(txtAPP_ID.Value));
            
            
            if(txtAPP_NAME.Value !="" )
                condObj.Like(SYS_APP.Attribute.APP_NAME, Convert.ToString(txtAPP_NAME.Value));
            
            
            if(txtAPP_LABEL.Value !="" )
                condObj.Like(SYS_APP.Attribute.APP_LABEL, Convert.ToString(txtAPP_LABEL.Value));
            
            
            if(txtDEFAULT_URL.Value !="" )
                condObj.Like(SYS_APP.Attribute.DEFAULT_URL, Convert.ToString(txtDEFAULT_URL.Value));
            
            
            if(txtDEFAULT_URL_NAME.Value !="" )
                condObj.Like(SYS_APP.Attribute.DEFAULT_URL_NAME, Convert.ToString(txtDEFAULT_URL_NAME.Value));
            
            
            if(txtIsBigSystem.Value !="" )
                condObj.IsBigSystem = Convert.ToBoolean(txtIsBigSystem.Value);
            
            
            if(txtNote.Value !="" )
                condObj.Like(SYS_APP.Attribute.Note, Convert.ToString(txtNote.Value));
            
            
            if(txtAPP_IMG.Value !="" )
                condObj.Like(SYS_APP.Attribute.APP_IMG, Convert.ToString(txtAPP_IMG.Value));

            listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_APP valObj = BLLTable<SYS_APP>.Factory(conn).GetRowData(SYS_APP.Attribute.APP_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_APPSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_APP>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

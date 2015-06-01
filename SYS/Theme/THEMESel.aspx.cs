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
public partial class SYS_THEMESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_THEMESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_THEMESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    SYS_THEME valObj = new SYS_THEME();
    SYS_THEME condObj = new SYS_THEME();
    List<SYS_THEME> listObj = new List<SYS_THEME>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_THEME.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_THEME.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_THEME.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_THEME.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_THEME.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_THEME.Attribute.EXP3);
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
                listObj = BLLTable<SYS_THEME>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_THEME>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_THEME>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_THEME();

            
            
            if(txtTHEME_ID.Value !="" )
                condObj.Like(SYS_THEME.Attribute.THEME_ID, Convert.ToInt32(txtTHEME_ID.Value));
            
            
            if(txtTHEME_NAME.Value !="" )
                condObj.Like(SYS_THEME.Attribute.THEME_NAME, Convert.ToString(txtTHEME_NAME.Value));
            
            
            if(txtSYS_NAME.Value !="" )
                condObj.Like(SYS_THEME.Attribute.SYS_NAME, Convert.ToString(txtSYS_NAME.Value));
            
            
            if(txtLOGIN_TIT.Value !="" )
                condObj.Like(SYS_THEME.Attribute.LOGIN_TIT, Convert.ToString(txtLOGIN_TIT.Value));
            
            
            if(txtLOGIN_HTML.Value !="" )
                condObj.Like(SYS_THEME.Attribute.LOGIN_HTML, Convert.ToString(txtLOGIN_HTML.Value));
            
            
            if(txtTECH_DES.Value !="" )
                condObj.Like(SYS_THEME.Attribute.TECH_DES, Convert.ToString(txtTECH_DES.Value));
            
            
            if(txtRIGHT_DES.Value !="" )
                condObj.Like(SYS_THEME.Attribute.RIGHT_DES, Convert.ToString(txtRIGHT_DES.Value));
            
            
            if(txtVERSION.Value !="" )
                condObj.Like(SYS_THEME.Attribute.VERSION, Convert.ToString(txtVERSION.Value));

            listObj = BLLTable<SYS_THEME>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_THEME valObj = BLLTable<SYS_THEME>.Factory(conn).GetRowData(SYS_THEME.Attribute.THEME_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_THEMESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_THEME>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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
public partial class SYS_BILL_TYPESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_TYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_BILL_TYPESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    SYS_BILL_TYPE valObj = new SYS_BILL_TYPE();
    SYS_BILL_TYPE condObj = new SYS_BILL_TYPE();
    List<SYS_BILL_TYPE> listObj = new List<SYS_BILL_TYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_BILL_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_BILL_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_BILL_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_BILL_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_BILL_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_BILL_TYPE.Attribute.EXP3);
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
                listObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_BILL_TYPE>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_BILL_TYPE();

            
            
            if(txtTYPE_ID.Value !="" )
                condObj.Like(SYS_BILL_TYPE.Attribute.TYPE_ID, Convert.ToInt32(txtTYPE_ID.Value));
            
            
            if(txtTYPE_NAME.Value !="" )
                condObj.Like(SYS_BILL_TYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
            
            
            if(txtTYPE_DES.Value !="" )
                condObj.Like(SYS_BILL_TYPE.Attribute.TYPE_DES, Convert.ToString(txtTYPE_DES.Value));
            
            
            if(txtBILL_ID.Value !="" )
                condObj.Like(SYS_BILL_TYPE.Attribute.BILL_ID, Convert.ToInt32(txtBILL_ID.Value));

            listObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_BILL_TYPE valObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).GetRowData(SYS_BILL_TYPE.Attribute.TYPE_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_TYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_BILL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

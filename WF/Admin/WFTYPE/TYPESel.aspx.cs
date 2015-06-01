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
public partial class WF_TYPESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WF_TYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WF_TYPESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WF_TYPE valObj = new WF_TYPE();
    WF_TYPE condObj = new WF_TYPE();
    List<WF_TYPE> listObj = new List<WF_TYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (valObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            valObj.af_PageBy(WF_TYPE.Attribute.TYPE_ID, Order.Desc);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(WF_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(WF_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(WF_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(WF_TYPE.Attribute.EXP3);
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
                listObj = BLLTable<WF_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WF_TYPE>(hidCondition.Value);
            }
            listObj = BLLTable<WF_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WF_TYPE();

            if(txtTYPE_NAME.Value !="" )
                condObj.Like(WF_TYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
            
            
            if(txtCREATER.Value !="" )
                condObj.Like(WF_TYPE.Attribute.CREATER, Convert.ToString(txtCREATER.Value));

            listObj = BLLTable<WF_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WF_TYPE valObj = BLLTable<WF_TYPE>.Factory(conn).GetRowData(WF_TYPE.Attribute.TYPE_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WF_TYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WF_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

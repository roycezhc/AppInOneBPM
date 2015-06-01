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

public partial class Ec_tabSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_tabSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("Ec_tabSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    Ec_tab valObj = new Ec_tab();
    Ec_tab condObj = new Ec_tab();
    List<Ec_tab> listObj = new List<Ec_tab>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP3);
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
                listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_tab>(hidCondition.Value);
            }
            listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new Ec_tab();

            
            
            if(txtTabid.Value !="" )
                condObj.Like(Ec_tab.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
            
            
            if(txtName.Value !="" )
                condObj.Like(Ec_tab.Attribute.Name, Convert.ToString(txtName.Value));
            
            
            if(txtPresence.Value !="" )
                condObj.Like(Ec_tab.Attribute.Presence, Convert.ToInt32(txtPresence.Value));
            
            
            if(txtTabsequence.Value !="" )
                condObj.Like(Ec_tab.Attribute.Tabsequence, Convert.ToInt32(txtTabsequence.Value));
            
            
            if(txtTablabel.Value !="" )
                condObj.Like(Ec_tab.Attribute.Tablabel, Convert.ToString(txtTablabel.Value));
            
            
            if(txtModifiedby.Value !="" )
                condObj.Like(Ec_tab.Attribute.Modifiedby, Convert.ToInt32(txtModifiedby.Value));
            
            
            if(txtModifiedtime.Value !="" )
                condObj.Like(Ec_tab.Attribute.Modifiedtime, Convert.ToInt32(txtModifiedtime.Value));
            
            
            if(txtCustomized.Value !="" )
                condObj.Like(Ec_tab.Attribute.Customized, Convert.ToInt32(txtCustomized.Value));
            
            
            if(txtReportable.Value !="" )
                condObj.Like(Ec_tab.Attribute.Reportable, Convert.ToInt32(txtReportable.Value));

            listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //Ec_tab valObj = BLLTable<Ec_tab>.Factory(conn).GetRowData(Ec_tab.Attribute.Tabid, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("Ec_tabSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

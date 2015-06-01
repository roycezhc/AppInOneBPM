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

public partial class Ec_blocksSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_blocksSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("Ec_blocksSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    Ec_blocks valObj = new Ec_blocks();
    Ec_blocks condObj = new Ec_blocks();
    List<Ec_blocks> listObj = new List<Ec_blocks>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP3);
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
                listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_blocks>(hidCondition.Value);
            }
            listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new Ec_blocks();

            
            
            if(txtBlockid.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Blockid, Convert.ToInt32(txtBlockid.Value));
            
            
            if(txtTabid.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
            
            
            if(txtBlocklabel.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Blocklabel, Convert.ToString(txtBlocklabel.Value));
            
            
            if(txtSequence.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
            
            
            if(txtShow_title.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Show_title, Convert.ToInt32(txtShow_title.Value));
            
            
            if(txtVisible.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Visible, Convert.ToInt32(txtVisible.Value));
            
            
            if(txtCreate_view.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Create_view, Convert.ToInt32(txtCreate_view.Value));
            
            
            if(txtEdit_view.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Edit_view, Convert.ToInt32(txtEdit_view.Value));
            
            
            if(txtDetail_view.Value !="" )
                condObj.Like(Ec_blocks.Attribute.Detail_view, Convert.ToInt32(txtDetail_view.Value));

            listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //Ec_blocks valObj = BLLTable<Ec_blocks>.Factory(conn).GetRowData(Ec_blocks.Attribute.Blockid, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("Ec_blocksSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

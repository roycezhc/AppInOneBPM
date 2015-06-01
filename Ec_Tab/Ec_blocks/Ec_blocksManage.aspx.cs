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

public partial class Ec_blocksManage : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_blocksManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("Ec_blocksManage.aspx", path);
    }
    protected string pid = "0";

    Ec_blocks valObj = new Ec_blocks();
    Ec_blocks condObj = new Ec_blocks();
    List<Ec_blocks> listObj = new List<Ec_blocks>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(Ec_blocks condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(Ec_blocks.Attribute.Blockid, Order.Desc);

        #region//数据权限条件

        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

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
            condObj = JsonServiceBase.FromJson<Ec_blocks>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new Ec_blocks();



        if (txtBlockid.Value != "")
            condObj.Like(Ec_blocks.Attribute.Blockid, Convert.ToInt32(txtBlockid.Value));


        if (txtTabid.Value != "")
            condObj.Like(Ec_blocks.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));


        if (txtBlocklabel.Value != "")
            condObj.Like(Ec_blocks.Attribute.Blocklabel, Convert.ToString(txtBlocklabel.Value));


        if (txtSequence.Value != "")
            condObj.Like(Ec_blocks.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));


        if (txtShow_title.Value != "")
            condObj.Like(Ec_blocks.Attribute.Show_title, Convert.ToInt32(txtShow_title.Value));


        if (txtVisible.Value != "")
            condObj.Like(Ec_blocks.Attribute.Visible, Convert.ToInt32(txtVisible.Value));


        if (txtCreate_view.Value != "")
            condObj.Like(Ec_blocks.Attribute.Create_view, Convert.ToInt32(txtCreate_view.Value));


        if (txtEdit_view.Value != "")
            condObj.Like(Ec_blocks.Attribute.Edit_view, Convert.ToInt32(txtEdit_view.Value));


        if (txtDetail_view.Value != "")
            condObj.Like(Ec_blocks.Attribute.Detail_view, Convert.ToInt32(txtDetail_view.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_blocks>(hidCondition.Value);
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
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

public partial class SYS_GUSETBOOKSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_GUSETBOOKSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_GUSETBOOKSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    SYS_GUSETBOOK valObj = new SYS_GUSETBOOK();
    SYS_GUSETBOOK condObj = new SYS_GUSETBOOK();
    List<SYS_GUSETBOOK> listObj = new List<SYS_GUSETBOOK>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
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
                listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_GUSETBOOK>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_GUSETBOOK();

            
            
            if(txtID.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtTYPE.Value !="" )
                condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
            
            
            if(txtMEMO.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.MEMO, Convert.ToString(txtMEMO.Value));
            
            
            if(txtEMAIL.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
            
            
            if(txtMOBIL.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.MOBIL, Convert.ToString(txtMOBIL.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtANSWER.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.ANSWER, Convert.ToString(txtANSWER.Value));
            
            
            if(txtUSERNAME.Value !="" )
                condObj.Like(SYS_GUSETBOOK.Attribute.USERNAME, Convert.ToString(txtUSERNAME.Value));

            listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_GUSETBOOK valObj = BLLTable<SYS_GUSETBOOK>.GetRowData(SYS_GUSETBOOK.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_GUSETBOOKSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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

public partial class WEC_ACTIVITY_SNCODESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_ACTIVITY_SNCODESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_ACTIVITY_SNCODESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_ACTIVITY_SNCODE valObj = new WEC_ACTIVITY_SNCODE();
    WEC_ACTIVITY_SNCODE condObj = new WEC_ACTIVITY_SNCODE();
    List<WEC_ACTIVITY_SNCODE> listObj = new List<WEC_ACTIVITY_SNCODE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_ACTIVITY_SNCODE.Attribute.EXP3);
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
                listObj = BLLTable<WEC_ACTIVITY_SNCODE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_ACTIVITY_SNCODE>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_ACTIVITY_SNCODE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_ACTIVITY_SNCODE();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtSN_CODE.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.SN_CODE, Convert.ToString(txtSN_CODE.Value));
            
            
            if(txtAWARD_TYPE.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE, Convert.ToString(txtAWARD_TYPE.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtPHONE.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
            
            
            if(txtWX_CODE.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.WX_CODE, Convert.ToString(txtWX_CODE.Value));
            
            
            if(txtZJ_TIME.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME, Convert.ToDateTime(txtZJ_TIME.Value));
            
            
            if(txtSY_TIME.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.SY_TIME, Convert.ToDateTime(txtSY_TIME.Value));
            
            
            if(txtA_ID.Value !="" )
                condObj.Like(WEC_ACTIVITY_SNCODE.Attribute.A_ID, Convert.ToDecimal(txtA_ID.Value));

            listObj = BLLTable<WEC_ACTIVITY_SNCODE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_ACTIVITY_SNCODE valObj = BLLTable<WEC_ACTIVITY_SNCODE>.GetRowData(WEC_ACTIVITY_SNCODE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_ACTIVITY_SNCODESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_ACTIVITY_SNCODE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

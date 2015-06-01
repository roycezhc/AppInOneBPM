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

public partial class WEC_CUSTOM_CATEBANNERSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_CATEBANNERSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CUSTOM_CATEBANNERSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_CUSTOM_CATEBANNER valObj = new WEC_CUSTOM_CATEBANNER();
    WEC_CUSTOM_CATEBANNER condObj = new WEC_CUSTOM_CATEBANNER();
    List<WEC_CUSTOM_CATEBANNER> listObj = new List<WEC_CUSTOM_CATEBANNER>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CUSTOM_CATEBANNER>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CUSTOM_CATEBANNER();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtPIC_URL.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
            
            
            if(txtOUT_URL.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL, Convert.ToString(txtOUT_URL.Value));
            
            
            if(txtSORT_ID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID, Convert.ToInt32(txtSORT_ID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CUSTOM_CATEBANNER valObj = BLLTable<WEC_CUSTOM_CATEBANNER>.GetRowData(WEC_CUSTOM_CATEBANNER.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_CATEBANNERSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

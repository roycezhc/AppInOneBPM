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
public partial class WF_PROCESS_TPLSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_PROCESS_TPL valObj = new WF_PROCESS_TPL();
    WF_PROCESS_TPL condObj = new WF_PROCESS_TPL();
    List<WF_PROCESS_TPL> listObj = new List<WF_PROCESS_TPL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        valObj.af_PageBy(WF_PROCESS_TPL.Attribute.GUID, Order.Desc);
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP1);
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP2);
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP1);
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP2);
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP3);
        #endregion

        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WF_PROCESS_TPL>(hidCondition.Value);
            }
            listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WF_PROCESS_TPL();

            
            
            if(txtPROCID.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.PROCID, Convert.ToInt32(txtPROCID.Value));
            
            
            if(txtPROC_NAME.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.PROC_NAME, Convert.ToString(txtPROC_NAME.Value));
            
            
            if(txtWFCID.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.WFID, Convert.ToString(txtWFCID.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtEDITIME.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.EDITIME, Convert.ToDateTime(txtEDITIME.Value));
            
            
            if(txtGUID.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.GUID, Convert.ToString(txtGUID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToString(txtSTATUS.Value);
            
            
            if(txtSHOW_CONDITION.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.CONDITION, Convert.ToString(txtSHOW_CONDITION.Value));
            
            
            if(txtSHOW_FORMULA.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.FORMULAR, Convert.ToString(txtSHOW_FORMULA.Value));
            
            
            if(txtNOTE.Value !="" )
                condObj.Like(WF_PROCESS_TPL.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

            listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WF_PROCESS_TPL valObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WF_PROCESS_TPLSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

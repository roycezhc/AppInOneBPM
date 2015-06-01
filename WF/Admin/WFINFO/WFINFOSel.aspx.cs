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
public partial class WF_INFOSel : AgileFrame.AppInOne.Common.BaseAdminPage
{

    WF_INFO valObj = new WF_INFO();
    WF_INFO condObj = new WF_INFO();
    List<WF_INFO> listObj = new List<WF_INFO>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        valObj.af_PageBy(WF_INFO.Attribute.FORM_ID, Order.Desc);
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP1);
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP2);
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP1);
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP2);
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP3);
        #endregion
        //多级数据表页面才用到

        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<WF_INFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WF_INFO>(hidCondition.Value);
            }
            listObj = BLLTable<WF_INFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WF_INFO();

            
            
            if(txtWFCID.Value !="" )
                condObj.Like(WF_INFO.Attribute.WFID, Convert.ToInt32(txtWFCID.Value));
            
            
            if(txtWFCNAME.Value !="" )
                condObj.Like(WF_INFO.Attribute.WFCNAME, Convert.ToString(txtWFCNAME.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WF_INFO.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtEDITIME.Value !="" )
                condObj.Like(WF_INFO.Attribute.EDITIME, Convert.ToDateTime(txtEDITIME.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToString(txtSTATUS.Value);
            
            
            if(txtUSE_LIMIT.Value !="" )
                condObj.USE_LIMIT = Convert.ToString(txtUSE_LIMIT.Value);

            if(txtNOTE.Value !="" )
                condObj.Like(WF_INFO.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

            listObj = BLLTable<WF_INFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WF_INFO valObj = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WF_INFOSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WF_INFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

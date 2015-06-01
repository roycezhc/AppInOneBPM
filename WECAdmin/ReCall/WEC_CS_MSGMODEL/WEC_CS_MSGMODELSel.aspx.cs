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

public partial class WEC_CS_MSGMODELSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_MSGMODELSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CS_MSGMODELSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_CS_MSGMODEL valObj = new WEC_CS_MSGMODEL();
    WEC_CS_MSGMODEL condObj = new WEC_CS_MSGMODEL();
    List<WEC_CS_MSGMODEL> listObj = new List<WEC_CS_MSGMODEL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CS_MSGMODEL>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CS_MSGMODEL();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_CS_MSGMODEL.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_CS_MSGMODEL.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_CS_MSGMODEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtMODELCONTENT.Value !="" )
                condObj.Like(WEC_CS_MSGMODEL.Attribute.MODELCONTENT, Convert.ToString(txtMODELCONTENT.Value));

            listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CS_MSGMODEL valObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).GetRowData(WEC_CS_MSGMODEL.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_MSGMODELSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

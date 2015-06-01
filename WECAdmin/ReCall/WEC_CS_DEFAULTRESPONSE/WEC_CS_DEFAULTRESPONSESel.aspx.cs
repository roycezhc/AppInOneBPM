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

public partial class WEC_CS_DEFAULTRESPONSESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_DEFAULTRESPONSESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CS_DEFAULTRESPONSESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_CS_DEFAULTRESPONSE valObj = new WEC_CS_DEFAULTRESPONSE();
    WEC_CS_DEFAULTRESPONSE condObj = new WEC_CS_DEFAULTRESPONSE();
    List<WEC_CS_DEFAULTRESPONSE> listObj = new List<WEC_CS_DEFAULTRESPONSE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CS_DEFAULTRESPONSE>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CS_DEFAULTRESPONSE();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtSTARTTIME.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME, Convert.ToDateTime(txtSTARTTIME.Value));
            
            
            if(txtENDTIME.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME, Convert.ToDateTime(txtENDTIME.Value));
            
            
            if(txtMSGCONTENT.Value !="" )
                condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT, Convert.ToString(txtMSGCONTENT.Value));

            listObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CS_DEFAULTRESPONSE valObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).GetRowData(WEC_CS_DEFAULTRESPONSE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_DEFAULTRESPONSESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

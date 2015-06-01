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

public partial class WEC_PUBLICLISTSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_PUBLICLISTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_PUBLICLISTSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_PUBLICLIST valObj = new WEC_PUBLICLIST();
    WEC_PUBLICLIST condObj = new WEC_PUBLICLIST();
    List<WEC_PUBLICLIST> listObj = new List<WEC_PUBLICLIST>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
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
                listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_PUBLICLIST>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_PUBLICLIST();

            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtUSER_ID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));
            
            
            if(txtPLC_NAME.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.PLC_NAME, Convert.ToString(txtPLC_NAME.Value));
            
            
            if(txtPLC_SOURCEID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.PLC_SOURCEID, Convert.ToString(txtPLC_SOURCEID.Value));
            
            
            if(txtWECHAT_ID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.WECHAT_ID, Convert.ToString(txtWECHAT_ID.Value));
            
            
            if(txtAVATAR_URL.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.AVATAR_URL, Convert.ToString(txtAVATAR_URL.Value));
            
            
            if(txtAPI_KEY.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.API_KEY, Convert.ToString(txtAPI_KEY.Value));
            
            
            if(txtTOKEN.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.TOKEN, Convert.ToString(txtTOKEN.Value));
            
            
            if(txtLOCATION.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.LOCATION, Convert.ToString(txtLOCATION.Value));
            
            
            if(txtEMAIL.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
            
            
            if(txtFUNS.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.FUNS, Convert.ToInt32(txtFUNS.Value));
            
            
            if(txtTYPE.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.TYPE, Convert.ToInt32(txtTYPE.Value));
            
            
            if(txtSTART_DAY.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.START_DAY, Convert.ToDateTime(txtSTART_DAY.Value));
            
            
            if(txtEND_DAY.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.END_DAY, Convert.ToDateTime(txtEND_DAY.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.STATUS, Convert.ToInt32(txtSTATUS.Value));
            
            
            if(txtPACKAGE_ID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.PACKAGE_ID, Convert.ToDecimal(txtPACKAGE_ID.Value));
            
            
            if(txtIS_NEWS.Value !="" )
                condObj.IS_NEWS = Convert.ToInt32(txtIS_NEWS.Value);
            
            
            if(txtDEFAULT_REPLAY.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY, Convert.ToString(txtDEFAULT_REPLAY.Value));
            
            
            if(txtDEFAULT_REPLAY_FALG.Value !="" )
                condObj.DEFAULT_REPLAY_FALG = Convert.ToInt32(txtDEFAULT_REPLAY_FALG.Value);
            
            
            if(txtLBS_DISTANCE.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.LBS_DISTANCE, Convert.ToDecimal(txtLBS_DISTANCE.Value));
            
            
            if(txtAPPID.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.APPID, Convert.ToString(txtAPPID.Value));
            
            
            if(txtAPPSESECRET.Value !="" )
                condObj.Like(WEC_PUBLICLIST.Attribute.APPSESECRET, Convert.ToString(txtAPPSESECRET.Value));

            listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_PUBLICLIST valObj = BLLTable<WEC_PUBLICLIST>.GetRowData(WEC_PUBLICLIST.Attribute.AID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_PUBLICLISTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

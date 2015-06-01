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

public partial class WEC_A_VOTESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_A_VOTESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_A_VOTESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_A_VOTE valObj = new WEC_A_VOTE();
    WEC_A_VOTE condObj = new WEC_A_VOTE();
    List<WEC_A_VOTE> listObj = new List<WEC_A_VOTE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
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
                listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_A_VOTE>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_A_VOTE();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtKEYWORD.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
            
            
            if(txtTITLE.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
            
            
            if(txtPICURL.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
            
            
            if(txtINSTRUCTION.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.INSTRUCTION, Convert.ToString(txtINSTRUCTION.Value));
            
            
            if(txtPIC_SHOW.Value !="" )
                condObj.PIC_SHOW = Convert.ToInt32(txtPIC_SHOW.Value);
            
            
            if(txtIS_RADIO.Value !="" )
                condObj.IS_RADIO = Convert.ToInt32(txtIS_RADIO.Value);
            
            
            if(txtSELECT_NUM.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.SELECT_NUM, Convert.ToInt32(txtSELECT_NUM.Value));
            
            
            if(txtTIME.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.TIME, Convert.ToString(txtTIME.Value));
            
            
            if(txtRESULT.Value !="" )
                condObj.Like(WEC_A_VOTE.Attribute.RESULT, Convert.ToInt32(txtRESULT.Value));
            
            
            if(txtSHARE.Value !="" )
                condObj.SHARE = Convert.ToInt32(txtSHARE.Value);
            
            
            if(txtKIND.Value !="" )
                condObj.KIND = Convert.ToInt32(txtKIND.Value);

            listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_A_VOTE valObj = BLLTable<WEC_A_VOTE>.Factory(conn).GetRowData(WEC_A_VOTE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_A_VOTESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

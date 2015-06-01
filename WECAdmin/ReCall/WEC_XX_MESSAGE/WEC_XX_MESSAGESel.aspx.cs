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

public partial class WEC_XX_MESSAGESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_XX_MESSAGESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_XX_MESSAGESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_XX_MESSAGE valObj = new WEC_XX_MESSAGE();
    WEC_XX_MESSAGE condObj = new WEC_XX_MESSAGE();
    List<WEC_XX_MESSAGE> listObj = new List<WEC_XX_MESSAGE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
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
                listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_XX_MESSAGE>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_XX_MESSAGE();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtOPENID.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.OPENID, Convert.ToString(txtOPENID.Value));
            
            
            if(txtTYPE.Value !="" )
                condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
            
            
            if(txtS_CONTENT.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.S_CONTENT, Convert.ToString(txtS_CONTENT.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtISCOLLECT.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.ISCOLLECT, Convert.ToString(txtISCOLLECT.Value));
            
            
            if(txtLATITUDE.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.LATITUDE, Convert.ToString(txtLATITUDE.Value));
            
            
            if(txtLONGITUDE.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.LONGITUDE, Convert.ToString(txtLONGITUDE.Value));
            
            
            if(txtPRECISION.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.PRECISION, Convert.ToString(txtPRECISION.Value));
            
            
            if(txtCITY.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.CITY, Convert.ToString(txtCITY.Value));
            
            
            if(txtPROVINCE.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.PROVINCE, Convert.ToString(txtPROVINCE.Value));
            
            
            if(txtCOUNTRY.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.COUNTRY, Convert.ToString(txtCOUNTRY.Value));
            
            
            if(txtHEADIMGURL.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.HEADIMGURL, Convert.ToString(txtHEADIMGURL.Value));
            
            
            if(txtCHANNELID.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.CHANNELID, Convert.ToDecimal(txtCHANNELID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_XX_MESSAGE.Attribute.AID, Convert.ToDecimal(txtAID.Value));

            listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_XX_MESSAGE valObj = BLLTable<WEC_XX_MESSAGE>.GetRowData(WEC_XX_MESSAGE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_XX_MESSAGESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

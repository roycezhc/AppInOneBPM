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

public partial class WEC_REQUESTSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_REQUESTSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_REQUEST valObj = new WEC_REQUEST();
    WEC_REQUEST condObj = new WEC_REQUEST();
    List<WEC_REQUEST> listObj = new List<WEC_REQUEST>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP3);
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
                listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_REQUEST();

            
            
            if(txtTID.Value !="" )
                condObj.Like(WEC_REQUEST.Attribute.TID, Convert.ToDecimal(txtTID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_REQUEST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtKEYWORD.Value !="" )
                condObj.Like(WEC_REQUEST.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
            
            
            if(txtMATCH_TYPE.Value !="" )
                condObj.MATCH_TYPE = Convert.ToInt32(txtMATCH_TYPE.Value);
            
            
            if(txtMEMO.Value !="" )
                condObj.Like(WEC_REQUEST.Attribute.MEMO, Convert.ToString(txtMEMO.Value));
            
            
            if(txtKIND.Value !="" )
                condObj.KIND = Convert.ToInt32(txtKIND.Value);
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_REQUEST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_REQUEST valObj = BLLTable<WEC_REQUEST>.GetRowData(WEC_REQUEST.Attribute.TID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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
public partial class CRM_CUSTSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("CRM_CUSTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("CRM_CUSTSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    CRM_CUST valObj = new CRM_CUST();
    CRM_CUST condObj = new CRM_CUST();
    List<CRM_CUST> listObj = new List<CRM_CUST>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP3);
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
                listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<CRM_CUST>(hidCondition.Value);
            }
            listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new CRM_CUST();

            
            
            if(txtCus_ID.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Cus_ID, Convert.ToInt32(txtCus_ID.Value));
            
            
            if(txtCus_Name.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Cus_Name, Convert.ToString(txtCus_Name.Value));
            
            
            if(txtJob.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Job, Convert.ToString(txtJob.Value));
            
            
            if(txtRelationTxt.Value !="" )
                condObj.Like(CRM_CUST.Attribute.RelationTxt, Convert.ToString(txtRelationTxt.Value));
            
            
            if(txtRecorder.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Recorder, Convert.ToString(txtRecorder.Value));
            
            
            if(txtMobPhone.Value !="" )
                condObj.Like(CRM_CUST.Attribute.MobPhone, Convert.ToString(txtMobPhone.Value));
            
            
            if(txtPhone.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Phone, Convert.ToString(txtPhone.Value));
            
            
            if(txtContactName.Value !="" )
                condObj.Like(CRM_CUST.Attribute.ContactName, Convert.ToString(txtContactName.Value));
            
            
            if(txtShopName.Value !="" )
                condObj.Like(CRM_CUST.Attribute.ShopName, Convert.ToString(txtShopName.Value));
            
            
            if(txtShopAddr.Value !="" )
                condObj.Like(CRM_CUST.Attribute.ShopAddr, Convert.ToString(txtShopAddr.Value));
            
            
            if(txtQQ.Value !="" )
                condObj.Like(CRM_CUST.Attribute.QQ, Convert.ToString(txtQQ.Value));
            
            
            if(txtWW.Value !="" )
                condObj.Like(CRM_CUST.Attribute.WW, Convert.ToString(txtWW.Value));
            
            
            if(txtEmail.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Email, Convert.ToString(txtEmail.Value));
            
            
            if(txtAddress.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Address, Convert.ToString(txtAddress.Value));
            
            
            if(txtTrade.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Trade, Convert.ToString(txtTrade.Value));
            
            
            if(txtType.Value !="" )
                condObj.Like(CRM_CUST.Attribute.Type, Convert.ToInt32(txtType.Value));
            
            
            if(txtState.Value !="" )
                condObj.State = Convert.ToInt32(txtState.Value);
            
            
            if(txtIsSign.Value !="" )
                condObj.IsSign = Convert.ToInt32(txtIsSign.Value);
            
            
            if(txtAddTime.Value !="" )
                condObj.Like(CRM_CUST.Attribute.AddTime, Convert.ToDateTime(txtAddTime.Value));
            
            
            if(txtEditTime.Value !="" )
                condObj.Like(CRM_CUST.Attribute.EditTime, Convert.ToDateTime(txtEditTime.Value));
            
            
            if(txtPATH.Value !="" )
                condObj.Like(CRM_CUST.Attribute.PATH, Convert.ToString(txtPATH.Value));
            
            
            if(txtPNAME.Value !="" )
                condObj.Like(CRM_CUST.Attribute.PNAME, Convert.ToString(txtPNAME.Value));

            listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //CRM_CUST valObj = BLLTable<CRM_CUST>.Factory(conn).GetRowData(CRM_CUST.Attribute.Cus_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("CRM_CUSTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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
public partial class SYS_BILL_COLSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_COLSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_BILL_COLSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    SYS_BILL_COL valObj = new SYS_BILL_COL();
    SYS_BILL_COL condObj = new SYS_BILL_COL();
    List<SYS_BILL_COL> listObj = new List<SYS_BILL_COL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_BILL_COL.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_BILL_COL.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_BILL_COL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_BILL_COL.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_BILL_COL.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_BILL_COL.Attribute.EXP3);
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
                listObj = BLLTable<SYS_BILL_COL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_BILL_COL>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_BILL_COL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_BILL_COL();

            
            
            if(txtCOL_ID.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.COL_ID, Convert.ToInt32(txtCOL_ID.Value));
            
            
            if(txtBILL_ID.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.BILL_ID, Convert.ToInt32(txtBILL_ID.Value));
            
            
            if(txtTABLE_NAME.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.TABLE_NAME, Convert.ToString(txtTABLE_NAME.Value));
            
            
            if(txtCOL_NAME.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.COL_NAME, Convert.ToString(txtCOL_NAME.Value));
            
            
            if(txtCOL_NOTE.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.COL_NOTE, Convert.ToString(txtCOL_NOTE.Value));
            
            
            if(txtDATA_TYPE.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.DATA_TYPE, Convert.ToString(txtDATA_TYPE.Value));
            
            
            if(txtDATA_LEN.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.DATA_LEN, Convert.ToInt32(txtDATA_LEN.Value));
            
            
            if(txtDATA_ACC.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.DATA_ACC, Convert.ToInt32(txtDATA_ACC.Value));
            
            
            if(txtIS_AUTO.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.IS_AUTO, Convert.ToString(txtIS_AUTO.Value));
            
            
            if(txtSORT_NO.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
            
            
            if(txtCOL_SHOW.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FK_SHOW, Convert.ToString(txtCOL_SHOW.Value));
            
            
            if(txtDISPLAY_NAME.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.DISPLAY_NAME, Convert.ToString(txtDISPLAY_NAME.Value));
            
            
            if(txtTITLE.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
            
            
            if(txtDVAL.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.DVAL, Convert.ToString(txtDVAL.Value));
            
            
            if(txtBILL_ROW_FORMULAR.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR, Convert.ToString(txtBILL_ROW_FORMULAR.Value));
            
            
            if(txtBILL_COL_FORMULAR.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.BILL_COL_FORMULAR, Convert.ToString(txtBILL_COL_FORMULAR.Value));
            
            
            if(txtBILL_ISHEADER.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.BILL_ISHEADER, Convert.ToString(txtBILL_ISHEADER.Value));
            
            
            if(txtBILL_HERDERWIDTH.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.BILL_HERDERWIDTH, Convert.ToInt32(txtBILL_HERDERWIDTH.Value));
            
            
            if(txtFORM_CHECKTYPE.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_CHECKTYPE, Convert.ToString(txtFORM_CHECKTYPE.Value));
            
            
            if(txtFORM_CTRL_ID.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_CTRL_ID, Convert.ToInt32(txtFORM_CTRL_ID.Value));
            
            
            if(txtFORM_SHOW.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_SHOW, Convert.ToString(txtFORM_SHOW.Value));
            
            
            if(txtFORM_NEED.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_NEED, Convert.ToString(txtFORM_NEED.Value));
            
            
            if(txtFORM_MIN.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_MIN, Convert.ToString(txtFORM_MIN.Value));
            
            
            if(txtFORM_MAX.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_MAX, Convert.ToString(txtFORM_MAX.Value));
            
            
            if(txtFORM_ONEROW.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_ONEROW, Convert.ToString(txtFORM_ONEROW.Value));
            
            
            if(txtFORM_CTRLWIDTH.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.FORM_CTRLWIDTH, Convert.ToInt32(txtFORM_CTRLWIDTH.Value));
            
            
            if(txtSEARCH_INBILL.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.SEARCH_INBILL, Convert.ToString(txtSEARCH_INBILL.Value));
            
            
            if(txtSEARCH_TYPE.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.SEARCH_TYPE, Convert.ToString(txtSEARCH_TYPE.Value));
            
            
            if(txtSEARCH_FORMULAR.Value !="" )
                condObj.Like(SYS_BILL_COL.Attribute.SEARCH_FORMULAR, Convert.ToString(txtSEARCH_FORMULAR.Value));

            listObj = BLLTable<SYS_BILL_COL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_BILL_COL valObj = BLLTable<SYS_BILL_COL>.Factory(conn).GetRowData(SYS_BILL_COL.Attribute.COL_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_COLSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_BILL_COL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

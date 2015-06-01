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
public partial class WF_F_COLUMN_ITEMSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("TF_F_COLUMN_ITEMSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("TF_F_COLUMN_ITEMSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    TF_F_COLUMN_ITEM valObj = new TF_F_COLUMN_ITEM();
    TF_F_COLUMN_ITEM condObj = new TF_F_COLUMN_ITEM();
    List<TF_F_COLUMN_ITEM> listObj = new List<TF_F_COLUMN_ITEM>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Order.Desc);
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP1);
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP2);
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP1);
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP2);
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP3);
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
                listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_F_COLUMN_ITEM>(hidCondition.Value);
            }
            listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_F_COLUMN_ITEM();

            
            
            if(txtITEM_ID.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Convert.ToInt32(txtITEM_ID.Value));
            
            
            if(txtFORM_ID.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.FORM_ID, Convert.ToInt32(txtFORM_ID.Value));
            
            
            if(txtCOLUMN_ID.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.COLUMN_ID, Convert.ToInt32(txtCOLUMN_ID.Value));
            
            
            if(txtVALUE.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.VALUE, Convert.ToString(txtVALUE.Value));
            
            
            if(txtTEXT.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.TEXT, Convert.ToString(txtTEXT.Value));
            
            
            if(txtDROP_REAL.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.DROP_REAL, Convert.ToString(txtDROP_REAL.Value));
            
            
            if(txtCOL_HIDE.Value !="" )
                condObj.Like(TF_F_COLUMN_ITEM.Attribute.COL_HIDE, Convert.ToString(txtCOL_HIDE.Value));

            listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //TF_F_COLUMN_ITEM valObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).GetRowData(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("TF_F_COLUMN_ITEMSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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
public partial class TF_TABLESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("TF_TABLESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("TF_TABLESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    TF_TABLE valObj = new TF_TABLE();
    TF_TABLE condObj = new TF_TABLE();
    List<TF_TABLE> listObj = new List<TF_TABLE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP3);
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
                listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_TABLE>(hidCondition.Value);
            }
            listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_TABLE();

            
            
            if(txtTB_ID.Value !="" )
                condObj.Like(TF_TABLE.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
            
            
            if(txtTB_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.TB_NAME, Convert.ToString(txtTB_NAME.Value));
            
            
            if(txtWF_TB_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.WF_TB_NAME, Convert.ToString(txtWF_TB_NAME.Value));
            
            
            if(txtCH_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.CH_NAME, Convert.ToString(txtCH_NAME.Value));
            
            
            if(txtM_TB_ID.Value !="" )
                condObj.Like(TF_TABLE.Attribute.M_TB_ID, Convert.ToInt32(txtM_TB_ID.Value));
            
            
            if(txtSORT_NO.Value !="" )
                condObj.Like(TF_TABLE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
            
            
            if(txtTB_TYPE.Value !="" )
                condObj.TB_TYPE = Convert.ToInt32(txtTB_TYPE.Value);
            
            
            if(txtNOTE.Value !="" )
                condObj.Like(TF_TABLE.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
            
            
            if(txtCREATED.Value !="" )
                condObj.Like(TF_TABLE.Attribute.CREATED, Convert.ToInt32(txtCREATED.Value));
            
            
            if(txtDB_SRC.Value !="" )
                condObj.Like(TF_TABLE.Attribute.DB_SRC, Convert.ToString(txtDB_SRC.Value));
            
            
            if(txtMENU_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.MENU_NAME, Convert.ToString(txtMENU_NAME.Value));
            
            
            if(txtKEY_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.KEY_NAME, Convert.ToString(txtKEY_NAME.Value));
            
            
            if(txtKEY_TYPE.Value !="" )
                condObj.Like(TF_TABLE.Attribute.KEY_TYPE, Convert.ToString(txtKEY_TYPE.Value));
            
            
            if(txtAPI_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.API_NAME, Convert.ToString(txtAPI_NAME.Value));
            
            
            if(txtALLOW_REPORT.Value !="" )
                condObj.ALLOW_REPORT = Convert.ToBoolean(txtALLOW_REPORT.Checked);
            
            
            if(txtALLOW_ACTIVITY.Value !="" )
                condObj.ALLOW_ACTIVITY = Convert.ToBoolean(txtALLOW_ACTIVITY.Checked);
            
            
            if(txtMODIFY_HIS.Value !="" )
                condObj.MODIFY_HIS = Convert.ToBoolean(txtMODIFY_HIS.Checked);
            
            
            if(txtALLOW_USER_AREA.Value !="" )
                condObj.ALLOW_USER_AREA = Convert.ToBoolean(txtALLOW_USER_AREA.Checked);
            
            
            if(txtALLOW_PUBLIC.Value !="" )
                condObj.ALLOW_PUBLIC = Convert.ToBoolean(txtALLOW_PUBLIC.Checked);
            
            
            if(txtTB_NAMESPACE.Value !="" )
                condObj.Like(TF_TABLE.Attribute.TB_NAMESPACE, Convert.ToString(txtTB_NAMESPACE.Value));
            
            
            if(txtINSTALL_STAT.Value !="" )
                condObj.INSTALL_STAT = Convert.ToBoolean(txtINSTALL_STAT.Checked);
            
            
            if(txtADD_NOTE_FILE.Value !="" )
                condObj.ADD_NOTE_FILE = Convert.ToBoolean(txtADD_NOTE_FILE.Checked);
            
            
            if(txtHAS_WF.Value !="" )
                condObj.HAS_WF = Convert.ToBoolean(txtHAS_WF.Checked);

            listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //TF_TABLE valObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("TF_TABLESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

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
public partial class TF_TABLESel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{

    protected int m_tbid = 0;//多级数据表页面才用到此变量

    TF_TABLE valObj = new TF_TABLE();
    TF_TABLE condObj = new TF_TABLE();
    List<TF_TABLE> listObj = new List<TF_TABLE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.OrderBy(TF_TABLE.Attribute.SORT_NO, Order.Asc);
        if (Request["PID"] != null)
        {
            int pid = int.Parse(Request["PID"]);
            TF_FORM formObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, pid);

            if (formObj != null) {
                m_tbid = formObj.TB_ID;
            }
        }
        condObj.M_TB_ID = m_tbid;
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
            
            if(txtTB_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.TB_NAME, Convert.ToString(txtTB_NAME.Value));
            
            
            if(txtCH_NAME.Value !="" )
                condObj.Like(TF_TABLE.Attribute.CH_NAME, Convert.ToString(txtCH_NAME.Value));
            

            if(txtTB_TYPE.Value !="" )
                condObj.TB_TYPE = Convert.ToInt32(txtTB_TYPE.Value);

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
        listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

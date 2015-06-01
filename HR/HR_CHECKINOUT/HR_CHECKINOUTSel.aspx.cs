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
public partial class HR_CHECKINOUTSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKINOUTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_CHECKINOUTSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    HR_CHECKINOUT valObj = new HR_CHECKINOUT();
    HR_CHECKINOUT condObj = new HR_CHECKINOUT();
    List<HR_CHECKINOUT> listObj = new List<HR_CHECKINOUT>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
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
                listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHECKINOUT>(hidCondition.Value);
            }
            listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_CHECKINOUT();

            
            
            if(txtUSERID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
            
            
            if(txtCHECKTIME.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.CHECKTIME, Convert.ToDateTime(txtCHECKTIME.Value));
            
            
            if(txtSTAFF_ID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
            
            
            if(txtCHECKTYPE.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.CHECKTYPE, Convert.ToString(txtCHECKTYPE.Value));
            
            
            if(txtVERIFYCODE.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.VERIFYCODE, Convert.ToInt32(txtVERIFYCODE.Value));
            
            
            if(txtSENSORID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.SENSORID, Convert.ToString(txtSENSORID.Value));

            listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_CHECKINOUT valObj = BLLTable<HR_CHECKINOUT>.Factory(conn).GetRowData(HR_CHECKINOUT.Attribute.CHECKTIME, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKINOUTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

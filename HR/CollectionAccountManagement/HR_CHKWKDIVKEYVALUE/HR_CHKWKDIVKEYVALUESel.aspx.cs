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
public partial class HR_CHKWKDIVKEYVALUESel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHKWKDIVKEYVALUESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_CHKWKDIVKEYVALUESel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    HR_CHKWKDIVKEYVALUE valObj = new HR_CHKWKDIVKEYVALUE();
    HR_CHKWKDIVKEYVALUE condObj = new HR_CHKWKDIVKEYVALUE();
    List<HR_CHKWKDIVKEYVALUE> listObj = new List<HR_CHKWKDIVKEYVALUE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.OrderBy(HR_CHKWKDIVKEYVALUE.Attribute.DeviceID, Order.Desc);
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP3);
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
                listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHKWKDIVKEYVALUE>(hidCondition.Value);
            }
            listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_CHKWKDIVKEYVALUE();

            
            
            if(txtGroupId.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.GroupId, Convert.ToInt32(txtGroupId.Value));
            
            
            if(txtDeviceID.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.DeviceID, Convert.ToString(txtDeviceID.Value));
            
            
            if(txtAIOTableName.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName, Convert.ToString(txtAIOTableName.Value));
            
            
            if(txtAIOKeyFieldName.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName, Convert.ToString(txtAIOKeyFieldName.Value));
            
            
            if(txtOtherKeyFieldName.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Convert.ToString(txtOtherKeyFieldName.Value));
            
            
            if(txtAIOKeyValue.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue, Convert.ToString(txtAIOKeyValue.Value));
            
            
            if(txtOtherKeyValue.Value !="" )
                condObj.Like(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue, Convert.ToString(txtOtherKeyValue.Value));

            listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_CHKWKDIVKEYVALUE valObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).GetRowData(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_CHKWKDIVKEYVALUESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

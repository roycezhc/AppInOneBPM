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
using AgileFrame.AppInOne.SYS;
public partial class HR_CHKWKDIVKEYVALUEManage2:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHKWKDIVKEYVALUEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("HR_CHKWKDIVKEYVALUEManage.aspx", path);
    }
    protected string pid="0";

    HR_CHKWKDIVKEYVALUE valObj = new HR_CHKWKDIVKEYVALUE();
    HR_CHKWKDIVKEYVALUE condObj = new HR_CHKWKDIVKEYVALUE();
    List<HR_CHKWKDIVKEYVALUE> listObj = new List<HR_CHKWKDIVKEYVALUE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_CHKWKDIVKEYVALUE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
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
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHKWKDIVKEYVALUE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
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

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHKWKDIVKEYVALUE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
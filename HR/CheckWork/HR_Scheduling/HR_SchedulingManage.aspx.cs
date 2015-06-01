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
public partial class HR_SchedulingManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_SchedulingManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("HR_SchedulingManage.aspx", path);
    }
    protected string pid="0";

    HR_Scheduling valObj = new HR_Scheduling();
    HR_Scheduling condObj = new HR_Scheduling();
    List<HR_Scheduling> listObj = new List<HR_Scheduling>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_Scheduling condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_Scheduling.Attribute.SchDay, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<HR_Scheduling>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_Scheduling.Attribute.EXP1);
        //hideTableColumnList.Add(HR_Scheduling.Attribute.EXP2);
        //hideTableColumnList.Add(HR_Scheduling.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_Scheduling.Attribute.EXP1);
        //hideFindColumnList.Add(HR_Scheduling.Attribute.EXP2);
        //hideFindColumnList.Add(HR_Scheduling.Attribute.EXP3);
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
            if (pid == "" || pid == "0")
            {
                //a_top.Visible = false;
            }
            #endregion
            #region//数据初始化
            
            txtType.Items.AddRange(FormHelper.GetListItem(HR_Scheduling.Attribute.SchType));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_Scheduling>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_Scheduling();

        
        
        if(txtYear.Value !="" )
            condObj.Like(HR_Scheduling.Attribute.SchYear, Convert.ToInt32(txtYear.Value));
        
        
        if(txtMonth.Value !="" )
            condObj.Like(HR_Scheduling.Attribute.SchMonth, Convert.ToInt16(txtMonth.Value));
        
        
        if(txtDay.Value !="" )
            condObj.Like(HR_Scheduling.Attribute.SchDay, Convert.ToInt16(txtDay.Value));
        
        
        if(txtType.Value !="" )
            condObj.SchType = Convert.ToInt32(txtType.Value);
        
        
        if(txtSchClassid.Value !="" )
            condObj.Like(HR_Scheduling.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_Scheduling>(hidCondition.Value);
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
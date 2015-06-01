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
public partial class HR_SchClassManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_SchClassManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("HR_SchClassManage.aspx", path);
    }
    protected string pid="0";

    HR_SchClass valObj = new HR_SchClass();
    HR_SchClass condObj = new HR_SchClass();
    List<HR_SchClass> listObj = new List<HR_SchClass>();
    int recount = -1;//查询总记录数
    protected string title = "";
    public FormHelper formHelper = new FormHelper();
    private void BindList(HR_SchClass condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_SchClass.Attribute.SchClassid, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP1);
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP2);
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP1);
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP2);
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            string haveschidsStr = "";
            if (Request["haveschids"] != null)
            {
                haveschidsStr = Request["haveschids"];
                haveschidsStr = haveschidsStr.TrimEnd(',');
                if (string.IsNullOrEmpty(haveschidsStr))
                    haveschidsStr = "-1";
                condObj.Where(" {0} not in ({1}) ", HR_SchClass.Attribute.SchClassid.FieldName, haveschidsStr);
            }
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
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_SchClass>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_SchClass();

        
        
        if(txtSchClassid.Value !="" )
            condObj.Like(HR_SchClass.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));
        
        
        if(txtSchName.Value !="" )
            condObj.Like(HR_SchClass.Attribute.SchName, Convert.ToString(txtSchName.Value));
        
        
        if(txtStartHour.Value !="" )
            condObj.Like(HR_SchClass.Attribute.StartHour, Convert.ToInt32(txtStartHour.Value));
        
        
        if(txtStartMin.Value !="" )
            condObj.Like(HR_SchClass.Attribute.StartMin, Convert.ToInt32(txtStartMin.Value));
        
        
        if(txtEndHour.Value !="" )
            condObj.Like(HR_SchClass.Attribute.EndHour, Convert.ToInt32(txtEndHour.Value));
        
        
        if(txtEndMin.Value !="" )
            condObj.Like(HR_SchClass.Attribute.EndMin, Convert.ToInt32(txtEndMin.Value));
        
        
        if(txtLateMinutes.Value !="" )
            condObj.Like(HR_SchClass.Attribute.LateMinutes, Convert.ToInt32(txtLateMinutes.Value));
        
        
        if(txtEarlyMinutes.Value !="" )
            condObj.Like(HR_SchClass.Attribute.EarlyMinutes, Convert.ToInt32(txtEarlyMinutes.Value));
        
        
        if(txtCheckIn.Value !="" )
            condObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
        
        
        if(txtCheckOut.Value !="" )
            condObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
        
        
        if(txtCheckInHour1.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckInHour1, Convert.ToInt32(txtCheckInHour1.Value));
        
        
        if(txtCheckInMin1.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckInMin1, Convert.ToInt32(txtCheckInMin1.Value));
        
        
        if(txtCheckInHour2.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckInHour2, Convert.ToInt32(txtCheckInHour2.Value));
        
        
        if(txtCheckInMin2.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckInMin2, Convert.ToInt32(txtCheckInMin2.Value));
        
        
        if(txtCheckOutHour1.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckOutHour1, Convert.ToInt32(txtCheckOutHour1.Value));
        
        
        if(txtCheckOutMin1.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckOutMin1, Convert.ToInt32(txtCheckOutMin1.Value));
        
        
        if(txtCheckOutHour2.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckOutHour2, Convert.ToInt32(txtCheckOutHour2.Value));
        
        
        if(txtCheckOutMin2.Value !="" )
            condObj.Like(HR_SchClass.Attribute.CheckOutMin2, Convert.ToInt32(txtCheckOutMin2.Value));
        
        
        if(txtColor.Value !="" )
            condObj.Like(HR_SchClass.Attribute.Color, Convert.ToInt32(txtColor.Value));
        
        
        if(txtIsOvertime.Value !="" )
            condObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_SchClass>(hidCondition.Value);
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
    protected void btn_Add_Click(object sender, EventArgs e)
    {
    }
}
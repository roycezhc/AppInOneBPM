using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class HR_Scheduling_IniProjectSels2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_Scheduling_IniProject()._ZhName;

    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    HR_Scheduling_IniProject valObj = new HR_Scheduling_IniProject();
    HR_Scheduling_IniProject condObj = new HR_Scheduling_IniProject();
    List<HR_Scheduling_IniProject> listObj = new List<HR_Scheduling_IniProject>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP1);
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP2);
        //hideTableColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP1);
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP2);
        //hideFindColumnList.Add(HR_Scheduling_IniProject.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_Scheduling_IniProject.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_Scheduling_IniProject roleOld = new HR_Scheduling_IniProject();
                roleOld.Where(HR_Scheduling_IniProject.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].ID + "',Name:'" + listObj[i].ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].ID;
                }
            }
            try
            {

                listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repList.DataSource = listObj;
                repList.DataBind();
                aspPager.RecordCount = recount;
            }
            catch (Exception ex)
            {
                 litWarn.Text = ex.Message;
            }



        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new HR_Scheduling_IniProject();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.ID, Convert.ToString(txtID.Value));
        
        
        if(txtSelBanciId.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.SelBanciId, Convert.ToString(txtSelBanciId.Value));
        
        
        if(txtXiuXi.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.XiuXi, Convert.ToString(txtXiuXi.Value));
        
        
        if(txtWorkDayType.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.WorkDayType, Convert.ToString(txtWorkDayType.Value));
        
        
        if(txtStartTime.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.StartTime, Convert.ToDateTime(txtStartTime.Value));
        
        
        if(txtEndTime.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.EndTime, Convert.ToDateTime(txtEndTime.Value));
        
        
        if(txtFuGaiOrZengBu.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu, Convert.ToInt32(txtFuGaiOrZengBu.Value));
        
        
        if(txtStaffID.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.StaffID, Convert.ToString(txtStaffID.Value));
        
        
        if(txtDeptID.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.DeptID, Convert.ToString(txtDeptID.Value));
        
        
        if(txtOrgID.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.OrgID, Convert.ToString(txtOrgID.Value));
        
        
        if(txtProjectName.Value !="" )
            condObj.Like_OR(HR_Scheduling_IniProject.Attribute.ProjectName, Convert.ToString(txtProjectName.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repList.DataSource = listObj;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }

    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            recount = aspPager.RecordCount;
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<HR_Scheduling_IniProject>(hidCondition.Value);
            }
            List<HR_Scheduling_IniProject> listVal = BLLTable<HR_Scheduling_IniProject>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
            repList.DataSource = listVal;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (hidOld.Value != "")
        {
            HtmlInputCheckBox ck = (HtmlInputCheckBox)e.Item.FindControl("chkSel");
            string id = ck.Attributes["value"];

            if (IsInOld(hidInitIDS.Value, id, ','))
            {
                ck.Checked = true;
            }
        }
    }
}
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

public partial class V_SchedulingSchClassSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new V_SchedulingSchClass()._ZhName;

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
    V_SchedulingSchClass valObj = new V_SchedulingSchClass();
    V_SchedulingSchClass condObj = new V_SchedulingSchClass();
    List<V_SchedulingSchClass> listObj = new List<V_SchedulingSchClass>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP1);
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP2);
        //hideTableColumnList.Add(V_SchedulingSchClass.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP1);
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP2);
        //hideFindColumnList.Add(V_SchedulingSchClass.Attribute.EXP3);
        #endregion
        condObj.OrderBy(V_SchedulingSchClass.Attribute.SchName, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                V_SchedulingSchClass roleOld = new V_SchedulingSchClass();
                roleOld.Where(V_SchedulingSchClass.Attribute.SchName, Request["ids"].ToString());
                listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].SchName + "',Name:'" + listObj[i].SchName + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].SchName;
                }
            }
            try
            {

                listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new V_SchedulingSchClass();
        
        
        if(txtSchName.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchName, Convert.ToString(txtSchName.Value));
        
        
        if(txtLateMinutes.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.LateMinutes, Convert.ToInt32(txtLateMinutes.Value));
        
        
        if(txtEarlyMinutes.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.EarlyMinutes, Convert.ToInt32(txtEarlyMinutes.Value));
        
        
        if(txtCheckIn.Value !="" )
            condObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
        
        
        if(txtCheckOut.Value !="" )
            condObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
        
        
        if(txtColor.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.Color, Convert.ToInt32(txtColor.Value));
        
        
        if(txtIsOvertime.Value !="" )
            condObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);
        
        
        if(txtYear.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchYear, Convert.ToInt32(txtYear.Value));
        
        
        if(txtMonth.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchMonth, Convert.ToInt16(txtMonth.Value));
        
        
        if(txtDay.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchDay, Convert.ToInt16(txtDay.Value));
        
        
        if(txtType.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchType, Convert.ToInt32(txtType.Value));
        
        
        if(txtSchClassid.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));
        
        
        if(txtStartHour.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.StartHour, Convert.ToInt32(txtStartHour.Value));
        
        
        if(txtStartMin.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.StartMin, Convert.ToInt32(txtStartMin.Value));
        
        
        if(txtEndHour.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.EndHour, Convert.ToInt32(txtEndHour.Value));
        
        
        if(txtEndMin.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.EndMin, Convert.ToInt32(txtEndMin.Value));
        
        
        if(txtCheckInHour1.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckInHour1, Convert.ToInt32(txtCheckInHour1.Value));
        
        
        if(txtCheckInMin1.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckInMin1, Convert.ToInt32(txtCheckInMin1.Value));
        
        
        if(txtCheckInHour2.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckInHour2, Convert.ToInt32(txtCheckInHour2.Value));
        
        
        if(txtCheckInMin2.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckInMin2, Convert.ToInt32(txtCheckInMin2.Value));
        
        
        if(txtCheckOutHour1.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckOutHour1, Convert.ToInt32(txtCheckOutHour1.Value));
        
        
        if(txtCheckOutMin1.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckOutMin1, Convert.ToInt32(txtCheckOutMin1.Value));
        
        
        if(txtCheckOutMin2.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckOutMin2, Convert.ToInt32(txtCheckOutMin2.Value));
        
        
        if(txtCheckOutHour2.Value !="" )
            condObj.Like_OR(V_SchedulingSchClass.Attribute.CheckOutHour2, Convert.ToInt32(txtCheckOutHour2.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<V_SchedulingSchClass>(hidCondition.Value);
            }
            List<V_SchedulingSchClass> listVal = BLLTable<V_SchedulingSchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
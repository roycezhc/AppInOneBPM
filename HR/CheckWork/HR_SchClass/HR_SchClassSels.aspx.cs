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
public partial class HR_SchClassSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_SchClass()._ZhName;

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
    HR_SchClass valObj = new HR_SchClass();
    HR_SchClass condObj = new HR_SchClass();
    List<HR_SchClass> listObj = new List<HR_SchClass>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
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
        condObj.OrderBy(HR_SchClass.Attribute.SchClassid, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_SchClass roleOld = new HR_SchClass();
                roleOld.Where(HR_SchClass.Attribute.SchClassid, Request["ids"].ToString());
                listObj = BLLTable<HR_SchClass>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].SchClassid + "',Name:'" + listObj[i].SchClassid + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].SchClassid;
                }
            }
            try
            {

                listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_SchClass();
        
        
        if(txtSchClassid.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));
        
        
        if(txtSchName.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.SchName, Convert.ToString(txtSchName.Value));
        
        
        if(txtStartHour.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.StartHour, Convert.ToInt32(txtStartHour.Value));
        
        
        if(txtStartMin.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.StartMin, Convert.ToInt32(txtStartMin.Value));
        
        
        if(txtEndHour.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.EndHour, Convert.ToInt32(txtEndHour.Value));
        
        
        if(txtEndMin.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.EndMin, Convert.ToInt32(txtEndMin.Value));
        
        
        if(txtLateMinutes.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.LateMinutes, Convert.ToInt32(txtLateMinutes.Value));
        
        
        if(txtEarlyMinutes.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.EarlyMinutes, Convert.ToInt32(txtEarlyMinutes.Value));
        
        
        if(txtCheckIn.Value !="" )
            condObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
        
        
        if(txtCheckOut.Value !="" )
            condObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
        
        
        if(txtCheckInHour1.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckInHour1, Convert.ToInt32(txtCheckInHour1.Value));
        
        
        if(txtCheckInMin1.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckInMin1, Convert.ToInt32(txtCheckInMin1.Value));
        
        
        if(txtCheckInHour2.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckInHour2, Convert.ToInt32(txtCheckInHour2.Value));
        
        
        if(txtCheckInMin2.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckInMin2, Convert.ToInt32(txtCheckInMin2.Value));
        
        
        if(txtCheckOutHour1.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckOutHour1, Convert.ToInt32(txtCheckOutHour1.Value));
        
        
        if(txtCheckOutMin1.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckOutMin1, Convert.ToInt32(txtCheckOutMin1.Value));
        
        
        if(txtCheckOutHour2.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckOutHour2, Convert.ToInt32(txtCheckOutHour2.Value));
        
        
        if(txtCheckOutMin2.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.CheckOutMin2, Convert.ToInt32(txtCheckOutMin2.Value));
        
        
        if(txtColor.Value !="" )
            condObj.Like_OR(HR_SchClass.Attribute.Color, Convert.ToInt32(txtColor.Value));
        
        
        if(txtIsOvertime.Value !="" )
            condObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_SchClass>(hidCondition.Value);
            }
            List<HR_SchClass> listVal = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class V_SchedulingSchClassEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    V_SchedulingSchClass valObj =new V_SchedulingSchClass();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["SchName"]))
        {
            keyid = Request["SchName"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtSchName.Disabled = true;
            this.txtSchName.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<V_SchedulingSchClass>.Factory(conn).GetRowData(V_SchedulingSchClass.Attribute.SchName, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtSchName.Value = Convert.ToString(valObj.SchName);//Convert.ToString                
                    
                    txtLateMinutes.Value = Convert.ToString(valObj.LateMinutes);//Convert.ToInt32                
                    
                    txtEarlyMinutes.Value = Convert.ToString(valObj.EarlyMinutes);//Convert.ToInt32                
                    
                    txtCheckIn.Checked = valObj.CheckIn;                
                    
                    txtCheckOut.Checked = valObj.CheckOut;                
                    
                    txtColor.Value = Convert.ToString(valObj.Color);//Convert.ToInt32                
                    
                    txtIsOvertime.Checked = valObj.IsOverTime;                
                    
                    txtYear.Value = Convert.ToString(valObj.SchYear);//Convert.ToInt32                

                    txtMonth.Value = Convert.ToString(valObj.SchMonth);//Convert.ToInt16                

                    txtDay.Value = Convert.ToString(valObj.SchDay);//Convert.ToInt16                

                    txtType.Value = Convert.ToString(valObj.SchType);//Convert.ToInt32                
                    
                    txtSchClassid.Value = Convert.ToString(valObj.SchClassid);//Convert.ToInt32                
                    
                    txtStartHour.Value = Convert.ToString(valObj.StartHour);//Convert.ToInt32                
                    
                    txtStartMin.Value = Convert.ToString(valObj.StartMin);//Convert.ToInt32                
                    
                    txtEndHour.Value = Convert.ToString(valObj.EndHour);//Convert.ToInt32                
                    
                    txtEndMin.Value = Convert.ToString(valObj.EndMin);//Convert.ToInt32                
                    
                    txtCheckInHour1.Value = Convert.ToString(valObj.CheckInHour1);//Convert.ToInt32                
                    
                    txtCheckInMin1.Value = Convert.ToString(valObj.CheckInMin1);//Convert.ToInt32                
                    
                    txtCheckInHour2.Value = Convert.ToString(valObj.CheckInHour2);//Convert.ToInt32                
                    
                    txtCheckInMin2.Value = Convert.ToString(valObj.CheckInMin2);//Convert.ToInt32                
                    
                    txtCheckOutHour1.Value = Convert.ToString(valObj.CheckOutHour1);//Convert.ToInt32                
                    
                    txtCheckOutMin1.Value = Convert.ToString(valObj.CheckOutMin1);//Convert.ToInt32                
                    
                    txtCheckOutMin2.Value = Convert.ToString(valObj.CheckOutMin2);//Convert.ToInt32                
                    
                    txtCheckOutHour2.Value = Convert.ToString(valObj.CheckOutHour2);//Convert.ToInt32
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            V_SchedulingSchClass valObj = new V_SchedulingSchClass();
            
            
            if(txtSchName.Value !="" )
                valObj.SchName = Convert.ToString(txtSchName.Value);
            
            
            if(txtLateMinutes.Value !="" )
                valObj.LateMinutes = Convert.ToInt32(txtLateMinutes.Value);
            
            
            if(txtEarlyMinutes.Value !="" )
                valObj.EarlyMinutes = Convert.ToInt32(txtEarlyMinutes.Value);
            
            
            valObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
            
            
            valObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
            
            
            if(txtColor.Value !="" )
                valObj.Color = Convert.ToString(txtColor.Value);
            
            
            valObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);
            
            
            if(txtYear.Value !="" )
                valObj.SchYear = Convert.ToInt32(txtYear.Value);
            
            
            if(txtMonth.Value !="" )
                valObj.SchMonth = Convert.ToInt16(txtMonth.Value);
            
            
            if(txtDay.Value !="" )
                valObj.SchDay = Convert.ToInt16(txtDay.Value);
            
            
            if(txtType.Value !="" )
                valObj.SchType = Convert.ToInt32(txtType.Value);
            
            
            if(txtSchClassid.Value !="" )
                valObj.SchClassid = Convert.ToInt32(txtSchClassid.Value);
            
            
            if(txtStartHour.Value !="" )
                valObj.StartHour = Convert.ToInt32(txtStartHour.Value);
            
            
            if(txtStartMin.Value !="" )
                valObj.StartMin = Convert.ToInt32(txtStartMin.Value);
            
            
            if(txtEndHour.Value !="" )
                valObj.EndHour = Convert.ToInt32(txtEndHour.Value);
            
            
            if(txtEndMin.Value !="" )
                valObj.EndMin = Convert.ToInt32(txtEndMin.Value);
            
            
            if(txtCheckInHour1.Value !="" )
                valObj.CheckInHour1 = Convert.ToInt32(txtCheckInHour1.Value);
            
            
            if(txtCheckInMin1.Value !="" )
                valObj.CheckInMin1 = Convert.ToInt32(txtCheckInMin1.Value);
            
            
            if(txtCheckInHour2.Value !="" )
                valObj.CheckInHour2 = Convert.ToInt32(txtCheckInHour2.Value);
            
            
            if(txtCheckInMin2.Value !="" )
                valObj.CheckInMin2 = Convert.ToInt32(txtCheckInMin2.Value);
            
            
            if(txtCheckOutHour1.Value !="" )
                valObj.CheckOutHour1 = Convert.ToInt32(txtCheckOutHour1.Value);
            
            
            if(txtCheckOutMin1.Value !="" )
                valObj.CheckOutMin1 = Convert.ToInt32(txtCheckOutMin1.Value);
            
            
            if(txtCheckOutMin2.Value !="" )
                valObj.CheckOutMin2 = Convert.ToInt32(txtCheckOutMin2.Value);
            
            
            if(txtCheckOutHour2.Value !="" )
                valObj.CheckOutHour2 = Convert.ToInt32(txtCheckOutHour2.Value);

            if (keyid != "")
            {
                valObj.SchName = Convert.ToString(keyid);
                count = BLLTable<V_SchedulingSchClass>.Factory(conn).Update(valObj, V_SchedulingSchClass.Attribute.SchName);
            }
            else
            {
                count = BLLTable<V_SchedulingSchClass>.Factory(conn).Insert(valObj, V_SchedulingSchClass.Attribute.SchName);
                keyid = valObj.SchName.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");

                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtSchName.Value ="";
                    
                    
                    txtLateMinutes.Value ="";
                    
                    
                    txtEarlyMinutes.Value ="";
                    
                    
                    txtCheckIn.Checked=false;
                    
                    
                    txtCheckOut.Checked=false;
                    
                    
                    txtColor.Value ="";
                    
                    
                    txtIsOvertime.Checked=false;
                    
                    
                    txtYear.Value ="";
                    
                    
                    txtMonth.Value ="";
                    
                    
                    txtDay.Value ="";
                    
                    
                    txtType.Value ="";
                    
                    
                    txtSchClassid.Value ="";
                    
                    
                    txtStartHour.Value ="";
                    
                    
                    txtStartMin.Value ="";
                    
                    
                    txtEndHour.Value ="";
                    
                    
                    txtEndMin.Value ="";
                    
                    
                    txtCheckInHour1.Value ="";
                    
                    
                    txtCheckInMin1.Value ="";
                    
                    
                    txtCheckInHour2.Value ="";
                    
                    
                    txtCheckInMin2.Value ="";
                    
                    
                    txtCheckOutHour1.Value ="";
                    
                    
                    txtCheckOutMin1.Value ="";
                    
                    
                    txtCheckOutMin2.Value ="";
                    
                    
                    txtCheckOutHour2.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

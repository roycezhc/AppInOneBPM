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
public partial class HR_SchClassEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_SchClass valObj =new HR_SchClass();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["SchClassid"]))
        {
            keyid = Request["SchClassid"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            txtSchUnit.Items.AddRange(FormHelper.GetListItem(HR_SchClass.Attribute.SchUnit));
            txtSchUnit.Items.RemoveAt(0);
            this.txtSchClassid.Disabled = true;
            this.txtSchClassid.Attributes["class"] = "dis";
            for (int i = 0; i < 24; i++)
            {
                txtStartHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtEndHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckInHour1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckInHour2.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckOutHour1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckOutHour2.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            for (int i = 0; i < 60; i++)
            {
                txtStartMin.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtEndMin.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckInMin1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckInMin2.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckOutMin1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtCheckOutMin2.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            for (int i = 1; i <= 120; i++)
            {
                txtEarlyMinutes.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtLateMinutes.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            txtSchNumber.Items.Add(new ListItem("0.5", "0.5"));
            txtSchNumber.Items.Add(new ListItem("1", "1"));
            txtSchNumber.Items.Add(new ListItem("1.5", "1.5"));
            txtSchNumber.Items.Add(new ListItem("2", "2"));
            txtSchNumber.Items.Add(new ListItem("2.5", "2.5"));
            txtSchNumber.Items.Add(new ListItem("3", "3"));
            txtSchNumber.Items.Add(new ListItem("0.1", "0.1"));
            txtSchNumber.Items.Add(new ListItem("0.2", "0.2"));
            txtSchNumber.Items.Add(new ListItem("0.3", "0.3"));
            txtSchNumber.Items.Add(new ListItem("0.4", "0.4"));
            txtSchNumber.Items.Add(new ListItem("0.6", "0.6"));
            txtSchNumber.Items.Add(new ListItem("0.7", "0.7"));
            txtSchNumber.Items.Add(new ListItem("0.8", "0.8"));
            txtSchNumber.Items.Add(new ListItem("0.9", "0.9"));
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<HR_SchClass>.Factory(conn).GetRowData(HR_SchClass.Attribute.SchClassid, keyid);
                    if (valObj == null) return;

                    txtSchClassid.Value = Convert.ToString(valObj.SchClassid);//Convert.ToInt32                

                    txtSchName.Value = Convert.ToString(valObj.SchName);//Convert.ToString                

                    txtStartHour.Value = Convert.ToString(valObj.StartHour);//Convert.ToInt32                

                    txtStartMin.Value = Convert.ToString(valObj.StartMin);//Convert.ToInt32                

                    txtEndHour.Value = Convert.ToString(valObj.EndHour);//Convert.ToInt32                

                    txtEndMin.Value = Convert.ToString(valObj.EndMin);//Convert.ToInt32                

                    txtLateMinutes.Value = Convert.ToString(valObj.LateMinutes);//Convert.ToInt32                

                    txtEarlyMinutes.Value = Convert.ToString(valObj.EarlyMinutes);//Convert.ToInt32                

                    txtCheckIn.Checked = valObj.CheckIn;

                    txtCheckOut.Checked = valObj.CheckOut;

                    txtCheckInHour1.Value = Convert.ToString(valObj.CheckInHour1);//Convert.ToInt32                

                    txtCheckInMin1.Value = Convert.ToString(valObj.CheckInMin1);//Convert.ToInt32                

                    txtCheckInHour2.Value = Convert.ToString(valObj.CheckInHour2);//Convert.ToInt32                

                    txtCheckInMin2.Value = Convert.ToString(valObj.CheckInMin2);//Convert.ToInt32                

                    txtCheckOutHour1.Value = Convert.ToString(valObj.CheckOutHour1);//Convert.ToInt32                

                    txtCheckOutMin1.Value = Convert.ToString(valObj.CheckOutMin1);//Convert.ToInt32                

                    txtCheckOutHour2.Value = Convert.ToString(valObj.CheckOutHour2);//Convert.ToInt32                

                    txtCheckOutMin2.Value = Convert.ToString(valObj.CheckOutMin2);//Convert.ToInt32                

                    txtColor.Value = Convert.ToString(valObj.Color);//Convert.ToInt32     

                    txtIsOvertime.Checked = valObj.IsOverTime;

                    txtSchNumber.Value = valObj.SchNumber.ToString();

                    txtSchUnit.SelectedValue = valObj.SchUnit.ToString();
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
            HR_SchClass valObj = new HR_SchClass();
            
            
            if(txtSchClassid.Value !="" )
                valObj.SchClassid = Convert.ToInt32(txtSchClassid.Value);
            
            
            if(txtSchName.Value !="" )
                valObj.SchName = Convert.ToString(txtSchName.Value);
            
            
            if(txtStartHour.Value !="" )
                valObj.StartHour = Convert.ToInt32(txtStartHour.Value);
            
            
            if(txtStartMin.Value !="" )
                valObj.StartMin = Convert.ToInt32(txtStartMin.Value);
            
            
            if(txtEndHour.Value !="" )
                valObj.EndHour = Convert.ToInt32(txtEndHour.Value);
            
            
            if(txtEndMin.Value !="" )
                valObj.EndMin = Convert.ToInt32(txtEndMin.Value);
            
            
            if(txtLateMinutes.Value !="" )
                valObj.LateMinutes = Convert.ToInt32(txtLateMinutes.Value);
            
            
            if(txtEarlyMinutes.Value !="" )
                valObj.EarlyMinutes = Convert.ToInt32(txtEarlyMinutes.Value);
            
            
            valObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
            
            
            valObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);

            if (valObj.CheckIn)
            {
                if (txtCheckInHour1.Value != "")
                    valObj.CheckInHour1 = Convert.ToInt32(txtCheckInHour1.Value);

                if (txtCheckInMin1.Value != "")
                    valObj.CheckInMin1 = Convert.ToInt32(txtCheckInMin1.Value);

                if (txtCheckInHour2.Value != "")
                    valObj.CheckInHour2 = Convert.ToInt32(txtCheckInHour2.Value);

                if (txtCheckInMin2.Value != "")
                    valObj.CheckInMin2 = Convert.ToInt32(txtCheckInMin2.Value);
            }
            else
            {
                valObj.CheckInHour1 = valObj.StartHour;
                valObj.CheckInMin1 = valObj.StartMin;
                valObj.CheckInHour2 = valObj.StartHour;
                valObj.CheckInMin2 = valObj.StartMin;
            }
            if (valObj.CheckOut)
            {
                if (txtCheckOutHour1.Value != "")
                    valObj.CheckOutHour1 = Convert.ToInt32(txtCheckOutHour1.Value);

                if (txtCheckOutMin1.Value != "")
                    valObj.CheckOutMin1 = Convert.ToInt32(txtCheckOutMin1.Value);

                if (txtCheckOutHour2.Value != "")
                    valObj.CheckOutHour2 = Convert.ToInt32(txtCheckOutHour2.Value);

                if (txtCheckOutMin2.Value != "")
                    valObj.CheckOutMin2 = Convert.ToInt32(txtCheckOutMin2.Value);
            }
            else
            {
                valObj.CheckOutHour1 = valObj.EndHour;
                valObj.CheckOutMin1 = valObj.EndMin;
                valObj.CheckOutHour2 = valObj.EndHour;
                valObj.CheckOutMin2 = valObj.EndMin;
            }

            if (txtColor.Value != "")
                valObj.Color = Convert.ToString(txtColor.Value);

            valObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);

            float num = -1;
            if (float.TryParse(txtSchNumber.Value, out num))
            {
                valObj.SchNumber = num;
            }
            else
            {
                valObj.SchNumber = 0.5;
            }

            valObj.SchUnit = Convert.ToInt32(txtSchUnit.SelectedValue);

            if (keyid != "")
            {
                valObj.SchClassid = Convert.ToInt32(keyid);
                count = BLLTable<HR_SchClass>.Factory(conn).Update(valObj, HR_SchClass.Attribute.SchClassid);
            }
            else
            {
                count = BLLTable<HR_SchClass>.Factory(conn).Insert(valObj, HR_SchClass.Attribute.SchClassid);
                keyid = valObj.SchClassid.ToString();

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
                if (btn.ID == "btnOK" || btn.ID == "_btnOK")
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.close();", true);
                    //if (ViewState["hadSave"] == null)
                    //{
                    //    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                    //}
                    //else
                    //{
                    //    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    //}
                }
                else
                {
                    
                    
                    txtSchClassid.Value = "";
                    
                    
                    txtSchName.Value ="";
                    
                    
                    txtStartHour.Value ="0";
                    
                    
                    txtStartMin.Value ="0";
                    
                    
                    txtEndHour.Value ="0";
                    
                    
                    txtEndMin.Value ="0";
                    
                    
                    txtLateMinutes.Value ="0";
                    
                    
                    txtEarlyMinutes.Value ="0";
                    
                    
                    txtCheckIn.Checked=false;
                    
                    
                    txtCheckOut.Checked=false;
                    
                    
                    txtCheckInHour1.Value ="0";
                    
                    
                    txtCheckInMin1.Value ="0";
                    
                    
                    txtCheckInHour2.Value ="0";
                    
                    
                    txtCheckInMin2.Value ="0";
                    
                    
                    txtCheckOutHour1.Value ="0";
                    
                    
                    txtCheckOutMin1.Value ="0";
                    
                    
                    txtCheckOutHour2.Value ="0";
                    
                    
                    txtCheckOutMin2.Value ="0";
                    
                    
                    txtColor.Value ="#009";
                    
                    
                    txtIsOvertime.Checked=false;

                    txtSchNumber.Value = "0.5";

                    txtSchUnit.SelectedIndex = 1;
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

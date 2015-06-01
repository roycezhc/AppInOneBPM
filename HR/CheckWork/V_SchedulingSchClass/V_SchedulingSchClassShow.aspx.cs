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

public partial class V_SchedulingSchClassShow : AgileFrame.AppInOne.Common.BasePage
{
    V_SchedulingSchClass valObj=new V_SchedulingSchClass();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["SchName"]))
                {

                    valObj = BLLTable<V_SchedulingSchClass>.Factory(conn).GetRowData(V_SchedulingSchClass.Attribute.SchName, Request["SchName"]);
                    if(valObj==null) return ;
                    
                    
                    txtSchName.Text = Convert.ToString(valObj.SchName);//Convert.ToString
                    
                    
                    txtLateMinutes.Text = Convert.ToString(valObj.LateMinutes);//Convert.ToInt32
                    
                    
                    txtEarlyMinutes.Text = Convert.ToString(valObj.EarlyMinutes);//Convert.ToInt32
                    
                    
                    txtCheckIn.Checked = valObj.CheckIn;


                    txtCheckOut.Checked = valObj.CheckOut;
                    
                    
                    txtColor.Text = Convert.ToString(valObj.Color);//Convert.ToInt32


                    txtIsOvertime.Checked = valObj.IsOverTime;
                    
                    
                    txtYear.Text = Convert.ToString(valObj.SchYear);//Convert.ToInt32
                    
                    
                    txtMonth.Text = Convert.ToString(valObj.SchMonth);//Convert.ToInt16
                    
                    
                    txtDay.Text = Convert.ToString(valObj.SchDay);//Convert.ToInt16
                    
                    
                    txtType.Text = Convert.ToString(valObj.SchType);//Convert.ToInt32
                    
                    
                    txtSchClassid.Text = Convert.ToString(valObj.SchClassid);//Convert.ToInt32
                    
                    
                    txtStartHour.Text = Convert.ToString(valObj.StartHour);//Convert.ToInt32
                    
                    
                    txtStartMin.Text = Convert.ToString(valObj.StartMin);//Convert.ToInt32
                    
                    
                    txtEndHour.Text = Convert.ToString(valObj.EndHour);//Convert.ToInt32
                    
                    
                    txtEndMin.Text = Convert.ToString(valObj.EndMin);//Convert.ToInt32
                    
                    
                    txtCheckInHour1.Text = Convert.ToString(valObj.CheckInHour1);//Convert.ToInt32
                    
                    
                    txtCheckInMin1.Text = Convert.ToString(valObj.CheckInMin1);//Convert.ToInt32
                    
                    
                    txtCheckInHour2.Text = Convert.ToString(valObj.CheckInHour2);//Convert.ToInt32
                    
                    
                    txtCheckInMin2.Text = Convert.ToString(valObj.CheckInMin2);//Convert.ToInt32
                    
                    
                    txtCheckOutHour1.Text = Convert.ToString(valObj.CheckOutHour1);//Convert.ToInt32
                    
                    
                    txtCheckOutMin1.Text = Convert.ToString(valObj.CheckOutMin1);//Convert.ToInt32
                    
                    
                    txtCheckOutMin2.Text = Convert.ToString(valObj.CheckOutMin2);//Convert.ToInt32
                    
                    
                    txtCheckOutHour2.Text = Convert.ToString(valObj.CheckOutHour2);//Convert.ToInt32

                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["ajax"] != null)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文
                //Response.ContentType = "html/text";

                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divC.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
        }
    }

}

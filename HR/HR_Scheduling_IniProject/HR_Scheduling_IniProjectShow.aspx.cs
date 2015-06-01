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

public partial class HR_Scheduling_IniProjectShow : AgileFrame.AppInOne.Common.BasePage
{
    HR_Scheduling_IniProject valObj=new HR_Scheduling_IniProject();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["ID"]))
                {

                    valObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).GetRowData(HR_Scheduling_IniProject.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToString
                    
                    
                    txtSelBanciId.Text = Convert.ToString(valObj.SelBanciId);//Convert.ToString
                    
                    
                    txtXiuXi.Text = Convert.ToString(valObj.XiuXi);//Convert.ToString
                    
                    
                    txtWorkDayType.Text = Convert.ToString(valObj.WorkDayType);//Convert.ToString
                    
                    
                    txtStartTime.Text = (valObj.StartTime == DateTime.MinValue) ? "" : valObj.StartTime.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEndTime.Text = (valObj.EndTime == DateTime.MinValue) ? "" : valObj.EndTime.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtFuGaiOrZengBu.Text = Convert.ToString(valObj.FuGaiOrZengBu);//Convert.ToInt32
                    
                    
                    txtStaffID.Text = Convert.ToString(valObj.StaffID);//Convert.ToString
                    
                    
                    txtDeptID.Text = Convert.ToString(valObj.DeptID);//Convert.ToString
                    
                    
                    txtOrgID.Text = Convert.ToString(valObj.OrgID);//Convert.ToString
                    
                    
                    txtProjectName.Text = Convert.ToString(valObj.ProjectName);//Convert.ToString

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

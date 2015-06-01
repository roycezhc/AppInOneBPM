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

public partial class HR_CHECKINOUTShow : AgileFrame.AppInOne.Common.BasePage
{
    HR_CHECKINOUT valObj=new HR_CHECKINOUT();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["CHECKTIME"]))
                {

                    valObj = BLLTable<HR_CHECKINOUT>.Factory(conn).GetRowData(HR_CHECKINOUT.Attribute.CHECKTIME, Request["CHECKTIME"]);
                    if(valObj==null) return ;
                    
                    
                    txtUSERID.Text = Convert.ToString(valObj.USERID);//Convert.ToInt32
                    
                    
                    txtCHECKTIME.Text = (valObj.CHECKTIME == DateTime.MinValue) ? "" : valObj.CHECKTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtSTAFF_ID.Text = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal
                    
                    
                    txtCHECKTYPE.Text = Convert.ToString(valObj.CHECKTYPE);//Convert.ToString
                    
                    
                    txtVERIFYCODE.Text = Convert.ToString(valObj.VERIFYCODE);//Convert.ToInt32
                    
                    
                    txtSENSORID.Text = Convert.ToString(valObj.SENSORID);//Convert.ToString

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

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

public partial class SYS_BILL_CTRLShow : AgileFrame.AppInOne.Common.BasePage
{
    SYS_BILL_CTRL valObj=new SYS_BILL_CTRL();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["CTRL_ID"]))
                {

                    valObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).GetRowData(SYS_BILL_CTRL.Attribute.CTRL_ID, Request["CTRL_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCTRL_ID.Text = Convert.ToString(valObj.CTRL_ID);//Convert.ToInt32
                    
                    
                    txtCTRL_NAME.Text = Convert.ToString(valObj.CTRL_NAME);//Convert.ToString
                    
                    
                    txtCTRL_CODE.Text = Convert.ToString(valObj.CTRL_CODE);//Convert.ToString
                    
                    
                    txtP_CTRL_ID.Text = Convert.ToString(valObj.P_CTRL_ID);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                    
                    
                    txtEL_HTML.Text = Convert.ToString(valObj.EL_HTML);//Convert.ToString
                    
                    
                    txtJS_CODE.Text = Convert.ToString(valObj.JS_CODE);//Convert.ToString

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

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

public partial class WF_CTRL_TYPEShow : AgileFrame.AppInOne.Common.BasePage
{
    TF_CTRL_TYPE valObj=new TF_CTRL_TYPE();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["CTRL_TYPE"]))
                {

                    valObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).GetRowData(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Request["CTRL_TYPE"]);
                    if(valObj==null) return ;
                    
                    
                    txtCTRL_TYPE.Text = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString
                    
                    
                    txtP_CTRL_TYPE.Text = Convert.ToString(valObj.P_CTRL_TYPE);//Convert.ToString
                    
                    
                    txtCTRL_NAME.Text = Convert.ToString(valObj.CTRL_NAME);//Convert.ToString
                    
                    
                    txtEL_HTML.Text = Convert.ToString(valObj.EL_HTML);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                    
                    
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

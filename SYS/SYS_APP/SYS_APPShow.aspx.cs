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

public partial class SYS_APPShow : BaseAdminPage
{
    protected SYS_APP valObj=new SYS_APP();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["APP_ID"]))
                {
                    valObj = BLLTable<SYS_APP>.Factory(conn).GetRowData(SYS_APP.Attribute.APP_ID, Request["APP_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtAPP_ID.Text = Convert.ToString(valObj.APP_ID);//Convert.ToString
                    
                    
                    txtAPP_NAME.Text = Convert.ToString(valObj.APP_NAME);//Convert.ToString
                    
                    
                    txtAPP_LABEL.Text = Convert.ToString(valObj.APP_LABEL);//Convert.ToString
                    
                    
                    txtDEFAULT_URL.Text = Convert.ToString(valObj.DEFAULT_URL);//Convert.ToString
                    
                    
                    txtDEFAULT_URL_NAME.Text = Convert.ToString(valObj.DEFAULT_URL_NAME);//Convert.ToString
                    
                    
                    txtIsBigSystem.Text=valObj.IsBigSystem.ToString();
                    
                    
                    txtNote.Text = Convert.ToString(valObj.Note);//Convert.ToString
                    
                    
                    txtAPP_IMG.Text = Convert.ToString(valObj.APP_IMG);//Convert.ToString
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

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

public partial class WEC_CUSTOM_WEB_SETShow : BaseAdminPage
{
    protected WEC_CUSTOM_WEB_SET valObj=new WEC_CUSTOM_WEB_SET();
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
                if (!string.IsNullOrEmpty(Request["ID"]))
                {
                    valObj = BLLTable<WEC_CUSTOM_WEB_SET>.Factory(conn).GetRowData(WEC_CUSTOM_WEB_SET.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtWEC_CUSTOM_WEB_SET_ID.Text = Convert.ToString(valObj.ID);//Convert.ToInt32
                    
                    
                    txtWEC_CUSTOM_WEB_SET_STAFF_ID.Text = Convert.ToString(valObj.STAFF_ID);//Convert.ToInt32
                    
                    
                    txtWEC_CUSTOM_WEB_SET_A_ID.Text = Convert.ToString(valObj.A_ID);//Convert.ToInt32
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

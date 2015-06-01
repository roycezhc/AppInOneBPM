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

public partial class APP_STATISTICSShow : BaseAdminPage
{
    protected APP_STATISTICS valObj=new APP_STATISTICS();
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
                    valObj = BLLTable<APP_STATISTICS>.Factory(conn).GetRowData(APP_STATISTICS.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtAPP_STATISTICS_ID.Text = Convert.ToString(valObj.ID);//Convert.ToInt32
                    
                    
                    txtAPP_STATISTICS_AF_ADDTIME.Text = (valObj.AF_ADDTIME == DateTime.MinValue) ? "" : valObj.AF_ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtAPP_STATISTICS_IP.Text = Convert.ToString(valObj.IP);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_LONG.Text = Convert.ToString(valObj.LONG);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_LAT.Text = Convert.ToString(valObj.LAT);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_DEVICE_SYS.Text = Convert.ToString(valObj.DEVICE_SYS);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_VER_CODE.Text = Convert.ToString(valObj.VER_CODE);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_DEVICE_MODEL.Text = Convert.ToString(valObj.DEVICE_MODEL);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_STAFF_ID.Text = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal
                    
                    
                    txtAPP_STATISTICS_DEVICE_ID.Text = Convert.ToString(valObj.DEVICE_ID);//Convert.ToString
                    
                    
                    txtAPP_STATISTICS_VER_NAME.Text = Convert.ToString(valObj.VER_NAME);//Convert.ToString
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

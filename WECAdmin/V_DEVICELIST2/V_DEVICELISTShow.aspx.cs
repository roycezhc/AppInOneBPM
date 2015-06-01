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

public partial class V_DEVICELISTShow : BaseAdminPage
{
    protected V_DEVICELIST valObj=new V_DEVICELIST();
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
                    valObj = BLLTable<V_DEVICELIST>.Factory(conn).GetRowData(V_DEVICELIST.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtV_DEVICELIST_ID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtV_DEVICELIST_USER_ID.Text = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal
                    
                    
                    txtV_DEVICELIST_DEVICE_ID.Text = Convert.ToString(valObj.DEVICE_ID);//Convert.ToString
                    
                    
                    txtV_DEVICELIST_KIND.Text = Convert.ToString(valObj.KIND);//Convert.ToInt32
                    
                    
                    txtV_DEVICELIST_DEBUG.Text = Convert.ToString(valObj.DEBUG);//Convert.ToInt32
                    
                    
                    txtV_DEVICELIST_STATUS.Text = Convert.ToString(valObj.STATUS);//Convert.ToInt32
                    
                    
                    txtV_DEVICELIST_AF_ADDTIEM.Text = Convert.ToString(valObj.AF_ADDTIEM);//Convert.ToDateTime
                    
                    
                    txtV_DEVICELIST_AF_EDITTIME.Text = Convert.ToString(valObj.AF_EDITTIME);//Convert.ToDateTime
                    
                    
                    txtV_DEVICELIST_TOKEN_ID.Text = Convert.ToString(valObj.TOKEN_ID);//Convert.ToString
                    
                    
                    txtV_DEVICELIST_STAFF_NAME.Text = Convert.ToString(valObj.STAFF_NAME);//Convert.ToString
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

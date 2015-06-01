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

public partial class Ec_tabShow : BaseAdminPage
{
    Ec_tab valObj=new Ec_tab();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Tabid"]))
                {

                    valObj = BLLTable<Ec_tab>.Factory(conn).GetRowData(Ec_tab.Attribute.Tabid, Request["Tabid"]);
                    if(valObj==null) return ;
                    
                    
                    txtTabid.Text = Convert.ToString(valObj.Tabid);//Convert.ToInt32
                    
                    
                    txtName.Text = Convert.ToString(valObj.Name);//Convert.ToString
                    
                    
                    txtPresence.Text = Convert.ToString(valObj.Presence);//Convert.ToInt32
                    
                    
                    txtTabsequence.Text = Convert.ToString(valObj.Tabsequence);//Convert.ToInt32
                    
                    
                    txtTablabel.Text = Convert.ToString(valObj.Tablabel);//Convert.ToString
                    
                    
                    txtModifiedby.Text = Convert.ToString(valObj.Modifiedby);//Convert.ToInt32
                    
                    
                    txtModifiedtime.Text = Convert.ToString(valObj.Modifiedtime);//Convert.ToInt32
                    
                    
                    txtCustomized.Text = Convert.ToString(valObj.Customized);//Convert.ToInt32
                    
                    
                    txtReportable.Text = Convert.ToString(valObj.Reportable);//Convert.ToInt32

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

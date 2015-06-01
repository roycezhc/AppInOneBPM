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

public partial class Ec_blocksShow : BaseAdminPage
{
    Ec_blocks valObj=new Ec_blocks();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Blockid"]))
                {

                    valObj = BLLTable<Ec_blocks>.Factory(conn).GetRowData(Ec_blocks.Attribute.Blockid, Request["Blockid"]);
                    if(valObj==null) return ;
                    
                    
                    txtBlockid.Text = Convert.ToString(valObj.Blockid);//Convert.ToInt32
                    
                    
                    txtTabid.Text = Convert.ToString(valObj.Tabid);//Convert.ToInt32
                    
                    
                    txtBlocklabel.Text = Convert.ToString(valObj.Blocklabel);//Convert.ToString
                    
                    
                    txtSequence.Text = Convert.ToString(valObj.Sequence);//Convert.ToInt32
                    
                    
                    txtShow_title.Text = Convert.ToString(valObj.Show_title);//Convert.ToInt32
                    
                    
                    txtVisible.Text = Convert.ToString(valObj.Visible);//Convert.ToInt32
                    
                    
                    txtCreate_view.Text = Convert.ToString(valObj.Create_view);//Convert.ToInt32
                    
                    
                    txtEdit_view.Text = Convert.ToString(valObj.Edit_view);//Convert.ToInt32
                    
                    
                    txtDetail_view.Text = Convert.ToString(valObj.Detail_view);//Convert.ToInt32

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

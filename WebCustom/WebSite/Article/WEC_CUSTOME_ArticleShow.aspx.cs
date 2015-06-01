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

public partial class WEC_CUSTOM_ArticleShow : System.Web.UI.Page
{
    WEC_CUSTOM_Article valObj=new WEC_CUSTOM_Article();
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

                    valObj = BLLTable<WEC_CUSTOM_Article>.GetRowData(WEC_CUSTOM_Article.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtCID.Text = Convert.ToString(valObj.CID);//Convert.ToString
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtDES.Text = Convert.ToString(valObj.DES);//Convert.ToString
                    
                    
                    txtCONTENT.Text = Convert.ToString(valObj.CONTENT);//Convert.ToString
                    
                    
                    txtURL.Text = Convert.ToString(valObj.URL);//Convert.ToString
                    
                    
                    txtPIC_URL.Text = Convert.ToString(valObj.PIC_URL);//Convert.ToString
                    
                    
                    txtMODEL_ID.Text = Convert.ToString(valObj.MODEL_ID);//Convert.ToDecimal

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

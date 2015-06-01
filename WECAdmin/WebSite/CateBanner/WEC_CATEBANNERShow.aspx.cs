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

public partial class WEC_CATEBANNERShow : System.Web.UI.Page
{
    WEC_CATEBANNER valObj=new WEC_CATEBANNER();
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

                    valObj = BLLTable<WEC_CATEBANNER>.GetRowData(WEC_CATEBANNER.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtPIC_URL.Text = Convert.ToString(valObj.PIC_URL);//Convert.ToString
                    
                    
                    txtOUT_URL.Text = Convert.ToString(valObj.OUT_URL);//Convert.ToString
                    
                    
                    txtSORT_ID.Text = Convert.ToString(valObj.SORT_ID);//Convert.ToInt32
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");

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

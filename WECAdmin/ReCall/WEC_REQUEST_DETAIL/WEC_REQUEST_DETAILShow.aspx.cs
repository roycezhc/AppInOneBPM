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

public partial class WEC_REQUEST_DETAILShow : System.Web.UI.Page
{
    WEC_REQUEST_DETAIL valObj=new WEC_REQUEST_DETAIL();
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

                    valObj = BLLTable<WEC_REQUEST_DETAIL>.GetRowData(WEC_REQUEST_DETAIL.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtTID.Text = Convert.ToString(valObj.TID);//Convert.ToDecimal
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtSORT_ID.Text = Convert.ToString(valObj.SORT_ID);//Convert.ToDecimal
                    
                    
                    txtPICURL.Text = Convert.ToString(valObj.PICURL);//Convert.ToString
                    
                    
                    txtTYPE_ID.Text=valObj.TYPE_ID.ToString();
                    
                    
                    txtTYPE_VALUE.Text = Convert.ToString(valObj.TYPE_VALUE);//Convert.ToString
                    
                    
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

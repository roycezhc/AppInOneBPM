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

public partial class WEC_C_CHANNELlISTShow : System.Web.UI.Page
{
    WEC_C_CHANNELlIST valObj=new WEC_C_CHANNELlIST();
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

                    valObj = BLLTable<WEC_C_CHANNELlIST>.GetRowData(WEC_C_CHANNELlIST.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtNAME.Text = Convert.ToString(valObj.NAME);//Convert.ToString
                    
                    
                    txtURL.Text = Convert.ToString(valObj.URL);//Convert.ToString
                    
                    
                    txtREMARK.Text = Convert.ToString(valObj.REMARK);//Convert.ToString
                    
                    
                    txtCATEGORY_ID.Text = Convert.ToString(valObj.CATEGORY_ID);//Convert.ToInt32
                    
                    
                    txtQRCODE.Text = Convert.ToString(valObj.QRCODE);//Convert.ToString
                    
                    
                    txtNOTE.Text = Convert.ToString(valObj.NOTE);//Convert.ToString
                    
                    
                    txtADDRESS.Text = Convert.ToString(valObj.ADDRESS);//Convert.ToString
                    
                    
                    txtTYPE.Text=valObj.TYPE.ToString();

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

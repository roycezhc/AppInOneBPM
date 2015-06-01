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

public partial class WEC_ACTIVITY_SNCODEShow : System.Web.UI.Page
{
    WEC_ACTIVITY_SNCODE valObj=new WEC_ACTIVITY_SNCODE();
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

                    valObj = BLLTable<WEC_ACTIVITY_SNCODE>.GetRowData(WEC_ACTIVITY_SNCODE.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtSN_CODE.Text = Convert.ToString(valObj.SN_CODE);//Convert.ToString
                    
                    
                    txtAWARD_TYPE.Text = Convert.ToString(valObj.AWARD_TYPE);//Convert.ToString
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtPHONE.Text = Convert.ToString(valObj.PHONE);//Convert.ToString
                    
                    
                    txtWX_CODE.Text = Convert.ToString(valObj.WX_CODE);//Convert.ToString
                    
                    
                    txtZJ_TIME.Text = (valObj.ZJ_TIME == DateTime.MinValue) ? "" : valObj.ZJ_TIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtSY_TIME.Text = (valObj.SY_TIME == DateTime.MinValue) ? "" : valObj.SY_TIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtA_ID.Text = Convert.ToString(valObj.A_ID);//Convert.ToDecimal

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

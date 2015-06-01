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

public partial class SYS_GUSETBOOKShow : System.Web.UI.Page
{
    SYS_GUSETBOOK valObj=new SYS_GUSETBOOK();
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

                    valObj = BLLTable<SYS_GUSETBOOK>.GetRowData(SYS_GUSETBOOK.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtTYPE.Text=valObj.TYPE.ToString();
                    
                    
                    txtMEMO.Text = Convert.ToString(valObj.MEMO);//Convert.ToString
                    
                    
                    txtEMAIL.Text = Convert.ToString(valObj.EMAIL);//Convert.ToString
                    
                    
                    txtMOBIL.Text = Convert.ToString(valObj.MOBIL);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtANSWER.Text = Convert.ToString(valObj.ANSWER);//Convert.ToString
                    
                    
                    txtUSERNAME.Text = Convert.ToString(valObj.USERNAME);//Convert.ToString

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

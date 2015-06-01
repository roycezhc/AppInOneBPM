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

public partial class SYS_BILLShow : AgileFrame.AppInOne.Common.BasePage
{
    SYS_BILL valObj=new SYS_BILL();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["BILL_ID"]))
                {

                    valObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, Request["BILL_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtBILL_ID.Text = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32
                    
                    
                    txtBILL_NAME.Text = Convert.ToString(valObj.BILL_NAME);//Convert.ToString
                    
                    
                    txtBILL_TYPE.Text = Convert.ToString(valObj.BILL_TYPE);//Convert.ToString
                    
                    
                    txtBILL_SQL.Text = Convert.ToString(valObj.BILL_SQL);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEDITIME.Text = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtADDER.Text = Convert.ToString(valObj.ADDER);//Convert.ToString
                    
                    
                    txtTABLE_NAME.Text = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString
                    
                    
                    txtP_BILL_ID.Text = Convert.ToString(valObj.P_BILL_ID);//Convert.ToInt32

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

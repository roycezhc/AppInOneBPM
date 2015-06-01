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

public partial class WF_PROCESS_TPLShow : AgileFrame.AppInOne.Common.BasePage
{
    WF_PROCESS_TPL valObj=new WF_PROCESS_TPL();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["PROCID"]))
                {

                    valObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, Request["PROCID"]);
                    if(valObj==null) return ;
                    
                    
                    txtPROCID.Text = Convert.ToString(valObj.PROCID);//Convert.ToInt32
                    
                    
                    txtPROC_NAME.Text = Convert.ToString(valObj.PROC_NAME);//Convert.ToString
                    
                    
                    txtWFCID.Text = Convert.ToString(valObj.WFID);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEDITIME.Text = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtGUID.Text = Convert.ToString(valObj.GUID);//Convert.ToString
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtSHOW_CONDITION.Text = Convert.ToString(valObj.CONDITION);//Convert.ToString
                    
                    
                    txtSHOW_FORMULA.Text = Convert.ToString(valObj.FORMULAR);//Convert.ToString
                    
                    
                    txtNOTE.Text = Convert.ToString(valObj.NOTE);//Convert.ToString

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

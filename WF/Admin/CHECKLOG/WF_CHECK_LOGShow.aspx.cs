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

public partial class WF_CHECK_LOGShow : AgileFrame.AppInOne.Common.BasePage
{
    WF_CHECK_LOG valObj=new WF_CHECK_LOG();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["LOG_ID"]))
                {

                    valObj = BLLTable<WF_CHECK_LOG>.Factory(conn).GetRowData(WF_CHECK_LOG.Attribute.LOG_ID, Request["LOG_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtLOG_ID.Text = Convert.ToString(valObj.LOG_ID);//Convert.ToInt32
                    
                    
                    txtWFCID.Text = Convert.ToString(valObj.WFID);//Convert.ToInt32
                    
                    
                    txtPROCID.Text = Convert.ToString(valObj.PROCID);//Convert.ToInt32
                    
                    
                    txtSTEP_ID.Text = Convert.ToString(valObj.STEP_ID);//Convert.ToInt32


                    txtREC_ID.Text = Convert.ToString(valObj.RECID);//Convert.ToString
                    
                    
                    txtDETAIL_ID.Text = Convert.ToString(valObj.DETAIL_ID);//Convert.ToString
                    
                    
                    txtRESULT.Text=valObj.RESULT.ToString();
                    
                    
                    txtCHECKER.Text = Convert.ToString(valObj.CHECKER);//Convert.ToString
                    
                    
                    txtCHECK_TIME.Text = (valObj.CHECK_TIME == DateTime.MinValue) ? "" : valObj.CHECK_TIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtNOTE.Text = Convert.ToString(valObj.NOTE);//Convert.ToString
                    
                    
                    txtRESULTS.Text = Convert.ToString(valObj.RESULTS);//Convert.ToString
                    
                    
                    txtCHECKERS.Text = Convert.ToString(valObj.CHECKERS);//Convert.ToString
                    
                    
                    txtCHECK_TIMES.Text = Convert.ToString(valObj.CHECK_TIMES);//Convert.ToString
                    
                    
                    txtNOTES.Text = Convert.ToString(valObj.NOTES);//Convert.ToString

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

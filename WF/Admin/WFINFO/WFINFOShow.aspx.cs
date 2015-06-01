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

public partial class WF_INFOShow : AgileFrame.AppInOne.Common.BasePage
{
    WF_INFO valObj=new WF_INFO();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["WFCID"]))
                {

                    valObj = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, Request["WFCID"]);
                    if(valObj==null) return ;
                    
                    
                    txtWFCID.Text = Convert.ToString(valObj.WFID);//Convert.ToInt32
                    
                    
                    txtWFCNAME.Text = Convert.ToString(valObj.WFCNAME);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEDITIME.Text = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtUSE_LIMIT.Text=valObj.USE_LIMIT.ToString();
                    
                    
                    //txtFORMTB.Text = Convert.ToString(valObj.FORMTB);//Convert.ToString
                    
                    
                    //txtFORMDETAIL.Text = Convert.ToString(valObj.FORMDETAIL);//Convert.ToString
                    
                    
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

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

public partial class SYS_USERShow : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USER valObj=new SYS_USER();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["USER_ID"]))
                {

                    valObj = BLLTable<SYS_USER>.Factory(conn).GetRowData(SYS_USER.Attribute.USER_ID, Request["USER_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtUSER_ID.Text = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal
                    
                    
                    txtUSER_NAME.Text = Convert.ToString(valObj.USER_NAME);//Convert.ToString
                    
                    
                    txtPASS.Text = Convert.ToString(valObj.PASS);//Convert.ToString
                    
                    
                    txtEMAIL.Text = Convert.ToString(valObj.EMAIL);//Convert.ToString
                    
                    
                    txtLOGIN_IPS.Text = Convert.ToString(valObj.LOGIN_IPS);//Convert.ToString


                    txtSTATE_FLAG.Text = valObj.USE_FLAG.ToString();


                    txtEDITIME.Text = (valObj.EDITTIME == DateTime.MinValue) ? "" : valObj.EDITTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtUSER_TYPE.Text=valObj.USER_TYPE.ToString();

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

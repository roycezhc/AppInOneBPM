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

public partial class WF_FORMShow : AgileFrame.AppInOne.Common.BasePage
{
    TF_FORM valObj=new TF_FORM();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["FORM_ID"]))
                {

                    valObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, Request["FORM_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtFORM_ID.Text = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32
                    
                    
                    txtF_NAME.Text = Convert.ToString(valObj.F_NAME);//Convert.ToString
                    
                    
                    txtTB_ID.Text = Convert.ToString(valObj.TB_ID);//Convert.ToInt32
                    
                    
                    txtTPL_EDIT.Text = Convert.ToString(valObj.TPL_EDIT);//Convert.ToString
                    
                    
                    txtTPL_SHOW.Text = Convert.ToString(valObj.TPL_SHOW);//Convert.ToString
                    
                    
                    txtTPL_PRINT.Text = Convert.ToString(valObj.TPL_PRINT);//Convert.ToString
                    
                    
                    txtTPL_LIST.Text = Convert.ToString(valObj.TPL_LIST);//Convert.ToString
                    
                    
                    txtTB_IDS.Text = Convert.ToString(valObj.TB_IDS);//Convert.ToString

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

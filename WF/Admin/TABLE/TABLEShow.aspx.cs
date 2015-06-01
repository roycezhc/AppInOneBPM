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

public partial class TF_TABLEShow2 : AgileFrame.AppInOne.Common.BasePage
{
    TF_TABLE valObj=new TF_TABLE();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["TB_ID"]))
                {

                    valObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, Request["TB_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtTB_ID.Text = Convert.ToString(valObj.TB_ID);//Convert.ToInt32
                    
                    
                    txtTB_NAME.Text = Convert.ToString(valObj.TB_NAME);//Convert.ToString
                    
                    
                    txtCH_NAME.Text = Convert.ToString(valObj.CH_NAME);//Convert.ToString
                    
                    
                    txtM_TB_ID.Text = Convert.ToString(valObj.M_TB_ID);//Convert.ToInt32
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                    
                    
                    txtTB_TYPE.Text=valObj.TB_TYPE.ToString();
                    
                    
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

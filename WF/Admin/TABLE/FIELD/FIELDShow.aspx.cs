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

public partial class TF_TB_FIELDShow2 : AgileFrame.AppInOne.Common.BasePage
{
    TF_TB_FIELD valObj=new TF_TB_FIELD();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["FIELD_ID"]))
                {

                    valObj = BLLTable<TF_TB_FIELD>.Factory(conn).GetRowData(TF_TB_FIELD.Attribute.FIELD_ID, Request["FIELD_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtFIELD_ID.Text = Convert.ToString(valObj.FIELD_ID);//Convert.ToInt32
                    
                    
                    txtFIELD_NAME.Text = Convert.ToString(valObj.FIELD_NAME);//Convert.ToString
                    
                    
                    //txtFIELD_TYPE.Text=valObj.FIELD_TYPE.ToString();
                    
                    
                    txtDB_TYPE.Text = Convert.ToString(valObj.DB_TYPE);//Convert.ToString
                    
                    
                    txtIS_NULL.Text = Convert.ToString(valObj.IS_NULL);//Convert.ToInt32
                    
                    
                    txtNOTE.Text = Convert.ToString(valObj.NOTE);//Convert.ToString
                    
                    
                    txtDEFAULT_VAL.Text = Convert.ToString(valObj.DEFAULT_VAL);//Convert.ToString
                    
                    
                    txtTB_ID.Text = Convert.ToString(valObj.TB_ID);//Convert.ToInt32
                    
                    
                    txtCTRL_TYPE.Text = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32

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

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

public partial class WF_F_COLUMN_ITEMShow : AgileFrame.AppInOne.Common.BasePage
{
    TF_F_COLUMN_ITEM valObj=new TF_F_COLUMN_ITEM();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["ITEM_ID"]))
                {

                    valObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).GetRowData(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Request["ITEM_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtITEM_ID.Text = Convert.ToString(valObj.ITEM_ID);//Convert.ToInt32
                    
                    
                    txtFORM_ID.Text = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32
                    
                    
                    txtCOLUMN_ID.Text = Convert.ToString(valObj.COLUMN_ID);//Convert.ToInt32
                    
                    
                    txtVALUE.Text = Convert.ToString(valObj.VALUE);//Convert.ToString
                    
                    
                    txtTEXT.Text = Convert.ToString(valObj.TEXT);//Convert.ToString
                    
                    
                    txtDROP_REAL.Text = Convert.ToString(valObj.DROP_REAL);//Convert.ToString
                    
                    
                    txtCOL_HIDE.Text = Convert.ToString(valObj.COL_HIDE);//Convert.ToString

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

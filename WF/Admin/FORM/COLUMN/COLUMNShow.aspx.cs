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

public partial class WF_F_COLUMNShow : AgileFrame.AppInOne.Common.BasePage
{
    TF_F_COLUMN valObj=new TF_F_COLUMN();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["COLUMN_ID"]))
                {

                    valObj = BLLTable<TF_F_COLUMN>.Factory(conn).GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, Request["COLUMN_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCOLUMN_ID.Text = Convert.ToString(valObj.COLUMN_ID);//Convert.ToInt32
                    
                    
                    txtFORM_ID.Text = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32
                    
                    
                    txtTB_ID.Text = Convert.ToString(valObj.TB_ID);//Convert.ToInt32
                    
                    
                    txtFIELD_ID.Text = Convert.ToString(valObj.FIELD_ID);//Convert.ToInt32
                    
                    
                    txtSHOW_NAME.Text = Convert.ToString(valObj.SHOW_NAME);//Convert.ToString
                    
                    
                    txtCTRL_TYPE.Text = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString
                    
                    
                    txtMAX_VAL.Text = Convert.ToString(valObj.MAX_VAL);//Convert.ToInt32
                    
                    
                    txtMIN_VAL.Text = Convert.ToString(valObj.MIN_VAL);//Convert.ToInt32
                    
                    
                    txtIS_NEED.Text = Convert.ToString(valObj.IS_NEED);//Convert.ToInt32
                    
                    
                    txtCAL_FORMULA.Text = Convert.ToString(valObj.CAL_FORMULA);//Convert.ToString
                    
                    
                    txtSUM_FIELD_ID.Text = Convert.ToString(valObj.SUM_FIELD_ID);//Convert.ToString
                    
                    
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

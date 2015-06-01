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

public partial class KM_KNMAShow : AgileFrame.AppInOne.Common.BasePage
{
    KM_KNMA valObj=new KM_KNMA();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["KNMA_ID"]))
                {

                    valObj = BLLTable<KM_KNMA>.Factory(conn).GetRowData(KM_KNMA.Attribute.KNMA_ID, Request["KNMA_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtKNMA_ID.Text = Convert.ToString(valObj.KNMA_ID);//Convert.ToString
                    
                    
                    txtKNMA_NAME.Text = Convert.ToString(valObj.KNMA_NAME);//Convert.ToString
                    
                    
                    txtP_KNMA_ID.Text = Convert.ToString(valObj.P_KNMA_ID);//Convert.ToString
                    
                    
                    txtCONTENT.Text = Convert.ToString(valObj.CONTENT);//Convert.ToString
                    
                    
                    txtCLASS_ID.Text=valObj.CLASS_ID.ToString();
                    
                    
                    txtUP_TYPE.Text=valObj.UP_TYPE.ToString();
                    
                    
                    txtEA_SIGN.Text=valObj.EA_SIGN.ToString();
                    
                    
                    txtAUTHOR.Text = Convert.ToString(valObj.AUTHOR);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToDecimal
                    
                    
                    txtDEPT_ID.Text = Convert.ToString(valObj.DEPT_ID);//Convert.ToString
                    
                    
                    txtADD_TIME.Text = (valObj.ADD_TIME == DateTime.MinValue) ? "" : valObj.ADD_TIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEDIT_TIME.Text = (valObj.EDIT_TIME == DateTime.MinValue) ? "" : valObj.EDIT_TIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtPATH_ID.Text = Convert.ToString(valObj.PATH_ID);//Convert.ToString
                    
                    
                    txtCAN_EDIT.Text=valObj.CAN_EDIT.ToString();
                    
                    
                    txtCAN_COMMENTS.Text=valObj.CAN_COMMENTS.ToString();
                    
                    
                    txtADD_USER.Text = Convert.ToString(valObj.ADD_USER);//Convert.ToString
                    
                    
                    txtEDIT_USER.Text = Convert.ToString(valObj.EDIT_USER);//Convert.ToString
                    
                    
                    txtS_LEVEL.Text = Convert.ToString(valObj.S_LEVEL);//Convert.ToString
                    
                    
                    txtEXP1.Text = Convert.ToString(valObj.EXP1);//Convert.ToString
                    
                    
                    txtEXP2.Text = Convert.ToString(valObj.EXP2);//Convert.ToString
                    
                    
                    txtEXP3.Text = Convert.ToString(valObj.EXP3);//Convert.ToString
                    
                    
                    txtEXP4.Text = Convert.ToString(valObj.EXP4);//Convert.ToString

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

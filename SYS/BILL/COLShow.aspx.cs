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

public partial class SYS_BILL_COLShow : AgileFrame.AppInOne.Common.BasePage
{
    SYS_BILL_COL valObj=new SYS_BILL_COL();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["COL_ID"]))
                {

                    valObj = BLLTable<SYS_BILL_COL>.Factory(conn).GetRowData(SYS_BILL_COL.Attribute.COL_ID, Request["COL_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCOL_ID.Text = Convert.ToString(valObj.COL_ID);//Convert.ToInt32
                    
                    
                    txtBILL_ID.Text = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32
                    
                    
                    txtTABLE_NAME.Text = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString
                    
                    
                    txtCOL_NAME.Text = Convert.ToString(valObj.COL_NAME);//Convert.ToString
                    
                    
                    txtCOL_NOTE.Text = Convert.ToString(valObj.COL_NOTE);//Convert.ToString
                    
                    
                    txtDATA_TYPE.Text = Convert.ToString(valObj.DATA_TYPE);//Convert.ToString
                    
                    
                    txtDATA_LEN.Text = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32
                    
                    
                    txtDATA_ACC.Text = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32
                    
                    
                    txtIS_AUTO.Text = Convert.ToString(valObj.IS_AUTO);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32


                    txtCOL_SHOW.Text = Convert.ToString(valObj.FK_SHOW);//Convert.ToString
                    
                    
                    txtDISPLAY_NAME.Text = Convert.ToString(valObj.DISPLAY_NAME);//Convert.ToString
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtDVAL.Text = Convert.ToString(valObj.DVAL);//Convert.ToString
                    
                    
                    txtBILL_ROW_FORMULAR.Text = Convert.ToString(valObj.BILL_ROW_FORMULAR);//Convert.ToString
                    
                    
                    txtBILL_COL_FORMULAR.Text = Convert.ToString(valObj.BILL_COL_FORMULAR);//Convert.ToString
                    
                    
                    txtBILL_ISHEADER.Text = Convert.ToString(valObj.BILL_ISHEADER);//Convert.ToString
                    
                    
                    txtBILL_HERDERWIDTH.Text = Convert.ToString(valObj.BILL_HERDERWIDTH);//Convert.ToInt32
                    
                    
                    txtFORM_CHECKTYPE.Text = Convert.ToString(valObj.FORM_CHECKTYPE);//Convert.ToString
                    
                    
                    txtFORM_CTRL_ID.Text = Convert.ToString(valObj.FORM_CTRL_ID);//Convert.ToInt32
                    
                    
                    txtFORM_SHOW.Text = Convert.ToString(valObj.FORM_SHOW);//Convert.ToString
                    
                    
                    txtFORM_NEED.Text = Convert.ToString(valObj.FORM_NEED);//Convert.ToString
                    
                    
                    txtFORM_MIN.Text = Convert.ToString(valObj.FORM_MIN);//Convert.ToString
                    
                    
                    txtFORM_MAX.Text = Convert.ToString(valObj.FORM_MAX);//Convert.ToString
                    
                    
                    txtFORM_ONEROW.Text = Convert.ToString(valObj.FORM_ONEROW);//Convert.ToString
                    
                    
                    txtFORM_CTRLWIDTH.Text = Convert.ToString(valObj.FORM_CTRLWIDTH);//Convert.ToInt32
                    
                    
                    txtSEARCH_INBILL.Text = Convert.ToString(valObj.SEARCH_INBILL);//Convert.ToString
                    
                    
                    txtSEARCH_TYPE.Text = Convert.ToString(valObj.SEARCH_TYPE);//Convert.ToString
                    
                    
                    txtSEARCH_FORMULAR.Text = Convert.ToString(valObj.SEARCH_FORMULAR);//Convert.ToString

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

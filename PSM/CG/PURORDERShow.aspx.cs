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

public partial class IM_PURORDERShow : AgileFrame.AppInOne.Common.BasePage
{
    IM_PURORDER valObj=new IM_PURORDER();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["PORD_ID"]))
                {

                    valObj = BLLTable<IM_PURORDER>.Factory(conn).GetRowData(IM_PURORDER.Attribute.PORD_ID, Request["PORD_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtPORD_ID.Text = Convert.ToString(valObj.PORD_ID);//Convert.ToDecimal
                    
                    
                    txtPORD_NO.Text = Convert.ToString(valObj.PORD_NO);//Convert.ToString
                    
                    
                    txtC_DATE.Text = (valObj.C_DATE == DateTime.MinValue) ? "" : valObj.C_DATE.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtORG_ID.Text = Convert.ToString(valObj.ORG_ID);//Convert.ToString
                    
                    
                    txtDEPT_ID.Text = Convert.ToString(valObj.DEPT_ID);//Convert.ToString
                    
                    
                    txtSUP_ID.Text = Convert.ToString(valObj.SUP_ID);//Convert.ToDecimal
                    
                    
                    txtPERSON_HID.Text = Convert.ToString(valObj.PERSON_HID);//Convert.ToDecimal
                    
                    
                    txtTS_NO.Text = Convert.ToString(valObj.TS_NO);//Convert.ToString
                    
                    
                    txtGOODES_NUM.Text = Convert.ToString(valObj.GOODES_NUM);//Convert.ToDecimal
                    
                    
                    txtARRIVAL_DATE.Text = (valObj.ARRIVAL_DATE == DateTime.MinValue) ? "" : valObj.ARRIVAL_DATE.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtPACKAGE_TYPE.Text = Convert.ToString(valObj.PACKAGE_TYPE);//Convert.ToString
                    
                    
                    txtTS_DEPT.Text = Convert.ToString(valObj.TS_DEPT);//Convert.ToString
                    
                    
                    txtPHONE.Text = Convert.ToString(valObj.PHONE);//Convert.ToString
                    
                    
                    txtCOST_PEICE_FLAG.Text = Convert.ToString(valObj.COST_PEICE_FLAG);//Convert.ToString
                    
                    
                    txtSTOR_ID.Text = Convert.ToString(valObj.STOR_ID);//Convert.ToDecimal
                    
                    
                    txtDEDUCTION_RATE.Text = Convert.ToString(valObj.DEDUCTION_RATE);//Convert.ToDecimal
                    
                    
                    txtTAX_RATE.Text = Convert.ToString(valObj.TAX_RATE);//Convert.ToDecimal
                    
                    
                    txtCREATER.Text = Convert.ToString(valObj.CREATER);//Convert.ToString
                    
                    
                    txtCHECKER.Text = Convert.ToString(valObj.CHECKER);//Convert.ToString
                    
                    
                    txtNOTE.Text = Convert.ToString(valObj.NOTE);//Convert.ToString
                    
                    
                    txtREMARK.Text = Convert.ToString(valObj.REMARK);//Convert.ToString
                    
                    
                    txtEXP1.Text = Convert.ToString(valObj.EXP1);//Convert.ToString
                    
                    
                    txtEXP2.Text = Convert.ToString(valObj.EXP2);//Convert.ToString
                    
                    
                    txtEXP3.Text = Convert.ToString(valObj.EXP3);//Convert.ToString

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

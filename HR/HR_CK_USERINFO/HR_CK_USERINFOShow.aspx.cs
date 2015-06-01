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

public partial class HR_CK_USERINFOShow : AgileFrame.AppInOne.Common.BasePage
{
    HR_CK_USERINFO valObj=new HR_CK_USERINFO();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["USERID"]))
                {

                    valObj = BLLTable<HR_CK_USERINFO>.Factory(conn).GetRowData(HR_CK_USERINFO.Attribute.USERID, Request["USERID"]);
                    if(valObj==null) return ;
                    
                    
                    txtUSERID.Text = Convert.ToString(valObj.USERID);//Convert.ToInt32
                    
                    
                    txtSTAFF_ID.Text = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal
                    
                    
                    txtBADGENUMBER.Text = Convert.ToString(valObj.BADGENUMBER);//Convert.ToString
                    
                    
                    txtSSN.Text = Convert.ToString(valObj.SSN);//Convert.ToString
                    
                    
                    txtNAME.Text = Convert.ToString(valObj.NAME);//Convert.ToString
                    
                    
                    txtGENDER.Text = Convert.ToString(valObj.GENDER);//Convert.ToString
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtPAGER.Text = Convert.ToString(valObj.PAGER);//Convert.ToString
                    
                    
                    txtBIRTHDAY.Text = (valObj.BIRTHDAY == DateTime.MinValue) ? "" : valObj.BIRTHDAY.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtHIREDDAY.Text = (valObj.HIREDDAY == DateTime.MinValue) ? "" : valObj.HIREDDAY.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtSTREET.Text = Convert.ToString(valObj.STREET);//Convert.ToString
                    
                    
                    txtCITY.Text = Convert.ToString(valObj.CITY);//Convert.ToString
                    
                    
                    txtSTATE.Text = Convert.ToString(valObj.STATE);//Convert.ToString
                    
                    
                    txtZIP.Text = Convert.ToString(valObj.ZIP);//Convert.ToString
                    
                    
                    txtOPHONE.Text = Convert.ToString(valObj.OPHONE);//Convert.ToString
                    
                    
                    txtFPHONE.Text = Convert.ToString(valObj.FPHONE);//Convert.ToString
                    
                    
                    txtVERIFICATIONMETHOD.Text = Convert.ToString(valObj.VERIFICATIONMETHOD);//Convert.ToInt16
                    
                    
                    txtDEFAULTDEPTID.Text = Convert.ToString(valObj.DEFAULTDEPTID);//Convert.ToInt16
                    
                    
                    txtSECURITYFLAGS.Text = Convert.ToString(valObj.SECURITYFLAGS);//Convert.ToInt16
                    
                    
                    txtATT.Text = Convert.ToString(valObj.ATT);//Convert.ToInt16
                    
                    
                    txtINLATE.Text = Convert.ToString(valObj.INLATE);//Convert.ToInt16
                    
                    
                    txtOUTEARLY.Text = Convert.ToString(valObj.OUTEARLY);//Convert.ToInt16
                    
                    
                    txtOVERTIME.Text = Convert.ToString(valObj.OVERTIME);//Convert.ToInt16
                    
                    
                    txtSEP.Text = Convert.ToString(valObj.SEP);//Convert.ToInt16
                    
                    
                    txtHOLIDAY.Text = Convert.ToString(valObj.HOLIDAY);//Convert.ToInt16
                    
                    
                    txtMINZU.Text = Convert.ToString(valObj.MINZU);//Convert.ToString
                    
                    
                    txtPASSWORD.Text = Convert.ToString(valObj.PASSWORD);//Convert.ToString
                    
                    
                    txtLUNCHDURATION.Text = Convert.ToString(valObj.LUNCHDURATION);//Convert.ToInt16
                    
                    
                    txtMVerifyPass.Text = Convert.ToString(valObj.MVerifyPass);//Convert.ToString
                    
                    
                    txtPHOTO.Text = Convert.ToString(valObj.PHOTO);//Convert.ToBase64CharArray

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

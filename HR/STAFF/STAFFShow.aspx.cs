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

public partial class HR_STAFFShow : AgileFrame.AppInOne.Common.BasePage
{
    HR_STAFF valObj=new HR_STAFF();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["STAFF_ID"]))
                {

                    valObj = BLLTable<HR_STAFF>.Factory(conn).GetRowData(HR_STAFF.Attribute.STAFF_ID, Request["STAFF_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtSTAFF_ID.Text = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal
                    
                    
                    txtSTAFF_NO.Text = Convert.ToString(valObj.STAFF_NO);//Convert.ToString


                    txtNAME.Text = Convert.ToString(valObj.STAFF_NAME);//Convert.ToString
                    
                    
                    txtDEPT_ID.Text = Convert.ToString(valObj.DEPT_ID);//Convert.ToString
                    
                    
                    txtGENDER.Text=valObj.GENDER.ToString();
                    
                    
                    txtPHOTO.Text = Convert.ToString(valObj.PHOTO);//Convert.ToString
                    
                    
                    txtPOS_NAME.Text = Convert.ToString(valObj.POS_NAME);//Convert.ToString
                    
                    
                    txtSTATION_CODE.Text = Convert.ToString(valObj.STATION_CODE);//Convert.ToString
                    
                    
                    txtWORK_TYPE_CODE.Text=valObj.WORK_TYPE_CODE.ToString();
                    
                    
                    txtTECH_LEVEL_CODE.Text = Convert.ToString(valObj.TECH_LEVEL_CODE);//Convert.ToString
                    
                    
                    txtYMD.Text = Convert.ToString(valObj.YMD);//Convert.ToString
                    
                    
                    txtMOBILE.Text = Convert.ToString(valObj.MOBILE);//Convert.ToString
                    
                    
                    txtOFFICE_TEL.Text = Convert.ToString(valObj.OFFICE_TEL);//Convert.ToString
                    
                    
                    txtCERT_FLAG.Text = Convert.ToString(valObj.CERT_FLAG);//Convert.ToString
                    
                    
                    txtFIXED_FLAG.Text = Convert.ToString(valObj.FIXED_FLAG);//Convert.ToString
                    
                    
                    txtON_POS_FLAG.Text = Convert.ToString(valObj.ON_POS_FLAG);//Convert.ToString
                    
                    
                    txtPROFESSION_CODE.Text = Convert.ToString(valObj.PROFESSION_CODE);//Convert.ToString
                    
                    
                    txtPROFESSION_BGN_DATE.Text = Convert.ToString(valObj.PROFESSION_BGN_DATE);//Convert.ToString
                    
                    
                    txtJOIN_DATE.Text = Convert.ToString(valObj.JOIN_DATE);//Convert.ToString
                    
                    
                    txtPOLITICAL_STATUS_CODE.Text = Convert.ToString(valObj.POLITICAL_STATUS_CODE);//Convert.ToString
                    
                    
                    txtTITLE_CODE.Text = Convert.ToString(valObj.TITLE_CODE);//Convert.ToString
                    
                    
                    txtSTATUS_CODE.Text = Convert.ToString(valObj.STATUS_CODE);//Convert.ToString
                    
                    
                    txtADDR.Text = Convert.ToString(valObj.ADDR);//Convert.ToString
                    
                    
                    txtEMAIL.Text = Convert.ToString(valObj.EMAIL);//Convert.ToString
                    
                    
                    txtNATION.Text = Convert.ToString(valObj.NATION);//Convert.ToString
                    
                    
                    txtNATIVE_PLACE.Text = Convert.ToString(valObj.NATIVE_PLACE);//Convert.ToString
                    
                    
                    txtPOST_NO.Text = Convert.ToString(valObj.POST_NO);//Convert.ToString
                    
                    
                    txtDEGREE_CODE.Text = Convert.ToString(valObj.DEGREE_CODE);//Convert.ToString
                    
                    
                    txtGRAD_SCHOOL.Text = Convert.ToString(valObj.GRAD_SCHOOL);//Convert.ToString
                    
                    
                    txtGRAD_DATE.Text = Convert.ToString(valObj.GRAD_DATE);//Convert.ToString
                    
                    
                    txtMAJOR.Text = Convert.ToString(valObj.MAJOR);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.AF_ADDTIME == DateTime.MinValue) ? "" : valObj.AF_ADDTIME.ToString("yyyy-MM-dd HH:mm");


                    txtEDITIME.Text = (valObj.AF_EDITTIME == DateTime.MinValue) ? "" : valObj.AF_EDITTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtREMARK.Text = Convert.ToString(valObj.REMARK);//Convert.ToString
                    
                    
                    txtUSER_ID.Text = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal

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

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

public partial class WEC_PUBLICLISTShow : System.Web.UI.Page
{
    WEC_PUBLICLIST valObj=new WEC_PUBLICLIST();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["AID"]))
                {

                    valObj = BLLTable<WEC_PUBLICLIST>.GetRowData(WEC_PUBLICLIST.Attribute.AID, Request["AID"]);
                    if(valObj==null) return ;
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtUSER_ID.Text = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal
                    
                    
                    txtPLC_NAME.Text = Convert.ToString(valObj.PLC_NAME);//Convert.ToString
                    
                    
                    txtPLC_SOURCEID.Text = Convert.ToString(valObj.PLC_SOURCEID);//Convert.ToString
                    
                    
                    txtWECHAT_ID.Text = Convert.ToString(valObj.WECHAT_ID);//Convert.ToString
                    
                    
                    txtAVATAR_URL.Text = Convert.ToString(valObj.AVATAR_URL);//Convert.ToString
                    
                    
                    txtAPI_KEY.Text = Convert.ToString(valObj.API_KEY);//Convert.ToString
                    
                    
                    txtTOKEN.Text = Convert.ToString(valObj.TOKEN);//Convert.ToString
                    
                    
                    txtLOCATION.Text = Convert.ToString(valObj.LOCATION);//Convert.ToString
                    
                    
                    txtEMAIL.Text = Convert.ToString(valObj.EMAIL);//Convert.ToString
                    
                    
                    txtFUNS.Text = Convert.ToString(valObj.FUNS);//Convert.ToInt32
                    
                    
                    txtTYPE.Text = Convert.ToString(valObj.TYPE);//Convert.ToInt32
                    
                    
                    txtSTART_DAY.Text = (valObj.START_DAY == DateTime.MinValue) ? "" : valObj.START_DAY.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEND_DAY.Text = (valObj.END_DAY == DateTime.MinValue) ? "" : valObj.END_DAY.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtSTATUS.Text = Convert.ToString(valObj.STATUS);//Convert.ToInt32
                    
                    
                    txtPACKAGE_ID.Text = Convert.ToString(valObj.PACKAGE_ID);//Convert.ToDecimal
                    
                    
                    txtIS_NEWS.Text=valObj.IS_NEWS.ToString();
                    
                    
                    txtDEFAULT_REPLAY.Text = Convert.ToString(valObj.DEFAULT_REPLAY);//Convert.ToString
                    
                    
                    txtDEFAULT_REPLAY_FALG.Text=valObj.DEFAULT_REPLAY_FALG.ToString();
                    
                    
                    txtLBS_DISTANCE.Text = Convert.ToString(valObj.LBS_DISTANCE);//Convert.ToDecimal
                    
                    
                    txtAPPID.Text = Convert.ToString(valObj.APPID);//Convert.ToString
                    
                    
                    txtAPPSESECRET.Text = Convert.ToString(valObj.APPSESECRET);//Convert.ToString

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

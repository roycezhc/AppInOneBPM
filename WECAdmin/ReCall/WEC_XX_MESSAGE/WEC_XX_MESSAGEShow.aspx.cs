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
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;
using System.Net;
using AgileFrame.AppInOne.Common;
using System.IO;
public partial class WEC_XX_MESSAGEShow :  BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string type=HttpUtil.GetReqStrValue("type");
        //string isSaveFile = HttpUtil.GetReqStrValue("isSaveFile");
        WEC_XX_MESSAGE conf = new WEC_XX_MESSAGE();
        conf.OPENID = HttpUtil.GetReqStrValue("openid");
        conf.OrderBy("ADDTIME DESC");
        WEC_XX_MESSAGE xx_message = BLLTable<WEC_XX_MESSAGE>.GetRowData(new WEC_XX_MESSAGE(), conf);

      
        if("0".Equals(type)){//文本回复
            string message = HttpUtil.GetReqStrValue("message");
            WEC_HF_RESPONSE hf_response = new WEC_HF_RESPONSE();
            hf_response.R_CONTENT = message;
            hf_response.OPENID = HttpUtil.GetReqStrValue("openid");
            hf_response.ADDTIME = DateTime.Now;
            hf_response.REQUEST_ID = xx_message.ID;
            hf_response.TYPE = 0;
            BLLTable<WEC_HF_RESPONSE>.Insert(hf_response, WEC_HF_RESPONSE.Attribute.ID);
            string responseText = "<div class='res right'>" + hf_response.ADDTIME + "<br/>" + hf_response.R_CONTENT + "</div><br/>";
          //  Response.Write("{\"res\":\""+responseText+"\"}");
           responseText= responseText.Replace("\n","<br/>");
           Response.Write("{\"res\":\"" + responseText + "\"}");
         
            WeiXinUtil.Factory(this).actificialResponseText(hf_response.OPENID, hf_response.R_CONTENT);
        }
        else if ("1".Equals(type))//图片回复
        {

            HttpFileCollection postedFile = Request.Files;
            string path = Request.PhysicalApplicationPath + "UploadFiles\\Res_Pic\\" + userBase2.Curraid;
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
            postedFile[0].SaveAs(path + "\\" + filename);

           // WEC_HF_RESPONSE hf_response = new WEC_HF_RESPONSE();
            WEC_HF_RESPONSE hf_response = new WEC_HF_RESPONSE();
            hf_response.R_CONTENT = "UploadFiles/Res_Pic/" + userBase2.Curraid + "/" + filename;
            hf_response.OPENID = HttpUtil.GetReqStrValue("openid");
            hf_response.ADDTIME = DateTime.Now;
            hf_response.REQUEST_ID = xx_message.ID;
            hf_response.TYPE = 1;
            BLLTable<WEC_HF_RESPONSE>.Insert(hf_response, WEC_HF_RESPONSE.Attribute.ID);
            string responseText = "<div class='res right'>" + hf_response.ADDTIME + "<br/>" + "<img class=\"img\" src='" +WebHelper.GetAppPath()+hf_response.R_CONTENT+ "'/>" + "</div><br/>";
            //  Response.Write("{\"res\":\""+responseText+"\"}");
            Response.Write(responseText);
            WeiXinUtil.Factory(this).actificialResponseImg(hf_response.OPENID, path + "\\" + filename);
            
        }

    }
}

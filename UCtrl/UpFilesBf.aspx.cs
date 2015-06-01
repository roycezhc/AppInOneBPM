using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
public partial class UCtrl_UpFilesBf : AgileFrame.AppInOne.Common.BasePage
{
    string pdivID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        pdivID=Request["pDIV"];
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request["delFile"]))
            {
                try
                {
                    string filename = Server.MapPath("~/" + Request["delFile"]);
                    if (File.Exists(filename))
                    {
                        File.Delete(filename);
                    } 
                    Response.Write("yes");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                Response.End();
            }
            else
            {
                btnUpload.Style.Value = "display:none;";
                FileUpload1.Attributes.Add("onchange", "valueChg(this,'" + pdivID + "');");
            }
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            string fileName = FileUpload1.FileName;
            string prePath = Request["PrePath"];
            string savePath = Server.MapPath("~/" + prePath);
            DirectoryInfo dinfo = new DirectoryInfo(savePath);
            if (!dinfo.Exists) {
                dinfo.Create();
            }
             //Response.Write(savePath);
            if (FileUpload1.PostedFile.ContentLength > 10485760)
            {
                AgileFrame.Core.ScriptHelper.ResponseScript(Page, "closeBarWindow('" + pdivID + "');alert('上传的文件太大，不能超过10M。');", false);
            }
            else
            {
                FileUpload1.SaveAs(savePath + fileName);

                string js = "AddFileToParent('" + fileName + "','" + pdivID + "');closeBarWindow('" + pdivID + "');";
                AgileFrame.Core.ScriptHelper.ResponseScript(Page, js, false);
            }
        }
        catch {
            string js = "closeBarWindow('" + pdivID + "');";
            AgileFrame.Core.ScriptHelper.ResponseScript(Page, js, false);
        }
    }
}

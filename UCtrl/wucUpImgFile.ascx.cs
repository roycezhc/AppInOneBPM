using System;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
public partial class UCtrl_wucUpImgFile : AgileFrame.AppInOne.Common.BaseUserControl
{
    int fileSize = 6291456;
    string _namePre = "img";
    public string ImgNamePre
    {
        set { _namePre = value; }
        get { return _namePre; }
    }
    /// <summary>
    /// 上传的文件存放路径，如：UpFiles/PRCS/Plan/  UpFiles必须是第一级文件夹
    /// </summary>
    public string SavePath
    {
        set { hidSavePath.Value = value; }
        get { return hidSavePath.Value; }
    }

    /// <summary>
    /// 设置允许的文件类型，如文本文件 .gif .jpg .jpeg
    /// </summary>
    /// <param name="fileTypes"></param>
    public void SetInLawFileTypes(params string[] fileTypes)
    {
        if (fileTypes.Length > 0)
        {
            StringBuilder inLawfiles = new StringBuilder();
            for (int i = 0; i < fileTypes.Length; i++)
            {
                if (i > 0)
                {
                    inLawfiles.Append("|");
                }
                inLawfiles.Append(fileTypes[i]);
            }
            hidInLawFile.Value = inLawfiles.ToString();
        }
    }
    string imgSrc = "";
    /// <summary>
    /// 设置原来图片路径
    /// </summary>
    /// <param name="url"></param>
    public void setOldImgUrl(string imgSrc)
    {
        imgSrc = imgSrc.Replace("../","");
        if (!string.IsNullOrEmpty(imgSrc))
        {
            imgShow.Src = "~/"+imgSrc;
        }
        //imgSrc = ShowPathPre + imgSrc;
        //try
        //{
        //    if (imgSrc.Length >= 3)
        //    {
        //        string lll = imgSrc.Substring(imgSrc.Length - 3);//../
        //        if (lll == "../")
        //        {
        //            return;
        //        }
        //    }
        //    imgShow.Src = imgSrc;
        //}
        //catch
        //{
        //    imgShow.Src = "";
        //}
    }

    public void setOldImgUrl(string imgSrc,string imgNail)
    {
        imgSrc = imgSrc.Replace("../", "");
        if (!string.IsNullOrEmpty(imgSrc))
        {
            imgShow.Src = "~/" + imgSrc;
        }

        imgNail = imgNail.Replace("../", "");
        if (!string.IsNullOrEmpty(imgNail))
        {
            imgShow.Alt = "~/" + imgNail;
        }

        //imgSrc = ShowPathPre + imgSrc;
        //try
        //{
        //    if (imgSrc.Length >= 3)
        //    {
        //        string lll = imgSrc.Substring(imgSrc.Length - 3);//../
        //        if (lll == "../")
        //        {
        //            return;
        //        }
        //    }
        //    imgShow.Src = imgSrc;
        //}
        //catch
        //{
        //    imgShow.Src = "";
        //}
    }

    public string getOldImgUrl()
    {
        return imgShow.Src;
    }
    /// <summary>
    /// 是传图片文件并返回文件虚拟路径
    /// </summary>
    /// <param name="keyid">关键ID，作为图片名前缀</param>
    /// <returns></returns>
    public string UpImgFile(string keyid)
    {
        string savePath = Server.MapPath("~/" + SavePath);
        DirectoryInfo dinfo = new DirectoryInfo(savePath);
        if (!dinfo.Exists)
        {
            dinfo.Create();
        }
        string re = "";
        string hidRightImgFileName = hidRightImgFile.Name;//.ClientID.Replace("_", "$");
        if (fileUpImg.Value!="" && !string.IsNullOrEmpty(Request[hidRightImgFileName]))
        {
            if (fileUpImg.PostedFile.ContentLength <= fileSize)
            {
                //string dirpath = Server.MapPath("~/" + SavePath);
                //string fileName = System.IO.Path.GetFileName(fileUpImg.FileName);
                //fileName = fileName.Substring(fileName.LastIndexOf("."));
                //fileUpImg.SaveAs(dirpath + _namePre + keyid + fileName);
                //re = SavePath + _namePre + keyid + fileName;

                string[] aaa = AgileFrame.Core.WebSystem.ImageHelper.UpLoadImage(fileUpImg.PostedFile, "~/" + SavePath, keyid + "_");
                re = SavePath + aaa[0];
            }
        }
        else
        {
            if (imgShow.Src != "")
            {
                re = imgShow.Src.Replace("~/","");
            }
        }
        return re;
    }

    /// <summary>
    /// 是传图片文件并返回原图和缩略图虚拟路径
    /// </summary>
    /// <param name="keyid">关键ID，作为图片名前缀</param>
    /// <returns></returns>
    public string[] UpImgAndNail(string keyid)
    {
        string savePath = Server.MapPath("~/" + SavePath);
        DirectoryInfo dinfo = new DirectoryInfo(savePath);
        if (!dinfo.Exists)
        {
            dinfo.Create();
        }
        string[] re = new string[2]{"",""};
        string hidRightImgFileName = hidRightImgFile.Name;//.ClientID.Replace("_", "$");
        if (fileUpImg.Value!="" && !string.IsNullOrEmpty(Request[hidRightImgFileName]))
        {
            //Response.Write(fileUpImg.FileName+"]]");
            if (fileUpImg.PostedFile.ContentLength <= fileSize)
            {
                string dirpath = Server.MapPath("~/" + SavePath);
                string fileName = System.IO.Path.GetFileName(fileUpImg.PostedFile.FileName);
                fileName = fileName.Substring(fileName.LastIndexOf("."));

                //string oPath = dirpath + _namePre + keyid + fileName;
                //string tPath = dirpath + "Nail/" + _namePre + keyid + fileName;

                //bool reUp = ImageHelper.SaveFileToImageAndNail(fileUpImg.PostedFile, oPath, tPath, 180, 180);
                ////fileUpImg.SaveAs(dirpath + "img" + keyid+ fileName);
                //if (reUp == true)
                //{
                //    re[0] = SavePath + _namePre + keyid + fileName;
                //    re[1] = SavePath + "Nail/" + _namePre + keyid + fileName;
                //}

                re=AgileFrame.Core.WebSystem.ImageHelper.UpLoadImageAndNail(fileUpImg.PostedFile, "~/" + SavePath,keyid+"_",200,200);
                //fileUpImg.SaveAs(dirpath + "img" + keyid+ fileName);
                if (re[0] !="")
                {
                    re[0] = SavePath + re[0];
                    re[1] = SavePath + re[1];
                }
            }
        }
        else {
            if (imgShow.Src != "")
            {
                re[0] = imgShow.Src.Substring(1);
                re[1] = imgShow.Alt.Substring(1);
                //string oldPath = imgShow.Src.Replace("../", "");//../../d
                //if (oldPath.IndexOf("Nail/") != -1)
                //{
                //    re[0] = oldPath;
                //    re[1] = oldPath.Replace("Nail/", "");//a/b/aaa.jpg
                //}
                //else
                //{
                //    re[0] = oldPath;

                //    re[1] = oldPath.Substring(1, oldPath.LastIndexOf("/") + 1) + "Nail" + oldPath.Substring(oldPath.LastIndexOf("/"));
                //}
            }  
        }
        return re;
    }

    public bool DeleteOldImage()
    {
        if (imgShow.Src != "" && fileUpImg.Value=="")
        {
            try
            {
                string filename = imgShow.Src.Substring(imgShow.Src.LastIndexOf("/")+1);
                string dirpath = Server.MapPath("~/" + SavePath + filename);

                if (File.Exists(dirpath))
                {
                    File.Delete(dirpath);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        return false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //imgShow.Attributes.Add("onload", "onPreviewLoad(this)");
            fileUpImg.Attributes.Add("onchange", "valueChg(this);");

            //Response.Write(imgShow.Src);
        }
    }
}

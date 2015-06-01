using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
public partial class UCtrl_wucUpFilesAtSubmit : AgileFrame.AppInOne.Common.BaseUserControl
{
    /// <summary>
    /// 浏览文件的页面相对于存放文件的根目录(UpFiles)的虚拟位置前缀，如：""表示和UpFiles同级，../表示在UpFiles下级目录，以此类推../../../
    /// </summary>
    public string ShowPathPre
    {
        set { hidShowPathPre.Value = value; }
        get { return hidShowPathPre.Value; }
    }
    /// <summary>
    /// 上传的文件存放路径，如：UpFiles/PRCS/Plan/  UpFiles必须是第一级文件夹
    /// </summary>
    public string SavePath
    {
        set { hidSavePath.Value = value; }
        get { return hidSavePath.Value; }
    }

    bool _isShow = false;
    public bool IsShow
    {
        get { return _isShow; }
        set { _isShow = value; }
    }
    /// <summary>
    /// 上传文件
    /// </summary>
    /// <param name="preName">文件名前缀</param>
    /// <returns></returns>
    public string UpFiles(string preName)
    {
        string stuffs = "";
        string savePath = Server.MapPath("~/" + SavePath);

        #region//上传当前新选择的文件，记录下文件显示虚拟路径字符串，存入数据库
        if (Request.Files.Count > 0)
        {
            string msg = "";
            List<string> ups =AgileFrame.Core.WebSystem.FileUpHelper.UpLoadFiles(Request.Files, savePath, preName, 3, true, out msg);
            if (ups != null && ups.Count > 0)
            {
                for (int i = 0; i < ups.Count; i++)
                {
                    stuffs += stuffs == "" ? SavePath + ups[i] : "|" + SavePath + ups[i];
                }
            }
        }
        #endregion

        #region//如果已经存在原来的文件并没有被删除，则附加到文件显示虚拟路径字符串，存入数据库 
        if (hidOldFiles.Value!="")
        {
            string[] oldstuff = StringHelper.GetStringArray(hidOldFiles.Value, '|');
            if (oldstuff != null)
            {
                for (int i = 0; i < oldstuff.Length; i++)
                {
                    if (hidOldDel.Value.IndexOf(oldstuff[i]) == -1)//原来的文件没有被删除才 记录
                    {
                        stuffs += stuffs == "" ? oldstuff[i] : "|" + oldstuff[i];
                    }
                }
            }
        }
        #endregion

        //页面加载时，显示原来上传的文件，当删除该文件时在hidOldDel里记录被删除的文件全名
        //根据此文件名删除服务器上的旧文件
        if (hidOldDel.Value != "")
        {
            string[] delarr = StringHelper.GetStringArray(hidOldDel.Value, '|');
            for (int i = 0; i < delarr.Length; i++)
            {
                File.Delete(Server.MapPath("~/" + SavePath + delarr[i]));
                stuffs = StringHelper.RemoveFromString(stuffs, SavePath + delarr[i], '|');
            }
        }

        return stuffs;
    }

    public void SetOldFiles(string files)
    {
        if (!string.IsNullOrEmpty(files))
        {
            hidOldFiles.Value = files;
            string[] stufs = StringHelper.GetStringArray(files, '|');
            if (stufs != null)
            {

                hidOldNum.Value = stufs.Length.ToString();
                for (int i = 0; i < stufs.Length; i++)
                {
                    string stuname = stufs[i].Substring(stufs[i].LastIndexOf("/") + 1);
                    if (IsShow == true)
                    {
                        stufs[i] = ShowPathPre + stufs[i];
                        divStuffs.InnerHtml += "<span><a href='" + stufs[i] + "' target='_blank'><b>" + stuname + "</b></a></span>";
                    }
                    else
                    {
                        divStuffs.InnerHtml += "<span><b>" + stuname + "</b><a onclick=\"delOldFile(this,'" + stuname + "');\">X</a></span>";
                    }
                }
            }
        }
    }
    public string dirPre = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int rootDepth = Request.Url.Segments.Length - 2;
            if (Request.ApplicationPath.Length > 1)
            {
                rootDepth -= 1;
            }
            for (int i = 0; i < rootDepth; i++)
            {
                dirPre += "../";
            }
            //if (!Page.ClientScript.IsClientScriptIncludeRegistered("jquery132"))
            //{
            //    Page.ClientScript.RegisterClientScriptInclude("jquery132", "../Lib/JQuery/jquery-1.3.2.min.js");
            //}
            Literal litStyle = new Literal();
            litStyle.Text = "<style  type=\"text/css\">\n";
            litStyle.Text += ".upfiles{display:block;line-height:20px;}\n";
            litStyle.Text += ".upfiles span{background:#fff url(" + dirPre + "Lib/Img/attachtb.gif) no-repeat;margin-right:5px;padding-left:15px;}\n";
            litStyle.Text += ".upfiles span a{background:#ff9;color:#900;font-family:Arial;font-weight:bold; cursor:pointer;margin:0 3px 0 3px;padding:0 5px 0 5px;}\n";
            litStyle.Text += "</style>";
            //Page.Header.Controls.Add(litStyle);

            if (IsShow == true)
            {
                btnAddUp.Visible = false;
            }
        }
    }
}

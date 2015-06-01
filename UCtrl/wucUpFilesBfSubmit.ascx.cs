using System;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
public partial class UCtrl_wucUpFilesBfSubmit : AgileFrame.AppInOne.Common.BaseUserControl
{
    /// <summary>
    /// 浏览文件的页面相对于存放文件的根目录(UpFiles)的虚拟位置前缀，如：""表示和UpFiles同级，../表示在UpFiles下级目录，以此类推../../../
    /// 仅用于显示正常
    /// </summary>
    public string ShowPathPre
    {
        set { hidShowPathPre.Value = value; }
        get { return hidShowPathPre.Value; }
    }

    /// <summary>
    /// 如：.txt|.doc|.docx|.xls|.jpg|.jpeg|.png|.gif|.ppt|.zip|.rar|.ppt
    /// </summary>
    public string LawFilesExdNames
    {
        set { hidLawFiles.Value = value; }
        get { return hidLawFiles.Value; }
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

    bool _isHide = false;
    public bool IsHide
    {
        get { return _isHide; }
        set { _isHide = value; }
    }

    /// <summary>
    /// 显示原来已经上传的附件
    /// </summary>
    /// <param name="files"></param>
    public void ShowOldFiles(string files)
    {
        if (!string.IsNullOrEmpty(files))
        {
            hidFileNames.Value = files;
            string[] stufs = StringHelper.GetStringArray(files, ',');
            if (stufs != null)
            {
                if (IsHide == true)
                {
                    litAnnex.Text = "您无权查看附件";
                }
                else
                {
                    for (int i = 0; i < stufs.Length; i++)
                    {
                        string stuname = stufs[i].Substring(stufs[i].LastIndexOf("/") + 1);
                        if (_isShow == true)
                        {
                            stufs[i] = ShowPathPre + stufs[i];
                            litAnnex.Text += "<span><a href='" + stufs[i] + "' target='_blank'><b>" + stuname + "</b></a></span>";
                        }
                        else
                        {

                            litAnnex.Text += "<span><b>" + stuname + "</b><a onclick=\"delFile_UpBf(this,'" + stuname + "');\">X</a></span>";
                        }
                    }
                }
            }
            else
            {
                litAnnex.Text = "无附件";
            }
        }
        else
        {
            litAnnex.Text = "无附件";
        }
    }
    /// <summary>
    /// 获取已经上传的文件名虚拟路径数组
    /// </summary>
    /// <returns></returns>
    public string[] GetUpFilesArray()
    {
        string fname = hidFileNames.Name;
        if (!string.IsNullOrEmpty(Request[fname]))
        {
            string str = Request[fname];
            if (str.IndexOf(",") == -1)
            {
                return new string[] { SavePath + str };
            }
            else
            {
                string[]arr= str.Split(',');
                for (int i = 0; i < arr.Length; i++)
                {
                    arr[i] = SavePath + arr[i];
                }
                return arr;
            }
        }
        return null;
    }
    /// <summary>
    /// 获取已经上传的文件名虚拟路径字符串组合,如：../sss/a.gif,../sss/b.gif
    /// </summary>
    /// <returns></returns>
    public string GetUpFilesString()
    {
        dirPre = getDirPre();
        string fname = hidFileNames.Name;
        if (!string.IsNullOrEmpty(Request[fname]))
        {
            string str = Request[fname];
            if (str.IndexOf(",") == -1)
            {
                if (str.IndexOf(SavePath) == -1)
                {
                    return SavePath + str;
                }
                else
                {
                    return str;
                }
            }
            else
            {
                StringBuilder sb = new StringBuilder();
                string[] arr = str.Split(',');
                for (int i = 0; i < arr.Length; i++)
                {
                    if (arr[i].IndexOf(SavePath) == -1)
                    {
                        arr[i] = SavePath + arr[i];
                    }
                    if (i > 0)
                    {
                        sb.Append(",");
                    }
                    sb.Append(arr[i]);
                }
                return sb.ToString();
            }
        }
        return "";
    }
    public string dirPre = "";
    string getDirPre()
    {
        string str = "";
        int rootDepth = Request.Url.Segments.Length - 2;
        if (Request.ApplicationPath.Length > 1)
        {
            rootDepth -= 1;
        }
        for (int i = 0; i < rootDepth; i++)
        {
            str += "../";
        }
        return str;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dirPre = getDirPre();

            if (IsShow == true)
            {
                iFrame.Style.Add("display","none");
            }
            //if (!Page.ClientScript.IsClientScriptIncludeRegistered("jquery132"))
            //{
            //    Page.ClientScript.RegisterClientScriptInclude("jquery132", "../Lib/JQuery/jquery-1.3.2.min.js");
            //}
            
            Literal litStyle = new Literal();
            litStyle.Text = "<style  type=\"text/css\">\n";
            litStyle.Text += ".divAnnex{display:inline;line-height:20px;}\n";
            litStyle.Text += ".divAnnex span{background:#fff url(" + dirPre + "Lib/Img/attachtb.gif) no-repeat;margin-right:5px;padding-left:18px;}\n";
            litStyle.Text += ".divAnnex span a{background:#ffc;color:#300;font-family:Arial;font-weight:bold;display:inline-block; cursor:pointer;margin:0 3px 0 3px;padding:0 5px 0 0;}\n";
            litStyle.Text += "</style>";
            //Page.Header.Controls.Add(litStyle);
        }
    }
}

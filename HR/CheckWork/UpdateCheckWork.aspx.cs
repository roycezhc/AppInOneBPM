using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.OA;
using AgileFrame.AppInOne.WF;
using IM.Communication;
using IM.Model;
using System.IO;

public partial class CheckWork_UpdateCheckWork : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string GetShowString(string str)
    {
        if (string.IsNullOrEmpty(str))
            return "";
        if (str.Length > 15)
        {
            str = str.Substring(0, 10) + ".." + str.Substring(str.Length - 4, 4);
        }
        return str;
    }

    protected static string SiteName
    {
        get
        {
            string sname = MyConfigurationSettings.GetValue<string>("SiteName");
            if (!string.IsNullOrEmpty(sname)) return sname; else return "App-In-One管理平台专业版";
        }
    }
    protected string showStepState(string status, string checkinfo, decimal recid, int wfid)
    {
        //string ck = "";
        string str = WFCKLOG_EXD.ShowCheckInfo(status, checkinfo, recid, userBase.StaffID.ToString());//
        str = str.Replace("{URL}", WebHelper.GetAppPath() + "WF/Check.aspx?WFID=" + wfid + "&RECID=" + recid + "&fromIndex=1");
        return str;
    }

    public string m_fanganList = "";
    private void ReadFangAn()
    {
        string fanganStr = "";
        //fanganStr += "<option value='中控指纹考勤机'>中控指纹考勤机</option>";
        m_fanganList = fanganStr;
        txtFangAnSelStr.Value = Server.UrlEncode(fanganStr);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReadFangAn();

            aspPager.PageSize = 15;
            List<FileInfo> dbFileInfos = GetDBFileNames();
            BindList(dbFileInfos, 1);
        }
    }

    private List<FileInfo> GetDBFileNames()
    {
        List<FileInfo> dbFileInfos = new List<FileInfo>();
        try
        {
            string thisPath = Page.MapPath(Page.AppRelativeVirtualPath);
            thisPath = thisPath.Substring(0,thisPath.LastIndexOf('\\'));
            DirectoryInfo di = new DirectoryInfo(thisPath + "\\uploads");
            if (di != null && di.Exists)
            {
                List<FileInfo> dbFileInfosNoSort = new List<FileInfo>(di.EnumerateFiles("*.mdb", SearchOption.TopDirectoryOnly));
                Dictionary<DateTime, List<FileInfo>> dicFileInfo = new Dictionary<DateTime, List<FileInfo>>();
                foreach (FileInfo file in dbFileInfosNoSort)
                {
                    if (!file.Exists)
                        continue;
                    if (!dicFileInfo.ContainsKey(file.CreationTime))
                        dicFileInfo.Add(file.CreationTime, new List<FileInfo>());
                    dicFileInfo[file.CreationTime].Add(file);
                }
                List<DateTime> creatTimes = new List<DateTime>(dicFileInfo.Keys);
                creatTimes.Sort(new Comparison<DateTime>(CheckInOutHelper.ComparisonTime));
                foreach (DateTime dt in creatTimes)
                {
                    dbFileInfos.AddRange(dicFileInfo[dt]);
                }
            }
        }
        catch { }
        return dbFileInfos;
    }

    private void BindList(List<FileInfo> dbFileInfos, int curPage)
    {
        ReadFangAn();
        List<FileInfo> files = new List<FileInfo>();
        if (curPage * aspPager.PageSize < dbFileInfos.Count)
            files = dbFileInfos.GetRange((curPage - 1) * aspPager.PageSize, aspPager.PageSize);
        else
            files = dbFileInfos.GetRange((curPage - 1) * aspPager.PageSize, dbFileInfos.Count - (curPage - 1) * aspPager.PageSize);
        repList.DataSource = files;
        repList.DataBind();
        aspPager.RecordCount = dbFileInfos.Count;
    }

    decimal getStaffID()
    {
        if (ViewState["STAFF_ID"] != null)
        {
            return Convert.ToDecimal(ViewState["STAFF_ID"]);
        }
        else
        {
            return userBase.GetStaff().STAFF_ID;
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        List<FileInfo> dbFileInfos = GetDBFileNames();
        BindList(dbFileInfos, aspPager.CurrentPageIndex);
    }
}
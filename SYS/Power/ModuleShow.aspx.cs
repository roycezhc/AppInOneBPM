using System;
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
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SYS_Power_ModuleShow : AgileFrame.AppInOne.Common.BasePage
{
    string keyid = "";
    string pid = "";
    protected string showPage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["id"]))
        {
            if (Request["edit"] != null)
            {
                keyid = Request["id"];
            }
            else
            {
                pid = Request["id"];
            }
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                #region//修改时信息初始化
                SYS_MODULE valObj = BLLTable<SYS_MODULE>.Factory(conn).GetRowData(SYS_MODULE.Attribute.MDL_ID, keyid);
                if (valObj == null)
                {
                    
                }
                else
                {
                    if (!string.IsNullOrEmpty(valObj.PAGE_URL))
                    {
                        string appPath = WebHelper.GetAppPath();
                        Response.Redirect(appPath + valObj.PAGE_URL, true);
                        return;
                        //zlg注释
                        showPage = appPath + valObj.PAGE_URL;
                    }
                    else
                    {
                        string appPath = WebHelper.GetAppPath() + WebHelper.GetPageUrl().ToLower().Replace("show.aspx", "edit.aspx");
                        Response.Redirect(appPath, true);
                        return;
                    }
                }
                #endregion
            }

        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
    }
}
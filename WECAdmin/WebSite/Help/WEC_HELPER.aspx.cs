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
public partial class WECAdmin_WebSite_Help_WEC_HELPER : System.Web.UI.Page
{
    public List<WEC_HELPER> helps;
    public string webpath;
    protected void Page_Load(object sender, EventArgs e)
    {
        string key=HttpUtil.GetReqStrValue("key");
        if (key.Equals(""))
        {
            WEC_HELPER conf = new WEC_HELPER();
            conf.PID = "0";
            helps = BLLTable<WEC_HELPER>.Select(new WEC_HELPER(), conf);
            webpath = WebHelper.GetAppPath();
        }
        else {
            WEC_HELPER conf = new WEC_HELPER();
            conf.KEYVALUE = key;
            WEC_HELPER help = BLLTable<WEC_HELPER>.GetRowData(new WEC_HELPER(),conf);
            if (help == null)
            {
                Response.Redirect(WebHelper.GetAppPath()+"wecadmin/website/help/wec_helpertree.aspx");
            }
            else {
                Response.Redirect(WebHelper.GetAppPath()+"wecadmin/website/help/wec_helperdetail.aspx?subid="+help.ID);
            }
        }

    }
    protected string replace(string txt)
    {
        if (string.IsNullOrEmpty(txt))
            return txt;
        return txt.Replace("微盟", "微信生意通");
    }
}
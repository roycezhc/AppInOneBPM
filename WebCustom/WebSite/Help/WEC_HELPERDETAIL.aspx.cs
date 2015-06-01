using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
public partial class WECAdmin_WebSite_Help_WEC_HELPERDETAIL : System.Web.UI.Page
{
    public List<WEC_HELPER> helps;
    public string subid;
    public string webpath;
    public WEC_HELPER help_p;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        subid = HttpUtil.GetReqStrValue("subid");
        WEC_HELPER conf = new WEC_HELPER();
        conf.ID = subid;
        WEC_HELPER help= BLLTable<WEC_HELPER>.GetRowData(new WEC_HELPER(),conf);
        WEC_HELPER conf2 = new WEC_HELPER();
        conf2.PID = help.PID;
        helps=BLLTable<WEC_HELPER>.Select(new WEC_HELPER(),conf2);

        WEC_HELPER conf3 = new WEC_HELPER();
        conf3.ID = help.PID;
        help_p = BLLTable<WEC_HELPER>.GetRowData(new WEC_HELPER(),conf3);
        webpath=WebHelper.GetAppPath();
    }
    protected string replace(string txt)
    {
        if (string.IsNullOrEmpty(txt))
            return txt;
        return txt.Replace("微盟", "微信生意通");
    }
}
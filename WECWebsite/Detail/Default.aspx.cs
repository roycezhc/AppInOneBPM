using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WECWebsite_Detail_Default : System.Web.UI.Page
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected string timevalue = "";
    protected string headvalue = "";
    protected WEC_REQUEST_DETAIL we;
    protected string aid = Common.GetReqStrValue("aid");
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Common.GetReqIntValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_REQUEST_DETAIL cond = new WEC_REQUEST_DETAIL();
        cond.ID = id;
        we = BLLTable<WEC_REQUEST_DETAIL>.GetRowData(cond);

        if (!we.Equals(null))
        {

            headvalue = we.TITLE;
            timevalue = we.ADDTIME.ToString("yyyy-mm-dd HH:mm");
            mainvalue = we.DESCRIPTION;
            //mainvalue = string.Format("<header> <h3 style=\"font-size:14px;\">{0}</h3> <small class=\"gray\">{1}</small></header>", we.TITLE, "2014.03.12");
            //mainvalue = string.Format("{0}<div class=\"content\">{1}</div>", mainvalue, we.CONTENT);
        }

    }
}
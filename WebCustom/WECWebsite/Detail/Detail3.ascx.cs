using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WECWebsite_Detail_Detail3 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected string timevalue = "";
    protected string headvalue = "";
    protected WEC_CUSTOM_Article we;
    protected string aid = Common.GetReqStrValue("aid");
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Common.GetReqIntValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_CUSTOM_Article cond = new WEC_CUSTOM_Article();
        cond.ID = id;
         we = BLLTable<WEC_CUSTOM_Article>.GetRowData(cond);
         
        if (!we.Equals(null))
        {

            headvalue = we.TITLE;
            timevalue = we.ADDTIME.ToString("yyyy-mm-dd HH:mm");
            mainvalue = we.CONTENT;
            //mainvalue = string.Format("<header> <h3 style=\"font-size:14px;\">{0}</h3> <small class=\"gray\">{1}</small></header>", we.TITLE, "2014.03.12");
            //mainvalue = string.Format("{0}<div class=\"content\">{1}</div>", mainvalue, we.CONTENT);
        }

    }
}
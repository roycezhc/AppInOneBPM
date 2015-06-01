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

public partial class WECWebsite_Detail_Detail1 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Common.GetReqIntValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_CUSTOM_Article cond = new WEC_CUSTOM_Article();
        cond.ID = id;
        WEC_CUSTOM_Article we = BLLTable<WEC_CUSTOM_Article>.GetRowData(cond);
        if (!we.Equals(null))
        {
            mainvalue = string.Format("<header><h3>{0}</h3><h5>{1}</h5></header>", we.TITLE, we.ADDTIME);//"2014-03-20");//
            mainvalue = string.Format("{0}<div class=\"content\" style=\"word-wrap:break-word; word-break:normal;\">{1}</div>", mainvalue, we.CONTENT);
        }
    }

}
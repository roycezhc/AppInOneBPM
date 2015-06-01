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

public partial class WECWebsite_List_List4 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int aid = Common.GetReqIntValue("aid"); 
        string id = Common.GetReqStrValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_Article cond = new WEC_Article();
        cond.CID = id;
        cond.OrderBy(WEC_Article.Attribute.CID);
        List<WEC_Article> list = BLLTable<WEC_Article>.Select(new WEC_Article(), cond);
        foreach (WEC_Article we in list)
        { 
            mainvalue = string.Format("{0}<a class=\"shengyt-list-item\" href=\"{1}\"><div class=\"shengyt-list-item-line\"> <div class=\"shengyt-list-item-title\">{2}</div></div><div class=\"shengyt-list-item-icon-two icon-arrow-r\" style=\"display:none;\"></div></a>", mainvalue, "Detail.aspx?id=" + we.ID + "&aid=" + aid, we.TITLE);
        }
    }
}
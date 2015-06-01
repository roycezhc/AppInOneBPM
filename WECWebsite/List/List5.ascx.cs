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

public partial class WECWebsite_List_List5 : System.Web.UI.UserControl
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

            mainvalue += "<a href=\""+"Detail.aspx?id=" + we.ID + "&aid=" + aid
                +"\" class=\"shengyt-list-box\"> <div class=\"shengyt-list-sau\"> <span class=\"mday\"><b class=\"day\">12</b>/03</span><span class=\"years\">2014"
                +"</span></div><div class=\"shengyt-list-item\"><div class=\"shengyt-list-item-line\"><div class=\"shengyt-list-item-title\">"
            +we.TITLE
            +"</div><div class=\"shengyt-list-item-img\"><img src="+we.PIC_URL
            +"></div><div class=\"shengyt-list-item-summary\">"+we.DES
            +"</div></div><div class=\"shengyt-list-more\"><div class=\"shengyt-list-item-more\">阅读全文</div><div class=\"shengyt-list-item-more-icon icon-arrow-r\"></div></div></div></a>";
        }
    }
}
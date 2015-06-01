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

public partial class WECWebsite_List_List3 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";    
    protected void Page_Load(object sender, EventArgs e)
    {
        List<WEC_Article> list2=new List<WEC_Article>();
        int aid = Common.GetReqIntValue("aid");
        preUrl = WebHelper.GetAppPath();
        WEC_Article cond = new WEC_Article();
        cond.AID = aid;
        cond.CID = Common.GetReqStrValue("id");
        cond.OrderBy(WEC_Article.Attribute.CID);
        list2 = BLLTable<WEC_Article>.Select(new WEC_Article(), cond);
        foreach (WEC_Article we in list2)
        {
            mainvalue = string.Format("{0}<div class=\"shengyt-list\"> <a class=\"shengyt-list-item\" href=\"{1}\"> <div class=\"shengyt-list-item-line\"> <div class=\"shengyt-list-item-title\">{2}</div><div class=\"shengyt-list-item-summary\">{3}</div><div class=\"shengyt-list-item-img\"><img src=\"{4}\"/></div><div class=\"shengyt-list-item-summary\">{5}</div></div><div class=\"shengyt-list-more\"><div class=\"shengyt-list-item-more\">阅读全文</div><div class=\"shengyt-list-item-more-icon icon-arrow-r\"></div> </div></a></div>",
                mainvalue, "Detail.aspx?id=" + we.ID + "&aid=" + Common.GetReqIntValue("aid"), we.TITLE, we.ADDTIME, we.PIC_URL, we.DES); //"2014-03-20", we.PIC_URL, we.DES); 
        }

    }
      
}
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


public partial class WECWebsite_List_List2 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int aid = Common.GetReqIntValue("aid"); //== 0 ? 1 : Common.GetReqIntValue("aid");
        string id = Common.GetReqStrValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_Article cond = new WEC_Article();
        cond.CID = id;
        cond.OrderBy(WEC_Article.Attribute.CID);
        List<WEC_Article> list = BLLTable<WEC_Article>.Select(new WEC_Article(),cond);
        foreach (WEC_Article we in list)
        {
            mainvalue = string.Format("{0}<li><a href=\"{1}\"  class=\"tbox\"> <div><span><img src=\"{2}\" /></span> </div><div><h3>{3}</h3><p>{4}</p></div></a></li>", mainvalue, "Detail.aspx?id="+ we.ID+"&aid="+aid, we.PIC_URL, we.TITLE, we.DES);
        //    string.Format("{0}<li><a href=\"{1}\"  class=\"tbox\"> <div><span><img src=\"{2}\" /></span> </div><div><h3>{3}</h3><p>{4}</p></div></a></li>",mainvalue,we.URL,we.PIC_URL,we.TITLE,we.DES);
        }
    }
}
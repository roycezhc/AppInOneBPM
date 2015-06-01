using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WECWebsite_Home_home9 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string navigation = "";//导航
    protected string mainvalue = "";//主内容
    protected List<WEC_CUSTOM_COLUMN> list1;
    protected int aid;
    protected void Page_Load(object sender, EventArgs e)
    {
        preUrl = WebHelper.GetAppPath();
        aid = Common.GetReqIntValue("aid");
        //导航
        WEC_CUSTOM_CATEBANNER condner = new WEC_CUSTOM_CATEBANNER();
        condner.STATUS = 0;
        condner.AID = aid;
        condner.OrderBy(WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID);
        List<WEC_CUSTOM_CATEBANNER> list = BLLTable<WEC_CUSTOM_CATEBANNER>.Select(new WEC_CUSTOM_CATEBANNER(), condner);
        if (list.Count != 0)
        {
            foreach (WEC_CUSTOM_CATEBANNER wr in list)
            {
                navigation = string.Format("{0} <li><a onclick=\"{1};\"><img src=\"{2}\" alt=\"{3}\" style=\"width:100%;\" /></a></li>", navigation, wr.OUT_URL == "" ? "return false" : wr.OUT_URL, wr.PIC_URL, wr.NAME);
            }
        }
        //主内容
        WEC_CUSTOM_COLUMN cond = new WEC_CUSTOM_COLUMN();
        cond.STATUS = 0;
        cond.UP_FLAG = 1;
        cond.PID = "0";
        cond.AID = aid;
        cond.OrderBy(WEC_CUSTOM_COLUMN.Attribute.SORT_ID);
        list1 = BLLTable<WEC_CUSTOM_COLUMN>.Select(new WEC_CUSTOM_COLUMN(), cond);
        foreach (WEC_CUSTOM_COLUMN wc in list1)
        {
                 
            //int a = 0;
                
            //a++;
        
            //mainvalue = string.Format("{0} <a class=\"list-item _C{1}_L0\" href=\"{2}\"><div class=\"item-title\"><div class=\"title-text\">{3}</div></div><div class=\"item-image\" style=\"background-image: url(<%=wc.PIC_URL%>)">div class="item_title2"><%=wc.COLUMN_DES %></div></div></a>"
            //, mainvalue,a, !string.IsNullOrEmpty(wc.OUT_URL) ? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid,wc.COLUMN_NAME, wc.SMALL_PIC != "" ? wc.SMALL_PIC : "return false", wc.COLUMN_NAME, wc.COLUMN_DES);

        }

    }
}
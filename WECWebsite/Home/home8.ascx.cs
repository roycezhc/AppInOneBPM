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

public partial class WECWebsite_Home_home8 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string navigation = "";//导航
    protected string mainvalue = "";//主内容
    protected List<WEC_COLUMN> list1;
    protected int aid;
    protected void Page_Load(object sender, EventArgs e)
    {
        preUrl = WebHelper.GetAppPath();
        aid = Common.GetReqIntValue("aid");
        //主内容
        WEC_COLUMN cond = new WEC_COLUMN();
        cond.STATUS = 0;
        cond.UP_FLAG = 1;
        cond.PID = "0";
        cond.AID = aid;
        cond.OrderBy(WEC_COLUMN.Attribute.SORT_ID);
        list1 = BLLTable<WEC_COLUMN>.Select(new WEC_COLUMN(), cond);
        foreach (WEC_COLUMN wc in list1)
        {
            mainvalue = string.Format("{0}<a href=\"{1}\"><label><small>{2}</small></label><span><img  src=\"{3}\"/></span></a>", mainvalue, !string.IsNullOrEmpty(wc.OUT_URL) ? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid, wc.COLUMN_NAME, wc.SMALL_PIC != "" ? wc.SMALL_PIC : "return false");

        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.CMS;

public partial class WECWebsite_Channel_channel1 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected int aid = Common.GetReqIntValue("aid");
    protected string id = Common.GetReqStrValue("id");
    protected string mainvalue="";
    protected void Page_Load(object sender, EventArgs e)
    {
        preUrl = WebHelper.GetAppPath();

         WEC_COLUMN cond = new WEC_COLUMN();
        cond.STATUS = 0;
        cond.UP_FLAG = 1;
        cond.PID = id;
        cond.AID = aid;
        cond.OrderBy(WEC_COLUMN.Attribute.SORT_ID);
        List<WEC_COLUMN> list1 = BLLTable<WEC_COLUMN>.Select(new WEC_COLUMN(), cond);
        foreach (WEC_COLUMN wc in list1)
        {
            mainvalue = string.Format("{0}<a href=\"{1}\"><label><small>{2}</small></label><span class=\"icon-smile\"></span></a>", mainvalue, !string.IsNullOrEmpty(wc.OUT_URL) ? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid, wc.COLUMN_NAME);
        }
 
    }
}
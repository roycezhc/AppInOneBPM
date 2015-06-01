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

public partial class WECWebsite_Home_home6 : System.Web.UI.UserControl
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
        //主内容
        WEC_CUSTOM_COLUMN cond = new WEC_CUSTOM_COLUMN();
        cond.STATUS = 0;
        cond.UP_FLAG = 1;
        cond.PID = "0";
        cond.AID = aid;
        cond.OrderBy(WEC_CUSTOM_COLUMN.Attribute.SORT_ID);
        list1 = BLLTable<WEC_CUSTOM_COLUMN>.Select(new WEC_CUSTOM_COLUMN(), cond);
        

    }
}
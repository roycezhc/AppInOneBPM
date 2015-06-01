using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;

public partial class IndexNew_WEC : BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String aid = HttpUtil.GetReqStrValue("aid");
        if (string.IsNullOrEmpty(aid))
        {
            //从数据库获取第一个aid
            WEC_PUBLICLIST val = new WEC_PUBLICLIST();
            WEC_PUBLICLIST conf = new WEC_PUBLICLIST();
            conf.USER_ID = userBase.UserID;
            WEC_PUBLICLIST data1 = BLLTable<WEC_PUBLICLIST>.GetRowData(val, conf);
            if (data1 != null && data1.IsNotNull())
            {
                aid = data1.AID.ToString();
            }
        }
        if (string.IsNullOrEmpty(aid))
        {
            aid = "1";
        }
        this.Server.Transfer("Index.aspx?appid=2&aid=" + aid, true);
        return;
    }
}
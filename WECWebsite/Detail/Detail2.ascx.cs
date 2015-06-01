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

public partial class WECWebsite_Detail_Detail2 : System.Web.UI.UserControl
{
    public string preUrl = "";
    protected string mainvalue = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Common.GetReqIntValue("id");
        preUrl = WebHelper.GetAppPath();
        WEC_Article cond = new WEC_Article();
        cond.ID = id;
         WEC_Article we=  BLLTable<WEC_Article>.GetRowData(cond);
         if(!we.Equals(null))
         {
             mainvalue = string.Format("<header> <h3 style=\"font-size:14px;\">{0}</h3> <small class=\"gray\">{1}</small></header>",we.TITLE,we.ADDTIME);
             mainvalue = string.Format("{0}<div class=\"content\" style=\"word-wrap:break-word; word-break:normal;\">{1}</div>", mainvalue, we.CONTENT);
         }
        
    }

}
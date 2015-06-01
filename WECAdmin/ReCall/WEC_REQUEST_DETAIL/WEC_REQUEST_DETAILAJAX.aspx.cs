using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WECAdmin_ReCall_WEC_REQUEST_DETAIL_WEC_REQUEST_DETAILAJAX : BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WEC_Article conf = new WEC_Article();
        conf.AID = Convert.ToInt32(userBase2.Curraid);
        List<WEC_Article> list= BLLTable<WEC_Article>.Select(new WEC_Article(),conf);
        String str = "{\"value\":[";
        foreach(WEC_Article wec in list){
            str += wec.ID + ","; 
        }
        str=str.Substring(0,str.Length-1);
        str += "]}";
        Response.Write(str);
    }
}
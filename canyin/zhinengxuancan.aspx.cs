using AgileFrame.Orm.PersistenceLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;
using System.IO;
using System.Text;
using System.Web;

public partial class yinshi : System.Web.UI.Page
{
    public List<WEC_CY_SELECTDISH> list = null;
    public StringBuilder nums = new StringBuilder();
    public int userid = 1;
    public int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        int storeid=Convert.ToInt32(Request["storeid"]);
      //  CYUtil.setStoreId(storeid);

        WEC_CY_STOREMANAGER conf2 = new WEC_CY_STOREMANAGER();
        WEC_CY_STOREMANAGER currStore=BLLTable<WEC_CY_STOREMANAGER>.GetRowData(conf2);
        HttpCookie cookie=new HttpCookie("currStore");
        cookie.Values.Add("currStoreId",""+storeid);
        cookie.Values.Add("currStoreAddress",HttpUtility.UrlEncode(""+currStore.ADDRESS));
        cookie.Values.Add("currStoreTel",""+currStore.TEL);
        //HttpCookie cookie2 = new HttpCookie("currStoreAddress", "" +currStore.ADDRESS );
        //HttpCookie cookie3 = new HttpCookie("currStoreTel", "" + currStore.TEL);
        DateTime dt=DateTime.Now;
        TimeSpan ts=new TimeSpan(1,0,0,0);
        cookie.Expires = dt.Add(ts);
        Response.AppendCookie(cookie);
        //HttpCookie C= Request.Cookies[""];

        WEC_CY_SELECTDISH conf = new WEC_CY_SELECTDISH();
        conf.OrderBy(WEC_CY_SELECTDISH.Attribute.ORDER_DISPLAY);
        conf.STORE_ID = storeid;
        list = BLLTable<WEC_CY_SELECTDISH>.Factory("conn_canyin").Select(new WEC_CY_SELECTDISH(), conf);
        //BLLTable.SQL_Test.ToString();
       
        foreach(WEC_CY_SELECTDISH s in list){
            nums.Append( "," + s.FIT_NUM);
        }
        if(nums.Length>0)
            nums.Remove(0, 1);

        num = CYUtil.getItemCount();
        
    }
}
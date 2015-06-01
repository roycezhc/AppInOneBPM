using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using System.Text;
public partial class yinshi_diancai : System.Web.UI.Page
{
    public List<WEC_CY_TYPE> typeList = null;
    public List<WEC_CY_DISH> dishList = null;
    public int userid = 1;
    public int num = 0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["currStore"];
        int storeId = Convert.ToInt32(cookie.Values["currStoreId"]);

        WEC_CY_TYPE conf2 = new WEC_CY_TYPE();
        conf2.STORE_ID = storeId;
        typeList = BLLTable<WEC_CY_TYPE>.Factory("conn_canyin").Select(new WEC_CY_TYPE(), conf2);
        WEC_CY_DISH conf = new WEC_CY_DISH();
        conf.TYPE_ID = typeList[0].ID;
        conf.STORE_ID = storeId;
        dishList = BLLTable<WEC_CY_DISH>.Factory("conn_canyin").Select(new WEC_CY_DISH(), conf);

        num = CYUtil.getItemCount();
       
    }
    /// <summary>
    /// 判断该菜品是否有特价，返回html
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public string getSpecialPrice(int index)
    {
        if (dishList[index].SPECIAL_PRICE != null)
        {
            return "[<font color='red'>特价</font>]";
        }
        else {
            return "";
        }
    }

    /// <summary>
    /// 判断该菜品是否有标签，返回html
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    //public string getTag(int index)
    //{
    //    WEC_CY_DISH dish=dishList[index];
    //    WEC_CY_TAG conf=new WEC_CY_TAG();
    //    conf.ID=dish.TAG_ID;
    //    conf.STORE_ID = storeId;
    //    WEC_CY_TAG tag=null;
    //    tag = BLLTable<WEC_CY_TAG>.Factory("conn_canyin").GetRowData(conf);
    //    if (tag != null)
    //    {
    //        return "<span style='font-size:10px;'>"+tag.TITLE+"</span>";
    //    }
    //    else
    //    {
    //        return "";
    //    }
    //}
}
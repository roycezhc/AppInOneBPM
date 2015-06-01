using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;
using System.IO;
using System.Text;
using System.Web;
/// <summary>
/// CYUtil 的摘要说明
/// </summary>
public class CYUtil
{
    public static int userid = 1;
	public CYUtil()
	{
		
	}
    private static int STOREID = 0;
    private static int AID = 0;
    private static WEC_CY_STOREMANAGER STORE = null;
    public static void setStoreId(int storeId)
    {
        
    }
    public static int getStoreId()
    {
        return STOREID;
    }
    public static void setAid(int aid)
    {
        AID = aid;
    }
    public static int getAid()
    {
        return AID;
    }
    public static WEC_CY_STOREMANAGER getCurrStore() {
        return STORE;
    }
    /// <summary>
    /// 获取餐饮当前用户当前订单条数
    /// </summary>
    /// <returns></returns>
    public static int getItemCount(){
        V_WEC_CY_ITEM conf2 = new V_WEC_CY_ITEM();
        conf2.F_ID = userid;
        conf2.O_ID = 0;
        conf2.STORE_ID = CYUtil.getStoreId();
        List<V_WEC_CY_ITEM> list = BLLTable<V_WEC_CY_ITEM>.Factory("conn_canyin").Select(new V_WEC_CY_ITEM(), conf2);
        return list.Count;
    }

    /// <summary>
    /// 获取当前用户当前订单条目的价格总和
    /// </summary>
    /// <returns></returns>
    public static decimal getItemsPrice() {
        V_WEC_CY_ITEM conf2 = new V_WEC_CY_ITEM();
        conf2.F_ID = userid;
        conf2.O_ID = 0;
        conf2.STORE_ID = CYUtil.getStoreId();
        List<V_WEC_CY_ITEM> list = BLLTable<V_WEC_CY_ITEM>.Factory("conn_canyin").Select(new V_WEC_CY_ITEM(), conf2);
        StringBuilder sb = new StringBuilder();
        decimal total = 0;
        foreach (V_WEC_CY_ITEM item in list)
        {
            decimal price = item.SPECIAL_PRICE == 0 ? item.DISH_PRICE : item.SPECIAL_PRICE;
            total += price * item.NUM;
        }
        return total;
    }
}
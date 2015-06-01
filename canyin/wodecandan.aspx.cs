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
using System.IO;
using System.Text;
using System.Web;
public partial class canyin_wodecandan : System.Web.UI.Page
{
    public List<Dictionary<string, string>> list = new List<Dictionary<string, string>>();
    protected void Page_Load(object sender, EventArgs e)
    {
        string combo_nums = Request["combo_nums"];
        HttpCookie cookie = Request.Cookies["currStore"];
        int storeId = Convert.ToInt32(cookie.Values["currStoreId"]);
      
        if (!string.IsNullOrEmpty(combo_nums))
        {
            //先清空
            WEC_CY_ITEM conf3 = new WEC_CY_ITEM();
            conf3.O_ID = 0;
            conf3.F_ID = 1;
            conf3.STORE_ID = storeId;
            BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Delete(conf3);

            int nums = Convert.ToInt32(combo_nums);
            WEC_CY_SELECTDISH conf = new WEC_CY_SELECTDISH();
            conf.FIT_NUM = nums;
            conf.STORE_ID = storeId;
            WEC_CY_SELECTDISH selectedish = BLLTable<WEC_CY_SELECTDISH>.Factory("conn_canyin").GetRowData(conf);
            decimal s_id = selectedish.ID;

            WEC_CY_DS conf2 = new WEC_CY_DS();
            conf2.S_ID = s_id;
            conf2.STORE_ID = storeId;
            List<WEC_CY_DS> list = BLLTable<WEC_CY_DS>.Factory("conn_canyin").Select(new WEC_CY_DS(), conf2);
            List<WEC_CY_ITEM> items = new List<WEC_CY_ITEM>();
            foreach (WEC_CY_DS ds in list)
            {
                WEC_CY_ITEM item = new WEC_CY_ITEM();
                item.ADDTIME = DateTime.Now;
                item.STATUS = 0;
                item.O_ID = 0;
                item.REMARK = "";
                item.F_ID = 1;
                item.D_ID = ds.D_ID;
                item.NUM = ds.NUM;
                items.Add(item);
            }
            BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Insert(items, WEC_CY_ITEM.Attribute.ID);
        }

        WEC_CY_TABLESET conf4 = new WEC_CY_TABLESET();
        conf4.AID = 1;
        conf4.TABLE_STATUS = 0;
        //大厅
        conf4.TABLE_TYPE = 0;
        conf4.STORE_ID = storeId;
        WEC_CY_TABLESET table1 = BLLTable<WEC_CY_TABLESET>.Factory("conn_canyin").GetRowData(conf4);

        WEC_CY_TABLESET conf5 = new WEC_CY_TABLESET();
        conf5.AID = 1;
        //可预订
        conf5.TABLE_STATUS = 0;
        //包厢
        conf5.TABLE_TYPE = 1;
        conf5.STORE_ID = storeId;
        WEC_CY_TABLESET table2 = BLLTable<WEC_CY_TABLESET>.Factory("conn_canyin").GetRowData(conf5);
        
        if (table1 == null && table2 == null)
        {

        }
        else if (table1 != null && table2 == null)
        {
            Dictionary<string, string> d1 = new Dictionary<string, string>();
            d1.Add("title", "大厅");
            d1.Add("value","0");
            list.Add(d1);
            //sb.Append("{\"num\":" + list.Count + ",\"total\":\"" + total + "\",\"type\":[{\"title\":\"大厅\",\"value\":0}]}");
        }
        else if (table1 == null && table2 != null)
        {
            Dictionary<string, string> d1 = new Dictionary<string, string>();
            d1.Add("title", "包厢");
            d1.Add("value", "1");
            list.Add(d1);
            //sb.Append("{\"num\":" + list.Count + ",\"total\":\"" + total + "\",\"type\":[{\"title\":\"包厢\",\"value\":1}]}");
        }
        else if (table1 != null && table2 != null)
        {
            Dictionary<string, string> d1 = new Dictionary<string, string>();
            d1.Add("title", "大厅");
            d1.Add("value", "0");
            Dictionary<string, string> d2 = new Dictionary<string, string>();
            d2.Add("title", "包厢");
            d2.Add("value", "1");
            list.Add(d1);
            list.Add(d2);
        }
    }
}
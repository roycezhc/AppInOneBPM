using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.RFCLIB;
using AgileFrame.Common;
using SAP.Middleware.Connector;
public partial class SAP_CHART_Purchase : System.Web.UI.Page
{
    public List<List<ITableImplement>> valLists = new List<List<ITableImplement>>();
    public List<AttributeItem[]> itemLists = new List<AttributeItem[]>();
    public Dictionary<string, string> purchaseMap = new Dictionary<string, string>();
    public Dictionary<string, string> zddryMap = new Dictionary<string, string>();
    public string monthStr = "";
    public int days = 0;
    public string month = "";
    public string werk = "";
    public List<string> tabnames = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
           
            tabnames.Add("采购创建、入库、冲销订单汇总");
            tabnames.Add("采购创建、入库、冲销订单金额汇总");
            tabnames.Add("未按期完成入库采购订单");
            tabnames.Add("未按期完成入库采购订单-创建者");

            month = HttpUtil.GetReqStrValue("month");
            werk = HttpUtil.GetReqStrValue("werk");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_WERKS = werk;
            param.I_GJAHR = month.Substring(0, 4);
            param.I_MONAT = month.Substring(5, 2);

            monthStr = param.I_MONAT;
            days = DateTime.DaysInMonth(Convert.ToInt32(param.I_GJAHR), Convert.ToInt32(param.I_MONAT));
            //采购创建、入库、冲销订单汇总 
            ZTTPP_POMOVE_SUM val1 = new ZTTPP_POMOVE_SUM();
            val1.ZDATE = "";
            val1.Z101DD = "";
            val1.Z102DD = "";
            val1.Z103DD = "";
            val1.Z104DD = "";
            val1.Z105DD = "";
            val1.Z106DD = "";
            val1.ZCJDD = "";
            //val1List = RFCUtil.GetTable<ZTTPP_POMOVE_SUM>(param, "ZP_REPL_PURCHASE_ORDER_OUT", "IT_POMOVE_SUM", val1);
            AttributeItem[]  item1List = val1.af_GetAvailableAttributeItem();


            //采购创建、入库、冲销订单金额汇总 
            ZTTPP_POMOVE_SUM_MN val2 = new ZTTPP_POMOVE_SUM_MN();
            val2.ZDATE = "";
            val2.Z101JE = "";
            val2.Z102JE = "";
            val2.Z103JE = "";
            val2.Z104JE = "";
            val2.Z105JE = "";
            val2.Z106JE = "";
            val2.ZCJJE = "";
           // val2List = RFCUtil.GetTable<ZTTPP_POMOVE_SUM_MN>(param, "ZP_REPL_PURCHASE_ORDER_OUT", "IT_POMOVE_SUM_MN", val2);
            AttributeItem[]  item2List = val2.af_GetAvailableAttributeItem();

            //未按期完成入库采购订单 
            ZTTPP_POMOVE_LAG val3 = new ZTTPP_POMOVE_LAG();
            val3.ZDATE = "";
            val3.ZSCDD = "";
           
           // val3List = RFCUtil.GetTable<ZTTPP_POMOVE_LAG>(param, "ZTTPP_POMOVE_LAG", "IT_POMOVE_LAG", val3);
            AttributeItem[]  item3List = val3.af_GetAvailableAttributeItem();

            //未按期完成入库采购订单-创建者  
            ZTTPP_POMOVE_LAGER val4 = new ZTTPP_POMOVE_LAGER();
            val4.ZDATE = "";
            val4.ZDDRY = "";
            val4.ZSCDD = "";
          //  val4List = RFCUtil.GetTable<ZTTPP_POMOVE_LAGER>(param, "ZTTPP_POMOVE_LAGER", "IT_POMOVE_LAGER", val4);
            AttributeItem[] item4List = val4.af_GetAvailableAttributeItem();

            List<ITableImplement> vals = new List<ITableImplement>();
            vals.Add(val1);
            vals.Add(val2);
            vals.Add(val3);
            vals.Add(val4);

            Dictionary<string, List<ITableImplement>> map = RFCUtil.GetTable2(param, "ZP_REPL_PURCHASE_ORDER_OUT", new string[] { "IT_POMOVE_SUM", "IT_POMOVE_SUM_MN", "IT_POMOVE_LAG", "IT_POMOVE_LAGER" }, vals);

            valLists.Add(map["IT_POMOVE_SUM"]);
            valLists.Add(map["IT_POMOVE_SUM_MN"]);
            valLists.Add(map["IT_POMOVE_LAG"]);
            
           // valLists.Add(map["IT_POMOVE_LAGER"]);
         

            itemLists.Add(item1List);
            itemLists.Add(item2List);
            itemLists.Add(item3List);
          //  itemLists.Add(item4List);

            IRfcTable IrfTable = RFCUtil.GetTable(param, "ZP_REPL_PURCHASE_ORDER_OUT", "IT_POMOVE_LAGER");
            for (int i = 0; i < IrfTable.Count; i++)
            {
                IrfTable.CurrentIndex = i;
                string zdate = IrfTable.GetString("ZDATE");
                string zscdd = IrfTable.GetString("ZSCDD");
                string zddry = IrfTable.GetString("ZDDRY");

                purchaseMap.Add("" + zdate + zddry, Convert.ToInt32(zscdd)+"");
                //zkwMap.Add(zkw, zkw);
                if (!zddryMap.ContainsKey(zddry))
                {
                    zddryMap.Add(zddry, zddry);
                }
            }
        }
        else
        {

        }
    }
}
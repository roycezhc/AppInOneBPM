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

public partial class SAP_CHART_Sale : System.Web.UI.Page
{
    public List<List<ITableImplement>> valLists = new List<List<ITableImplement>>();
    public List<AttributeItem[]> itemLists = new List<AttributeItem[]>();
    public string month = "";
    public string werk = "";
    public string vkorg = "";
    public List<string> tabnames = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            tabnames.Add("销售创建、计划、完成订单汇总");
            tabnames.Add("销售创建、计划、完成订单金额汇总");
            month = HttpUtil.GetReqStrValue("month");
            werk = HttpUtil.GetReqStrValue("werk");
            vkorg = HttpUtil.GetReqStrValue("vkorg");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_WERKS = werk;
            param.I_GJAHR = month.Substring(0, 4);
            param.I_MONAT = month.Substring(5, 2);
            param.I_VKORG = vkorg;
            //销售创建、计划、完成订单汇总 
            ZTTPP_SALES_SUM val1 = new ZTTPP_SALES_SUM();
            val1.ZDATE = "";
            val1.ZJHXS = "";
            val1.ZSJJH = "";
            val1.ZXSDD = "";
           // val1List = RFCUtil.GetTable<ZTTPP_SALES_SUM>(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY", val1);
            AttributeItem[] item1List = val1.af_GetAvailableAttributeItem();

            //销售创建、计划、完成订单金额汇总
            ZTTPP_SALES_SUM_MN val2 = new ZTTPP_SALES_SUM_MN();
            val2.ZDATE = "";
            val2.ZJHJE = "";
            val2.ZSJJE = "";
            val2.ZXSJE = "";
            //val2List = RFCUtil.GetTable<ZTTPP_SALES_SUM_MN>(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY", val2);
            AttributeItem[] item2List = val2.af_GetAvailableAttributeItem();


            List<ITableImplement> vals = new List<ITableImplement>();
            vals.Add(val1);
            vals.Add(val2);


            Dictionary<string, List<ITableImplement>> map = RFCUtil.GetTable2(param, "ZP_REPL_SALES_ORDER_OUT", new string[] { "IT_SALES_SUM", "IT_SALES_SUM_MN" }, vals);

            valLists.Add(map["IT_SALES_SUM"]);
            valLists.Add(map["IT_SALES_SUM_MN"]);
         


            itemLists.Add(item1List);
            itemLists.Add(item2List);
           
        }
        else
        {
        }
    }
}
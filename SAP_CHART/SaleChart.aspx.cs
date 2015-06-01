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
public partial class SAP_CHART_Sale : SapChartBase
{
    public List<List<ITableImplement>> valLists = new List<List<ITableImplement>>();
    public List<AttributeItem[]> itemLists = new List<AttributeItem[]>();
    public string month = "";
    public string werk = "";
    public string vkorg = "";
    public string labels = "";
    public List<List<string>> dataLists = new List<List<string>>();
    public List<string> tabnames = new List<string>();
    public List<List<string>> lineNames=new  List<List<string>>();
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

            int days = DateTime.DaysInMonth(Convert.ToInt32(param.I_GJAHR), Convert.ToInt32(param.I_MONAT));
            for (int i = 1; i <= days; i++)
            {
                labels += "\"" + param.I_MONAT + "/" + (i < 10 ? "0" + i : "" + i) + "\",";
            }
            labels = labels.Substring(0, labels.Length - 1);

            //销售创建、计划、完成订单汇总 
            ZTTPP_SALES_SUM val1 = new ZTTPP_SALES_SUM();
            val1.ZDATE = "";
            val1.ZJHXS = "";
            val1.ZSJJH = "";
            val1.ZXSDD = "";
           // val1List = RFCUtil.GetTable<ZTTPP_SALES_SUM>(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY", val1);
            AttributeItem[] item1List = val1.af_GetAvailableAttributeItem();

            List<string> val1Names = new List<string>();
            val1Names.Add(ZTTPP_SALES_SUM.Attribute.ZJHXS.ZhName);
            val1Names.Add(ZTTPP_SALES_SUM.Attribute.ZSJJH.ZhName);
            val1Names.Add(ZTTPP_SALES_SUM.Attribute.ZXSDD.ZhName);
            lineNames.Add(val1Names);

            //销售创建、计划、完成订单金额汇总
            ZTTPP_SALES_SUM_MN val2 = new ZTTPP_SALES_SUM_MN();
            val2.ZDATE = "";
            val2.ZJHJE = "";
            val2.ZSJJE = "";
            val2.ZXSJE = "";
            //val2List = RFCUtil.GetTable<ZTTPP_SALES_SUM_MN>(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY", val2);
            AttributeItem[] item2List = val2.af_GetAvailableAttributeItem();

            List<string> val2Names = new List<string>();
            val2Names.Add(ZTTPP_SALES_SUM_MN.Attribute.ZJHJE.ZhName);
            val2Names.Add(ZTTPP_SALES_SUM_MN.Attribute.ZSJJE.ZhName);
            val2Names.Add(ZTTPP_SALES_SUM_MN.Attribute.ZXSJE.ZhName);
            lineNames.Add(val2Names);

            List<ITableImplement> vals = new List<ITableImplement>();
            vals.Add(val1);
            vals.Add(val2);


            Dictionary<string, List<ITableImplement>> map = RFCUtil.GetTable2(param, "ZP_REPL_SALES_ORDER_OUT", new string[] { "IT_SALES_SUM", "IT_SALES_SUM_MN" }, vals);

            valLists.Add(map["IT_SALES_SUM"]);
            valLists.Add(map["IT_SALES_SUM_MN"]);
         


            itemLists.Add(item1List);
            itemLists.Add(item2List);

            foreach (List<ITableImplement> valList in valLists)
            {
                List<string> datas = new List<string>();
                foreach (AttributeItem item in itemLists[valLists.IndexOf(valList)])
                {
                    if (item.FieldName.Equals("ZDATE")) { continue; }
                    string data = "";
                    foreach (ITableImplement val in valList)
                    {

                        try
                        {
                        
                            data += "" + Convert.ToInt32(val[item]) + ",";
                        }
                        catch (Exception ee)
                        {
                            //Response.Write(val[item]);
                            data += "" + val[item] + ",";
                        }
                    }
                    data = data.Substring(0, data.Length - 1);
                    datas.Add(data);
                }
                dataLists.Add(datas);
            }
        }
        else
        {
        }
    }
}
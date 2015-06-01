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
public partial class SAP_CHART_Production : System.Web.UI.Page
{
    public List<AttributeItem[]> itemLists = new List<AttributeItem[]>();
    public List<List<ITableImplement>> valLists = new List<List<ITableImplement>>();

    public List<string> tabnames = new List<string>();
    public List<string> panelnames = new List<string>();
    public string month="";
    public string werk = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            tabnames.Add("生产总工单、成品的计划排产及实际完成订单汇总");
            tabnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单汇总");
            tabnames.Add("生产总工单、成品的计划排产及实际完成订单数量汇总");
            tabnames.Add("生产总工单、生产总工单、成品的计划排产及实际完成订单数量汇总");
            tabnames.Add("常规产品计划与实际排产订单数量汇总");
            tabnames.Add("未按期完成入库生产订单汇总");

            panelnames.Add("生产总工单、成品的计划排产及实际完成订单汇总");
            panelnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单汇总");
            panelnames.Add("生产总工单、成品的计划排产及实际完成订单数量汇总");
            panelnames.Add("生产总工单、生产总工单、成品的计划排产及实际完成订单数量汇总");
            panelnames.Add("常规产品计划与实际排产订单数量汇总");
            panelnames.Add("未按期完成入库生产订单汇总");

            month = HttpUtil.GetReqStrValue("month");
            werk = HttpUtil.GetReqStrValue("werk");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_WERKS = werk;
            param.I_GJAHR = month.Substring(0,4);
            param.I_MONAT = month.Substring(5,2);

            //生产总工单、成品汇总 
            ZTTPP_FP_SUM val1 = new ZTTPP_FP_SUM();
            val1.ZDATE = "";
            val1.ZFSSUM = "";
            val1.ZFSUM = "";
            val1.ZSFSUM = "";
            val1.ZSSUM = "";
          //  val1List = RFCUtil.GetTable<ZTTPP_FP_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RET", val1);
            AttributeItem[] item1List = val1.af_GetAvailableAttributeItem();


            //生产总工单、半成品、重工工单的排产及实际完成订单汇总
            ZTTPP_SM_SUM val2 = new ZTTPP_SM_SUM();
            val2.ZDATE = "";
            val2.ZFRSUM = "";
            val2.ZFSMSUM = "";
            val2.ZFSUM = "";
            val2.ZSRSUM = "";
            val2.ZSSMSUM = "";
            val2.ZSSUM = "";
         //   val2List = RFCUtil.GetTable<ZTTPP_SM_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_SM", val2);
            AttributeItem[] item2List = val2.af_GetAvailableAttributeItem();

            //生产总工单、成品的计划排产及实际完成订单数量汇总
            ZTTPP_FP_SUM_NUM val3 = new ZTTPP_FP_SUM_NUM();
            val3.ZDATE = "";
            val3.ZDDSL = "";
            val3.ZKSCPSL = "";
            val3.ZSJCPSL = "";
            val3.ZSJSL = "";
           // val3List = RFCUtil.GetTable<ZTTPP_FP_SUM_NUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RET_NUM", val3);
            AttributeItem[]  item3List = val3.af_GetAvailableAttributeItem();

            //生产总工单、半成品、重工工单的排产及实际完成订单数量汇总 
            ZTTPP_SM_SUM_NUM val4 = new ZTTPP_SM_SUM_NUM();
            val4.ZDATE = "";
            val4.ZKSBCPSL = "";
            val4.ZKSCGSL = "";
            val4.ZKSSL = "";
            val4.ZSJBCPSL = "";
            val4.ZSJCGSL = "";
            val4.ZSJSL = "";
          //  val4List = RFCUtil.GetTable<ZTTPP_SM_SUM_NUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_SM_NUM", val4);
            AttributeItem[]  item4List = val4.af_GetAvailableAttributeItem();


            //常规产品计划与实际排产订单数量汇总 
            ZTTPP_RULE_SUM val5 = new ZTTPP_RULE_SUM();
            val5.ZDATE = "";
            val5.ZCGSJSL = "";
            val5.ZCGSL = "";
          //  val5List = RFCUtil.GetTable<ZTTPP_RULE_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RULE", val5);
            AttributeItem[]  item5List = val5.af_GetAvailableAttributeItem();

            //未按期完成入库生产订单汇总 
            ZTTPP_UNDONE_SUM val6 = new ZTTPP_UNDONE_SUM();
            val6.ZDATE = "";
            val6.ZWWCGS = "";
         //   val6List = RFCUtil.GetTable<ZTTPP_UNDONE_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_UNDONE", val6);
            AttributeItem[] item6List = val6.af_GetAvailableAttributeItem();

            List<ITableImplement> vals = new List<ITableImplement>();
            vals.Add(val1);
            vals.Add(val2);
            vals.Add(val3);
            vals.Add(val4);
            vals.Add(val5);
            vals.Add(val6);
            Dictionary<string, List<ITableImplement>> map = RFCUtil.GetTable2(param, "ZP_REPL_WQ_ORDER_OUT", new string[] { "IT_ORDER_RET", "IT_ORDER_SM", "IT_ORDER_RET_NUM", "IT_ORDER_SM_NUM", "IT_ORDER_RULE", "IT_ORDER_UNDONE" }, vals);

            valLists.Add( map["IT_ORDER_RET"]);
            valLists.Add(map["IT_ORDER_SM"]);
            valLists.Add(map["IT_ORDER_RET_NUM"]);
            valLists.Add( map["IT_ORDER_SM_NUM"]);
            valLists.Add( map["IT_ORDER_RULE"]);
            valLists.Add( map["IT_ORDER_UNDONE"]);

            itemLists.Add(item1List);
            itemLists.Add(item2List);
            itemLists.Add(item3List);
            itemLists.Add(item4List);
            itemLists.Add(item5List);
            itemLists.Add(item6List);

        }
        else { 
            
        }
    }
}
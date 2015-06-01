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
public partial class SAP_CHART_Production : SapChartBase
{
    public List<AttributeItem[]> itemLists = new List<AttributeItem[]>();
    public List<List<ITableImplement>> valLists = new List<List<ITableImplement>>();

    public List<string> tabnames = new List<string>();
    public List<string> panelnames = new List<string>();
    public string month="";
    public string werk = "";
    public string labels = "";

    public List<List<string>> dataLists = new List<List<string>>();
    public List<List<string>> lineNames = new List<List<string>>();
    public List<int> stepList = new List<int>();
    public List<decimal> maxList = new List<decimal>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            tabnames.Add("生产总工单、成品的计划排产及实际完成订单汇总");
            tabnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单汇总");
            tabnames.Add("生产总工单、成品的计划排产及实际完成订单数量汇总");
            tabnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单数量汇总");
            tabnames.Add("常规产品计划与实际排产订单数量汇总");
            tabnames.Add("未按期完成入库生产订单汇总");

            panelnames.Add("生产总工单、成品的计划排产及实际完成订单汇总");
            panelnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单汇总");
            panelnames.Add("生产总工单、成品的计划排产及实际完成订单数量汇总");
            panelnames.Add("生产总工单、半成品、重工工单的排产及实际完成订单数量汇总");
            panelnames.Add("常规产品计划与实际排产订单数量汇总");
            panelnames.Add("未按期完成入库生产订单汇总");

            month = HttpUtil.GetReqStrValue("month");
            werk = HttpUtil.GetReqStrValue("werk");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_WERKS = werk;
            param.I_GJAHR = month.Substring(0, 4);
            param.I_MONAT = month.Substring(5, 2);
            int days = DateTime.DaysInMonth(Convert.ToInt32(param.I_GJAHR), Convert.ToInt32(param.I_MONAT));
            for (int i = 1; i <= days; i++)
            {
                labels += "\"" + param.I_MONAT + "/" + (i < 10 ? "0" + i : "" + i) + "\",";
            }
            labels = labels.Substring(0, labels.Length - 1);
            //生产总工单、成品汇总 
            ZTTPP_FP_SUM val1 = new ZTTPP_FP_SUM();
            val1.ZDATE = "";
            val1.ZFSSUM = "";
            val1.ZFSUM = "";
            val1.ZSFSUM = "";
            val1.ZSSUM = "";
            //  val1List = RFCUtil.GetTable<ZTTPP_FP_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RET", val1);
            AttributeItem[] item1List = val1.af_GetAvailableAttributeItem();

            List<string> val1Names = new List<string>();
            val1Names.Add(ZTTPP_FP_SUM.Attribute.ZSSUM.ZhName);
            val1Names.Add(ZTTPP_FP_SUM.Attribute.ZFSUM.ZhName);
            val1Names.Add(ZTTPP_FP_SUM.Attribute.ZSFSUM.ZhName);
            val1Names.Add(ZTTPP_FP_SUM.Attribute.ZFSSUM.ZhName);
            lineNames.Add(val1Names);

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

            List<string> val2Names = new List<string>();
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZSSUM.ZhName);
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZFSUM.ZhName);
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZSSMSUM.ZhName);
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZFSMSUM.ZhName);
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZSRSUM.ZhName);
            val2Names.Add(ZTTPP_SM_SUM.Attribute.ZFRSUM.ZhName);

            lineNames.Add(val2Names);

            //生产总工单、成品的计划排产及实际完成订单数量汇总
            ZTTPP_FP_SUM_NUM val3 = new ZTTPP_FP_SUM_NUM();
            val3.ZDATE = "";
            val3.ZDDSL = "";
            val3.ZKSCPSL = "";
            val3.ZSJCPSL = "";
            val3.ZSJSL = "";
            // val3List = RFCUtil.GetTable<ZTTPP_FP_SUM_NUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RET_NUM", val3);
            AttributeItem[] item3List = val3.af_GetAvailableAttributeItem();

            List<string> val3Names = new List<string>();
            val3Names.Add(ZTTPP_FP_SUM_NUM.Attribute.ZDDSL.ZhName);
            val3Names.Add(ZTTPP_FP_SUM_NUM.Attribute.ZSJSL.ZhName);
            val3Names.Add(ZTTPP_FP_SUM_NUM.Attribute.ZKSCPSL.ZhName);
            val3Names.Add(ZTTPP_FP_SUM_NUM.Attribute.ZSJCPSL.ZhName);
            lineNames.Add(val3Names);

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
            AttributeItem[] item4List = val4.af_GetAvailableAttributeItem();

            List<string> val4Names = new List<string>();
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZKSSL.ZhName);
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZSJSL.ZhName);
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZKSBCPSL.ZhName);
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZSJBCPSL.ZhName);
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZKSCGSL.ZhName);
            val4Names.Add(ZTTPP_SM_SUM_NUM.Attribute.ZSJCGSL.ZhName);
            lineNames.Add(val4Names);

            //常规产品计划与实际排产订单数量汇总 
            ZTTPP_RULE_SUM val5 = new ZTTPP_RULE_SUM();
            val5.ZDATE = "";
            val5.ZCGSJSL = "";
            val5.ZCGSL = "";
            //  val5List = RFCUtil.GetTable<ZTTPP_RULE_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_RULE", val5);
            AttributeItem[] item5List = val5.af_GetAvailableAttributeItem();

            List<string> val5Names = new List<string>();
            val5Names.Add(ZTTPP_RULE_SUM.Attribute.ZCGSL.ZhName);
            val5Names.Add(ZTTPP_RULE_SUM.Attribute.ZCGSJSL.ZhName);
            lineNames.Add(val5Names);

            //未按期完成入库生产订单汇总 
            ZTTPP_UNDONE_SUM val6 = new ZTTPP_UNDONE_SUM();
            val6.ZDATE = "";
            val6.ZWWCGS = "";
            //   val6List = RFCUtil.GetTable<ZTTPP_UNDONE_SUM>(param, "ZP_REPL_WQ_ORDER_OUT", "IT_ORDER_UNDONE", val6);
            AttributeItem[] item6List = val6.af_GetAvailableAttributeItem();

            List<string> val6Names = new List<string>();
            val6Names.Add(ZTTPP_UNDONE_SUM.Attribute.ZWWCGS.ZhName);
            lineNames.Add(val6Names);

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


            foreach (List<ITableImplement> valList in valLists)
            {
                int index = valLists.IndexOf(valList);
                List<string> datas = new List<string>();
                maxList.Add(0);
                foreach (AttributeItem item in itemLists[index])
                {
                    if (item.FieldName.Equals("ZDATE")) { continue; }
                    string data = "";
                    foreach (ITableImplement val in valList)
                    {

                        try
                        {
                            if (Convert.ToDecimal(val[item]) > maxList[index])
                            {
                                maxList[index] = Convert.ToDecimal(val[item]);
                            }
                            data += "" + Convert.ToDecimal(val[item]) + ",";
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
            foreach (decimal max in maxList)
            {
                stepList.Add(getStepWidth(max));
            }

        }
        else { 
            
        }
    }
}
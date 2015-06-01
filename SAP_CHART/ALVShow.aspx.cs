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
public partial class SAP_CHART_ALVShow : System.Web.UI.Page
{
    public List<ITableImplement> val1List = null;
    public List<ITableImplement> val2List = null;
    public List<ITableImplement> val3List = null;
    public List<ITableImplement> val4List = null;
    public List<ITableImplement> val5List = null;
    public List<ITableImplement> val6List = null;
    public List<ITableImplement> val7List = null;

    public AttributeItem[] itemList = null;

    public string startmonth = "";
    public string endmonth = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            startmonth = HttpUtil.GetReqStrValue("startmonth");
            endmonth = HttpUtil.GetReqStrValue("endmonth");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_PERIOD_S = startmonth.Replace("-","");
            param.I_PERIOD_E = endmonth.Replace("-", "");

            //生产订单物料耗用差异率 
            ALVTEMP val1 = new ALVTEMP();
            val1.WERKS = "";
            val1.GJAHR = "";
            val1.MONAT = "";
            val1.ERNAM = "";
            val1.ZZHIB = "";
            val1.ZKDBS = "";
            //val1List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_MLD", val1);
             itemList = val1.af_GetAvailableAttributeItem();

            ////盘盈盘亏/盘点初的库存总金额 
            //val2List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_OPCIITA", val1);


            ////采购订单及时率  
            //val3List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_POTR", val1);

            ////采购订单及时率(按操作人员)
            //val4List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_POTR_PERP", val1);

            ////采购订单完成率 
            //val5List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_POCR", val1);

            ////采购订单完成率(按操作人员)
            //val6List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_POCR_PERP", val1);

            ////生产订单入库及时率 
            //val7List = RFCUtil.GetTable<ALVTEMP>(param, "ZP_REPL_QUARTER_ASSESS_OUT", "IT_POINR", val1);
            List<ITableImplement> vals = new List<ITableImplement>();
            vals.Add(val1);
            vals.Add(val1);
            vals.Add(val1);
            vals.Add(val1);
            vals.Add(val1);
            vals.Add(val1);
            vals.Add(val1);
            Dictionary<string, List<ITableImplement>> map = RFCUtil.GetTable2(param, "ZP_REPL_QUARTER_ASSESS_OUT",
                new string[] { "IT_MLD", "IT_OPCIITA", "IT_POTR", "IT_POTR_PERP", "IT_POCR", "IT_POCR_PERP", "IT_POINR" }, vals);

            val1List = map["IT_MLD"];
            val2List=map["IT_OPCIITA"];
            val3List=map["IT_POTR"];
            val4List=map["IT_POTR_PERP"];
            val5List=map["IT_POCR"];
            val6List=map["IT_POCR_PERP"];
            val7List=map["IT_POINR"];
        }
        else
        {
        }
    }
}
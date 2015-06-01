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
public partial class SAP_CHART_Stock : System.Web.UI.Page
{
    public Dictionary<string, string> stockMap = new Dictionary<string, string>();
    public string month = "";
    public string monthStr = "";
    public string werk = "";
    public int days = 0;
    public Dictionary<string,string> zkwMap =new Dictionary<string,string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            month = HttpUtil.GetReqStrValue("month");
            werk = HttpUtil.GetReqStrValue("werk");
            SAPCHARTPARAM param = new SAPCHARTPARAM();
            param.I_WERKS = werk;
            param.I_GJAHR = month.Substring(0, 4);
            param.I_MONAT = month.Substring(5, 2);
            monthStr = param.I_MONAT;
            days=DateTime.DaysInMonth(Convert.ToInt32(param.I_GJAHR), Convert.ToInt32(param.I_MONAT));
            //库存金额情况变动表
            //ZTTPP_STOCK_MONEY val1 = new ZTTPP_STOCK_MONEY();
            //val1.ZDATE = "";
            //val1.ZKCJE = "";
            //val1.ZKW = "";
            //val1List = RFCUtil.GetTable<ZTTPP_STOCK_MONEY>(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY", val1);
          //  AttributeItem[]  item1List = val1.af_GetAvailableAttributeItem();


            IRfcTable IrfTable = RFCUtil.GetTable(param, "ZP_REPL_STOCK_MONEY_OUT", "IT_STOCK_MONEY");
            for (int i = 0; i < IrfTable.Count; i++)
            {
                IrfTable.CurrentIndex = i;
                string zdate=IrfTable.GetString("ZDATE");
                string zkw = IrfTable.GetString("ZKW");
                string zkcje = IrfTable.GetString("ZKCJE");
              
                stockMap.Add("" + zdate + zkw, zkcje);
                //zkwMap.Add(zkw, zkw);
               if (!zkwMap.ContainsKey(zkw)) {
                   zkwMap.Add(zkw, zkw);
                }
            }

            //itemLists.Add(item1List);
           
        }
        else
        {
        }
    }
}
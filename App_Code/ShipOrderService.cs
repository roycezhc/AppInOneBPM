using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.RFCLIB;
/// <summary>
/// ShipOrderService 的摘要说明
/// </summary>

[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
// [System.Web.Script.Services.ScriptService]
public class ShipOrderService : System.Web.Services.WebService {

    public ShipOrderService () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    /*webservise参数：
	供应商编号
	工厂
	发货单号
	创建时间 yyyyMMdd
     * 
     * 单号	行号	物料描述	数量	单位	创建日期	物料编号	订单编号	订单行	状态
     * 
     * 功能：发货单跟踪
*/
    [WebMethod]
    public string getShipOrderList(string vendor,string plant_code,string order_code,string starttime,string endtime)
    {
        V_PURSUEDELIVER conf = new V_PURSUEDELIVER();
        conf.Status = "REL";
        if(!string.IsNullOrEmpty(vendor)){
            conf.Vendor = vendor;
        }
        if (!string.IsNullOrEmpty(plant_code))
        {
            conf.Plant_code = plant_code;
        }
       
        if (!string.IsNullOrEmpty(starttime))
        {
          
        }
        if (!string.IsNullOrEmpty(endtime))
        {
            conf.af_WhereSQL += " AND creation_date < '" + endtime + " 23:59:59'";
        }
        V_PURSUEDELIVER val= new V_PURSUEDELIVER();
        val.Order_code = 0;
        val.Line_num = "";
        val.Quantity = 0;
        val.Unit = "";
        val.Creation_date = DateTime.Now;
        val.Material_id = "";
        val.Po_num = "";
        val.Po_line_num = "";
        val.Status = "";
        val.Plan_line_num = 0;
        List<V_PURSUEDELIVER> lineList3 = BLLTable<V_PURSUEDELIVER>.Factory("conn_gys").Select(val, conf);

        RFCPARAM paramObj = new RFCPARAM();
        paramObj.I_WERKS = plant_code;
        paramObj.DATE_FROM = starttime;
        paramObj.DATE_TO = endtime;
        paramObj.I_LIFNR = vendor;

        
        paramObj.DATE_FROM = DateTime.Now.AddYears(-1).ToString("yyyyMMdd");
        paramObj.DATE_TO = DateTime.Now.AddYears(1).ToString("yyyyMMdd");

        IT_LINES valObj = new IT_LINES();
        valObj.EBELN = "";
        valObj.EBELP = "";
        valObj.LOEKZ = "";
        valObj.MATNR = "";
        valObj.TXZ01 = "";
        valObj.MENGE = 1;
        valObj.MEINS = "";
        valObj.EINDT = "";
        valObj.LTEXT = "";
        valObj.WERKS = "";
        valObj.ETENR = "";
        valObj.OBMNG = 1;
        List<IT_LINES> lines = RFCUtil.GetTable<IT_LINES>(paramObj, "ZVP_NOT_DLV_PO", "IT_LINES", valObj);
        Dictionary<string, IT_LINES> lineMap = new Dictionary<string, IT_LINES>();

        foreach (IT_LINES detail in lines)
        {
            string key = detail.EBELN + Convert.ToInt32(detail.EBELP) + Convert.ToInt32(detail.ETENR);
            // lines.Add(detail);
            if (lineMap.ContainsKey(key))
            {
                lineMap[key] = detail;
                // deliverMap[key] = ship;
            }
            else
            {
                lineMap.Add(key, detail);
                // deliverMap.Add(key, ship);
            }
        }

        List<V_PURSUEDELIVER> lineList = new List<V_PURSUEDELIVER>();
        Dictionary<string, decimal> numMap = new Dictionary<string, decimal>();
        for (int i = lineList3.Count - 1; i >= 0; i--)
        {
            // foreach(V_PURSUEDELIVER line in lineList3){
            V_PURSUEDELIVER line = lineList3[i];
            string key = line.Po_num + "" + line.Po_line_num + "" + line.Plan_line_num;
            decimal usedNum = 0;
            if (numMap.ContainsKey(key))
            {
                //usedNum表示上一个 key相同的发货单送的数量。
                usedNum = numMap[key];
                if (usedNum == -1)
                {
                    //肯定为在途
                    lineList.Add(line);
                    continue;
                }
            }
            else
            {
                numMap.Add(key, 0);
            }
            if (!lineMap.ContainsKey(key))
            {
                //lineList.Remove(line);
                //如果不在未清中，那么肯定不在途
                continue;
            }
            else
            {
                IT_LINES line_1 = lineMap[key];

                Vp_initial_polines conf2 = new Vp_initial_polines();
                conf2.Po_number = line.Po_num;
                conf2.Po_line = line.Po_line_num;
                conf2.Po_line_num = line.Plan_line_num + "";
                Vp_initial_polines valObj2 = new Vp_initial_polines();
                valObj2.Quantity = 0;
                Vp_initial_polines poline = BLLTable<Vp_initial_polines>.Factory("conn_gys").GetRowData(valObj2, conf2);
                decimal sum = 0;
                decimal num = 0;
                if (poline != null)
                {
                    sum = poline.Quantity;
                }
                if (sum > 0)
                {
                    num = sum - line_1.OBMNG - usedNum;
                }
                else
                {
                    num = line_1.MENGE - line_1.OBMNG - usedNum;
                }
                if (num >= line.Quantity)
                {
                    numMap[key] += line.Quantity;
                    // lineList.Remove(line);
                }
                else
                {
                    //如果=-1 则代表 第一条 key 都没有交货，以后遇到 -1 就continue
                    numMap[key] = -1;
                    lineList.Add(line);
                }

            }
        }
        //这里需要过滤一下
        if (!string.IsNullOrEmpty(order_code))
        {
            List<V_PURSUEDELIVER> lineList4 = new List<V_PURSUEDELIVER>();
            //如果有传入订单号，则过滤
            for (int i = 0; i < lineList.Count; i++)
            {
                if (order_code.Equals(lineList[i].Order_code + ""))
                {
                    lineList4.Add(lineList[i]);
                }
            }
            lineList = lineList4;
        }
        lineList.Reverse();

        string xml = "<Orders>";
        foreach (V_PURSUEDELIVER p in lineList)
        {
           string tempxml = "<Order>";
           tempxml += "<Order_code>"+p.Order_code+"</Order_code>";
           tempxml += "<Line_num>" + p.Line_num + "</Line_num>";
           tempxml += "<Quantity>" + p.Quantity + "</Quantity>";
           tempxml += "<Unit>" + p.Unit + "</Unit>";
           tempxml += "<Creation_date>" + p.Creation_date + "</Creation_date>";
           tempxml += "<Material_id>" + p.Material_id + "</Material_id>";
           tempxml += "<Po_num>" + p.Po_num + "</Po_num>";
           tempxml += "<Po_line_num>" + p.Po_line_num + "</Po_line_num>";
           tempxml += "<Status>" + p.Status + "</Status>";
           tempxml += "</Order>";
           xml += tempxml;
       }
        xml+="</Orders>";
      //string json=JsonUtil.getJsonStr<V_PURSUEDELIVER>(list);
        return xml;
    }
}

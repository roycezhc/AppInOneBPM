using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
/// <summary>
/// ShipOrderService 的摘要说明
/// </summary>

[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
// [System.Web.Script.Services.ScriptService]
public class WaitOrderListService : System.Web.Services.WebService {

    public WaitOrderListService()
    {

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
*/
    [WebMethod]
    public string getWaitOrderList(string vendor,string plant_code)
    {
            
        Vp_purchase_orders conf = new Vp_purchase_orders();
        if (!string.IsNullOrEmpty(vendor))
        {
            conf.Vendor = vendor;

            Vp_users conf2 = new Vp_users();
            conf2.Vendor = vendor;
            Vp_users valObj = BLLTable<Vp_users>.Factory("conn_gys").GetRowData(conf2);
            if (valObj == null)
            {
                return "";
            }
        }
        else {
            List<string> vendors = new List<string>();
            Vp_users userCond = new Vp_users();
            Vp_users userVal = new Vp_users();
            userVal.Vendor = "";
            List<Vp_users> users = BLLTable<Vp_users>.Factory("conn_gys").Select(userVal, userCond);
            foreach (Vp_users u in users)
            {
                vendors.Add(u.Vendor);
            }
            conf.In(Vp_purchase_orders.Attribute.Vendor, vendors.ToArray());
        }
            if (!string.IsNullOrEmpty(plant_code))
            {
                conf.Plant_code = plant_code;
            }
            conf.af_WhereSQL += " AND (status='REL' OR status='VCO' OR status='CCO')";
            conf.OrderBy("release_date desc");
           
            List<Vp_purchase_orders> orderList = BLLTable<Vp_purchase_orders>.Factory("conn_gys").Select(new Vp_purchase_orders(), conf);

            string xml = XmlUtil.getXmlByTableList(orderList, new Vp_purchase_orders().TableName());
            //string json=JsonUtil.getJsonStr<V_PURSUEDELIVER>(list);
            return xml;
    }
}




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
using AgileFrame.Core;
using System.Text;
using System.Net.Json;
using System.Web;
public partial class canyin_Back : System.Web.UI.Page
{
    public string PREPATH = MyConfigurationSettings.GetValue<string>("BehindSite");
    public int userid = 1;
    public int aid = 1;
    public List<ITableImplement> cls = new List<ITableImplement>();
    
    private JsonObjectCollection getJsonObj<MyTable>(MyTable item, string jsonName) where MyTable : ITableImplement, new()
    {
        //item.SetValue(new AttributeItem("name"), object1);
        JsonObjectCollection obj = new JsonObjectCollection();
        List<object> listObj = new List<object>();
        AttributeItem[] attrList = item.af_GetAvailableAttributeItem(ref listObj);
        for (int i = 0; i < attrList.Length; i++)
        {
            if (listObj[i] is MyTable)
            {
                MyTable item1 = listObj[i] as MyTable;
                obj.Add(getJsonObj(item1, attrList[i].FieldName));
            }
            else if (listObj[i] is List<MyTable>)
            {
                List<MyTable> item2 = listObj[i] as List<MyTable>;
                obj.Add(getJsonObj(item2, attrList[i].FieldName));
            }
            else if (listObj[i] is ITableImplement)
            {
                List<ITableImplement> item2 = listObj[i] as List<ITableImplement>;
                obj.Add(getJsonObj(item2, attrList[i].FieldName));
            }
            else if (listObj[i] is List<ITableImplement>)
            {
                List<ITableImplement> item2 = listObj[i] as List<ITableImplement>;
                obj.Add(getJsonObj(item2, attrList[i].FieldName));
            }
            else
                obj.Add(new JsonStringValue(attrList[i].FieldName, Convert.ToString(listObj[i])));
        }
        if (!string.IsNullOrEmpty(jsonName))
            obj.Name = jsonName;
        return obj;
    }
    private List<ITableImplement> getTable<MyTable>(List<MyTable> item1) where MyTable : ITableImplement, new()
    {
        List<ITableImplement> itemlist2 = new List<ITableImplement>();
        foreach (ITableImplement item in item1)
        {
            itemlist2.Add(item);
        }
        return itemlist2;
    }
    private ITableImplement getTable<MyTable>(MyTable item1) where MyTable : ITableImplement, new()
    {
        return (ITableImplement)item1;
    }
    //{"data":{ "retFlag": 0, "message": "登录成功。", "userID": 1, "userName": "sys", "realName": "管理员", "userType": 1, "roleIDS": "", "email": "", "staffID": 21, "staffName": "管理员", "deptID": 105, "deptName": "", "orgID": 0, "orgName": "", "myDeptIDS": "" },"response":"Checklogin"}
    //private string getJson<MyTable>(MyTable item) where MyTable : ITableImplement, new()
    //{
    //    return getJsonObj(item).ToString();
    //}
    private JsonArrayCollection getJsonObj<MyTable>(List<MyTable> list, string jsonName) where MyTable : ITableImplement, new()
    {
        JsonArrayCollection arrs = new JsonArrayCollection();        
        foreach (MyTable item in list)
        {
            arrs.Add(getJsonObj(item, ""));
        }
        arrs.Name = jsonName;
        return arrs;
    }
    //private JsonArrayCollection getJsonObj<MyTable>(List<List<MyTable>> listList, string jsonName) where MyTable : ITableImplement, new()
    //{
    //    JsonArrayCollection arrs = new JsonArrayCollection();
    //    foreach (List<MyTable> list in listList)
    //    {
    //        arrs.Add(getJsonObj(list, jsonName));
    //    }
    //    return arrs;
    //}
    private string getJsonStr<MyTable>(Object item) where MyTable : ITableImplement, new()
    {
        //if (item is object)
        //{
        //    object a = new object();
        //}
        //else if (item is List<WEC_CY_ORDER>) {
        //    object a = new object();
        //}

        if (item is MyTable)
        {
            MyTable item1 = item as MyTable;
            return getJsonObj(item1, "").ToString();
        }
        else if (item is List<MyTable>)
        {
            List<MyTable> item2 = item as List<MyTable>;
            return getJsonObj(item2, "").ToString();

        }
        return "";
        //if (item is List<List<MyTable>>)
        //{
        //    List<List<MyTable>> item3 = item as List<List<MyTable>>;
        //    return getJsonObj(item3, "").ToString();
        //}
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie=Request.Cookies["currStore"];
        int storeId = Convert.ToInt32(cookie.Values["currStoreId"]);
        
       // string tel = cookie.Values["currStoreTel"];
        //0:初始化为0 
        string type = "0";
        //1:loadDishList：载入菜品列表
        //2:getOrderList 获取订单列表
        //3:loadLikeList 加载喜欢的菜品列表
        //4:addItem：选中菜品，添加菜品
        //5:delItem: 取消选中，删除菜品
        //6:getAllMenu: 加载订单中菜单列表  getAllMenu
        //7:getDishCount 加载各页面时，需要异步获取当前的点菜数量
        //8:clearAll 清空选菜
        //9:orderSubmit 订单提交
        //10:addLikeDish 插入喜欢菜品信息
        //11:delLikeDish 移除喜欢菜品
        //12:updateItem 订单提交 更新相关ITEM信息
        type=Request["type"];
        //载入菜品列表
        string loadlist = Request["loadlist"];
        
        //插入喜欢菜品信息
        string like =Request["like"];
        //加载喜欢的菜品列表
        string loadlikelist=Request["loadlikelist"];
        //选择菜品，加入订单表，或者删除菜品
        string select=Request["select"];
        //加载各页面时，需要异步获取当前的点菜数量。
        string getdishcount=Request["getdishcount"];
        //加载订单中菜单列表
        string getitemlist=Request["getitemlist"];
        //获取位置类型
        string getseattype=Request["getseattype"];

        //电话号码(订单提交)
        string tel=Request["tel"];
        
        //订单id
        string orderid=Request["orderid"];

        //获取订单列表
        string getorderlist=Request["getorderlist"];
        //清空选菜
        string clearall = Request["clearall"];
        if (type.Equals("loadDishList"))
        {
            string type_id=Request["type_id"];
            //StringBuilder sb = new StringBuilder();
            List<WEC_CY_DISH> list = null;
            WEC_CY_DISH conf = new WEC_CY_DISH();
            conf.TYPE_ID = Convert.ToDecimal(type_id);
            conf.STORE_ID = storeId;
            WEC_CY_DISH val=new WEC_CY_DISH();
            val.ID = 1;
            val.TITLE = "";
            val.INFO = "";
            val.SPECIAL_PRICE = 1;
            val.DISH_PRICE = 1;
            val.TAG_ID = 1;
          
            list = BLLTable<WEC_CY_DISH>.Factory("conn_canyin").Select(val, conf);

            WEC_CY_LIKE conf3 = new WEC_CY_LIKE();
            conf3.F_ID = userid;
            conf3.STORE_ID = storeId;
            List<WEC_CY_LIKE> likelist = BLLTable<WEC_CY_LIKE>.Factory("conn_canyin").Select(new WEC_CY_LIKE(), conf3);
            List<decimal> intlist = new List<decimal>();
            foreach( WEC_CY_LIKE likedish in likelist){
                intlist.Add(likedish.D_ID);
            }
            foreach (WEC_CY_DISH dish in list)
            {
                JsonObjectCollection obj = new JsonObjectCollection();
                Boolean islike = intlist.Contains(dish.ID);

                WEC_CY_TAG conf2 = new WEC_CY_TAG();
                conf2.ID = dish.TAG_ID;
                conf2.STORE_ID = storeId;
                WEC_CY_TAG tag = BLLTable<WEC_CY_TAG>.Factory("conn_canyin").GetRowData(conf2);
                int isspecial = dish.SPECIAL_PRICE == 0 ? 0 : 1;
                dish.DISH_PRICE = dish.SPECIAL_PRICE == 0 ? dish.DISH_PRICE  : dish.SPECIAL_PRICE ;
                dish.PIC = PREPATH + dish.PIC;
                if (islike)
                {
                    dish.SetValue(new AttributeItem("","CHECK"),"checked");
                }
                else
                {
                    dish.SetValue(new AttributeItem("", "CHECK"), "");
                }
               
                dish.SetValue(new AttributeItem("", "DISH_TAG"), tag.TITLE);
                dish.SetValue(new AttributeItem("", "ISSPECIAL"), isspecial);
                if (isspecial == 1)
                {
                    dish.SetValue(new AttributeItem("", "DISH_REMARK"), "[<font color='red'>特价</font>]");
                }
                else {
                    dish.SetValue(new AttributeItem("", "DISH_REMARK"), "");
                }

               
                WEC_CY_ITEM conf4 = new WEC_CY_ITEM();
                conf4.D_ID = dish.ID;
                conf4.F_ID = userid;
                conf4.O_ID = 0;
                conf3.STORE_ID = storeId;
                WEC_CY_ITEM item = BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").GetRowData(conf4);
                if (item == null)
                {
                    dish.SetValue(new AttributeItem("", "CHOOSE"), "unchoose");
                }
                else
                {
                    dish.SetValue(new AttributeItem("", "CHOOSE"), "choosen");
                }
             
            }
            Response.Write(getJsonStr<ITableImplement>(getTable(list)));
        }
        else if(type.Equals("addLikeDish")){
            string id=Request["id"];
            WEC_CY_LIKE conf = new WEC_CY_LIKE();
            conf.D_ID = Convert.ToDecimal(id);
            conf.ADDTIME = DateTime.Now;
            //这里是插入当前用户的ID（粉丝ID）先写1
            conf.F_ID = userid;
            conf.STORE_ID = storeId;
            BLLTable<WEC_CY_LIKE>.Factory("conn_canyin").Insert(conf, WEC_CY_LIKE.Attribute.ID);
        }
        else if (type.Equals("delLikeDish"))
        {
             //删除喜欢
            string id = Request["id"];
            WEC_CY_LIKE conf = new WEC_CY_LIKE();
            conf.D_ID = Convert.ToDecimal(id);
            //这里是插入当前用户的ID（粉丝ID）先写1
            conf.F_ID = userid;
            conf.STORE_ID = storeId;
            BLLTable<WEC_CY_LIKE>.Factory("conn_canyin").Delete(conf);
        }
        else if (type.Equals("loadLikeList"))
        {
            StringBuilder sb = new StringBuilder();
            V_WEC_CY_LIKE conf = new V_WEC_CY_LIKE();
            conf.F_ID = userid;
            conf.STORE_ID = storeId;
            List<V_WEC_CY_LIKE> list = null;
            V_WEC_CY_LIKE val = new V_WEC_CY_LIKE();
            val.ID = 1;
            val.TITLE = "";
            val.INFO = "";
            val.DISH_PRICE = 1;
            val.SPECIAL_PRICE = 1;
            val.TAG_ID = 1;
            val.Expr1 = 1;
            list = BLLTable<V_WEC_CY_LIKE>.Factory("conn_canyin").Select(val, conf);
          //  JsonArrayCollection arrs = new JsonArrayCollection();
            foreach (V_WEC_CY_LIKE dish in list)
            {
                JsonObjectCollection obj = new JsonObjectCollection();
                WEC_CY_TAG conf2 = new WEC_CY_TAG();
                conf2.ID = dish.TAG_ID;
                conf2.STORE_ID = storeId;
                WEC_CY_TAG tag = BLLTable<WEC_CY_TAG>.Factory("conn_canyin").GetRowData(conf2);
                //string s1=dish.TITLE + dish.SPECIAL_PRICE == null ? "" : "[<font color='red'>特价</font>]";
               int isspecial = dish.SPECIAL_PRICE == 0 ? 0 : 1;
               dish.DISH_PRICE= dish.SPECIAL_PRICE == 0 ? dish.DISH_PRICE  : dish.SPECIAL_PRICE ;
               dish.PIC = PREPATH + dish.PIC;
                //sb.Append("<dl   dunitname='份' dsubcount='1' dishid='" + dish.Expr1 + "' dname='" + dish.TITLE + "' dtaste='' ddescribe='" + dish.INFO + "' dprice='" + dish.DISH_PRICE + "' dishot='" + tag.TITLE + "' dspecialprice='" + dish.SPECIAL_PRICE + "' disspecial='" + isSpecial + "' onclick='selectOne(this, " + dish.Expr1 + ", " + ss + ");'>" +
                //    "<dt><h3>" + dish.TITLE);
                //sb.Append(dish.SPECIAL_PRICE == 0 ? "" : "[<font color='red'>特价</font>]");
                //sb.Append("</h3></dt>" +
                //        "<dd><a href='javascript:void(0)' class='dataIn' onclick='showImgDetail(this);event.stopPropagation();'>" +
                //        "<img src=" + PREPATH + dish.PIC + " alt='' title=''>");
                //sb.Append(tag == null ? "" : ("<span style='font-size:10px;'>" + tag.TITLE + "</span>"));
                //sb.Append("</a></dd><dd><em>");
                //sb.Append(dish.SPECIAL_PRICE == 0 ? (dish.DISH_PRICE + "") : (dish.SPECIAL_PRICE + ""));
                //sb.Append("元/份</em></dd>" );
                //         "<button shopinfo='' class='selectBtn choose  unchoose'></button>" +
              
            
               
                dish.SetValue(new AttributeItem("", "DISH_TAG"), tag.TITLE);
                dish.SetValue(new AttributeItem("", "ISSPECIAL"), isspecial);
                if (isspecial == 1)
                {

                    dish.SetValue(new AttributeItem("", "DISH_REMARK"), "[<font color='red'>特价</font>]");
                }
                else
                {

                    dish.SetValue(new AttributeItem("", "DISH_REMARK"), "");
                }

                WEC_CY_ITEM conf3 = new WEC_CY_ITEM();
                conf3.D_ID = dish.Expr1;
                conf3.F_ID = userid;
                conf3.O_ID = 0;
                conf3.STORE_ID = storeId;
                WEC_CY_ITEM item = BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").GetRowData(conf3);
                if (item == null)
                {
                   // sb.Append("<button shopinfo='' class='selectBtn choose  unchoose'></button>");
                    dish.SetValue(new AttributeItem("", "CHOOSE"), "unchoose");
                }
                else {
                   // sb.Append("<button shopinfo='' class='selectBtn choose choosen'></button>");
                    dish.SetValue(new AttributeItem("", "CHOOSE"), "choosen");
                }
                
            }
            Response.Write(getJsonStr<ITableImplement>(getTable(list)));
        }
        else if (type.Equals("addItem"))
        {
            string dishid = Request["dishid"];
            
                WEC_CY_ITEM conf = new WEC_CY_ITEM();
                conf.ADDTIME = DateTime.Now;
                conf.F_ID = userid;
                conf.D_ID = Convert.ToDecimal(dishid);
               //用户选了一个菜之后 默认数量为1
                conf.NUM = 1;
                //状态 启用
                conf.STATUS = 0;
                //订单ID 默认为0
                conf.O_ID = 0;
                conf.STORE_ID = storeId;
                BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Insert(conf, WEC_CY_ITEM.Attribute.ID);
         }
        else if (type.Equals("delItem"))
        {
            string dishid = Request["dishid"];
            WEC_CY_ITEM conf = new WEC_CY_ITEM();
            conf.F_ID = userid;
            conf.D_ID = Convert.ToDecimal(dishid);
            //删除无订单的条目
            conf.O_ID = 0;
            conf.STORE_ID = storeId;
            BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Delete(conf);
           
        }
        else if (type.Equals("getDishCount"))
        {
            V_WEC_CY_ITEM conf = new V_WEC_CY_ITEM();
            conf.F_ID = userid;
            conf.O_ID = 0;
            conf.STORE_ID = storeId;
            List<V_WEC_CY_ITEM> list = BLLTable<V_WEC_CY_ITEM>.Factory("conn_canyin").Select(new V_WEC_CY_ITEM(), conf);
            StringBuilder sb=new StringBuilder();
            decimal total=0;
            foreach(V_WEC_CY_ITEM item in list){
                decimal price=item.SPECIAL_PRICE==0?item.DISH_PRICE:item.SPECIAL_PRICE;
                total+=price*item.NUM;
            }
            JsonObjectCollection obj = new JsonObjectCollection();
            obj.Add(new JsonStringValue("num",list.Count+""));
            obj.Add(new JsonStringValue("total",total+""));
            Response.Write(obj.ToString());
        }
        else if (type.Equals("getAllMenu"))
        {
            String orderRemark = "";
            V_WEC_CY_ITEM conf = new V_WEC_CY_ITEM();
            conf.F_ID = userid;
            conf.STORE_ID = storeId;
            if (!string.IsNullOrEmpty(orderid))
            {
                //指定订单条目
                conf.O_ID = Convert.ToInt32(orderid);
                WEC_CY_ORDER conf2 = new WEC_CY_ORDER();
                conf2.ID = Convert.ToInt32(orderid);
                conf2.STORE_ID = storeId;
                WEC_CY_ORDER order = BLLTable<WEC_CY_ORDER>.Factory("conn_canyin").GetRowData(conf2);
                orderRemark = order.REMARK;
            }
            else
            {
                //无订单条目
                conf.O_ID = 0;
            }
            V_WEC_CY_ITEM val1 = new V_WEC_CY_ITEM();
            val1.TITLE = "";
            val1.REMARK = "";
            val1.NUM = 1;
            val1.ID = 1;
            val1.DISH_PRICE = 1;
            val1.SPECIAL_PRICE = 1;
            val1.ITEM_ID = 1;
            List<V_WEC_CY_ITEM> list = BLLTable<V_WEC_CY_ITEM>.Factory("conn_canyin").Select(val1, conf);
           // StringBuilder sb = new StringBuilder();
            //var TPL = '<li class="dish_item">\
            //      <span class="dishName">{name}</span>\
            //      <i>{price}元/份</i>\
            //      <span class="btn_common" onclick="slideOn(this, event);">添加备注</span>\
            //      <div><textarea name="description" onblur="changeDescription(this, event, {dishes_id});">{description}</textarea></div>\
            //      <section class="bbox" dishname="{name}" onclick="changeCount(this, event, {dishes_id});">\
            //          <input class="btn-reduce" type="button" value="-">\
            //          <input class="numBox" name="numBox" type="text" value="{selected_count}" price="{price}" readonly="readonly">\
            //          <input type="button" class="btn-plus" value="+">\
            //      </section>\
            //      </li>';
            // sb.Append("[");

          //  JsonArrayCollection arrs = new JsonArrayCollection();
            foreach (V_WEC_CY_ITEM item in list)
            {
                //JsonObjectCollection obj = new JsonObjectCollection();
                item.DISH_PRICE = item.SPECIAL_PRICE == 0 ? (item.DISH_PRICE) : (item.SPECIAL_PRICE);
                //item.Add(new AttributeItem("","countAll"), countAll1);
                //string price = item.SPECIAL_PRICE == 0 ? (item.DISH_PRICE + "") : (item.SPECIAL_PRICE + "");
                //if (list.IndexOf(item) == 0)
                //{
                //    //sb.Append("{\"name\":\"" + item.TITLE + "\",\"price\":\"" + price + "\",\"dishes_id\":\"" + item.ID + "\",\"description\":\"" + item.REMARK + "\",\"selected_count\":\"" + item.NUM + "\",\"item_id\":\"" + item.Expr1 + "\",\"order_remark\":\"" + orderRemark + "\"}");
                //}
                //else {

                //    //sb.Append(",{\"name\":\"" + item.TITLE + "\",\"price\":\"" + price + "\",\"dishes_id\":\"" + item.ID + "\",\"description\":\"" + item.REMARK + "\",\"selected_count\":\"" + item.NUM + "\",\"item_id\":\"" + item.Expr1 + "\",\"order_remark\":\"" + orderRemark + "\"}");
                //}
                //arrs.Add(obj);
                //obj.Add(new JsonStringValue("name", item.TITLE + ""));
                //obj.Add(new JsonStringValue("price", price + ""));
                //obj.Add(new JsonStringValue("dishes_id", item.ID + ""));
                //obj.Add(new JsonStringValue("description", item.REMARK + ""));
                //obj.Add(new JsonStringValue("selected_count", item.NUM + ""));
                //obj.Add(new JsonStringValue("item_id", item.Expr1 + ""));
                //obj.Add(new JsonStringValue("order_remark", orderRemark + ""));
                //arrs.Add(obj);
            }
            Response.Write(getJsonStr<ITableImplement>(getTable(list)));
            //sb.Append("]");
        }
        else if (type.Equals("orderSubmit"))
        {
            string guest_name = Request["guest_name"];
            string time_day = Request["time_day"];
            string time_hour = Request["time_hour"];
            string time_second = Request["time_second"];
            string nums = Request["nums"];
            string seat_type = Request["seat_type"];
            string remark = Request["remark"];
            string sex = Request["sex"];

            WEC_CY_ORDER order = new WEC_CY_ORDER();
            order.AID = aid;
            order.STATUS = 0;
            order.ADDTIME = DateTime.Now;
            order.CLIENT_ID = userid;
            order.SEX = Convert.ToInt32(sex);
            order.GUESTNAME = guest_name;
            //string.Format("{0:yyyy-MM-dd}", order.EATING_TIME);
            order.EATING_TIME = DateTime.Parse(time_day + " " + time_hour + ":" + time_second + ":00");
            order.EATING_TYPE = Convert.ToInt32(seat_type);
            order.EATING_NUMBER = Convert.ToInt32(nums);
            order.EATING_STATUS = 0;
            order.TEL = tel;
            order.ORDER_STATUS = 0;
            order.ORDER_TIME = DateTime.Now;
            order.REMARK = remark;
            order.STORE_ID = storeId;
            BLLTable<WEC_CY_ORDER>.Factory("conn_canyin").Insert(order, WEC_CY_ORDER.Attribute.ID);
            JsonObjectCollection obj = new JsonObjectCollection();
            obj.Add(new JsonNumericValue("success", 1));
            obj.Add(new JsonNumericValue("orderid", (int)order.ID));
            Response.Write(obj.ToString());
        }
        else if (type.Equals("updateItem"))
        {
            WEC_CY_ITEM conf = new WEC_CY_ITEM();
            string[] ids = Request["id"].Split(',');
            string[] descs = Request["desc"].Split(',');
            string[] counts = Request["count"].Split(',');
            for (int i = 0; i < ids.Length; i++)
            {
                conf.ID = Convert.ToDecimal(ids[i]);
                conf.REMARK = descs[i];
                conf.NUM = Convert.ToInt32(counts[i]);
                conf.O_ID = Convert.ToInt32(orderid);
                conf.ADDTIME = DateTime.Now;
                conf.STORE_ID = storeId;
                BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Update(conf, WEC_CY_ITEM.Attribute.ID);
            }

        }
        else if (type.Equals("getOrderList"))
        {
            string address =HttpUtility.UrlDecode(cookie.Values["currStoreAddress"]);
            string val = Request["val"];
            //  string currPage=Request["currPage"];
            //string pageSize=Request["pageSize"];
            //int currPage2=Convert.ToInt32(currPage);
            //int pageSize2=Convert.ToInt32(pageSize);
            int count = 0;
            //int countAll = 0;
            string index = Request["index"];
            int indexnum = Convert.ToInt32(index);
            WEC_CY_ORDER conf = new WEC_CY_ORDER();
            conf.OrderBy("addtime desc");
            conf.CLIENT_ID = userid;
            conf.STORE_ID = storeId;
            //未买单，未就餐
            if (val.Equals("0"))
            {
                conf.ORDER_STATUS = 0;
                conf.EATING_STATUS = 0;
            }
            //已买单，未就餐
            else if (val.Equals("1"))
            {
                conf.ORDER_STATUS = 1;
                conf.EATING_STATUS = 0;

            }
            //已买单，已就餐
            else if (val.Equals("2"))
            {
                conf.ORDER_STATUS = 1;
                conf.EATING_STATUS = 1;
            }
            //obj2.Add(new JsonStringValue("guestname", order.GUESTNAME + ""));
            //obj2.Add(new JsonStringValue("eatingnumber", order.EATING_NUMBER + ""));
            //obj2.Add(new JsonStringValue("tel", order.TEL + ""));
            //obj2.Add(new JsonStringValue("id", order.ID + ""));
            //obj2.Add(new JsonStringValue("orderstatus", order_str + ""));
            //obj2.Add(new JsonStringValue("ordertime", order.ADDTIME + ""));
            WEC_CY_ORDER val1 = new WEC_CY_ORDER();
            val1.GUESTNAME="";
            val1.EATING_NUMBER = 1;
            val1.TEL = "";
            val1.ID = 1;
            val1.ORDER_TIME = new DateTime();
            val1.ORDER_STATUS=1;
            val1.EATING_STATUS = 1;
            val1.EATING_TYPE = 1;
            val1.EATING_TIME = new DateTime();
            List<WEC_CY_ORDER> list = BLLTable<WEC_CY_ORDER>.Factory("conn_canyin").SelectByPage(val1, conf, 10, indexnum, ref count);

            BLLTable.SQL_Test.ToString();
            // countAll = BLLTable<V_WEC_CY_ORDER>.Count(conf);
            //StringBuilder sb = new StringBuilder();
            //sb.Append("[");
            JsonArrayCollection arrs = new JsonArrayCollection();
            foreach (WEC_CY_ORDER order in list)
            {
                //JsonObjectCollection obj = new JsonObjectCollection();
                //if(list.IndexOf(order)!=0){
                //    sb.Append(",");
                //}
                decimal allprice = 0;
                //sb.Append("{");
                //sb.Append("\"guestname\":\""+order.GUESTNAME+"\",");
                //sb.Append("\"eatingtime\":\"" + order.EATING_TIME + "\",");
                //sb.Append("\"address\":\"金工他家\",");
                order.SetValue(new AttributeItem("", "ADDRESS"),address);
                V_WEC_CY_ITEM conf2 = new V_WEC_CY_ITEM();
                conf2.O_ID = order.ID;
                conf2.STORE_ID = storeId;
                V_WEC_CY_ITEM val2 = new V_WEC_CY_ITEM();
                val2.NUM = 1;
                val2.TITLE = "";
                val2.DISH_PRICE = 1;
                val2.SPECIAL_PRICE = 1;
                List<V_WEC_CY_ITEM> items = BLLTable<V_WEC_CY_ITEM>.Factory("conn_canyin").Select(val2, conf2);
                // sb.Append("\"items\":[");
              //  JsonArrayCollection arr = new JsonArrayCollection("items");
                
                foreach (V_WEC_CY_ITEM item in items)
                {
                    //JsonObjectCollection obj2 = new JsonObjectCollection();
                    //if (items.IndexOf(item) != 0)
                    //{
                    //    sb.Append(",");
                    //}
                    //string eatingstatus = (order.EATING_STATUS == 0 ? "未就餐" : "已就餐");
                    //string eating_str = (order.EATING_TYPE == 0 ? "大厅" : "包厢");
                    //string order_str = order.ORDER_STATUS == 0 ? "未买单" : "已买单";
                    //  sb.Append("{\"ordertime\":\""+order.ORDER_TIME+"\",\"eatingtime\":\""+order.EATING_TIME+
                    //    "\",\"eatingtype\":\"" + eating_str + "\",\"eatingstatus\":\"" + eatingstatus + "\",\"guestname\":\"" +
                    //  order.GUESTNAME + "\",\"eatingnumber\":\"" + order.EATING_NUMBER + "\",\"tel\":\"" + order.TEL + "\",
                    //\"id\":\"" + order.ID + "\",\"orderstatus\":\"" + order_str + "\",\"ordertime\":\"" + order.ADDTIME + "\",
                    //\"count\":\"" + countAll + "\"}");
                    string ss = item.SPECIAL_PRICE == 0 ? item.DISH_PRICE + "" : item.SPECIAL_PRICE + "";
                    // sb.Append("{\"dishname\":\"" + item.TITLE + "\",\"price\":\"" + ss + "\",\"num\":\"" + item.NUM + "\"}");
                    allprice = allprice + Convert.ToDecimal(ss) * Convert.ToInt32(item.NUM);
                    //obj2.Add(new JsonStringValue("ordertime", order.ORDER_TIME + ""));
                    //obj2.Add(new JsonStringValue("eatingtype", eating_str + ""));
                    //obj2.Add(new JsonStringValue("eatingstatus", eatingstatus + ""));
                    

                    item.SetValue(new AttributeItem("", "PRICE"), ss);
                  
                }

              //  obj.Add(new JsonStringValue("allprice", allprice + ""));
                order.SetValue(new AttributeItem("", "COUNT"), count);
                order.SetValue(new AttributeItem("", "ITEMS"), getTable(items));
                order.SetValue(new AttributeItem("","ALLPRICE"),allprice);
            }





            Response.Write(getJsonStr<ITableImplement>(getTable(list)));
        }
        else if (type.Equals("clearAll"))
        {
            WEC_CY_ITEM conf = new WEC_CY_ITEM();
            conf.O_ID = 0;
            conf.F_ID = 1;
            conf.STORE_ID = storeId;
            BLLTable<WEC_CY_ITEM>.Factory("conn_canyin").Delete(conf);
        }
    }
    
}
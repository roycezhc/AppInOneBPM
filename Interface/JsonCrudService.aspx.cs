using AgileFrame.AppInOne.Common;
using AgileFrame.Common;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_JsonCrudService : BasePage
{

    ////搜索配置
    //protected ITableImplement finderObj = new ITableImplement();
    ////取值视图配置
    //protected ITableImplement valObj = new ITableImplement();
    ////条件视图配置
    //protected ITableImplement condObj = new ITableImplement();

    //Dictionary<string, object> flagMap = new Dictionary<string, object>();
    //Dictionary<string, Dictionary<string, object>> nextMap = new Dictionary<string, Dictionary<string, object>>();
    //查询结果
    List<Dictionary<string, object>> objList = new List<Dictionary<string, object>>();
    protected void Page_Load(object sender, EventArgs e)
    {
       // string action = HttpUtil.GetReqStrValue("action");

        select();


       

    }
    public void select()
    {
        string data=HttpUtil.GetReqStrValue("data");
        JavaScriptSerializer jss = new JavaScriptSerializer();

        Dictionary<string, object> dataMap=jss.Deserialize<Dictionary<string, object>>(data);
        objList= selectReverse(dataMap, new List<Dictionary<string, object>>(),null);

        Response.Write(jss.Serialize(objList));
    }
    //递归遍历
    public List<Dictionary<string, object>> selectReverse(Dictionary<string, object> map, List<Dictionary<string, object>> mapList,ITableImplement table)
    {
        string tableName = "";
          //取值视图配置
         ITableImplement valObj = new ITableImplement();
        //条件视图配置
         ITableImplement condObj = new ITableImplement();
         Dictionary<string, object> flagMap = new Dictionary<string, object>();
         Dictionary<string, Dictionary<string, object>> nextMap = new Dictionary<string, Dictionary<string, object>>();
         foreach(var item in map){
          // Dictionary<string, object> temp2List = new Dictionary<string, object>();
            if (item.Key.Equals("tableName"))
            {
                tableName = item.Value.ToString();
                valObj.setConn(conn).setModule(item.Value.ToString(), false, true);
                condObj.setConn(conn).setModule(item.Value.ToString(), false, true);
            }else if (item.Key.Equals("condition")){
                condObj.af_WhereSQL = " " + item.Value;
            } else{
                if (item.Value is string)
                {
                    valObj[item.Key] = item.Value;
                    flagMap[item.Key]= item.Value;
                }
                else {
                    flagMap[item.Key]= new object();
                   // valObj[item.Key] = temp3List;
                    nextMap.Add(item.Key, (Dictionary<string, object>)item.Value);
                }
            }
        }
        if (table != null)
        {
            //   foreach(ITableImplement table in tableList){
            //条件视图配置 (这里要每次都new 一个  因为循环 每次都要同的条件)
            ITableImplement condObj2 = new ITableImplement();
            condObj2.setConn(conn).setModule(tableName.ToString(), false, true);
            condObj2.af_WhereSQL = condObj.af_WhereSQL;
            DataBaseField[] dataBaseFields = table.af_GetAvailableDataBaseField();
            foreach (DataBaseField dataBaseField in dataBaseFields)
            {
                condObj2.af_WhereSQL = condObj2.af_WhereSQL.Replace("{" + dataBaseField.FieldName + "}", "'" + table[dataBaseField.FieldName].ToString() + "'");
            }
            condObj = condObj2;
        }
        List<ITableImplement> temp4List = BLLTable<ITableImplement>.Factory(conn).Select(valObj, condObj);
        foreach (ITableImplement itable in temp4List)
        {
            Dictionary<string, object> tempMap = new Dictionary<string, object>();
                  
            foreach (var flag in flagMap)
            {
                if (flag.Value is string)
                {
                    tempMap.Add(flag.Key, itable[flag.Key]);
                }
                else
                {
                    tempMap.Add(flag.Key, selectReverse(nextMap[flag.Key], new List<Dictionary<string, object>>(), itable));
                }
            }
            mapList.Add(tempMap);
        }     
        return mapList;
    }
}
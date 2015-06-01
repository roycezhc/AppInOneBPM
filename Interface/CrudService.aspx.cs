using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Common;
using System.Web.Script.Serialization;
public partial class Interface_CrudService : BasePage
{
    /// <summary>
    ///1、	通用接口改进：增加通用的url参数：
    ///带个人账户md5码（账户名+开户时间）对比验证（实现手机挂失时，客户端失效）、
    ///已读/未读、阅后是否删除、此链接是否需密码访问 等公共功能。
    /// </summary>
    
    private string tableName = "";
    private List<DataBaseField> fileds = null;
    private int retFlag = 0;

    //搜索配置
    protected ITableImplement finderObj = new ITableImplement();
    //取值视图配置
    protected ITableImplement valObj = new ITableImplement();
    //条件视图配置
    protected ITableImplement condObj = new ITableImplement();

    /// <summary>
    /// retFlag
    /// retFlag:0 成功返回  1:失败
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = HttpUtil.GetReqStrValue("action");
        tableName = HttpUtil.GetReqStrValue("tableName");
        valObj.setConn(conn).setModule(tableName, false, true);
        finderObj.setConn(conn).setModule(tableName, false, true);
        condObj.setConn(conn).setModule(tableName, false, true);
        try
        {
            fileds = getFieldList(valObj, true, false);
        }
        catch (Exception ex)
        {
            //报错则表名错误
            retFlag = 1;
            Response.Write("{\"response\":{\"retFlag\":1,\"message\":\"表名错误\",\"method\":\"" + action + "\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
            return;
        }

        switch (action)
        {
            case "save":
                save();
                break;
            case "delete":
                delete();
                break;
            case "select":
                select();
                break;
            case "update":
                update();
                break;
        }
    }

    public void save()
    {
        foreach (DataBaseField dataBaseField in fileds)
        {
            string field = HttpUtil.GetReqStrValue(dataBaseField.FieldName);
            if (!HttpUtil.HasReqStr(dataBaseField.FieldName))
            {
                continue;
            }
            valObj[dataBaseField.FieldName] = field;
        }
        int count = BLLTable<ITableImplement>.Factory(conn).Insert(valObj, new AttributeItem(fileds[0]));
        if (count == 0)
        {
            Response.Write("{\"response\":1,\"message\":\"保存失败\",\"method\":\"save\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
        }
        else if (count < 0)
        {
            Response.Write("{\"response\":1,\"message\":\"保存失败-存在异常\",\"method\":\"save\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
        }
        else
            Response.Write("{\"response\":{\"retFlag\":0,\"message\":\"保存成功\",\"method\":\"save\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
    }

    public void delete()
    {
        foreach (DataBaseField dataBaseField in fileds)
        {
            string field = HttpUtil.GetReqStrValue(dataBaseField.FieldName);
            if (!HttpUtil.HasReqStr(dataBaseField.FieldName))
            {
                continue;
            }
            condObj[dataBaseField.FieldName] = field;
        }
        int count = BLLTable<ITableImplement>.Factory(conn).Delete(condObj);
        if (count == 0)
        {
            Response.Write("{\"response\":1,\"message\":\"删除完成-未存在记录\",\"method\":\"delete\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
        }
        else if (count < 0)//zlg add
        {
            Response.Write("{\"response\":1,\"message\":\"删除失败-存在异常\",\"method\":\"delete\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
        }
        else
            Response.Write("{\"response\":{\"retFlag\":0,\"message\":删除成功\"\",\"method\":\"delete\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
    }

    public void select()
    {
        foreach (DataBaseField dataBaseField in fileds)
        {
            string field = HttpUtil.GetReqStrValue(dataBaseField.FieldName);
            if (!HttpUtil.HasReqStr(dataBaseField.FieldName))
            {
                continue;
            }
            condObj[dataBaseField.FieldName] = field;
        }
        if (HttpUtil.HasReqStr("field"))
        {
            string fields = HttpUtil.GetReqStrValue("field");
            string[] fieldStrs = fields.Split(',');
            foreach (string fieldStr in fieldStrs)
            {
                valObj[fieldStr] = "";
            }
        }

        List<ITableImplement> list = BLLTable<ITableImplement>.Factory(conn).Select(valObj, condObj);
        Response.Write("{\"response\":{\"retFlag\":0,\"message\":\"\",\"method\":\"select\",\"tableName\":\"" + tableName + "\"},\"data\":" + JsonUtil.getJsonStr<ITableImplement>(list) + "}");
    }

    public void update()
    {
        foreach (DataBaseField dataBaseField in fileds)
        {
            string field = HttpUtil.GetReqStrValue(dataBaseField.FieldName);
            if (!HttpUtil.HasReqStr(dataBaseField.FieldName))
            {
                continue;
            }
            condObj[dataBaseField.FieldName] = field;
        }
        //data:{AP_NAME:'213',AP_SO:'23'}
        string data = HttpUtil.GetReqStrValue("data");
        JavaScriptSerializer js = new JavaScriptSerializer();
        Dictionary<string, string> dataMap = js.Deserialize<Dictionary<string, string>>(data);
        foreach (var dataEntry in dataMap)
        {
            valObj[dataEntry.Key] = dataEntry.Value;
        }
        int count = BLLTable<ITableImplement>.Factory(conn).Update(valObj, condObj);
        if (count == 0)
        {
            Response.Write("{\"response\":{\"retFlag\":1,\"message\":更新失败\"\",\"method\":\"update\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
        }
        else if (count < 0)
        {
            Response.Write("{\"response\":{\"retFlag\":1,\"message\":更新失败-存在异常\"\",\"method\":\"update\",\"tableName\":\""+tableName+"\"},\"data\":{}}");
        }
        else
            Response.Write("{\"response\":{\"retFlag\":0,\"message\":更新成功\"\",\"method\":\"update\",\"tableName\":\"" + tableName + "\"},\"data\":{}}");
    }
}
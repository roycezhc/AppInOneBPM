using AgileFrame.Core;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Common;
using AgileFrame.AppInOne.Common;

public partial class test_Default3 : BaseAdminPage
{
    public Dictionary<string, string> tableMap = new Dictionary<string, string>();
    public string DEFAULT_TEMPLATE_START = @"<table style='width:100%;' cellpadding='2' cellspacing='0' border='1' bordercolor='#000000'><tbody>";
    public string DEFAULT_TEMPLATE_END = "</tbody></table>";
    public string PREFIX = "var.";
    protected void Page_Load(object sender, EventArgs e)
    {
        string type=HttpUtil.GetReqStrValue("type");
        switch(type){
            case "getTemplateOptionsAndField":
                getTemplateOptionsAndField();
                break;
            case "saveTemplateHtml":
                saveTemplateHtml();
                break;
            //case "recoveryDefault":
            //    recoveryDefault();
            //    break;
            case "delTemplate":
                delTemplate();
                break;
            case "addTemplate":
                addTemplate();
                break;
            case "getTemplateHtml":
                getTemplateHtml();
                break;
            case "getTemplateNameOptions":
                getTemplateNameOptions();
                break;
            case "saveTemplate":
                saveTemplate();
                break;
        }

    }

    public void saveTemplate() {
        string tableName = HttpUtil.GetReqStrValue("tableName");
        string templateName = HttpUtil.GetReqStrValue("templateName");
        //先把全部status =0 然后 status=1

        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TABLE_NAME = tableName;
        conf.TYPE = 0;
        TF_CUSTOM_TEMPLATE val = new TF_CUSTOM_TEMPLATE();
        val.STATUS = 0;
        BLLTable<TF_CUSTOM_TEMPLATE>.Update(val, conf);

        TF_CUSTOM_TEMPLATE conf2 = new TF_CUSTOM_TEMPLATE();
        conf2.TABLE_NAME = tableName;
        conf2.TEMPLATE_NAME = templateName;
        conf2.TYPE = 0;
        TF_CUSTOM_TEMPLATE val2 = new TF_CUSTOM_TEMPLATE();
        val2.STATUS = 1;
        BLLTable<TF_CUSTOM_TEMPLATE>.Update(val2, conf2);
        Response.Write("{}");

    }

    public void getTemplateHtml() { 
        string tableName = HttpUtil.GetReqStrValue("tableName");
        string templateName = HttpUtil.GetReqStrValue("templateName");
        if (templateName.Equals("默认")) {
            //默认，根据tableName取获取模板
            ITableImplement itable = new ITableImplement();
            itable.setConn(conn).setModule(tableName);
            int i = 0;
            string html = "";
            string tr = "<tr>";
            foreach(AttributeItem attr in itable.af_AttributeItemList){
                if (i % 2 == 0)
                {
                    html += tr+"</tr>";
                    tr = "<tr>";
                }
                TF_TB_FIELD conf2 = new TF_TB_FIELD();
                conf2.FIELD_NAME = attr.FieldName;
                TF_TB_FIELD val = BLLTable<TF_TB_FIELD>.GetRowData(conf2);
                if (val != null)
                {
                    tr += "<td>" + val.NOTE + "</td><td>[" + tableName + "." + attr.FieldName + "]</td>";
                }
                else
                {
                    tr += "<td>" + (string.IsNullOrEmpty(attr.ZhName) ? attr.FieldName : attr.ZhName )+ "</td><td>[" + tableName + "." + attr.FieldName + "]</td>";
                }
                i++;
            }
            Response.Write(DEFAULT_TEMPLATE_START + html + DEFAULT_TEMPLATE_END);
            return;
        }
        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TEMPLATE_NAME = templateName;
        conf.TABLE_NAME = tableName;
        conf.USER_ID = Convert.ToInt32(userBase.StaffID);
        conf.TYPE = 0;
        TF_CUSTOM_TEMPLATE valObj=BLLTable<TF_CUSTOM_TEMPLATE>.GetRowData(conf);
        if (valObj == null)
        {
            Response.Write("");
        }
        else {
            Response.Write(valObj.TEMPLATE_HTML); 
        }
    }
    private void addTemplate()
    {
        int tableId = Convert.ToInt32(HttpUtil.GetReqStrValue("tableid"));
        string tableName = HttpUtil.GetReqStrValue("tableName");
        string templateName = HttpUtil.GetReqStrValue("templateName");
        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TEMPLATE_NAME = templateName;
        conf.TABLE_NAME = tableName;
        conf.TYPE = 0;
        conf.USER_ID = Convert.ToInt32(userBase.StaffID);
        conf.TABLE_ID = tableId;
        TF_CUSTOM_TEMPLATE valObj=BLLTable<TF_CUSTOM_TEMPLATE>.GetRowData(conf);
        if (valObj == null)
        {
            int i=BLLTable<TF_CUSTOM_TEMPLATE>.Insert(conf, TF_CUSTOM_TEMPLATE.Attribute.ID);
            if (i > 0)
            {
                Response.Write("{\"msg\":\"添加成功\",\"template_id\":\"" + conf.ID+ "\"}");
            }
            else {
                Response.Write("{\"msg\":\"添加失败\",\"template_id\":\"" + 0 + "\"}");
            }
        }
        else {
            Response.Write("{\"msg\":\"该模板已经存在\",\"template_id\":\"" + -1 + "\"}");
        }
      
    }

    private void delTemplate()
    {
        string tableName = HttpUtil.GetReqStrValue("tableName");
        string templateName = HttpUtil.GetReqStrValue("templateName");
        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TEMPLATE_NAME = templateName;
        conf.TABLE_NAME = tableName;
        conf.USER_ID =Convert.ToInt32(userBase.StaffID);
        conf.TYPE = 0;
        int i=BLLTable<TF_CUSTOM_TEMPLATE>.Delete(conf);
        if (i > 0)
        {
            Response.Write("{\"msg\":\"删除成功\"}");
        }
        else {
            Response.Write("{\"msg\":\"删除失败\"}");
        }
    }

    //private void recoveryDefault()
    //{
    //    string tableName = HttpUtil.GetReqStrValue("tableName");
    //    TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
    //    conf.TABLE_NAME = tableName;
    //    conf.USER_ID = -1

    //    TF_CUSTOM_TEMPLATE val = new TF_CUSTOM_TEMPLATE();
    //    val.HASDEFAULT = 1;
    //   int i= BLLTable<TF_CUSTOM_TEMPLATE>.Update(val,conf);
    //   if (i > 0)
    //   {
    //       Response.Write("{\"msg\":\"恢复成功\"}");
    //   }
    //   else
    //   {
    //       Response.Write("{\"msg\":\"恢复失败\"}");
    //   }
    //}

    private void saveTemplateHtml()
    {
        int tableId = Convert.ToInt32(HttpUtil.GetReqStrValue("tableid"));
        string tableName = HttpUtil.GetReqStrValue("tableName");
        string templateName = HttpUtil.GetReqStrValue("templateName");
        string templateHtml = HttpUtil.GetReqStrValue("templateHtml");
        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TEMPLATE_NAME = templateName;
        conf.TABLE_NAME = tableName;
        conf.USER_ID = Convert.ToInt32(userBase.StaffID);
        conf.TYPE = 0;
        conf.TABLE_ID = tableId;
        TF_CUSTOM_TEMPLATE valObj = BLLTable<TF_CUSTOM_TEMPLATE>.GetRowData(conf);
        int i = 0;
        if (valObj == null)
        {
            conf.TEMPLATE_HTML = templateHtml;
            i = BLLTable<TF_CUSTOM_TEMPLATE>.Insert(conf, TF_CUSTOM_TEMPLATE.Attribute.ID);
            if (i > 0)
            {
                Response.Write("{\"msg\":\"保存成功\",\"template_id\":\"" + (valObj == null ? conf.ID : valObj.ID) + "\",\"type\":\"add\"}");
            }
            else
            {
                Response.Write("{\"msg\":\"保存失败\",\"type\":\"add\"}");
            }
        }
        else
        {
            TF_CUSTOM_TEMPLATE val = new TF_CUSTOM_TEMPLATE();
            val.TEMPLATE_HTML = templateHtml;
            i = BLLTable<TF_CUSTOM_TEMPLATE>.Update(val, conf);
            if (i > 0)
            {
                Response.Write("{\"msg\":\"保存成功\",\"template_id\":\"" + (valObj == null ? conf.ID : valObj.ID) + "\",\"type\":\"update\"}");
            }
            else
            {
                Response.Write("{\"msg\":\"保存失败\",\"type\":\"update\"}");
            }
        }
    }

    private void getTemplateOptionsAndField()
    {
        string tableName = HttpUtil.GetReqStrValue("tableName");
      
        TF_CUSTOM_TEMPLATE conf = new TF_CUSTOM_TEMPLATE();
        conf.TABLE_NAME = tableName;
        conf.USER_ID = Convert.ToInt32(userBase.StaffID);
        conf.TYPE = 0;
        List<TF_CUSTOM_TEMPLATE> templateList = BLLTable<TF_CUSTOM_TEMPLATE>.Select(new TF_CUSTOM_TEMPLATE(), conf);
        string html = "<option value='-1'>--无--</option>";
        if (tableName.Equals("-1"))
        {
            Response.Write("{\"html\":\"" + html + "\"}");
            return;
        }
        foreach(TF_CUSTOM_TEMPLATE template in templateList){
            html += "<option value='"+template.ID+"'>"+template.TEMPLATE_NAME+"</option>";
        }
        ITableImplement itable = new ITableImplement();
        itable.setConn(conn).setModule(tableName);
        DataBaseField[] dataBaseFields = itable.af_GetAvailableDataBaseField();
        string fieldHtml = "<ul>";
        foreach (DataBaseField dataBaseField in dataBaseFields)
        {
            TF_TB_FIELD conf2 = new TF_TB_FIELD();
            conf2.FIELD_NAME = dataBaseField.FieldName;
            TF_TB_FIELD val2 = BLLTable<TF_TB_FIELD>.GetRowData(conf2);
            if (val2 != null)
            {
                fieldHtml += "<li><div  fieldname='" + dataBaseField.FieldName + "'>" + (string.IsNullOrEmpty(val2.NOTE)? dataBaseField.FieldName : val2.NOTE) + "</div></li>";

            }
            else {
                fieldHtml += "<li><div fieldname='" + dataBaseField.FieldName + "'>" +  dataBaseField.FieldName + "</div></li>";
            }
        }
        fieldHtml += "</ul>";
        Response.Write("{\"html\":\"" + html + "\",\"fieldHtml\":\"" + fieldHtml + "\"}");
    }

    private void getTemplateNameOptions()
    {
        V_TF_TEMPLATE_TABLENAME conf = new V_TF_TEMPLATE_TABLENAME();
        conf.Distinct= true;
        conf.USER_ID =Convert.ToInt32(userBase.StaffID);
        List<V_TF_TEMPLATE_TABLENAME> templateList = BLLTable<V_TF_TEMPLATE_TABLENAME>.Select(new V_TF_TEMPLATE_TABLENAME(), conf);
       string html = "<option value='-1'>--无--</option>";
       foreach (V_TF_TEMPLATE_TABLENAME temp in templateList)
       {
            ITableImplement itable = new ITableImplement();
            itable.setConn(conn).setModule(temp.TABLE_NAME);
            html += "<option value='" + temp.TABLE_NAME + "'>" + temp.CH_NAME + "</option>";
        }
        Response.Write("{\"html\":\"" + html + "\"}");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Common;

/// <summary>
/// XmlUtil 的摘要说明
/// </summary>
public class XmlUtil
{
	public XmlUtil()
	{
		
	}

    public static string getXmlByTable(ITableImplement table) {
        DataBaseField[] dataBaseFields=table.af_GetAvailableDataBaseField();
        string tableXml = "<" +table.TableName()+ ">";
        foreach (DataBaseField dataBaseField in dataBaseFields)
        {
            tableXml += "<" + dataBaseField.FieldName + ">";
            tableXml += dataBaseField.Value;
            tableXml += "</" + dataBaseField.FieldName + ">";
        }
        tableXml += "</" + table.TableName() + ">";
        return tableXml;
    }

    public static string getXmlByTableList<MyTable>(List<MyTable> tableList,string tablename)where MyTable : ITableImplement, new()
    {
        if (tableList.Count > 0)
        {
            string tableListXml = "<" + tableList[0].TableName() + "s>";
            string tableXml = "";
            foreach (ITableImplement table in tableList)
            {
                DataBaseField[] dataBaseFields = tableList[0].af_GetAvailableDataBaseField();
                tableXml += "<" + tableList[0].TableName() + ">";
                foreach (DataBaseField dataBaseField in dataBaseFields)
                {
                    tableXml += "<" + dataBaseField.FieldName + ">";
                    tableXml += table[dataBaseField.FieldName];
                    tableXml += "</" + dataBaseField.FieldName + ">";
                }
                tableXml+= "</" + tableList[0].TableName() + ">";
            }
            tableListXml += tableXml;
            tableListXml += "</" + tableList[0].TableName() + "s>";
            return tableListXml;
        }
        else
        {
            return "<"+tablename+"s><"+tablename+"s/>";
        }
    }
}
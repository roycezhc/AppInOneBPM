using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AgileFrame.Orm.PersistenceLayer.Model;

public partial class CRM_CustomerDetailsWUControl : AgileFrame.AppInOne.Common.BaseUserControl
{
    private string thisName = "";

    /// <summary>
    /// 详细信息类别名
    /// </summary>
    public string ThisName
    {
        get { return thisName; }
        set { thisName = value; }
    }

    /// <summary>
    /// 详细信息表
    /// </summary>
    public DataTable DetailsTable = new DataTable();

    /// <summary>
    /// 详细信息列表
    /// </summary>
    public List<ITableImplement> DetailsITableImplement = new List<ITableImplement>();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    #region 绑定表格
    /// <summary>
    /// 绑定表格
    /// </summary>
    /// <param name="detailsTable">详细信息表</param>
    public virtual void DataBind(DataTable detailsTable)
    {
        if (detailsTable == null)
            return;
        DetailsTable = detailsTable;
        List<int> valueWidthList = new List<int>();
        DetailsTable = DetailsTable == null ? new DataTable() : DetailsTable;
        string table = "<table class=\"datatable\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"> \r\n";

        string tableBody = "<tbody> \r\n";
        int index = 0;
        int rowCount = 0;
        foreach (DataRow dr in DetailsTable.Rows)
        {
            if (dr == null || dr.ItemArray == null)
                continue;
            string trstyle = "";
            if (rowCount == 11)
            {
                tableBody += "<p>";
            }
            if (rowCount >= 11)
            {
                trstyle = "style=\"display:none\"";
            }
            tableBody += "    <tr " + trstyle + "> \r\n";
            for (int i = 0; i < dr.ItemArray.Length; i++)
            {
                string datavalue = "";
                if (dr.ItemArray[i] != null)
                    datavalue = dr.ItemArray[i].ToString();
                if (valueWidthList.Count < i + 1)
                    valueWidthList.Add(0);
                valueWidthList[i] = valueWidthList[i] < datavalue.Length ? datavalue.Length : valueWidthList[i];
                tableBody += "        <td>" + datavalue + "</td> \r\n";
            }
            index = 0;
            tableBody += "    </tr> \r\n";
        }
        if (rowCount >= 11)
            tableBody += "</p>";
        tableBody += "</tbody> \r\n";

        string tableHead = "<thead> \r\n";
        tableHead += "    <tr> \r\n";
        index = 0;
        int sum = 0;
        foreach (DataColumn dc in DetailsTable.Columns)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            //valueWidthList[index] = valueWidthList[index] < dc.ColumnName.Length ? dc.ColumnName.Length : valueWidthList[index];
            sum += valueWidthList[index];
            index++;
        }
        index = 0;
        int _sum = 100;
        foreach (DataColumn dc in DetailsTable.Columns)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            double wid = ((double)valueWidthList[index] * 100.00) / ((double)sum);
            if (valueWidthList.Count == index + 1)
                wid = _sum;
            else
                _sum = _sum - ((int)wid);
            tableHead += "        <td style=\"width:" + ((int)wid) + "%\">" + dc.ColumnName + "</td> \r\n";
            index++;
        }
        tableHead += "    </tr> \r\n";
        tableHead += "</thead> \r\n";

        table += tableHead + tableBody;
        table += "</table> \r\n";
        LiteralDataShow.Text = table;
    }

    public void DataBindTable(DataTable detailsTable, Dictionary<string, List<string>> DropDownListValue, List<string> keyColumes)
    {
        if (detailsTable == null)
            return;
        DetailsTable = detailsTable;
        List<int> valueWidthList = new List<int>();
        DetailsTable = DetailsTable == null ? new DataTable() : DetailsTable;
        string table = "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" id=\"tab_" + thisName + "\"> \r\n";

        string tableBody = "";
        int index = 0;
        int rowCount = 0;
        foreach (DataRow dr in DetailsTable.Rows)
        {
            if (dr == null || dr.ItemArray == null)
                continue;
            string trstyle = "";
            if (rowCount == 11)
            {
                tableBody += "<p>";
            }
            if (rowCount >= 11)
            {
                trstyle = "style=\"display:none\"";
            }
            tableBody += "    <tr " + trstyle + "> \r\n";
            for (int i = 0; i < dr.ItemArray.Length; i++)
            {
                string datavalue = "";
                if (dr.ItemArray[i] != null)
                    datavalue = dr.ItemArray[i].ToString();
                if (valueWidthList.Count < i + 1)
                    valueWidthList.Add(0);
                valueWidthList[i] = valueWidthList[i] < datavalue.Length ? datavalue.Length : valueWidthList[i];
                string val = "";
                if(dr.Table.Columns[i].DataType == typeof(bool))
                    val = " value=\"" + datavalue + "\"";
                else if (DropDownListValue != null && DropDownListValue.ContainsKey(dr.Table.Columns[i].ColumnName))
                {
                    val = " value=\"" + datavalue + "\"";
                }
                tableBody += "        <td " + val + ">" + datavalue + "</td> \r\n";
            }
            index = 0;
            tableBody += "    </tr> \r\n";
        }
        if (rowCount >= 11)
            tableBody += "</p>";

        string tableHead = "";
        tableHead += "    <tr> \r\n";
        tableHead += "        <td width=\"32\" align=\"center\" name=\"Num\"><input type=\"checkbox\" name=\"checkbox_" + this.thisName + "\" value=\"checkbox\" onclick=\"checkAll(this)\" /></td>";
        index = 0;
        int sum = 0;
        foreach (DataColumn dc in DetailsTable.Columns)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            //valueWidthList[index] = valueWidthList[index] < dc.ColumnName.Length ? dc.ColumnName.Length : valueWidthList[index];
            sum += valueWidthList[index];
            index++;
        }
        index = 0;
        int _sum = 100;
        foreach (DataColumn dc in DetailsTable.Columns)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            double wid = ((double)valueWidthList[index] * 100.00) / ((double)sum);
            if (valueWidthList.Count == index + 1)
                wid = _sum;
            else
                _sum = _sum - ((int)wid);
            //string valFormat = "";
            string datatype = " edittype=\"TextBox\"";
            if (dc.DataType == typeof(bool))
                datatype = " edittype=\"checkbox\"";
            else if (DropDownListValue != null && DropDownListValue.ContainsKey(dc.ColumnName))
            {
                datatype = " edittype=\"DropDownList\"";
                datatype += " dataitems=\"";
                foreach (string val in DropDownListValue[dc.ColumnName])
                {
                    datatype += "{text:'" + val + "',value:'" + val + "'},";
                }
                datatype.TrimEnd(',');
            }
            else if (keyColumes != null && keyColumes.Contains(dc.ColumnName))
                datatype = "";
            tableHead += "        <td style=\"width:" + ((int)wid) + "%\" name=\"" + dc.ColumnName + "\" " + datatype + ">" + dc.ColumnName + "</td> \r\n";
            index++;
        }
        tableHead += "    </tr> \r\n";

        table += tableHead + tableBody;
        table += "</table> \r\n";
        LiteralDataShow.Text = table;
    }

    /// <summary>
    /// 绑定表格
    /// </summary>
    /// <param name="detailsTable">详细信息列表</param>
    public virtual void DataBind(List<ITableImplement> detailsITableImplement)
    {
        if (detailsITableImplement == null || detailsITableImplement.Count < 1)
            return;
        DetailsITableImplement = detailsITableImplement;
        List<int> valueWidthList = new List<int>();
        DetailsTable = DetailsTable == null ? new DataTable() : DetailsTable;
        string table = "<table class=\"datatable\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> \r\n";

        string tableBody = "<tbody> \r\n";
        int index = 0;
        int rowCount = 0;
        foreach (ITableImplement it in DetailsITableImplement)
        {
            if (it == null || it.af_AttributeItemList == null)
                continue;
            rowCount++;
            string trstyle = "";
            if (rowCount == 11)
            {
                tableBody += "<p>";
            }
            if (rowCount >= 11)
            {
                trstyle = "style=\"display:none\"";
            }
            tableBody += "    <tr " + trstyle + "> \r\n";
            foreach (AttributeItem at in it.af_AttributeItemList)
            {
                string datavalue = "";
                object val = it.GetValue(at);
                if (val != null)
                    datavalue = val.ToString();
                if (valueWidthList.Count < index + 1)
                    valueWidthList.Add(0);
                valueWidthList[index] = valueWidthList[index] < datavalue.Length ? datavalue.Length : valueWidthList[index];
                tableBody += "        <td>" + datavalue + "</td> \r\n";
                index++;
            }
            index = 0;
            tableBody += "    </tr> \r\n";
        }
        if (rowCount >= 11)
            tableBody += "</p>";
        tableBody += "</table>";
        tableBody += "</tbody> \r\n";

        string tableHead = "<thead> \r\n";
        tableHead += "    <tr> \r\n";
        index = 0;
        int sum = 0;
        foreach (AttributeItem at in DetailsITableImplement[0].af_AttributeItemList)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            //valueWidthList[index] = valueWidthList[index] < dc.ColumnName.Length ? dc.ColumnName.Length : valueWidthList[index];
            sum += valueWidthList[index];
            index++;
        }
        index = 0;
        int _sum = 100;
        foreach (AttributeItem at in DetailsITableImplement[0].af_AttributeItemList)
        {
            if (valueWidthList.Count < index + 1)
                continue;
            double wid = ((double)valueWidthList[index] * 100.00) / ((double)sum);
            if (valueWidthList.Count == index + 1)
                wid = _sum;
            else
                _sum = _sum - ((int)wid);
            tableHead += "        <td style=\"width:" + ((int)wid) + "%\">" + at._ZhName + "</td> \r\n";
            index++;
        }
        tableHead += "    </tr> \r\n";
        tableHead += "</thead> \r\n";

        table += tableHead + tableBody;
        table += "</table> \r\n";
        LiteralDataShow.Text = table;

        if (rowCount >= 11)
            LiteralDataShow.Text += "<span class =\"showall\" onclick=\"showAllRows(this)\">显示全部列表</span>";
    } 
    #endregion

    /// <summary>
    /// 向工具栏添加按钮
    /// </summary>
    /// <param name="text"></param>
    /// <param name="url"></param>
    public void AddLinkAtTool(string text, string url)
    {
        if (string.IsNullOrEmpty(text) || string.IsNullOrEmpty(url))
            return;
        LiteralDataShow.Text += "\r\n";
    }
}
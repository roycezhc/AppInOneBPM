using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Windows.Forms;
using AgileFrame.Core.WebSystem;
using System.Collections.Specialized;
using AgileFrame.AppInOne.Common;

public partial class TEMPLATE_CRM_WJ_Control_panel_admin : BasePage_wj
{
    public string strTemp = "";
    protected StringBuilder jsonBuilder = new StringBuilder();
    protected StringBuilder jsonBuilder1 = new StringBuilder();
    protected string html客户;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Get("action").Length > 0)
            {
                if ("SettingsAjax" == Get("action"))//下拉框选项
                {

                    string[] dic1 = Request.Params.AllKeys;
                    List<string> listArr = new List<string>();
                    NameValueCollection dic2 = Request.Params;
                    foreach (string key1 in dic2)
                    {
                        if (key1.StartsWith("_user"))
                            break;
                        listArr.Add(dic2[key1]);
                        Request.Url.ToString();

                    }

                    string url = @"Ctrl\" + dic2["action"] + ".aspx?";
                    for (int i = 0; i < listArr.Count; i++)
                    {

                        url += dic1[i] + "=" + listArr[i] + "&";

                    }
                    url = url.Remove(url.Length - 1);
                    Server.Transfer(url, true);//+url地址  
                }
                else
                {
                    GetData();
                    if (url1.Length< 6)//非跳转
                    {
                    }
                    else
                    {

                        string url = url1[3] + ".aspx?";
                        for (int i = 4; i < url1.Length; i++)
                        {
                            url += url1[i] + "=" + url1[i + 1] + "&";
                            i++;
                        }
                        url = url.Remove(url.Length - 1);
                        Server.Transfer(url, true);//+url地址  
                        //Response.Redirect(url, true);


                    }
                }
            }
        }
        catch (Exception ex)
        {
        }
    
    }
    private void GetData1()//获取传过来的变量
    {
        try
        {
            string url = Page.Request.Url.AbsolutePath;
            if (url.Contains('?'))
            {
                url1 = url.Split(new char[1] { '?' });
                url1 = url1[1].Split(new char[2] { '=', '&' });
            }
            else
            {
                url1 = url.Split(new char[2] { '=', '&' });
            }
        }
        catch (Exception ex)
        {
            //throw(ex.Message());
            url1 = null;
        }
    }
    
    public string DataTableToJson(string jsonName, DataTable dt)
    {
        return "";
        //jsonBuilder.Append("<table width=\"100%\" class=\"listTable\" cellpadding=\"5\" cellspacing=\"0\"><tbody>");
        //foreach (DataColumn dc in dt.Columns)
        //{
        //    jsonBuilder.Append("<tr><td class=\"detail-content-heading\" align=\"left\">");
        //    // Response.Write(string.Format("列名：{0} ,数据类型：{1}", dc.ColumnName, dc.DataType));
        //    jsonBuilder.Append(dc.ColumnName);
        //    jsonBuilder.Append("</td><tr><td class=\"detail-content-heading\" align=\"left\"><td class=\"detail-content-heading\">&nbsp;<button class=\"pure-button pure-button-success\" title=\"编辑\" onclick=\"fetchEditPickList('Products','usageunit', 15);return false;\"><i class=\"icon-fixed-width icon-pencil\"></i> 编辑 </button> </td><td class=\"detail-content-heading small\" colspan=\"2\">&nbsp;</td> <td class=\"detail-content-heading small\" colspan=\"2\">&nbsp;</td></tr>");
        //    jsonBuilder1.Append("<tr> <td colspan=\"2\" valign=\"top\" align=\"left\"> <ul style=\"list-style-type: none;\">");
        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        jsonBuilder1.Append("<li>");
        //        jsonBuilder1.Append(dt.Rows[i][dc.ColumnName]);
        //        jsonBuilder1.Append("</li>");
        //    }
        //    jsonBuilder1.Append("</ul></td> <td colspan=\"2\">&nbsp;</td><td colspan=\"2\">&nbsp;</td> </tr>");
        //}
        //jsonBuilder1.Append("/tbody></table>");
        //return jsonBuilder.ToString() + jsonBuilder1.ToString();
        //StringBuilder jsonBuilder = new StringBuilder();
        //jsonBuilder.Append("[");
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    jsonBuilder.Append("{");
        //    for (int j = 0; j < dt.Columns.Count; j++)
        //    {
        //        jsonBuilder.Append("\"");
        //        jsonBuilder.Append(dt.Columns[j].ColumnName);
        //        jsonBuilder.Append("\":\"");
        //        jsonBuilder.Append(dt.Rows[i][j].ToString());
        //        jsonBuilder.Append("\",");
        //    }
        //    jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
        //    jsonBuilder.Append("},");
        //}
        //jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
        //jsonBuilder.Append("]");
        //return jsonBuilder.ToString();
    }
}
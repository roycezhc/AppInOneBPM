using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///UrlHelper_wj 的摘要说明
/// </summary>
public class BasePage_wj: System.Web.UI.Page
{
    public BasePage_wj()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    protected string[] url1;
    protected string conn;
   // protected List<string> url1 = new List<string>();
    protected void GetData()//获取传过来的变量
    {
        try
        {
            string url = Page.Request.RawUrl;
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
            
        }
    }

    protected string Get(string requestName)
    {
        if (!string.IsNullOrEmpty(Request[requestName]))
        {
            return Convert.ToString(Request[requestName]);
        }
        return "";
    }
}
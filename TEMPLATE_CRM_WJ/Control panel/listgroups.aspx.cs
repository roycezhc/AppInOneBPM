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

public partial class TEMPLATE_CRM_WJ_Control_panel_admin : System.Web.UI.Page
{
    private string Get(string requestName)
    {
        if (!string.IsNullOrEmpty(Request[requestName]))
        {
            return Convert.ToString(Request[requestName]);
        }
        return "";
    }
    protected string action1;
    protected string module1;
    protected string directmode1;
    protected string file1;
    protected string fld_module1;
    protected string parenttab1;


    public string strTemp = "";
    protected StringBuilder jsonBuilder = new StringBuilder();
    protected StringBuilder jsonBuilder1 = new StringBuilder();
    protected string html客户;
    protected void Page_Load(object sender, EventArgs e)
    {
        action1 = Get("action");//页面
        module1 = Get("module");//模块
        directmode1 = Get("directmode");
        file1 = Get("file");
        fld_module1 = Get("fld_module");     
        if(action1.Equals("SettingsAjax") && directmode1.Equals("ajax") && file1.Equals("PickList"))
        {
            uf_Init();
        }

        if (action1.Equals("CustomTabList"))
        {
            strTemp = @"123456";
            
        }


    
    }
    protected void uf_Init()
    {
    }
    public string DataTableToJson(string jsonName, DataTable dt)
    {
        return "";
    }
}
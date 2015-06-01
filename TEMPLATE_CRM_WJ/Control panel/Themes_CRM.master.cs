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

public partial class Themes_CRM : System.Web.UI.MasterPage
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
    }
   
    

}

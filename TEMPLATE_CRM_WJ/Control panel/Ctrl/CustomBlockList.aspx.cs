using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class TEMPLATE_CRM_WJ_Control_panel_Ctrl_CustomBlockList : System.Web.UI.Page
{
    protected List<Ec_blocks> list;
    protected string conn = System.Configuration.ConfigurationSettings.AppSettings["conn1"];
    //protected int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string aa = Request["parenttab"];
        Ec_blocks val = new Ec_blocks();
        val.Tabid = Convert.ToInt32(Request["fld_module"]);
        val.OrderBy(Ec_blocks.Attribute.Sequence);
        list = BLLTable<Ec_blocks>.Factory(conn).Select(new Ec_blocks(), val);
     
    }
    protected void choose()
    {
         
    }
}
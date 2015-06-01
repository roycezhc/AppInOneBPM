using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class TEMPLATE_CRM_WJ_Control_panel_Ctrl_CustomModuleList : System.Web.UI.Page
{
    protected string prodview;
    protected List<V_ec_parenttabrel_ec_tab_ec_parenttab> list;
    protected List<V_ec_modules_ec_parenttab> list1;
    protected string conn = System.Configuration.ConfigurationSettings.AppSettings["conncr"];
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            prodview = Request["prodview"];
            list = BLLTable<V_ec_parenttabrel_ec_tab_ec_parenttab>.Factory(conn).Select();
            list1 = BLLTable<V_ec_modules_ec_parenttab>.Factory(conn).Select();
        }
        catch (Exception ex)
        { 
            throw(ex);
        }
    }
}
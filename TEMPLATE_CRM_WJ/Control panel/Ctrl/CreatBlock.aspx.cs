using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class TEMPLATE_CRM_WJ_Control_panel_Ctrl_CreatBlock : BasePage_wj
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection dic2 = Request.Form;

        V_ec_field_ec_tab cond = new V_ec_field_ec_tab();
        cond.OrderBy(V_ec_field_ec_tab.Attribute.Tabid);
        List<V_ec_field_ec_tab> list = BLLTable<V_ec_field_ec_tab>.Factory(conn).Select(new V_ec_field_ec_tab(), cond);
        //IEnumerator myEnumerator = myCol.GetEnumerator();
        //Console.WriteLine("   KEY        VALUE");
        //foreach (String s in myCol.AllKeys)
        //    Console.WriteLine("   {0,-10} {1}", s, myCol[s]);
        //Console.WriteLine();   


    }
}
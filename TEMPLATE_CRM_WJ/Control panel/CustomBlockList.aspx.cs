using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Text;

public partial class TEMPLATE_CRM_WJ_Controlpanel_CustomBlockList : System.Web.UI.Page
{
    protected string preUrl;
    protected StringBuilder selected=new StringBuilder();
    protected string conn = System.Configuration.ConfigurationSettings.AppSettings["conn1"];
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            GetData();
        }
        catch (Exception ex)
        {
            throw(ex);
        }
    }
    protected void GetData()
    {
        preUrl = WebHelper.GetAppPath();
        string id = Common.GetReqStrValue("id");
        preUrl = WebHelper.GetAppPath();
        V_ec_field_ec_tab cond = new V_ec_field_ec_tab();
        cond.OrderBy(V_ec_field_ec_tab.Attribute.Tabid);
        List<V_ec_field_ec_tab> list = BLLTable<V_ec_field_ec_tab>.Factory(conn).Select(new V_ec_field_ec_tab(), cond);
        if (list.Count != 0)
        {
            for (int i = 0; i < list.Count; i++)
            { 
                if(i==0)
                {
                    selected.Append(string.Format("<option value=\"{0}\" selected=\"\">{1}</option>",list[i].Tabid ,list[i].NAME));
                }
                else
                {
                    selected.Append(string.Format("<option value=\"{0}\">{1}</option>", list[i].Tabid, list[i].NAME));
                }
            }
        }
    }
}
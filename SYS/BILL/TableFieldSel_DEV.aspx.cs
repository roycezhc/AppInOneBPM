using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Common;
using AgileFrame.Orm.PersistenceLayer;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class SYS_BILL_TableFieldSel_DEV : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            if (Request["DEV"] != null)
            {
                body1.Visible = false;
                string conStr = BillBase.GetConnByDevKey(Request["DEV"]);                
                DataBase db = new DataBase(DataBaseConnectStringHelper.GetDataBaseType(conStr,""), conStr);
                string tbname = Request["TB"];
                if (db.DataTables.Contains(tbname))
                {
                    DataBaseTable tb = db.DataTables[tbname];
                    DataBaseFieldCollection fc = tb.DataFields;
                    if (fc != null)
                    {
                        repCus.DataSource = fc;
                        repCus.DataBind();
                    }
                }
            }
            else { 
            
            }
        }
    }

}
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
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
public partial class SYS_BILL_TableSel_DEV : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtDEV.Items.AddRange(FormHelper.GetListItem(SYS_DATASOURCE.Attribute.SourceName, SYS_DATASOURCE.Attribute.SourceName, SYS_DATASOURCE.Attribute.SourceName));

            if (txtDEV.Items.Count > 0)
                txtDEV.SelectedIndex = 1;

            if (Request["DEV"] != null)
            {
                txtDEV.SelectedValue = Request["DEV"];
            }
            Init1(txtDEV.SelectedValue);
        }
    }
    private void Init1(string dev1)
    {
        string connectStr = BillBase.GetConnByDevKey(dev1);
        Title = Convert.ToString(dev1) + "数据源" + "管理" + connectStr;
        
        DataBase db = new DataBase(DataBaseConnectStringHelper.GetDataBaseType(connectStr,""), connectStr);
        DataBaseTableCollection tbs = db.DataTables;
        if (tbs != null)
        {
            repCus.DataSource = tbs;
            repCus.DataBind();
        }
        if (txtDEV.Items.Count > 0)
        {
            txtDEV.SelectedValue = dev1;
        }
    }
    protected void txtDEV_SelectedIndexChanged(object sender, EventArgs e)
    {
        Init1(txtDEV.SelectedValue);
    }
}
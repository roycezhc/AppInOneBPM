using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using DevExpress.Web.ASPxGridView;
using DevExpress.Data;
using DevExpress.XtraGrid;

public partial class Wage_XwclSP : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["detailtable"] != null)
        {
            DataTable table = ViewState["detailtable"] as DataTable;
            this.gridRGZ.DataSource = table;
            gridRGZ.DataBind();  //执行绑定
        }
    }
    protected void btnWSP_Click(object sender, EventArgs e)
    {
        BinData(0);
    }
    protected void btnYSP_Click(object sender, EventArgs e)
    {
        BinData(1);
    }
    private void BinData(int spzt)
    {
        string where = "SELECT MX.*,GX.MESGXMC GXMC,CP.SAPRemark,KH.KHMC  ";
        where = string.Format(" {0} FROM GZ_XWZYMX MX ", where);
        where = string.Format(" {0} JOIN GZ_GXDZB GX ON MX.GXID=GX.MESGXID ", where);
        where = string.Format(" {0} JOIN JC_CPXX CP ON MX.CPID=CP.CPID ", where);
        where = string.Format(" {0} JOIN JC_KHXX KH ON MX.KHID=KH.KHID WHERE 1=1", where);
        where = string.Format(" {0} and  SPZT = {1} ", where, spzt);
        GZ_XWZYMX valRgzmx = new GZ_XWZYMX();
        GZ_XWZYMX condRgzmx = new GZ_XWZYMX();
        conn = "connMES";
        DataTable dtbRGZ = BLLTable<GZ_XWZYMX>.Factory(conn).qDataTable(where);
        this.gridRGZ.DataSource = dtbRGZ;
        gridRGZ.DataBind();  //执行绑定
        ViewState["detailtable"] = dtbRGZ;//dtbRGZMX;
    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
    }
    //改变当前处理列的颜色    
    protected void gridRGZ_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
    {
        if (e.DataColumn.FieldName == "CQBZCL" )
        {
            e.Cell.ForeColor = System.Drawing.Color.Red;
        }
       
        if (e.DataColumn.FieldName == "SPZT")
        {

            int intspzt = int.Parse(e.GetValue("SPZT").ToString());
            switch (intspzt)
            {
                case 0:
                    e.Cell.Text = "未审批";
                    break;
                case 1:
                    e.Cell.Text = "已审批";
                    break;
            }
        }
    }
}
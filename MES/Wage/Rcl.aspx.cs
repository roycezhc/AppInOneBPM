using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Reflection;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using DevExpress.Web.ASPxGridView;
using DevExpress.Data;
using DevExpress.XtraGrid;

public partial class QC_defect_rate :  BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ygid = Request["YGID"];
        if (!IsPostBack)
        {
            dateedtSCRQ1.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
            dateedtSCRQ2.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
        }

        if (ViewState["detailtable"] != null)
        {
            DataTable table = ViewState["detailtable"] as DataTable;
            this.gridRGZ.DataSource = table;
            gridRGZ.DataBind();  //执行绑定
        }

    }

    private void BinData()
    {   
       // DateTime dateEnd=(DateTime)dateedtSCRQ2.Value;
        DataTable dtbRCL = new DataTable();
        string where=string.Empty;
        string m_scrq1 = Convert.ToDateTime(dateedtSCRQ1.Text.Trim()).ToString("yyyy-MM-dd");
        string m_scrq2 = Convert.ToDateTime(dateedtSCRQ2.Text.Trim()).ToString("yyyy-MM-dd");//dateEnd.AddDays(+1).ToString("yyy-MM-dd");
        string m_gxid = cbGX.Value.ToString().Trim();
        string m_xxlx = cbXXLX.Text.ToString().Trim();
        //    string m_yg = txtYG.Text.ToString().Trim();
        
     
        if (!string.IsNullOrEmpty(m_scrq1) && !string.IsNullOrEmpty(m_scrq2))
        {
            where = string.Format(" {0} and czrq >= '{1}' AND czrq <= '{2}'", where, m_scrq1, m_scrq2);
        }
   
        if (!string.IsNullOrEmpty(m_xxlx) && m_xxlx != "全部")
        {
            if (m_xxlx == "其它")
            {
                where = string.Format(" {0} and ( XXLX = '{1}' OR XXLX = NULL)", where, "");
            }
            else if (m_xxlx == "三相")
            {
                where = string.Format(" {0} and substring(XXLX,1,2) = '{1}'", where, m_xxlx);
            }
            else
            {
                where = string.Format(" {0} and XXLX = '{1}'", where, m_xxlx);
            }
        }


        if (!string.IsNullOrEmpty(m_gxid))
        {
            if (m_gxid == "102611")
            {
                where = string.Format(" SELECT * FROM V_GZ_BZDYTJ WHERE 1=1 {0}", where); 
              
                V_GZ_BZDYTJ valBz = new V_GZ_BZDYTJ();
                V_GZ_BZDYTJ condBz = new V_GZ_BZDYTJ();
                conn = "connMES";
                dtbRCL = BLLTable<V_GZ_BZDYTJ>.Factory(conn).qDataTable(where);
            }
            if (m_gxid == "102511")
            {

                where = string.Format(" SELECT * FROM V_GZ_CPJTJ WHERE 1=1 {0}", where);

                V_GZ_CPJTJ valBz = new V_GZ_CPJTJ();
                V_GZ_CPJTJ condBz = new V_GZ_CPJTJ();
                conn = "connMES";
                dtbRCL = BLLTable<V_GZ_CPJTJ>.Factory(conn).qDataTable(where);
            }
            if (m_gxid == "102311")
            {

                where = string.Format(" SELECT * FROM V_GZ_JBTJ WHERE 1=1 {0}", where);

                V_GZ_JBTJ valBz = new V_GZ_JBTJ();
                V_GZ_JBTJ condBz = new V_GZ_JBTJ();
                conn = "connMES";
                dtbRCL = BLLTable<V_GZ_JBTJ>.Factory(conn).qDataTable(where);
            }
        }

        this.gridRGZ.DataSource = dtbRCL;
        gridRGZ.DataBind();  //执行绑定
        ViewState["detailtable"] = dtbRCL;//dtbRGZMX;


    }


    protected void gridRGZ_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        DataTable table = ViewState["detailtable"] as DataTable;
        this.gridRGZ.DataSource = table;
        gridRGZ.DataBind();  //执行绑定

    }
    protected void gridRGZ_PageIndexChanged(object sender, EventArgs e)
    {
        DataTable table = ViewState["detailtable"] as DataTable;
        this.gridRGZ.DataSource = table;
        gridRGZ.DataBind();  //执行绑定
    }
    protected void btnXlsExport_Click(object sender, EventArgs e)
    {
        gridExport.WriteXlsToResponse();
    }
    protected void btnSerch_Click(object sender, EventArgs e)
    {
        //if (dateedtSCRQ.DateTime >= DateTime.Now)
        //{
        //    MessageBox.Show("提示：该日期的报表还未生成！", "注意", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //    return;
        //}
        BinData();
    }


    //改变当前处理列的颜色    
    protected void gridRGZ_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
    {
    //    if (e.DataColumn.FieldName == "JE" || e.DataColumn.FieldName == "DJ")
    //    {
    //        e.Cell.ForeColor = System.Drawing.Color.Red;
    //    }
    //    string jjyxz = e.GetValue("JJYXZ").ToString();

    //    for (int n = 0; n < gridRGZ.Columns.Count; n++)
    //    {

    //        if (e.DataColumn.FieldName == jjyxz)
    //        {
    //            e.Cell.ForeColor = System.Drawing.Color.Blue;
    //        }

    //    }
    //    if (e.DataColumn.FieldName == "SJLY")
    //    {

    //        int intsjly = int.Parse(e.GetValue("SJLY").ToString());
    //        switch (intsjly)
    //        {
    //            case 0:
    //                e.Cell.Text = "系统";
    //                break;
    //            case 1:
    //                e.Cell.Text = "导入";
    //                break;
    //        }
    //    }
    //    if (e.DataColumn.FieldName == "SPZT")
    //    {

    //        int intspzt = int.Parse(e.GetValue("SPZT").ToString());
    //        switch (intspzt)
    //        {
    //            case 0:
    //                e.Cell.Text = "未审批";
    //                break;
    //            case 1:
    //                e.Cell.Text = "已审批";
    //                break;
    //        }
    //    }
    }

}
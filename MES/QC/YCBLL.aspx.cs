using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;
using DevExpress.Data;
using DevExpress.XtraGrid;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;



public partial class MES_QC_YCBLL: BasePage
{   ///一次不良率
    Wage_Helper helper = new Wage_Helper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //foreach (string name in Enum.GetNames(typeof(GridViewDetailExportMode)))
            //{
            //    ddlExportMode.Items.Add(name);
            //}
            //ddlExportMode.Text = GridViewDetailExportMode.Expanded.ToString();
            dateedtSCRQ1.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
            dateedtSCRQ2.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
        }
        if (ViewState["detailtable"] != null)
        {
            DataTable table = ViewState["detailtable"] as DataTable;
            this.grid1.DataSource = table;
            grid1.DataBind();  //执行绑定
        }    
    }
    private void BinData()
    {
        string m_scrq1 = dateedtSCRQ1.Date.ToString("yyy-MM-dd");
        string m_scrq2 = dateedtSCRQ2.Date.ToString("yyy-MM-dd");
        string m_gxid = cbGX.Value.ToString().Trim();
        string m_xxlx = cbXXLX.Text.ToString().Trim();
        //获取工序对应的班组作业明细的数据表名称
        string tablename = Wage_Helper.GetBzMxTableName(m_gxid);

        string where = "SELECT sum(CZSL)CZSL,sum(SJCZBS)SJCZBS,sum(HGBS)HGBS,sum(BHGBS)BHGBS ";
        where = string.Format(" {0},Cast(Cast(sum(BHGBS)As decimal(18,3))/Cast(sum(CZSL)As decimal(18,3))*1000 as  decimal(18,3)) YCBLL ", where);
        where = string.Format("  {0},'{1}'as TABLENAME ,'{2}' as M_XXLX ,'{3}'as CZRQ1 ,'{4}'as CZRQ2", where, tablename, m_xxlx, m_scrq1, m_scrq2);
        where = string.Format("  {0} FROM {1} MX  ", where, tablename);
        where = string.Format(" {0} JOIN JC_CPXX CPXX ON MX.CPID=CPXX.CPID   WHERE 1=1", where);
        if (!string.IsNullOrEmpty(m_scrq1) && !string.IsNullOrEmpty(m_scrq2))
        {
            where = string.Format(" {0} and CZRQ >= '{1}' AND CZRQ <= '{2}'", where, m_scrq1, m_scrq2);
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
        //where = string.Format(" {0} GROUP BY CZRQ", where);


        GG_BZZYMX valBzzymx = new GG_BZZYMX();
        GG_BZZYMX condBzzymx = new GG_BZZYMX();
        JC_CPXX valCpxx = new JC_CPXX();
        JC_CPXX condCpxx = new JC_CPXX();
        JC_KHXX valKhxx = new JC_KHXX();
        JC_KHXX condKhxx = new JC_KHXX();
        valCpxx._XXLX = "";
        valCpxx._SAPRemark = "";
        valCpxx._XH = "";
        valKhxx._KHMC = "";
        conn = "connMES";

        DataTable dtb = BLLTable<GG_BZZYMX>.Factory(conn).qDataTable(where);
        this.grid1.DataSource = dtb;
        grid1.DataBind();  //执行绑定
        ViewState["detailtable"] = dtb;//dtbRGZMX;


    }
    protected void grid3BZ_DataSelect(object sender, EventArgs e)
    {   //将主表的主键写入Session，以便于ObjectDataSource在SELECT时调用
        Session["XH"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        Session["CZRQ1"] = (sender as ASPxGridView).GetMasterRowFieldValues("CZRQ1");
        Session["CZRQ2"] = (sender as ASPxGridView).GetMasterRowFieldValues("CZRQ2");
        Session["TABLENAME"] = (sender as ASPxGridView).GetMasterRowFieldValues("TABLENAME");
        Session["M_XXLX"] = (sender as ASPxGridView).GetMasterRowFieldValues("M_XXLX");
    }

    protected void grid4SCZYD_DataSelect(object sender, EventArgs e)
    {   //将主表的主键写入Session，以便于ObjectDataSource在SELECT时调用
        Session["BZID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        Session["CZRQ1"] = (sender as ASPxGridView).GetMasterRowFieldValues("CZRQ1");
        Session["CZRQ2"] = (sender as ASPxGridView).GetMasterRowFieldValues("CZRQ2");
        Session["XH"] = (sender as ASPxGridView).GetMasterRowFieldValues("XH");
        Session["TABLENAME"] = (sender as ASPxGridView).GetMasterRowFieldValues("TABLENAME");
        Session["M_XXLX"] = (sender as ASPxGridView).GetMasterRowFieldValues("M_XXLX");
    }
    protected void grid2XH_DataSelect(object sender, EventArgs e)
    {   //将主表的主键写入Session，以便于ObjectDataSource在SELECT时调用
        Session["CZRQ1"] = (sender as ASPxGridView).GetMasterRowKeyValue(); //(sender as ASPxGridView).GetMasterRowKeyValue();
        Session["CZRQ2"] = (sender as ASPxGridView).GetMasterRowFieldValues("CZRQ2");
        Session["TABLENAME"] = (sender as ASPxGridView).GetMasterRowFieldValues("TABLENAME");
        Session["M_XXLX"] = (sender as ASPxGridView).GetMasterRowFieldValues("M_XXLX");
    }
    protected void btnSerch_Click(object sender, EventArgs e)
    {
        BinData();
    }
    protected void grid1_CustomSummaryCalculate(object sender, CustomSummaryEventArgs e)
    {
        //ASPxSummaryItem item = e.Item as ASPxSummaryItem;

        //if (item.FieldName == "YCBLL")
        //{

        //    //if (e.SummaryProcess == CustomSummaryProcess.Finalize)

        //    //    e.TotalValue = e.FieldValue.ToString();

        //}
    }
    protected void btnPdfExport_Click(object sender, EventArgs e)
    {
        exporter.WritePdfToResponse();
    }
    protected void btnXlsExport_Click(object sender, EventArgs e)
    {
        exporter.WriteXlsToResponse();
    }
    protected void btnXlsxExport_Click(object sender, EventArgs e)
    {
        exporter.WriteXlsxToResponse();
    }
    protected void btnRtfExport_Click(object sender, EventArgs e)
    {
        exporter.WriteRtfToResponse();
    }
    protected void btnCsvExport_Click(object sender, EventArgs e)
    {
        exporter.WriteCsvToResponse();
    }
    protected void ddlExportMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        //grid1.SettingsDetail.ExportMode = (GridViewDetailExportMode)Enum.Parse(typeof(GridViewDetailExportMode), ddlExportMode.Text);
        //grid2XH.SettingsDetail.ExportMode = (GridViewDetailExportMode)Enum.Parse(typeof(GridViewDetailExportMode), ddlExportMode.Text);
        //grid3BZ.SettingsDetail.ExportMode = (GridViewDetailExportMode)Enum.Parse(typeof(GridViewDetailExportMode), ddlExportMode.Text);
    }
}
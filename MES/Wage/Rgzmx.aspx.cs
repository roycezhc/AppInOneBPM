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
using DevExpress.Web.ASPxEditors;

public partial class Wage_Rgzmx : BasePage
{

    /// <summary>
    /// 员工ID
    /// </summary>
    private string varYGID;
    /// <summary>
    /// 可查询的车间
    /// </summary>
    private string varCJ;
    protected void Page_Load(object sender, EventArgs e)
    {
        varYGID = Request.QueryString["ygid"];
        varCJ = HttpUtility.UrlDecode(Request.QueryString["cj"], System.Text.Encoding.GetEncoding("UTF-8"));
        GetGx(varCJ);
        GetXXLX(varCJ);
     if (!IsPostBack)
        {
            dateedtSCRQ1.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
            //dateedtSCRQ2.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
        }

        if (ViewState["detailtable"] != null)
        {
            DataTable table = ViewState["detailtable"] as DataTable;
            this.gridRGZ.DataSource = table;
            gridRGZ.DataBind();  //执行绑定
        }
            
    }
    /// <summary>
    /// 根据权限获取可以查询的工序
    /// </summary>
    /// <returns></returns>
    private void GetGx(string strcj)
    {
        string where = "SELECT DISTINCT MESGXMC,MESGXID FROM GZ_GXDZB WHERE 1=1";

        if (!string.IsNullOrEmpty(strcj))
        {
            where = string.Format(" {0} and chejian = '{1}'", where, strcj);
        }

        GZ_GXDZB valRgzmx = new GZ_GXDZB();
        GZ_GXDZB condRgzmx = new GZ_GXDZB();
        conn = "connMEStest";
        DataTable dtbGX = BLLTable<GZ_GXDZB>.Factory(conn).qDataTable(where);
        this.cbGX.DataSource = dtbGX;
        cbGX.TextField = "MESGXMC";
        cbGX.ValueField = "MESGXID";
        cbGX.DataBind();

        ViewState["gx"] = dtbGX;//dtbRGZMX;
    }
     /// <summary>
    /// 获取相线类型
    /// </summary>
    /// <returns></returns>
    private void GetXXLX(string strcj)
    {
        if (varCJ == "单相装配车间" || varCJ == "单相包装车间")
        {
            cbXXLX.Text = "单相";
            cbXXLX.Items.Add(new ListEditItem("单相", 1));
        }
        if (varCJ == "三相包装车间")
        {
            cbXXLX.Text = "三相";
            cbXXLX.Items.Add(new ListEditItem("三相", 2));
        }
        if (varCJ == "线路板车间")
        {
            cbXXLX.Text = "全部";
            cbXXLX.Items.Add(new ListEditItem("全部", 0));
        }
        if (varCJ == "品质")
        {
            cbXXLX.Text = "全部";
            cbXXLX.Items.Add(new ListEditItem("全部", 0));
            cbXXLX.Items.Add(new ListEditItem("单相", 1));
            cbXXLX.Items.Add(new ListEditItem("三相", 2));
        }
        if (varCJ == "零部件仓库")
        {
            cbXXLX.Text = "全部";
            cbXXLX.Items.Add(new ListEditItem("全部", 0));
        }
    }
    private void BinData()
    {
        //string m_scrq1 = dateedtSCRQ1.Text.Trim();
        //string m_scrq2 = dateedtSCRQ2.Text.Trim();
        string m_scrq1 =dateedtSCRQ1.Date.ToString("yyyy-MM-dd");
        //string m_scrq2 = Convert.ToDateTime(dateedtSCRQ2.Text.Trim()).ToString("yyyy-MM-dd");//dateEnd.AddDays(+1).ToString("yyy-MM-dd");
        string m_gxid = cbGX.Value.ToString().Trim();
        string m_xxlx = cbXXLX.Text.ToString().Trim();
        string m_yg = txtYG.Text.ToString().Trim();

        string where = "SELECT * FROM GZ_RGZMX WHERE 1=1";
        where = string.Format(" {0} and SCRQ = '{1}' ", where, m_scrq1);
        //if (!string.IsNullOrEmpty(m_scrq1) && !string.IsNullOrEmpty(m_scrq2))
        //{
        //    where = string.Format(" {0} and SCRQ >= '{1}' AND SCRQ <= '{2}'", where, m_scrq1, m_scrq2);
        //}
        if (!string.IsNullOrEmpty(m_gxid))
        {                                                                                                 
            where = string.Format(" {0} and GXID = '{1}'", where, m_gxid);
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
        if (!string.IsNullOrEmpty(m_yg))
        {
            where = string.Format(" {0} and (YGBH LIKE '%{1}%' OR YGXM LIKE'%{1}%')", where, m_yg);
        }
       
        GZ_RGZMX valRgzmx = new GZ_RGZMX();
        GZ_RGZMX condRgzmx = new GZ_RGZMX();
        //JC_CPXX valCpxx = new JC_CPXX();
        //JC_CPXX condCpxx = new JC_CPXX();
        //valCpxx._XXLX = "";
        //valCpxx._SAPRemark = "";
        //valCpxx._XH = "";
        //JC_KHXX valKhxx = new JC_KHXX();
        //JC_KHXX condKhxx = new JC_KHXX();
        //valKhxx._KHMC = "";        
        conn = "connMEStest";
        DataTable dtbRGZ = BLLTable<GZ_RGZMX>.Factory(conn).qDataTable(where);
        this.gridRGZ.DataSource = dtbRGZ;
        gridRGZ.DataBind();  //执行绑定
        ViewState["detailtable"] = dtbRGZ;//dtbRGZMX;

      
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
        //if (e.DataColumn.FieldName == "JE" || e.DataColumn.FieldName == "DJ")
        //{
        //        e.Cell.ForeColor = System.Drawing.Color.Red; 
        //}
        //string jjyxz = e.GetValue("JJYXZ").ToString();

        //for (int n = 0; n < gridRGZ.Columns.Count; n++)
        //{

        //    if (e.DataColumn.FieldName == jjyxz)
        //    {
        //        e.Cell.ForeColor = System.Drawing.Color.Blue;
        //    }

        //}
        if (e.DataColumn.FieldName == "SJLY" )
        {

            int intsjly = int.Parse(e.GetValue("SJLY").ToString());
            switch (intsjly)
            {
                case 0:
                    e.Cell.Text= "系统";
                    break;
                case 1:
                    e.Cell.Text = "导入";
                    break;
            }
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
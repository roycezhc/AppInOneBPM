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

public partial class Wage_Ygz : BasePage
{
    Wage_Helper helper = new Wage_Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateedtTJYF.Text = DateTime.Now.AddMonths(-1).ToString("yyy-MM");
                //dateedtSCRQ2.Text = DateTime.Now.AddDays(-1).ToString("yyy-MM-dd");
            }
            if (ViewState["detailtable"] != null)
            {
                DataTable table = ViewState["detailtable"] as DataTable;
                this.gridYGZ.DataSource = table;
                gridYGZ.KeyFieldName = "YGBH";
                gridYGZ.DataBind();  //执行绑定
            }
        }
        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            gridExport.WriteXlsToResponse();
        }
        protected void gridYGZ_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {


        }
        protected void btnSerch_Click(object sender, EventArgs e)
        {

            BinData();
        }
        private void BinData()
        {
            string m_tjyf = dateedtTJYF.Text.Trim();

            //  string m_gxid = cbGX.Value.ToString().Trim();
            //   string m_xxlx = cbXXLX.Text.ToString().Trim();
            string m_yg = txtYG.Text.ToString().Trim();

            string where = " SELECT * FROM GZ_YGZTJ WHERE 1=1";
            if (!string.IsNullOrEmpty(m_tjyf))
            {
                where = string.Format(" {0} and SCYF = '{1}'", where, m_tjyf);
            }
            //if (!string.IsNullOrEmpty(m_gxid))
            //{
            //    where = string.Format(" {0} and GXID = '{1}'", where, m_gxid);
            //}
            //if (!string.IsNullOrEmpty(m_xxlx) && m_xxlx != "全部")
            //{
            //    if (m_xxlx == "其它")
            //    {
            //        where = string.Format(" {0} and ( XXLX = '{1}' OR XXLX = NULL)", where, "");
            //    }
            //    else if (m_xxlx == "三相")
            //    {
            //        where = string.Format(" {0} and substring(XXLX,1,2) = '{1}'", where, m_xxlx);
            //    }
            //    else
            //    {
            //        where = string.Format(" {0} and XXLX = '{1}'", where, m_xxlx);
            //    }
            //}
            if (!string.IsNullOrEmpty(m_yg))
            {
                where = string.Format(" {0} and (YGBH LIKE '%{1}%' OR YGXM LIKE'%{1}%')", where, m_yg);
            }

            GZ_YGZTJ valYgz = new GZ_YGZTJ();
            GZ_YGZTJ condYgz = new GZ_YGZTJ();


            conn = "connMES";
            DataTable dtbYGZ = BLLTable<GZ_YGZTJ>.Factory(conn).qDataTable(where);
            this.gridYGZ.DataSource = dtbYGZ;
            gridYGZ.KeyFieldName = "YGBH";
            gridYGZ.DataBind();  //执行绑定
            ViewState["detailtable"] = dtbYGZ;//dtbRGZMX;



        }
        protected void chkSingleExpanded_CheckedChanged(object sender, EventArgs e)
        {
            gridYGZ.SettingsDetail.AllowOnlyOneMasterRowExpanded = chkSingleExpanded.Checked;
            if (gridYGZ.SettingsDetail.AllowOnlyOneMasterRowExpanded)
            {
                gridYGZ.DetailRows.CollapseAllRows();
            }
        }
        protected void detailYgzmx_DataSelect(object sender, EventArgs e)
        {   //将主表的主键写入Session，以便于ObjectDataSource在SELECT时调用
            Session["YGBH"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
        //改变当前处理列的颜色    
        protected void detailYgzmx_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
           //根据工序ID 显示工序名称
            if (e.DataColumn.FieldName == "GXID")
            {
               string strgxid = e.GetValue("GXID").ToString();
              e.Cell.Text=helper.GetGxName(strgxid);
            }
       
        }
  
  }

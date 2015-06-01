using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class V_SYS_BILL_COL_SYNShow : AgileFrame.AppInOne.Common.BasePage
{
    V_SYS_BILL_COL_SYN valObj=new V_SYS_BILL_COL_SYN();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["COL_SYNID"]))
                {

                    valObj = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).GetRowData(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, Request["COL_SYNID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCOL_SYNID.Text = Convert.ToString(valObj.COL_SYNID);//Convert.ToInt32
                    
                    
                    txtBILL_ID.Text = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32
                    
                    
                    txtCOL_ID.Text = Convert.ToString(valObj.COL_ID);//Convert.ToInt32
                    
                    
                    txtDB_SRC.Text = Convert.ToString(valObj.DB_SRC);//Convert.ToString
                    
                    
                    txtTABLE_NAME.Text = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString
                    
                    
                    txtCOL_NAME.Text = Convert.ToString(valObj.COL_NAME);//Convert.ToString
                    
                    
                    txtCOL_NOTE.Text = Convert.ToString(valObj.COL_NOTE);//Convert.ToString
                    
                    
                    txtDATA_TYPE.Text = Convert.ToString(valObj.DATA_TYPE);//Convert.ToString
                    
                    
                    txtDATA_LEN.Text = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32
                    
                    
                    txtDATA_ACC.Text = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32
                    
                    
                    txtIS_AUTO.Text = Convert.ToString(valObj.IS_AUTO);//Convert.ToString
                    
                    
                    txtISPK.Text = Convert.ToString(valObj.ISPK);//Convert.ToString
                    
                    
                    txtDVAL.Text = Convert.ToString(valObj.DVAL);//Convert.ToString
                    
                    
                    txtPK_VALCODE.Text = Convert.ToString(valObj.PK_VALCODE);//Convert.ToString
                    
                    
                    txtISFK.Text = Convert.ToString(valObj.ISFK);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                    
                    
                    txtFK_NAME.Text = Convert.ToString(valObj.FK_NAME);//Convert.ToString
                    
                    
                    txtFK_SHOW.Text = Convert.ToString(valObj.FK_SHOW);//Convert.ToString
                    
                    
                    txtDISPLAY_NAME.Text = Convert.ToString(valObj.DISPLAY_NAME);//Convert.ToString
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtBILL_ROW_FORMULAR.Text = Convert.ToString(valObj.BILL_ROW_FORMULAR);//Convert.ToString
                    
                    
                    txtBILL_COL_FORMULAR.Text = Convert.ToString(valObj.BILL_COL_FORMULAR);//Convert.ToString
                    
                    
                    txtBILL_ISHEADER.Text = Convert.ToString(valObj.BILL_ISHEADER);//Convert.ToString
                    
                    
                    txtBILL_HERDERWIDTH.Text = Convert.ToString(valObj.BILL_HERDERWIDTH);//Convert.ToInt32
                    
                    
                    txtFORM_CHECKTYPE.Text = Convert.ToString(valObj.FORM_CHECKTYPE);//Convert.ToString
                    
                    
                    txtBILL_AFTREDTL.Text = Convert.ToString(valObj.BILL_AFTREDTL);//Convert.ToString
                    
                    
                    txtFORM_CTRL_ID.Text = Convert.ToString(valObj.FORM_CTRL_ID);//Convert.ToInt32
                    
                    
                    txtFORM_SHOW.Text = Convert.ToString(valObj.FORM_SHOW);//Convert.ToString
                    
                    
                    txtFORM_NEED.Text = Convert.ToString(valObj.FORM_NEED);//Convert.ToString
                    
                    
                    txtFORM_MIN.Text = Convert.ToString(valObj.FORM_MIN);//Convert.ToString
                    
                    
                    txtFORM_MAX.Text = Convert.ToString(valObj.FORM_MAX);//Convert.ToString
                    
                    
                    txtFORM_ONEROW.Text = Convert.ToString(valObj.FORM_ONEROW);//Convert.ToString
                    
                    
                    txtSEARCH_INBILL.Text = Convert.ToString(valObj.SEARCH_INBILL);//Convert.ToString
                    
                    
                    txtFORM_CTRLWIDTH.Text = Convert.ToString(valObj.FORM_CTRLWIDTH);//Convert.ToInt32
                    
                    
                    txtSEARCH_TYPE.Text = Convert.ToString(valObj.SEARCH_TYPE);//Convert.ToString
                    
                    
                    txtSEARCH_FORMULAR.Text = Convert.ToString(valObj.SEARCH_FORMULAR);//Convert.ToString
                    
                    
                    txtSTATUS.Text = Convert.ToString(valObj.STATUS);//Convert.ToString
                    
                    
                    txtSEL_TB_COL.Text = Convert.ToString(valObj.SEL_TB_COL);//Convert.ToString
                    
                    
                    txtIS_COL_EXISTS.Text = Convert.ToString(valObj.IS_COL_EXISTS);//Convert.ToString
                    
                    
                    txtBILL_NAME.Text = Convert.ToString(valObj.BILL_NAME);//Convert.ToString
                    
                    
                    txtBILL_TYPE.Text = Convert.ToString(valObj.BILL_TYPE);//Convert.ToString
                    
                    
                    txtBILL_SQL.Text = Convert.ToString(valObj.BILL_SQL);//Convert.ToString
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEDITIME.Text = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtADDER.Text = Convert.ToString(valObj.ADDER);//Convert.ToString
                    
                    
                    txtExpr1.Text = Convert.ToString(valObj.Expr1);//Convert.ToString
                    
                    
                    txtP_BILL_ID.Text = Convert.ToString(valObj.P_BILL_ID);//Convert.ToInt32
                    
                    
                    txtBILL_STATUS.Text = Convert.ToString(valObj.BILL_STATUS);//Convert.ToString
                    
                    
                    txtCONN_SOURCE.Text = Convert.ToString(valObj.CONN_SOURCE);//Convert.ToString
                    
                    
                    txtIS_TABLE_EXISTS.Text = Convert.ToString(valObj.IS_TABLE_EXISTS);//Convert.ToString
                    
                    
                    txtKEYS.Text = Convert.ToString(valObj.KEYS);//Convert.ToString

                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["ajax"] != null)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文
                //Response.ContentType = "html/text";

                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divC.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
        }
    }

}

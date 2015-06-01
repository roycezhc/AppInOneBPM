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
using AgileFrame.AppInOne.Common;
public partial class V_SYS_BILL_COL_SYNEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    V_SYS_BILL_COL_SYN valObj =new V_SYS_BILL_COL_SYN();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["COL_SYNID"]))
        {
            keyid = Request["COL_SYNID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtEDITIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtCOL_SYNID.Disabled = true; this.txtCOL_SYNID.Value = "0";
            this.txtCOL_SYNID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).GetRowData(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtCOL_SYNID.Value = Convert.ToString(valObj.COL_SYNID);//Convert.ToInt32                
                    
                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                
                    
                    txtCOL_ID.Value = Convert.ToString(valObj.COL_ID);//Convert.ToInt32                
                    
                    txtDB_SRC.Value = Convert.ToString(valObj.DB_SRC);//Convert.ToString                
                    
                    txtTABLE_NAME.Value = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString                
                    
                    txtCOL_NAME.Value = Convert.ToString(valObj.COL_NAME);//Convert.ToString                
                    
                    txtCOL_NOTE.Value = Convert.ToString(valObj.COL_NOTE);//Convert.ToString                
                    
                    txtDATA_TYPE.Value = Convert.ToString(valObj.DATA_TYPE);//Convert.ToString                
                    
                    txtDATA_LEN.Value = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32                
                    
                    txtDATA_ACC.Value = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32                
                    
                    txtIS_AUTO.Value = Convert.ToString(valObj.IS_AUTO);//Convert.ToString                
                    
                    txtISPK.Value = Convert.ToString(valObj.ISPK);//Convert.ToString                
                    
                    txtDVAL.Value = Convert.ToString(valObj.DVAL);//Convert.ToString                
                    
                    txtPK_VALCODE.Value = Convert.ToString(valObj.PK_VALCODE);//Convert.ToString                
                    
                    txtISFK.Value = Convert.ToString(valObj.ISFK);//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                
                    
                    txtFK_NAME.Value = Convert.ToString(valObj.FK_NAME);//Convert.ToString                
                    
                    txtFK_SHOW.Value = Convert.ToString(valObj.FK_SHOW);//Convert.ToString                
                    
                    txtDISPLAY_NAME.Value = Convert.ToString(valObj.DISPLAY_NAME);//Convert.ToString                
                    
                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                
                    
                    txtBILL_ROW_FORMULAR.Value = Convert.ToString(valObj.BILL_ROW_FORMULAR);//Convert.ToString                
                    
                    txtBILL_COL_FORMULAR.Value = Convert.ToString(valObj.BILL_COL_FORMULAR);//Convert.ToString                
                    
                    txtBILL_ISHEADER.Value = Convert.ToString(valObj.BILL_ISHEADER);//Convert.ToString                
                    
                    txtBILL_HERDERWIDTH.Value = Convert.ToString(valObj.BILL_HERDERWIDTH);//Convert.ToInt32                
                    
                    txtFORM_CHECKTYPE.Value = Convert.ToString(valObj.FORM_CHECKTYPE);//Convert.ToString                
                    
                    txtBILL_AFTREDTL.Value = Convert.ToString(valObj.BILL_AFTREDTL);//Convert.ToString                
                    
                    txtFORM_CTRL_ID.Value = Convert.ToString(valObj.FORM_CTRL_ID);//Convert.ToInt32                
                    
                    txtFORM_SHOW.Value = Convert.ToString(valObj.FORM_SHOW);//Convert.ToString                
                    
                    txtFORM_NEED.Value = Convert.ToString(valObj.FORM_NEED);//Convert.ToString                
                    
                    txtFORM_MIN.Value = Convert.ToString(valObj.FORM_MIN);//Convert.ToString                
                    
                    txtFORM_MAX.Value = Convert.ToString(valObj.FORM_MAX);//Convert.ToString                
                    
                    txtFORM_ONEROW.Value = Convert.ToString(valObj.FORM_ONEROW);//Convert.ToString                
                    
                    txtSEARCH_INBILL.Value = Convert.ToString(valObj.SEARCH_INBILL);//Convert.ToString                
                    
                    txtFORM_CTRLWIDTH.Value = Convert.ToString(valObj.FORM_CTRLWIDTH);//Convert.ToInt32                
                    
                    txtSEARCH_TYPE.Value = Convert.ToString(valObj.SEARCH_TYPE);//Convert.ToString                
                    
                    txtSEARCH_FORMULAR.Value = Convert.ToString(valObj.SEARCH_FORMULAR);//Convert.ToString                
                    
                    txtSTATUS.Value = Convert.ToString(valObj.STATUS);//Convert.ToString                
                    
                    txtSEL_TB_COL.Value = Convert.ToString(valObj.SEL_TB_COL);//Convert.ToString                
                    
                    txtIS_COL_EXISTS.Value = Convert.ToString(valObj.IS_COL_EXISTS);//Convert.ToString                
                    
                    txtBILL_NAME.Value = Convert.ToString(valObj.BILL_NAME);//Convert.ToString                
                    
                    txtBILL_TYPE.Value = Convert.ToString(valObj.BILL_TYPE);//Convert.ToString                
                    
                    txtBILL_SQL.Value = Convert.ToString(valObj.BILL_SQL);//Convert.ToString                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtEDITIME.Value = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd");                
                    
                    txtADDER.Value = Convert.ToString(valObj.ADDER);//Convert.ToString                
                    
                    txtExpr1.Value = Convert.ToString(valObj.Expr1);//Convert.ToString                
                    
                    txtP_BILL_ID.Value = Convert.ToString(valObj.P_BILL_ID);//Convert.ToInt32                
                    
                    txtBILL_STATUS.Value = Convert.ToString(valObj.BILL_STATUS);//Convert.ToString                
                    
                    txtCONN_SOURCE.Value = Convert.ToString(valObj.CONN_SOURCE);//Convert.ToString                
                    
                    txtIS_TABLE_EXISTS.Value = Convert.ToString(valObj.IS_TABLE_EXISTS);//Convert.ToString                
                    
                    txtKEYS.Value = Convert.ToString(valObj.KEYS);//Convert.ToString
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            V_SYS_BILL_COL_SYN valObj = new V_SYS_BILL_COL_SYN();
            
            
            if(txtCOL_SYNID.Value !="" )
                valObj.COL_SYNID = Convert.ToInt32(txtCOL_SYNID.Value);
            
            
            if(txtBILL_ID.Value !="" )
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);
            
            
            if(txtCOL_ID.Value !="" )
                valObj.COL_ID = Convert.ToInt32(txtCOL_ID.Value);
            
            
            if(txtDB_SRC.Value !="" )
                valObj.DB_SRC = Convert.ToString(txtDB_SRC.Value);
            
            
            if(txtTABLE_NAME.Value !="" )
                valObj.TABLE_NAME = Convert.ToString(txtTABLE_NAME.Value);
            
            
            if(txtCOL_NAME.Value !="" )
                valObj.COL_NAME = Convert.ToString(txtCOL_NAME.Value);
            
            
            if(txtCOL_NOTE.Value !="" )
                valObj.COL_NOTE = Convert.ToString(txtCOL_NOTE.Value);
            
            
            if(txtDATA_TYPE.Value !="" )
                valObj.DATA_TYPE = Convert.ToString(txtDATA_TYPE.Value);
            
            
            if(txtDATA_LEN.Value !="" )
                valObj.DATA_LEN = Convert.ToInt32(txtDATA_LEN.Value);
            
            
            if(txtDATA_ACC.Value !="" )
                valObj.DATA_ACC = Convert.ToInt32(txtDATA_ACC.Value);
            
            
            if(txtIS_AUTO.Value !="" )
                valObj.IS_AUTO = Convert.ToString(txtIS_AUTO.Value);
            
            
            if(txtISPK.Value !="" )
                valObj.ISPK = Convert.ToString(txtISPK.Value);
            
            
            if(txtDVAL.Value !="" )
                valObj.DVAL = Convert.ToString(txtDVAL.Value);
            
            
            if(txtPK_VALCODE.Value !="" )
                valObj.PK_VALCODE = Convert.ToString(txtPK_VALCODE.Value);
            
            
            if(txtISFK.Value !="" )
                valObj.ISFK = Convert.ToString(txtISFK.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);
            
            
            if(txtFK_NAME.Value !="" )
                valObj.FK_NAME = Convert.ToString(txtFK_NAME.Value);
            
            
            if(txtFK_SHOW.Value !="" )
                valObj.FK_SHOW = Convert.ToString(txtFK_SHOW.Value);
            
            
            if(txtDISPLAY_NAME.Value !="" )
                valObj.DISPLAY_NAME = Convert.ToString(txtDISPLAY_NAME.Value);
            
            
            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);
            
            
            if(txtBILL_ROW_FORMULAR.Value !="" )
                valObj.BILL_ROW_FORMULAR = Convert.ToString(txtBILL_ROW_FORMULAR.Value);
            
            
            if(txtBILL_COL_FORMULAR.Value !="" )
                valObj.BILL_COL_FORMULAR = Convert.ToString(txtBILL_COL_FORMULAR.Value);
            
            
            if(txtBILL_ISHEADER.Value !="" )
                valObj.BILL_ISHEADER = Convert.ToString(txtBILL_ISHEADER.Value);
            
            
            if(txtBILL_HERDERWIDTH.Value !="" )
                valObj.BILL_HERDERWIDTH = Convert.ToInt32(txtBILL_HERDERWIDTH.Value);
            
            
            if(txtFORM_CHECKTYPE.Value !="" )
                valObj.FORM_CHECKTYPE = Convert.ToString(txtFORM_CHECKTYPE.Value);
            
            
            if(txtBILL_AFTREDTL.Value !="" )
                valObj.BILL_AFTREDTL = Convert.ToString(txtBILL_AFTREDTL.Value);
            
            
            if(txtFORM_CTRL_ID.Value !="" )
                valObj.FORM_CTRL_ID = Convert.ToInt32(txtFORM_CTRL_ID.Value);
            
            
            if(txtFORM_SHOW.Value !="" )
                valObj.FORM_SHOW = Convert.ToString(txtFORM_SHOW.Value);
            
            
            if(txtFORM_NEED.Value !="" )
                valObj.FORM_NEED = Convert.ToString(txtFORM_NEED.Value);
            
            
            if(txtFORM_MIN.Value !="" )
                valObj.FORM_MIN = Convert.ToString(txtFORM_MIN.Value);
            
            
            if(txtFORM_MAX.Value !="" )
                valObj.FORM_MAX = Convert.ToString(txtFORM_MAX.Value);
            
            
            if(txtFORM_ONEROW.Value !="" )
                valObj.FORM_ONEROW = Convert.ToString(txtFORM_ONEROW.Value);
            
            
            if(txtSEARCH_INBILL.Value !="" )
                valObj.SEARCH_INBILL = Convert.ToString(txtSEARCH_INBILL.Value);
            
            
            if(txtFORM_CTRLWIDTH.Value !="" )
                valObj.FORM_CTRLWIDTH = Convert.ToInt32(txtFORM_CTRLWIDTH.Value);
            
            
            if(txtSEARCH_TYPE.Value !="" )
                valObj.SEARCH_TYPE = Convert.ToString(txtSEARCH_TYPE.Value);
            
            
            if(txtSEARCH_FORMULAR.Value !="" )
                valObj.SEARCH_FORMULAR = Convert.ToString(txtSEARCH_FORMULAR.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToString(txtSTATUS.Value);
            
            
            if(txtSEL_TB_COL.Value !="" )
                valObj.SEL_TB_COL = Convert.ToString(txtSEL_TB_COL.Value);
            
            
            if(txtIS_COL_EXISTS.Value !="" )
                valObj.IS_COL_EXISTS = Convert.ToString(txtIS_COL_EXISTS.Value);
            
            
            if(txtBILL_NAME.Value !="" )
                valObj.BILL_NAME = Convert.ToString(txtBILL_NAME.Value);
            
            
            if(txtBILL_TYPE.Value !="" )
                valObj.BILL_TYPE = Convert.ToString(txtBILL_TYPE.Value);
            
            
            if(txtBILL_SQL.Value !="" )
                valObj.BILL_SQL = Convert.ToString(txtBILL_SQL.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtEDITIME.Value !="" )
                valObj.EDITIME = Convert.ToDateTime(txtEDITIME.Value);
            
            
            if(txtADDER.Value !="" )
                valObj.ADDER = Convert.ToString(txtADDER.Value);
            
            
            if(txtExpr1.Value !="" )
                valObj.Expr1 = Convert.ToString(txtExpr1.Value);
            
            
            if(txtP_BILL_ID.Value !="" )
                valObj.P_BILL_ID = Convert.ToInt32(txtP_BILL_ID.Value);
            
            
            if(txtBILL_STATUS.Value !="" )
                valObj.BILL_STATUS = Convert.ToString(txtBILL_STATUS.Value);
            
            
            if(txtCONN_SOURCE.Value !="" )
                valObj.CONN_SOURCE = Convert.ToString(txtCONN_SOURCE.Value);
            
            
            if(txtIS_TABLE_EXISTS.Value !="" )
                valObj.IS_TABLE_EXISTS = Convert.ToString(txtIS_TABLE_EXISTS.Value);
            
            
            if(txtKEYS.Value !="" )
                valObj.KEYS = Convert.ToString(txtKEYS.Value);

            if (keyid != "")
            {
                valObj.COL_SYNID = Convert.ToInt32(keyid);
                count = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).Update(valObj, V_SYS_BILL_COL_SYN.Attribute.COL_SYNID);
            }
            else
            {
                count = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).Insert(valObj, V_SYS_BILL_COL_SYN.Attribute.COL_SYNID);
                keyid = valObj.COL_SYNID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtCOL_SYNID.Value ="";
                    
                    
                    txtBILL_ID.Value ="";
                    
                    
                    txtCOL_ID.Value ="";
                    
                    
                    txtDB_SRC.Value ="";
                    
                    
                    txtTABLE_NAME.Value ="";
                    
                    
                    txtCOL_NAME.Value ="";
                    
                    
                    txtCOL_NOTE.Value ="";
                    
                    
                    txtDATA_TYPE.Value ="";
                    
                    
                    txtDATA_LEN.Value ="";
                    
                    
                    txtDATA_ACC.Value ="";
                    
                    
                    txtIS_AUTO.Value ="";
                    
                    
                    txtISPK.Value ="";
                    
                    
                    txtDVAL.Value ="";
                    
                    
                    txtPK_VALCODE.Value ="";
                    
                    
                    txtISFK.Value ="";
                    
                    
                    txtSORT_NO.Value ="";
                    
                    
                    txtFK_NAME.Value ="";
                    
                    
                    txtFK_SHOW.Value ="";
                    
                    
                    txtDISPLAY_NAME.Value ="";
                    
                    
                    txtTITLE.Value ="";
                    
                    
                    txtBILL_ROW_FORMULAR.Value ="";
                    
                    
                    txtBILL_COL_FORMULAR.Value ="";
                    
                    
                    txtBILL_ISHEADER.Value ="";
                    
                    
                    txtBILL_HERDERWIDTH.Value ="";
                    
                    
                    txtFORM_CHECKTYPE.Value ="";
                    
                    
                    txtBILL_AFTREDTL.Value ="";
                    
                    
                    txtFORM_CTRL_ID.Value ="";
                    
                    
                    txtFORM_SHOW.Value ="";
                    
                    
                    txtFORM_NEED.Value ="";
                    
                    
                    txtFORM_MIN.Value ="";
                    
                    
                    txtFORM_MAX.Value ="";
                    
                    
                    txtFORM_ONEROW.Value ="";
                    
                    
                    txtSEARCH_INBILL.Value ="";
                    
                    
                    txtFORM_CTRLWIDTH.Value ="";
                    
                    
                    txtSEARCH_TYPE.Value ="";
                    
                    
                    txtSEARCH_FORMULAR.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtSEL_TB_COL.Value ="";
                    
                    
                    txtIS_COL_EXISTS.Value ="";
                    
                    
                    txtBILL_NAME.Value ="";
                    
                    
                    txtBILL_TYPE.Value ="";
                    
                    
                    txtBILL_SQL.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtEDITIME.Value ="";
                    
                    
                    txtADDER.Value ="";
                    
                    
                    txtExpr1.Value ="";
                    
                    
                    txtP_BILL_ID.Value ="";
                    
                    
                    txtBILL_STATUS.Value ="";
                    
                    
                    txtCONN_SOURCE.Value ="";
                    
                    
                    txtIS_TABLE_EXISTS.Value ="";
                    
                    
                    txtKEYS.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

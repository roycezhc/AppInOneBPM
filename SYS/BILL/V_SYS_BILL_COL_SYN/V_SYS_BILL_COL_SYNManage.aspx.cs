using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class V_SYS_BILL_COL_SYNManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("V_SYS_BILL_COL_SYNManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("V_SYS_BILL_COL_SYNManage.aspx", path);
    }
    protected string pid="0";

    V_SYS_BILL_COL_SYN valObj = new V_SYS_BILL_COL_SYN();
    V_SYS_BILL_COL_SYN condObj = new V_SYS_BILL_COL_SYN();
    List<V_SYS_BILL_COL_SYN> listObj = new List<V_SYS_BILL_COL_SYN>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(V_SYS_BILL_COL_SYN condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, Order.Desc);
               
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["BillID"] != null)
            condObj.BILL_ID = Convert.ToInt32(Request["BillID"]);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP1);
        //hideTableColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP2);
        //hideTableColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP1);
        //hideFindColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP2);
        //hideFindColumnList.Add(V_SYS_BILL_COL_SYN.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
                                
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtEDITIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_SYS_BILL_COL_SYN>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new V_SYS_BILL_COL_SYN();

        
        
        if(txtCOL_SYNID.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, Convert.ToInt32(txtCOL_SYNID.Value));
        
        
        if(txtBILL_ID.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_ID, Convert.ToInt32(txtBILL_ID.Value));
        
        
        if(txtCOL_ID.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.COL_ID, Convert.ToInt32(txtCOL_ID.Value));
        
        
        if(txtDB_SRC.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DB_SRC, Convert.ToString(txtDB_SRC.Value));
        
        
        if(txtTABLE_NAME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.TABLE_NAME, Convert.ToString(txtTABLE_NAME.Value));
        
        
        if(txtCOL_NAME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.COL_NAME, Convert.ToString(txtCOL_NAME.Value));
        
        
        if(txtCOL_NOTE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.COL_NOTE, Convert.ToString(txtCOL_NOTE.Value));
        
        
        if(txtDATA_TYPE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DATA_TYPE, Convert.ToString(txtDATA_TYPE.Value));
        
        
        if(txtDATA_LEN.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DATA_LEN, Convert.ToInt32(txtDATA_LEN.Value));
        
        
        if(txtDATA_ACC.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DATA_ACC, Convert.ToInt32(txtDATA_ACC.Value));
        
        
        if(txtIS_AUTO.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.IS_AUTO, Convert.ToString(txtIS_AUTO.Value));
        
        
        if(txtISPK.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.ISPK, Convert.ToString(txtISPK.Value));
        
        
        if(txtDVAL.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DVAL, Convert.ToString(txtDVAL.Value));
        
        
        if(txtPK_VALCODE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.PK_VALCODE, Convert.ToString(txtPK_VALCODE.Value));
        
        
        if(txtISFK.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.ISFK, Convert.ToString(txtISFK.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtFK_NAME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FK_NAME, Convert.ToString(txtFK_NAME.Value));
        
        
        if(txtFK_SHOW.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FK_SHOW, Convert.ToString(txtFK_SHOW.Value));
        
        
        if(txtDISPLAY_NAME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.DISPLAY_NAME, Convert.ToString(txtDISPLAY_NAME.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtBILL_ROW_FORMULAR.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_ROW_FORMULAR, Convert.ToString(txtBILL_ROW_FORMULAR.Value));
        
        
        if(txtBILL_COL_FORMULAR.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_COL_FORMULAR, Convert.ToString(txtBILL_COL_FORMULAR.Value));
        
        
        if(txtBILL_ISHEADER.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_ISHEADER, Convert.ToString(txtBILL_ISHEADER.Value));
        
        
        if(txtBILL_HERDERWIDTH.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_HERDERWIDTH, Convert.ToInt32(txtBILL_HERDERWIDTH.Value));
        
        
        if(txtFORM_CHECKTYPE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_CHECKTYPE, Convert.ToString(txtFORM_CHECKTYPE.Value));
        
        
        if(txtBILL_AFTREDTL.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_AFTREDTL, Convert.ToString(txtBILL_AFTREDTL.Value));
        
        
        if(txtFORM_CTRL_ID.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_CTRL_ID, Convert.ToInt32(txtFORM_CTRL_ID.Value));
        
        
        if(txtFORM_SHOW.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_SHOW, Convert.ToString(txtFORM_SHOW.Value));
        
        
        if(txtFORM_NEED.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_NEED, Convert.ToString(txtFORM_NEED.Value));
        
        
        if(txtFORM_MIN.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_MIN, Convert.ToString(txtFORM_MIN.Value));
        
        
        if(txtFORM_MAX.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_MAX, Convert.ToString(txtFORM_MAX.Value));
        
        
        if(txtFORM_ONEROW.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_ONEROW, Convert.ToString(txtFORM_ONEROW.Value));
        
        
        if(txtSEARCH_INBILL.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.SEARCH_INBILL, Convert.ToString(txtSEARCH_INBILL.Value));
        
        
        if(txtFORM_CTRLWIDTH.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.FORM_CTRLWIDTH, Convert.ToInt32(txtFORM_CTRLWIDTH.Value));
        
        
        if(txtSEARCH_TYPE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.SEARCH_TYPE, Convert.ToString(txtSEARCH_TYPE.Value));
        
        
        if(txtSEARCH_FORMULAR.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.SEARCH_FORMULAR, Convert.ToString(txtSEARCH_FORMULAR.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.STATUS, Convert.ToString(txtSTATUS.Value));
        
        
        if(txtSEL_TB_COL.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.SEL_TB_COL, Convert.ToString(txtSEL_TB_COL.Value));
        
        
        if(txtIS_COL_EXISTS.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.IS_COL_EXISTS, Convert.ToString(txtIS_COL_EXISTS.Value));
        
        
        if(txtBILL_NAME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_NAME, Convert.ToString(txtBILL_NAME.Value));
        
        
        if(txtBILL_TYPE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_TYPE, Convert.ToString(txtBILL_TYPE.Value));
        
        
        if(txtBILL_SQL.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_SQL, Convert.ToString(txtBILL_SQL.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtEDITIME.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.EDITIME, Convert.ToDateTime(txtEDITIME.Value));
        
        
        if(txtADDER.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.ADDER, Convert.ToString(txtADDER.Value));
        
        
        if(txtExpr1.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.Expr1, Convert.ToString(txtExpr1.Value));
        
        
        if(txtP_BILL_ID.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.P_BILL_ID, Convert.ToInt32(txtP_BILL_ID.Value));
        
        
        if(txtBILL_STATUS.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS, Convert.ToString(txtBILL_STATUS.Value));
        
        
        if(txtCONN_SOURCE.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.CONN_SOURCE, Convert.ToString(txtCONN_SOURCE.Value));
        
        
        if(txtIS_TABLE_EXISTS.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.IS_TABLE_EXISTS, Convert.ToString(txtIS_TABLE_EXISTS.Value));
        
        
        if(txtKEYS.Value !="" )
            condObj.Like(V_SYS_BILL_COL_SYN.Attribute.KEYS, Convert.ToString(txtKEYS.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_SYS_BILL_COL_SYN>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
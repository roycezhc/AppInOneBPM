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
public partial class SYS_PAGE_TBFIND_COLSEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_PAGE_TBFIND_COLS valObj =new SYS_PAGE_TBFIND_COLS();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏列代码
        //hideAttributeItemList = new List<AttributeItem>();
        //hideAttributeItemList.Add(SYS_PAGE_TBFIND_COLS.Attribute.EXP1);
        //hideAttributeItemList.Add(SYS_PAGE_TBFIND_COLS.Attribute.EXP2);
        //hideAttributeItemList.Add(SYS_PAGE_TBFIND_COLS.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideAttributeItemList);
        #endregion

        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["P_COLID"]))
        {
            keyid = Request["P_COLID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtP_COLID.Disabled = true;
            this.txtP_COLID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).GetRowData(SYS_PAGE_TBFIND_COLS.Attribute.P_COLID, Request["P_COLID"]);
                    if(valObj==null) return ;
                    
                    
                    txtP_COLID.Value = Convert.ToString(valObj.P_COLID);//Convert.ToDecimal                
                    
                    txtPAGE_URL.Value = Convert.ToString(valObj.PAGE_URL);//Convert.ToString                
                    
                    txtFOR_TYPE.Value = Convert.ToString(valObj.FOR_TYPE);//Convert.ToDecimal                
                    
                    txtCOL_NAME.Value = Convert.ToString(valObj.COL_NAME);//Convert.ToString                
                    
                    txtTB_SHOW.Value = Convert.ToString(valObj.TB_SHOW);//Convert.ToDecimal                
                    
                    txtFIND_SHOW.Value = Convert.ToString(valObj.FIND_SHOW);//Convert.ToDecimal
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
            SYS_PAGE_TBFIND_COLS valObj = new SYS_PAGE_TBFIND_COLS();
            
            
            if(txtP_COLID.Value !="" )
                valObj.P_COLID = Convert.ToDecimal(txtP_COLID.Value);
            
            
            if(txtPAGE_URL.Value !="" )
                valObj.PAGE_URL = Convert.ToString(txtPAGE_URL.Value);
            
            
            if(txtFOR_TYPE.Value !="" )
                valObj.FOR_TYPE = Convert.ToDecimal(txtFOR_TYPE.Value);
            
            
            if(txtCOL_NAME.Value !="" )
                valObj.COL_NAME = Convert.ToString(txtCOL_NAME.Value);
            
            
            if(txtTB_SHOW.Value !="" )
                valObj.TB_SHOW = Convert.ToDecimal(txtTB_SHOW.Value);
            
            
            if(txtFIND_SHOW.Value !="" )
                valObj.FIND_SHOW = Convert.ToDecimal(txtFIND_SHOW.Value);

            if (keyid != "")
            {
                valObj.P_COLID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Update(valObj, SYS_PAGE_TBFIND_COLS.Attribute.P_COLID);
            }
            else
            {
                count = BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Insert(valObj, SYS_PAGE_TBFIND_COLS.Attribute.P_COLID);
                keyid = valObj.P_COLID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");

                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtP_COLID.Value ="";
                    
                    
                    txtPAGE_URL.Value ="";
                    
                    
                    txtFOR_TYPE.Value ="";
                    
                    
                    txtCOL_NAME.Value ="";
                    
                    
                    txtTB_SHOW.Value ="";
                    
                    
                    txtFIND_SHOW.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

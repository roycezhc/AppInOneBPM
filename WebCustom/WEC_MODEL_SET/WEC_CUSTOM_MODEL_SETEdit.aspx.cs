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

public partial class WEC_CUSTOM_MODEL_SETEdit : BaseAdminPage
{
    WEC_CUSTOM_MODEL_SET valObj =new WEC_CUSTOM_MODEL_SET();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["record"]))
        {
            keyid = Request["record"];
        }
        if (!IsPostBack)
        {
            

            this.txtWEC_CUSTOM_MODEL_SET_ID.Disabled = true; this.txtWEC_CUSTOM_MODEL_SET_ID.Value = "0";
            this.txtWEC_CUSTOM_MODEL_SET_ID.Attributes["class"] = "hide";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).GetRowData(WEC_CUSTOM_MODEL_SET.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_ID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtWEC_CUSTOM_MODEL_SET_A_ID.Value = Convert.ToString(valObj.A_ID);//Convert.ToDecimal                
                    
                    txtWEC_CUSTOM_MODEL_SET_M_ID.Value = Convert.ToString(valObj.M_ID);//Convert.ToDecimal
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
            WEC_CUSTOM_MODEL_SET valObj = new WEC_CUSTOM_MODEL_SET();
            
            
            if(txtWEC_CUSTOM_MODEL_SET_ID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_ID.Value);
            
            
            if(txtWEC_CUSTOM_MODEL_SET_A_ID.Value !="" )
                valObj.A_ID = Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_A_ID.Value);
            
            
            if(txtWEC_CUSTOM_MODEL_SET_M_ID.Value !="" )
                valObj.M_ID = Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_M_ID.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).Update(valObj, WEC_CUSTOM_MODEL_SET.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).Insert(valObj, WEC_CUSTOM_MODEL_SET.Attribute.ID);
                keyid = valObj.ID.ToString();

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
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_ID.Value ="";
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_A_ID.Value ="";
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_M_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

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

public partial class WEC_C_TYPEEdit : BaseAdminPage
{
    WEC_C_TYPE valObj =new WEC_C_TYPE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
                                      
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_C_TYPE.Attribute.STATUS));                                 
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_C_TYPE>.GetRowData(WEC_C_TYPE.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString                
                    
                    txtSORT.Value = Convert.ToString(valObj.SORT);//Convert.ToInt32
                }
                else
                {
                    txtAID.Value = Convert.ToString(userBase2.Curraid);
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
            WEC_C_TYPE valObj = new WEC_C_TYPE();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtNAME.Value !="" )
                valObj.NAME = Convert.ToString(txtNAME.Value);
            
            
            if(txtSORT.Value !="" )
                valObj.SORT = Convert.ToInt32(txtSORT.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_C_TYPE>.Update(valObj, WEC_C_TYPE.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_C_TYPE>.Insert(valObj, WEC_C_TYPE.Attribute.ID);
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
                    
                    
                    txtID.Value ="";
                    
                    
                    txtAID.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtNAME.Value ="";
                    
                    
                    txtSORT.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

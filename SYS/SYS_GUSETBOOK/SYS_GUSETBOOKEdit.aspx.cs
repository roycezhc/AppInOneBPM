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

public partial class SYS_GUSETBOOKEdit : BaseAdminPage
{
    SYS_GUSETBOOK valObj =new SYS_GUSETBOOK();
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
                         
            txtTYPE.Items.AddRange(FormHelper.GetListItem(SYS_GUSETBOOK.Attribute.TYPE));                                                                        
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<SYS_GUSETBOOK>.GetRowData(SYS_GUSETBOOK.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtTYPE.Value=valObj.TYPE.ToString();                
                    
                    txtMEMO.Value = Convert.ToString(valObj.MEMO);//Convert.ToString                
                    
                    txtEMAIL.Value = Convert.ToString(valObj.EMAIL);//Convert.ToString                
                    
                    txtMOBIL.Value = Convert.ToString(valObj.MOBIL);//Convert.ToString                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtANSWER.Value = Convert.ToString(valObj.ANSWER);//Convert.ToString                
                    
                    txtUSERNAME.Value = Convert.ToString(valObj.USERNAME);//Convert.ToString
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
            SYS_GUSETBOOK valObj = new SYS_GUSETBOOK();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtTYPE.Value !="" )
                valObj.TYPE = Convert.ToInt32(txtTYPE.Value);
            
            
            if(txtMEMO.Value !="" )
                valObj.MEMO = Convert.ToString(txtMEMO.Value);
            
            
            if(txtEMAIL.Value !="" )
                valObj.EMAIL = Convert.ToString(txtEMAIL.Value);
            
            
            if(txtMOBIL.Value !="" )
                valObj.MOBIL = Convert.ToString(txtMOBIL.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtANSWER.Value !="" )
                valObj.ANSWER = Convert.ToString(txtANSWER.Value);
            
            
            if(txtUSERNAME.Value !="" )
                valObj.USERNAME = Convert.ToString(txtUSERNAME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<SYS_GUSETBOOK>.Update(valObj, SYS_GUSETBOOK.Attribute.ID);
            }
            else
            {
                count = BLLTable<SYS_GUSETBOOK>.Insert(valObj, SYS_GUSETBOOK.Attribute.ID);
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
                    
                    
                    txtID.Value ="";
                    
                    
                    txtTYPE.Value ="";
                    
                    
                    txtMEMO.Value ="";
                    
                    
                    txtEMAIL.Value ="";
                    
                    
                    txtMOBIL.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtANSWER.Value ="";
                    
                    
                    txtUSERNAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

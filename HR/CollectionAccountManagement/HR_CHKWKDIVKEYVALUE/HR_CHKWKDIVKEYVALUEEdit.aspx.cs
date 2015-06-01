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
public partial class HR_CHKWKDIVKEYVALUEEdit2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_CHKWKDIVKEYVALUE valObj =new HR_CHKWKDIVKEYVALUE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["OtherKeyFieldName"]))
        {
            keyid = Request["OtherKeyFieldName"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtOtherKeyFieldName.Disabled = true;
            this.txtOtherKeyFieldName.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).GetRowData(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtGroupId.Value = Convert.ToString(valObj.GroupId);//Convert.ToInt32                
                    
                    txtDeviceID.Value = Convert.ToString(valObj.DeviceID);//Convert.ToString                
                    
                    txtAIOTableName.Value = Convert.ToString(valObj.AIOTableName);//Convert.ToString                
                    
                    txtAIOKeyFieldName.Value = Convert.ToString(valObj.AIOKeyFieldName);//Convert.ToString                
                    
                    txtOtherKeyFieldName.Value = Convert.ToString(valObj.OtherKeyFieldName);//Convert.ToString                
                    
                    txtAIOKeyValue.Value = Convert.ToString(valObj.AIOKeyValue);//Convert.ToString                
                    
                    txtOtherKeyValue.Value = Convert.ToString(valObj.OtherKeyValue);//Convert.ToString
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
            HR_CHKWKDIVKEYVALUE valObj = new HR_CHKWKDIVKEYVALUE();
            
            
            if(txtGroupId.Value !="" )
                valObj.GroupId = Convert.ToInt32(txtGroupId.Value);
            
            
            if(txtDeviceID.Value !="" )
                valObj.DeviceID = Convert.ToString(txtDeviceID.Value);
            
            
            if(txtAIOTableName.Value !="" )
                valObj.AIOTableName = Convert.ToString(txtAIOTableName.Value);
            
            
            if(txtAIOKeyFieldName.Value !="" )
                valObj.AIOKeyFieldName = Convert.ToString(txtAIOKeyFieldName.Value);
            
            
            if(txtOtherKeyFieldName.Value !="" )
                valObj.OtherKeyFieldName = Convert.ToString(txtOtherKeyFieldName.Value);
            
            
            if(txtAIOKeyValue.Value !="" )
                valObj.AIOKeyValue = Convert.ToString(txtAIOKeyValue.Value);
            
            
            if(txtOtherKeyValue.Value !="" )
                valObj.OtherKeyValue = Convert.ToString(txtOtherKeyValue.Value);

            if (keyid != "")
            {
                valObj.OtherKeyFieldName = keyid;
                count = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).Update(valObj, HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName);
            }
            else
            {
                count = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).Insert(valObj, HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName);
                keyid = valObj.OtherKeyFieldName.ToString();

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
                    
                    
                    txtGroupId.Value ="";
                    
                    
                    txtDeviceID.Value ="";
                    
                    
                    txtAIOTableName.Value ="";
                    
                    
                    txtAIOKeyFieldName.Value ="";
                    
                    
                    txtOtherKeyFieldName.Value ="";
                    
                    
                    txtAIOKeyValue.Value ="";
                    
                    
                    txtOtherKeyValue.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

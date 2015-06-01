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

public partial class SYS_ROLEDATAEdit : AgileFrame.AppInOne.Common.BasePage
{
    SYS_ROLEDATA valObj =new SYS_ROLEDATA();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ROLE_ID"]))
        {
            keyid = Request["ROLE_ID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtROLE_ID.Attributes["readonly"] = "readonly";
            this.txtROLE_ID.Attributes["disabled"] = "disabled";
            this.txtROLE_ID.Style["background-color"] = "Silver";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_ROLEDATA>.Factory(conn).GetRowData(SYS_ROLEDATA.Attribute.ROLE_ID, Request["ROLE_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtROLE_ID.Value = Convert.ToString(valObj.ROLE_ID);//Convert.ToDecimal                
                    
                    txtDATA_TYPE.Value = Convert.ToString(valObj.DATA_TYPE);//Convert.ToString                
                    
                    txtDATA_ID.Value = Convert.ToString(valObj.DATA_ID);//Convert.ToString
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
            SYS_ROLEDATA valObj = new SYS_ROLEDATA();
            
            
            if(txtROLE_ID.Value !="" )
                valObj.ROLE_ID = Convert.ToDecimal(txtROLE_ID.Value);
            
            
            if(txtDATA_TYPE.Value !="" )
                valObj.DATA_TYPE = Convert.ToString(txtDATA_TYPE.Value);
            
            
            if(txtDATA_ID.Value !="" )
                valObj.DATA_ID = Convert.ToString(txtDATA_ID.Value);

            if (keyid != "")
            {
                valObj.ROLE_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_ROLEDATA>.Factory(conn).Update(valObj, SYS_ROLEDATA.Attribute.ROLE_ID);
            }
            else
            {
                count = BLLTable<SYS_ROLEDATA>.Factory(conn).Insert(valObj, SYS_ROLEDATA.Attribute.ROLE_ID);
                keyid = valObj.ROLE_ID.ToString();

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
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

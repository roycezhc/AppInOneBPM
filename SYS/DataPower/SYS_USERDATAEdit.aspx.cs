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

public partial class SYS_USERDATAEdit : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USERDATA valObj =new SYS_USERDATA();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["USER_ID"]))
        {
            keyid = Request["USER_ID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtUSER_ID.Attributes["readonly"] = "readonly";
            this.txtUSER_ID.Attributes["disabled"] = "disabled";
            this.txtUSER_ID.Style["background-color"] = "Silver";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_USERDATA>.Factory(conn).GetRowData(SYS_USERDATA.Attribute.USER_ID, Request["USER_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtUSER_ID.Value = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal                
                    
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
            SYS_USERDATA valObj = new SYS_USERDATA();
            
            
            if(txtUSER_ID.Value !="" )
                valObj.USER_ID = Convert.ToDecimal(txtUSER_ID.Value);
            
            
            if(txtDATA_TYPE.Value !="" )
                valObj.DATA_TYPE = Convert.ToString(txtDATA_TYPE.Value);
            
            
            if(txtDATA_ID.Value !="" )
                valObj.DATA_ID = Convert.ToString(txtDATA_ID.Value);

            if (keyid != "")
            {
                valObj.USER_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_USERDATA>.Factory(conn).Update(valObj, SYS_USERDATA.Attribute.USER_ID);
            }
            else
            {
                count = BLLTable<SYS_USERDATA>.Factory(conn).Insert(valObj, SYS_USERDATA.Attribute.USER_ID);
                keyid = valObj.USER_ID.ToString();

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

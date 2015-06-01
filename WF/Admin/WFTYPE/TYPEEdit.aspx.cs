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
public partial class WF_TYPEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_TYPE valObj =new WF_TYPE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["TYPE_ID"]))
        {
            keyid = Request["TYPE_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {

            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.STATUS));                                                                  
            txtCREATE_TIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            txtCREATER.Value = userBase.StaffName;
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<WF_TYPE>.Factory(conn).GetRowData(WF_TYPE.Attribute.TYPE_ID, keyid);
                    if(valObj==null) return ;

                    txtSTATUS.Value = valObj.STATUS.ToString();
                    
                    txtTYPE_ID.Value = Convert.ToString(valObj.TYPE_ID);//Convert.ToInt32                
                    
                    txtTYPE_NAME.Value = Convert.ToString(valObj.TYPE_NAME);//Convert.ToString                
                    
                    txtCREATER.Value = Convert.ToString(valObj.CREATER);//Convert.ToString                
                    
                    txtCREATE_TIME.Value = (valObj.CREATE_TIME == DateTime.MinValue) ? "" : valObj.CREATE_TIME.ToString("yyyy-MM-dd");
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
            WF_TYPE valObj = new WF_TYPE();
            
            
            if(txtTYPE_ID.Value !="" )
                valObj.TYPE_ID = Convert.ToInt32(txtTYPE_ID.Value);
            
            
            if(txtTYPE_NAME.Value !="" )
                valObj.TYPE_NAME = Convert.ToString(txtTYPE_NAME.Value);
            
            
            if(txtCREATER.Value !="" )
                valObj.CREATER = Convert.ToString(txtCREATER.Value);
            
            
            if(txtCREATE_TIME.Value !="" )
                valObj.CREATE_TIME = Convert.ToDateTime(txtCREATE_TIME.Value);

            if (txtSTATUS.Value != "")
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);

            if (keyid != "")
            {
                valObj.TYPE_ID = Convert.ToInt32(keyid);
                count = BLLTable<WF_TYPE>.Factory(conn).Update(valObj, WF_TYPE.Attribute.TYPE_ID);
            }
            else
            {
                count = BLLTable<WF_TYPE>.Factory(conn).Insert(valObj, WF_TYPE.Attribute.TYPE_ID);
                keyid = valObj.TYPE_ID.ToString();

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
                if (btn.ID.IndexOf("btnOK") != -1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "returnVal='re';parent.pwHide(true);", true);
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';window.opener.location.reload();}else{window.returnValue = 're';}window.close();", true);
                    }

                }
                else
                {

                    txtTYPE_NAME.Value = "";

                }
            }
     }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

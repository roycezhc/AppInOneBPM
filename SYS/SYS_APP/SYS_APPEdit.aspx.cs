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

public partial class SYS_APPEdit : BaseAdminPage
{
    SYS_APP valObj =new SYS_APP();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["APP_ID"]))
        {
            keyid = Request["APP_ID"];
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
                                                                             
            txtIsBigSystem.Items.AddRange(FormHelper.GetListItem(SYS_APP.Attribute.IsBigSystem));

            this.txtAPP_ID.Disabled = true; this.txtAPP_ID.Value = "0";
            this.txtAPP_ID.Attributes["class"] = "hide";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<SYS_APP>.Factory(conn).GetRowData(SYS_APP.Attribute.APP_ID, keyid);
                    if (valObj == null) return;


                    txtAPP_ID.Value = Convert.ToString(valObj.APP_ID);//Convert.ToString                

                    txtAPP_NAME.Value = Convert.ToString(valObj.APP_NAME);//Convert.ToString                

                    txtAPP_LABEL.Value = Convert.ToString(valObj.APP_LABEL);//Convert.ToString                

                    txtDEFAULT_URL.Value = Convert.ToString(valObj.DEFAULT_URL);//Convert.ToString                

                    txtDEFAULT_URL_NAME.Value = Convert.ToString(valObj.DEFAULT_URL_NAME);//Convert.ToString                

                    txtIsBigSystem.Value = valObj.IsBigSystem.ToString();

                    txtNote.Value = Convert.ToString(valObj.Note);//Convert.ToString                

                    txtAPP_IMG.Src = valObj.APP_IMG;
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
            SYS_APP valObj = new SYS_APP();
            
            
            if(txtAPP_ID.Value !="" )
                valObj.APP_ID = Convert.ToString(txtAPP_ID.Value);
            
            
            if(txtAPP_NAME.Value !="" )
                valObj.APP_NAME = Convert.ToString(txtAPP_NAME.Value);
            
            
            if(txtAPP_LABEL.Value !="" )
                valObj.APP_LABEL = Convert.ToString(txtAPP_LABEL.Value);
            
            
            if(txtDEFAULT_URL.Value !="" )
                valObj.DEFAULT_URL = Convert.ToString(txtDEFAULT_URL.Value);
            
            
            if(txtDEFAULT_URL_NAME.Value !="" )
                valObj.DEFAULT_URL_NAME = Convert.ToString(txtDEFAULT_URL_NAME.Value);
            
            
            if(txtIsBigSystem.Value !="" )
                valObj.IsBigSystem = Convert.ToBoolean(txtIsBigSystem.Value);
            
            
            if(txtNote.Value !="" )
                valObj.Note = Convert.ToString(txtNote.Value);
            
              
            valObj.APP_IMG =  hidtxtAPP_IMG.Value;

            if (keyid != "")
            {
                valObj.APP_ID = Convert.ToString(keyid);
                count = BLLTable<SYS_APP>.Factory(conn).Update(valObj, SYS_APP.Attribute.APP_ID);
            }
            else
            {
                count = BLLTable<SYS_APP>.Factory(conn).Insert(valObj, SYS_APP.Attribute.APP_ID);
                keyid = valObj.APP_ID.ToString();

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
                    
                    
                    txtAPP_ID.Value ="";
                    
                    
                    txtAPP_NAME.Value ="";
                    
                    
                    txtAPP_LABEL.Value ="";
                    
                    
                    txtDEFAULT_URL.Value ="";
                    
                    
                    txtDEFAULT_URL_NAME.Value ="";
                    
                    
                    txtIsBigSystem.Value ="";
                    
                    
                    txtNote.Value ="";
                    
                    
                    txtAPP_IMG.Src ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

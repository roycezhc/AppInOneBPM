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
public partial class WF_CTRL_TYPEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_CTRL_TYPE valObj =new TF_CTRL_TYPE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["CTRL_TYPE"]))
        {
            keyid = Request["CTRL_TYPE"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtCTRL_TYPE.Disabled = true;
            this.txtCTRL_TYPE.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).GetRowData(TF_CTRL_TYPE.Attribute.CTRL_TYPE, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtCTRL_TYPE.Value = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString                
                    
                    txtP_CTRL_TYPE.Value = Convert.ToString(valObj.P_CTRL_TYPE);//Convert.ToString                
                    
                    txtCTRL_NAME.Value = Convert.ToString(valObj.CTRL_NAME);//Convert.ToString                
                    
                    txtEL_HTML.Value = Convert.ToString(valObj.EL_HTML);//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                
                    
                    txtJS_CODE.Value = Convert.ToString(valObj.JS_CODE);//Convert.ToString
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
            TF_CTRL_TYPE valObj = new TF_CTRL_TYPE();
            
            
            if(txtCTRL_TYPE.Value !="" )
                valObj.CTRL_TYPE = Convert.ToString(txtCTRL_TYPE.Value);
            
            
            if(txtP_CTRL_TYPE.Value !="" )
                valObj.P_CTRL_TYPE = Convert.ToString(txtP_CTRL_TYPE.Value);
            
            
            if(txtCTRL_NAME.Value !="" )
                valObj.CTRL_NAME = Convert.ToString(txtCTRL_NAME.Value);
            
            
            if(txtEL_HTML.Value !="" )
                valObj.EL_HTML = Convert.ToString(txtEL_HTML.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);
            
            
            if(txtJS_CODE.Value !="" )
                valObj.JS_CODE = Convert.ToString(txtJS_CODE.Value);

            if (keyid != "")
            {
                valObj.CTRL_TYPE = keyid;
                count = BLLTable<TF_CTRL_TYPE>.Factory(conn).Update(valObj, TF_CTRL_TYPE.Attribute.CTRL_TYPE);
            }
            else
            {
                count = BLLTable<TF_CTRL_TYPE>.Factory(conn).Insert(valObj, TF_CTRL_TYPE.Attribute.CTRL_TYPE);
                keyid = valObj.CTRL_TYPE.ToString();

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
                    
                    
                    txtCTRL_TYPE.Value ="";
                    
                    
                    txtP_CTRL_TYPE.Value ="";
                    
                    
                    txtCTRL_NAME.Value ="";
                    
                    
                    txtEL_HTML.Value ="";
                    
                    
                    txtSORT_NO.Value ="";
                    
                    
                    txtJS_CODE.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

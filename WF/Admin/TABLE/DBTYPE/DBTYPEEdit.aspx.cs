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
public partial class WF_FIELD_DBTYPEEdit2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_FIELD_DBTYPE valObj =new TF_FIELD_DBTYPE();
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
            this.txtTYPE_ID.Disabled = true;
            this.txtTYPE_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).GetRowData(TF_FIELD_DBTYPE.Attribute.TYPE_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTYPE_ID.Value = Convert.ToString(valObj.TYPE_ID);//Convert.ToInt32                
                    
                    txtTYPE_NAME.Value = Convert.ToString(valObj.TYPE_NAME);//Convert.ToString                
                    
                    txtDB_TYPE.Value = Convert.ToString(valObj.DB_TYPE);//Convert.ToString                
                    
                    txtCTRL_TYPES.Value = Convert.ToString(valObj.CTRL_TYPES);//Convert.ToString
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
            TF_FIELD_DBTYPE valObj = new TF_FIELD_DBTYPE();
            
            
            if(txtTYPE_ID.Value !="" )
                valObj.TYPE_ID = Convert.ToInt32(txtTYPE_ID.Value);
            
            
            if(txtTYPE_NAME.Value !="" )
                valObj.TYPE_NAME = Convert.ToString(txtTYPE_NAME.Value);
            
            
            if(txtDB_TYPE.Value !="" )
                valObj.DB_TYPE = Convert.ToString(txtDB_TYPE.Value);
            
            
            if(txtCTRL_TYPES.Value !="" )
                valObj.CTRL_TYPES = Convert.ToString(txtCTRL_TYPES.Value);

            if (keyid != "")
            {
                valObj.TYPE_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).Update(valObj, TF_FIELD_DBTYPE.Attribute.TYPE_ID);
            }
            else
            {
                count = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).Insert(valObj, TF_FIELD_DBTYPE.Attribute.TYPE_ID);
                keyid = valObj.TYPE_ID.ToString();

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
                    
                    
                    txtTYPE_ID.Value ="";
                    
                    
                    txtTYPE_NAME.Value ="";
                    
                    
                    txtDB_TYPE.Value ="";
                    
                    
                    txtCTRL_TYPES.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

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
public partial class TF_TABLEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_TABLE valObj =new TF_TABLE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["TB_ID"]))
        {
            keyid = Request["TB_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {            
                                                                                          
            //txtTB_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TABLE.Attribute.TB_TYPE));

            //this.txtTB_ID.Disabled = true; this.txtTB_ID.Value = "0";
            //this.txtTB_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    //txtTB_ID.Value = Convert.ToString(valObj.TB_ID);//Convert.ToInt32                
                    
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
            TF_TABLE valObj = new TF_TABLE();
            
            
            //if(txtTB_ID.Value !="" )
            //    valObj.TB_ID = Convert.ToInt32(txtTB_ID.Value);
            
            

            if (keyid != "")
            {
                valObj.TB_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_TABLE>.Factory(conn).Update(valObj, TF_TABLE.Attribute.TB_ID);
            }
            else
            {
                count = BLLTable<TF_TABLE>.Factory(conn).Insert(valObj, TF_TABLE.Attribute.TB_ID);
                keyid = valObj.TB_ID.ToString();

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
                    
                    
                    //txtTB_ID.Value ="";
                    
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

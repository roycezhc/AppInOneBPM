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
public partial class WF_PROCESS_TPLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_PROCESS_TPL valObj =new WF_PROCESS_TPL();
    int count = 0;
    string keyid = "";
    int wfid = 0;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            keyid = Request["PROCID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (!IsPostBack)
        {
                        
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_PROCESS_TPL.Attribute.STATUS));
            if (txtSTATUS.Items.Count > 1) {
                txtSTATUS.SelectedIndex = 1;
            }
            this.txtPROCID.Disabled = true;
            this.txtPROCID.Attributes["class"] = "dis";
            try
            {
                txtWFCID.Value = wfid.ToString();
                if (keyid != "")
                {

                    valObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtPROCID.Value = Convert.ToString(valObj.PROCID);//Convert.ToInt32                
                    
                    txtPROC_NAME.Value = Convert.ToString(valObj.PROC_NAME);//Convert.ToString                

                    txtGUID.Value = Convert.ToString(valObj.GUID);//Convert.ToString                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtSHOW_CONDITION.Value = Convert.ToString(valObj.CONDITION);//Convert.ToString                
                    
                    txtSHOW_FORMULA.Value = Convert.ToString(valObj.FORMULAR);//Convert.ToString                
                    
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString
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
            WF_PROCESS_TPL valObj = new WF_PROCESS_TPL();
            if (txtWFCID.Value != "")
                valObj.WFID = Convert.ToInt32(txtWFCID.Value);
            
            
            if(txtPROCID.Value !="" )
                valObj.PROCID = Convert.ToInt32(txtPROCID.Value);
            
            
            if(txtPROC_NAME.Value !="" )
                valObj.PROC_NAME = Convert.ToString(txtPROC_NAME.Value);
            
            
            if(txtGUID.Value !="" )
                valObj.GUID = Convert.ToString(txtGUID.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToString(txtSTATUS.Value);
            
            
            if(txtSHOW_CONDITION.Value !="" )
                valObj.CONDITION = Convert.ToString(txtSHOW_CONDITION.Value);
            
            
            if(txtSHOW_FORMULA.Value !="" )
                valObj.FORMULAR = Convert.ToString(txtSHOW_FORMULA.Value);
            
            
            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);

            valObj.EDITIME = DateTime.Now;
            if (keyid != "")
            {
                valObj.PROCID = Convert.ToInt32(keyid);
                count = BLLTable<WF_PROCESS_TPL>.Factory(conn).Update(valObj, WF_PROCESS_TPL.Attribute.PROCID);
            }
            else
            {
                valObj.GUID = "P"+DateTime.Now.ToString("yyyyMMddHHmmss");
                valObj.ADDTIME = DateTime.Now;
                count = BLLTable<WF_PROCESS_TPL>.Factory(conn).Insert(valObj, WF_PROCESS_TPL.Attribute.PROCID);
                keyid = valObj.PROCID.ToString();

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
                if (btn.ID.IndexOf("btnOK")!=-1)
                {

                  ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);

                }
                else
                {
                    
                    
                    txtPROCID.Value ="";
                    
                    
                    txtPROC_NAME.Value ="";

                    txtGUID.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtSHOW_CONDITION.Value ="";
                    
                    
                    txtSHOW_FORMULA.Value ="";
                    
                    
                    txtNOTE.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

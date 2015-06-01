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
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;

public partial class WEC_CATEBANNEREdit : BaseAdminPage
{
    WEC_CATEBANNER valObj =new WEC_CATEBANNER();
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
                                                                             
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_CATEBANNER.Attribute.STATUS));                                 
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_CATEBANNER>.GetRowData(WEC_CATEBANNER.Attribute.ID, keyid);
                    if (valObj == null) return;


                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                

                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                

                    txtPICURL.Src = valObj.PIC_URL;

                    txtOUT_URL.Value = Convert.ToString(valObj.OUT_URL);//Convert.ToString                

                    txtSORT_ID.Value = Convert.ToString(valObj.SORT_ID);//Convert.ToInt32                

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtNAME.Value = Convert.ToString(valObj.NAME);

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtAID.Value = Convert.ToString(userBase2.Curraid);
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

            WEC_CATEBANNER valObj = new WEC_CATEBANNER();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);

            if (txtNAME.Value != "")
                valObj.NAME = Convert.ToString(txtNAME.Value);

            valObj.PIC_URL = hidPICURL.Value;
            
            if(txtOUT_URL.Value !="" )
                valObj.OUT_URL = Convert.ToString(txtOUT_URL.Value);
            
            
            if(txtSORT_ID.Value !="" )
                valObj.SORT_ID = Convert.ToInt32(txtSORT_ID.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_CATEBANNER>.Update(valObj, WEC_CATEBANNER.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_CATEBANNER>.Insert(valObj, WEC_CATEBANNER.Attribute.ID);
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
                    
                    
                    txtID.Value ="";
                    
                    
                    txtAID.Value ="";
                    
                    
                    txtOUT_URL.Value ="";
                    
                    
                    txtSORT_ID.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

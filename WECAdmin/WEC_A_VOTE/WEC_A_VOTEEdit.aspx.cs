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

public partial class WEC_A_VOTEEdit : BaseAdminPage
{
    WEC_A_VOTE valObj =new WEC_A_VOTE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
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
                                      
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.STATUS));                                                                              
            txtPIC_SHOW.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.PIC_SHOW));             
            txtIS_RADIO.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.IS_RADIO));                                                    
            txtSHARE.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.SHARE));             
            txtKIND.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.KIND));

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "hide";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_A_VOTE>.Factory(conn).GetRowData(WEC_A_VOTE.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtADDTIME.Value = Convert.ToString(valObj.ADDTIME);//Convert.ToDateTime                
                    
                    txtKEYWORD.Value = Convert.ToString(valObj.KEYWORD);//Convert.ToString                
                    
                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                
                      
                    txtPICURL.Src = valObj.PICURL;                
                    
                    txtINSTRUCTION.Value = Convert.ToString(valObj.INSTRUCTION);//Convert.ToString                
                    
                    txtPIC_SHOW.Value=valObj.PIC_SHOW.ToString();                
                    
                    txtIS_RADIO.Value=valObj.IS_RADIO.ToString();                
                    
                    txtSELECT_NUM.Value = Convert.ToString(valObj.SELECT_NUM);//Convert.ToInt32                
                    
                    txtTIME.Value = Convert.ToString(valObj.TIME);//Convert.ToString                
                    
                    txtRESULT.Value = Convert.ToString(valObj.RESULT);//Convert.ToInt32                
                    
                    txtSHARE.Value=valObj.SHARE.ToString();                
                    
                    txtKIND.Value=valObj.KIND.ToString();
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
            WEC_A_VOTE valObj = new WEC_A_VOTE();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtKEYWORD.Value !="" )
                valObj.KEYWORD = Convert.ToString(txtKEYWORD.Value);
            
            
            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);
            
              
            valObj.PICURL =  hidtxtPICURL.Value;
            
            
            if(txtINSTRUCTION.Value !="" )
                valObj.INSTRUCTION = Convert.ToString(txtINSTRUCTION.Value);
            
            
            if(txtPIC_SHOW.Value !="" )
                valObj.PIC_SHOW = Convert.ToInt32(txtPIC_SHOW.Value);
            
            
            if(txtIS_RADIO.Value !="" )
                valObj.IS_RADIO = Convert.ToInt32(txtIS_RADIO.Value);
            
            
            if(txtSELECT_NUM.Value !="" )
                valObj.SELECT_NUM = Convert.ToInt32(txtSELECT_NUM.Value);
            
            
            if(txtTIME.Value !="" )
                valObj.TIME = Convert.ToDateTime(txtTIME.Value);
            
            
            if(txtRESULT.Value !="" )
                valObj.RESULT = Convert.ToInt32(txtRESULT.Value);
            
            
            if(txtSHARE.Value !="" )
                valObj.SHARE = Convert.ToInt32(txtSHARE.Value);
            
            
            if(txtKIND.Value !="" )
                valObj.KIND = Convert.ToInt32(txtKIND.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_A_VOTE>.Factory(conn).Update(valObj, WEC_A_VOTE.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_A_VOTE>.Factory(conn).Insert(valObj, WEC_A_VOTE.Attribute.ID);
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
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtKEYWORD.Value ="";
                    
                    
                    txtTITLE.Value ="";
                    
                    
                    txtPICURL.Src ="";
                    
                    
                    txtINSTRUCTION.Value ="";
                    
                    
                    txtPIC_SHOW.Value ="";
                    
                    
                    txtIS_RADIO.Value ="";
                    
                    
                    txtSELECT_NUM.Value ="";
                    
                    
                    txtTIME.Value ="";
                    
                    
                    txtRESULT.Value ="";
                    
                    
                    txtSHARE.Value ="";
                    
                    
                    txtKIND.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

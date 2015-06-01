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

public partial class WEC_PUBLICLISTEdit : BaseAdminPage
{
    WEC_PUBLICLIST valObj =new WEC_PUBLICLIST();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["AID"]))
        {
            keyid = Request["AID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
                                                                                                                                                                                            
            txtSTART_DAY.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtEND_DAY.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                       
            txtIS_NEWS.Items.AddRange(FormHelper.GetListItem(WEC_PUBLICLIST.Attribute.IS_NEWS));                          
            txtDEFAULT_REPLAY_FALG.Items.AddRange(FormHelper.GetListItem(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG));

            this.txtAID.Disabled = true; this.txtAID.Value = "0";
            this.txtAID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_PUBLICLIST>.GetRowData(WEC_PUBLICLIST.Attribute.AID, keyid);
                    if (valObj == null) return;


                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                

                    txtUSER_ID.Value = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal                

                    txtPLC_NAME.Value = Convert.ToString(valObj.PLC_NAME);//Convert.ToString                

                    txtPLC_SOURCEID.Value = Convert.ToString(valObj.PLC_SOURCEID);//Convert.ToString                

                    txtWECHAT_ID.Value = Convert.ToString(valObj.WECHAT_ID);//Convert.ToString                

                    txtAVATAR_URL.Value = Convert.ToString(valObj.AVATAR_URL);//Convert.ToString                

                    txtAPI_KEY.Value = Convert.ToString(valObj.API_KEY);//Convert.ToString                

                    txtTOKEN.Value = Convert.ToString(valObj.TOKEN);//Convert.ToString                

                    txtLOCATION.Value = Convert.ToString(valObj.LOCATION);//Convert.ToString                

                    txtEMAIL.Value = Convert.ToString(valObj.EMAIL);//Convert.ToString                

                    txtFUNS.Value = Convert.ToString(valObj.FUNS);//Convert.ToInt32                

                    txtTYPE.Value = Convert.ToString(valObj.TYPE);//Convert.ToInt32                

                    txtSTART_DAY.Value = (valObj.START_DAY == DateTime.MinValue) ? "" : valObj.START_DAY.ToString("yyyy-MM-dd");

                    txtEND_DAY.Value = (valObj.END_DAY == DateTime.MinValue) ? "" : valObj.END_DAY.ToString("yyyy-MM-dd");

                    txtSTATUS.Value = Convert.ToString(valObj.STATUS);//Convert.ToInt32                

                    txtPACKAGE_ID.Value = Convert.ToString(valObj.PACKAGE_ID);//Convert.ToDecimal                

                    txtIS_NEWS.Value = valObj.IS_NEWS.ToString();

                    txtDEFAULT_REPLAY.Value = Convert.ToString(valObj.DEFAULT_REPLAY);//Convert.ToString                

                    txtDEFAULT_REPLAY_FALG.Value = valObj.DEFAULT_REPLAY_FALG.ToString();

                    txtLBS_DISTANCE.Value = Convert.ToString(valObj.LBS_DISTANCE);//Convert.ToDecimal                

                    txtAPPID.Value = Convert.ToString(valObj.APPID);//Convert.ToString                

                    txtAPPSESECRET.Value = Convert.ToString(valObj.APPSESECRET);//Convert.ToString
                }
                else
                { txtUSER_ID.Value = Convert.ToString(userBase.UserID); }
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
            WEC_PUBLICLIST valObj = new WEC_PUBLICLIST();
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtUSER_ID.Value !="" )
                valObj.USER_ID = Convert.ToDecimal(txtUSER_ID.Value);
            
            
            if(txtPLC_NAME.Value !="" )
                valObj.PLC_NAME = Convert.ToString(txtPLC_NAME.Value);
            
            
            if(txtPLC_SOURCEID.Value !="" )
                valObj.PLC_SOURCEID = Convert.ToString(txtPLC_SOURCEID.Value);
            
            
            if(txtWECHAT_ID.Value !="" )
                valObj.WECHAT_ID = Convert.ToString(txtWECHAT_ID.Value);
            
            
            if(txtAVATAR_URL.Value !="" )
                valObj.AVATAR_URL = Convert.ToString(txtAVATAR_URL.Value);
            
            
            if(txtAPI_KEY.Value !="" )
                valObj.API_KEY = Convert.ToString(txtAPI_KEY.Value);
            
            
            if(txtTOKEN.Value !="" )
                valObj.TOKEN = Convert.ToString(txtTOKEN.Value);
            
            
            if(txtLOCATION.Value !="" )
                valObj.LOCATION = Convert.ToString(txtLOCATION.Value);
            
            
            if(txtEMAIL.Value !="" )
                valObj.EMAIL = Convert.ToString(txtEMAIL.Value);
            
            
            if(txtFUNS.Value !="" )
                valObj.FUNS = Convert.ToInt32(txtFUNS.Value);
            
            
            if(txtTYPE.Value !="" )
                valObj.TYPE = Convert.ToInt32(txtTYPE.Value);
            
            
            if(txtSTART_DAY.Value !="" )
                valObj.START_DAY = Convert.ToDateTime(txtSTART_DAY.Value);
            
            
            if(txtEND_DAY.Value !="" )
                valObj.END_DAY = Convert.ToDateTime(txtEND_DAY.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtPACKAGE_ID.Value !="" )
                valObj.PACKAGE_ID = Convert.ToDecimal(txtPACKAGE_ID.Value);
            
            
            if(txtIS_NEWS.Value !="" )
                valObj.IS_NEWS = Convert.ToInt32(txtIS_NEWS.Value);
            
            
            if(txtDEFAULT_REPLAY.Value !="" )
                valObj.DEFAULT_REPLAY = Convert.ToString(txtDEFAULT_REPLAY.Value);
            
            
            if(txtDEFAULT_REPLAY_FALG.Value !="" )
                valObj.DEFAULT_REPLAY_FALG = Convert.ToInt32(txtDEFAULT_REPLAY_FALG.Value);
            
            
            if(txtLBS_DISTANCE.Value !="" )
                valObj.LBS_DISTANCE = Convert.ToDecimal(txtLBS_DISTANCE.Value);
            
            
            if(txtAPPID.Value !="" )
                valObj.APPID = Convert.ToString(txtAPPID.Value);
            
            
            if(txtAPPSESECRET.Value !="" )
                valObj.APPSESECRET = Convert.ToString(txtAPPSESECRET.Value);

            if (keyid != "")
            {
                valObj.AID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_PUBLICLIST>.Update(valObj, WEC_PUBLICLIST.Attribute.AID);
            }
            else
            {
                count = BLLTable<WEC_PUBLICLIST>.Insert(valObj, WEC_PUBLICLIST.Attribute.AID);
                keyid = valObj.AID.ToString();

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
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"" + dataStr + "\";window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "window.returnValue=\"re\";window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtAID.Value ="";
                   
                    
                    txtUSER_ID.Value ="";
                    
                    
                    txtPLC_NAME.Value ="";
                    
                    
                    txtPLC_SOURCEID.Value ="";
                    
                    
                    txtWECHAT_ID.Value ="";
                    
                    
                    txtAVATAR_URL.Value ="";
                    
                    
                    txtAPI_KEY.Value ="";
                    
                    
                    txtTOKEN.Value ="";
                    
                    
                    txtLOCATION.Value ="";
                    
                    
                    txtEMAIL.Value ="";
                    
                    
                    txtFUNS.Value ="";
                    
                    
                    txtTYPE.Value ="";
                    
                    
                    txtSTART_DAY.Value ="";
                    
                    
                    txtEND_DAY.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtPACKAGE_ID.Value ="";
                    
                    
                    txtIS_NEWS.Value ="";
                    
                    
                    txtDEFAULT_REPLAY.Value ="";
                    
                    
                    txtDEFAULT_REPLAY_FALG.Value ="";
                    
                    
                    txtLBS_DISTANCE.Value ="";
                    
                    
                    txtAPPID.Value ="";
                    
                    
                    txtAPPSESECRET.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

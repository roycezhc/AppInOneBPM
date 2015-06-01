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
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.SYS;

public partial class WEC_ACTIVITYEdit : BaseAdminPage
{
    WEC_ACTIVITY valObj =new WEC_ACTIVITY();
    int count = 0;
    public string keyid = "";
    protected string title = "";
    public string kind = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        kind = HttpUtil.GetReqStrValue("kind");
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
            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_ACTIVITY>.GetRowData(WEC_ACTIVITY.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                
                    
                    txtKEYWORD.Value = Convert.ToString(valObj.KEYWORD);//Convert.ToString                
                    
                 
                    txtTIME.Value = Convert.ToString(valObj.TIME);//Convert.ToString                
                    
                    //txtSTART_PICURL.Value = Convert.ToString(valObj.START_PICURL);//Convert.ToString                

                    
                    txtEND_THEME.Value = Convert.ToString(valObj.END_THEME);//Convert.ToString                

     
                   // txtEND_PICURL.Value = Convert.ToString(valObj.END_PICURL);//Convert.ToString                
                    
                    txtTYPE_ONE.Value = Convert.ToString(valObj.TYPE_ONE);//Convert.ToString                
                    
              
                    txtNAME_ONE.Value = Convert.ToString(valObj.NAME_ONE);//Convert.ToString                
                    
                    txtNUM_ONE.Value = Convert.ToString(valObj.NUM_ONE);//Convert.ToInt32                
                    
                    txtTYPE_TWO.Value = Convert.ToString(valObj.TYPE_TWO);//Convert.ToString                
                    
               
                    
                    txtNAME_TWO.Value = Convert.ToString(valObj.NAME_TWO);//Convert.ToString                
                    
                    txtNUM_TWO.Value = Convert.ToString(valObj.NUM_TWO);//Convert.ToInt32                
                    
                    txtTYPE_THREE.Value = Convert.ToString(valObj.TYPE_THREE);//Convert.ToString                
                    
             
                    
                    txtNAME_THREE.Value = Convert.ToString(valObj.NAME_THREE);//Convert.ToString                
                    
                    txtNUM_THREE.Value = Convert.ToString(valObj.NUM_THREE);//Convert.ToInt32                
                    
                    txtTYPE_FOUR.Value = Convert.ToString(valObj.TYPE_FOUR);//Convert.ToString                
                    
                  
                    
                    txtNAME_FOUR.Value = Convert.ToString(valObj.NAME_FOUR);//Convert.ToString                
                    
                    txtNUM_FOUR.Value = Convert.ToString(valObj.NUM_FOUR);//Convert.ToInt32                
                    
                    txtTYPE_FIVE.Value = Convert.ToString(valObj.TYPE_FIVE);//Convert.ToString                
                    
                        
                    
                    txtNAME_FIVE.Value = Convert.ToString(valObj.NAME_FIVE);//Convert.ToString                
                    
                    txtNUM_FIVE.Value = Convert.ToString(valObj.NUM_FIVE);//Convert.ToInt32                
                    
                    txtTYPE_SIX.Value = Convert.ToString(valObj.TYPE_SIX);//Convert.ToString                
                    
                       
                    
                    txtNAME_SIX.Value = Convert.ToString(valObj.NAME_SIX);//Convert.ToString                
                    
                    txtNUM_SIX.Value = Convert.ToString(valObj.NUM_SIX);//Convert.ToInt32                
                    
                    txtCONFIRM_PWD.Value = Convert.ToString(valObj.CONFIRM_PWD);//Convert.ToString                
                    
                          
                    
                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString                
                    
                    txtCONTENT.Value = Convert.ToString(valObj.CONTENT);//Convert.ToString                
                    
                    txtINFO.Value = Convert.ToString(valObj.INFO);//Convert.ToString                
                           
                    
                    txtEND_INSTRUCTION.Value = Convert.ToString(valObj.END_INSTRUCTION);//Convert.ToString                


                    txtSTART_PICURL.Src = valObj.START_PICURL;

                    txtEND_PICURL.Src = valObj.END_PICURL;
                    
                    txtPROBABILITY.Value = Convert.ToString(valObj.PROBABILITY);//Convert.ToString                
                    
                    txtNUMBER_TIMES.Value = Convert.ToString(valObj.NUMBER_TIMES);//Convert.ToInt32                

              
                 
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
            
            WEC_ACTIVITY valObj = new WEC_ACTIVITY();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtKEYWORD.Value !="" )
                valObj.KEYWORD = Convert.ToString(txtKEYWORD.Value);
            
            
         
            
            if(txtTIME.Value !="" )
                valObj.TIME = Convert.ToString(txtTIME.Value);
            
            
           // if(txtSTART_PICURL.Value !="" )
             //   valObj.START_PICURL = Convert.ToString(txtSTART_PICURL.Value);

            valObj.START_PICURL = hidSTART_PICURL.Value;
            
            
            if(txtEND_THEME.Value !="" )
                valObj.END_THEME = Convert.ToString(txtEND_THEME.Value);

            valObj.END_PICURL = hidEND_PICURL.Value;
           // if(txtEND_PICURL.Value !="" )
           //     valObj.END_PICURL = Convert.ToString(txtEND_PICURL.Value);
            
            
            if(txtTYPE_ONE.Value !="" )
                valObj.TYPE_ONE = Convert.ToString(txtTYPE_ONE.Value);
            
            
      
            
            if(txtNAME_ONE.Value !="" )
                valObj.NAME_ONE = Convert.ToString(txtNAME_ONE.Value);
            
            
            if(txtNUM_ONE.Value !="" )
                valObj.NUM_ONE = Convert.ToInt32(txtNUM_ONE.Value);
            
            
            if(txtTYPE_TWO.Value !="" )
                valObj.TYPE_TWO = Convert.ToString(txtTYPE_TWO.Value);
            
            
      
            
            if(txtNAME_TWO.Value !="" )
                valObj.NAME_TWO = Convert.ToString(txtNAME_TWO.Value);
            
            
            if(txtNUM_TWO.Value !="" )
                valObj.NUM_TWO = Convert.ToInt32(txtNUM_TWO.Value);
            
            
            if(txtTYPE_THREE.Value !="" )
                valObj.TYPE_THREE = Convert.ToString(txtTYPE_THREE.Value);
            
            
       
            if(txtNAME_THREE.Value !="" )
                valObj.NAME_THREE = Convert.ToString(txtNAME_THREE.Value);
            
            
            if(txtNUM_THREE.Value !="" )
                valObj.NUM_THREE = Convert.ToInt32(txtNUM_THREE.Value);
            
            
            if(txtTYPE_FOUR.Value !="" )
                valObj.TYPE_FOUR = Convert.ToString(txtTYPE_FOUR.Value);
            
            
     
            if(txtNAME_FOUR.Value !="" )
                valObj.NAME_FOUR = Convert.ToString(txtNAME_FOUR.Value);
            
            
            if(txtNUM_FOUR.Value !="" )
                valObj.NUM_FOUR = Convert.ToInt32(txtNUM_FOUR.Value);
            
            
            if(txtTYPE_FIVE.Value !="" )
                valObj.TYPE_FIVE = Convert.ToString(txtTYPE_FIVE.Value);
            
            
        
            if(txtNAME_FIVE.Value !="" )
                valObj.NAME_FIVE = Convert.ToString(txtNAME_FIVE.Value);
            
            
            if(txtNUM_FIVE.Value !="" )
                valObj.NUM_FIVE = Convert.ToInt32(txtNUM_FIVE.Value);
            
            
            if(txtTYPE_SIX.Value !="" )
                valObj.TYPE_SIX = Convert.ToString(txtTYPE_SIX.Value);
            
            
            
            if(txtNAME_SIX.Value !="" )
                valObj.NAME_SIX = Convert.ToString(txtNAME_SIX.Value);
            
            
            if(txtNUM_SIX.Value !="" )
                valObj.NUM_SIX = Convert.ToInt32(txtNUM_SIX.Value);
            
            
            if(txtCONFIRM_PWD.Value !="" )
                valObj.CONFIRM_PWD = Convert.ToString(txtCONFIRM_PWD.Value);
        
            
            if(txtNAME.Value !="" )
                valObj.NAME = Convert.ToString(txtNAME.Value);
            
            
            if(txtCONTENT.Value !="" )
                valObj.CONTENT = Convert.ToString(txtCONTENT.Value);
            
            
            if(txtINFO.Value !="" )
                valObj.INFO = Convert.ToString(txtINFO.Value);
            
       
            
            
            if(txtEND_INSTRUCTION.Value !="" )
                valObj.END_INSTRUCTION = Convert.ToString(txtEND_INSTRUCTION.Value);
            
            
          
        
            
            if(txtPROBABILITY.Value !="" )
                valObj.PROBABILITY = Convert.ToInt32(txtPROBABILITY.Value);
            
            
            if(txtNUMBER_TIMES.Value !="" )
                valObj.NUMBER_TIMES = Convert.ToInt32(txtNUMBER_TIMES.Value);
            
            
          
            
            
        
            
            if(txtINFORMATION.Value !="" )
                valObj.INFORMATION = Convert.ToString(txtINFORMATION.Value);

            valObj.KIND = Convert.ToInt32(kind);
      

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_ACTIVITY>.Update(valObj, WEC_ACTIVITY.Attribute.ID);


            }
            else
            {
                
                keyid = valObj.ID.ToString();
                WEC_REQUEST wec_request = new WEC_REQUEST();
                wec_request.AID = Convert.ToInt32(userBase2.Curraid);
                wec_request.ADDTIME = DateTime.Now;
                wec_request.KEYWORD = valObj.KEYWORD;
                wec_request.KIND = 8;
                wec_request.MEMO = "";
                wec_request.STATUS = 0;
                wec_request.MATCH_TYPE = 0;
                BLLTable<WEC_REQUEST>.Insert(wec_request,WEC_REQUEST.Attribute.TID);
              
                valObj.R_ID=wec_request.TID;
                count = BLLTable<WEC_ACTIVITY>.Insert(valObj, WEC_ACTIVITY.Attribute.ID);
                
                WEC_REQUEST_DETAIL detail = new WEC_REQUEST_DETAIL();
                detail.TID = wec_request.TID;
                detail.SORT_ID = 1;
                detail.STATUS = 0;
                detail.PICURL =valObj.START_PICURL;
                detail.TITLE =valObj.NAME;
                detail.ADDTIME = DateTime.Now; ;
                detail.DESCRIPTION = valObj.INFO;
                detail.TYPE_ID = "4";

                detail.TYPE_VALUE = "";

                BLLTable<WEC_REQUEST_DETAIL>.Insert(detail,WEC_REQUEST_DETAIL.Attribute.ID);
                Random r=new Random();
                int[] num_type = new int[] { valObj.NUM_ONE, valObj.NUM_TWO, valObj.NUM_THREE, valObj.NUM_FOUR, valObj.NUM_FIVE,valObj.NUM_SIX };
                string[] type_type = new string[] {valObj.TYPE_ONE,valObj.TYPE_TWO,valObj._TYPE_THREE,valObj.TYPE_FOUR,valObj.TYPE_FIVE,valObj.TYPE_SIX };
                string[] name_type = new string[] { valObj.NAME_ONE, valObj.NAME_TWO, valObj.NAME_THREE, valObj.NAME_FOUR, valObj.NAME_FIVE, valObj.NAME_SIX };
                for (int j = 0; j < num_type.Length;j++ )
                {
                    for (int i = 0; i < num_type[j]; i++)
                    {
                        WEC_ACTIVITY_SNCODE sn = new WEC_ACTIVITY_SNCODE();
                        sn.A_ID = valObj.ID;
                        sn.PHONE = "";
                        sn.WX_CODE = "";
                        sn.STATUS = 0;
                        sn.AWARD_TYPE = j+1;
                        sn.AWARD_NAME = name_type[j];
                        sn.SN_CODE = DateTime.Now.ToString("yyyyMMddHHmmss") + (r.Next(8999) + 1000 )+ "";
                        BLLTable<WEC_ACTIVITY_SNCODE>.Insert(sn, WEC_ACTIVITY_SNCODE.Attribute.ID);

                    }
                }

                
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
                    
                    
                    txtKEYWORD.Value ="";
                    
                    
                 
                    
                    
                    txtTIME.Value ="";
                    
                    
                  //  txtSTART_PICURL.Value ="";
                    
              
                    
                    
                    txtEND_THEME.Value ="";
                    
                    
                  //  txtEND_PICURL.Value ="";
                    
                    
                    txtTYPE_ONE.Value ="";
                    
                    
              
                    
                    txtNAME_ONE.Value ="";
                    
                    
                    txtNUM_ONE.Value ="";
                    
                    
                    txtTYPE_TWO.Value ="";
                    
                
                    
                    txtNAME_TWO.Value ="";
                    
                    
                    txtNUM_TWO.Value ="";
                    
                    
                    txtTYPE_THREE.Value ="";
                    
                    
                 
                    
                    txtNAME_THREE.Value ="";
                    
                    
                    txtNUM_THREE.Value ="";
                    
                    
                    txtTYPE_FOUR.Value ="";
                    
                    
                
                    
                    
                    txtNAME_FOUR.Value ="";
                    
                    
                    txtNUM_FOUR.Value ="";
                    
                    
                    txtTYPE_FIVE.Value ="";
                    
                    
               
                    
                    txtNAME_FIVE.Value ="";
                    
                    
                    txtNUM_FIVE.Value ="";
                    
                    
                    txtTYPE_SIX.Value ="";
                    
                    
                 
                    
                    
                    txtNAME_SIX.Value ="";
                    
                    
                    txtNUM_SIX.Value ="";
                    
                    
                    txtCONFIRM_PWD.Value ="";
                    
                    
                
                    
                    
                    txtNAME.Value ="";
                    
                    
                    txtCONTENT.Value ="";
                    
                    
                    txtINFO.Value ="";
                    
                    
               
                    
                    txtEND_INSTRUCTION.Value ="";
                    
                    
              
                    
                    
                  
                    
                    txtPROBABILITY.Value ="";
                    
                    
                    txtNUMBER_TIMES.Value ="";
                    
                    
                  
                    
                    
                   
                    
                    
                    txtINFORMATION.Value ="";
                    
                 
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

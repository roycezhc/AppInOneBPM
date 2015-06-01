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
using System.IO;

public partial class WEC_C_CHANNELlISTEdit : BaseAdminPage
{
    WEC_C_CHANNELlIST valObj = new WEC_C_CHANNELlIST();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
        if (!IsPostBack)
        {
            WEC_C_TYPE cond = new WEC_C_TYPE();
            cond.AID = Convert.ToInt32(userBase2.Curraid);
            cond.STATUS = 0;
            txtCATEGORY_ID.Items.AddRange(FormHelper.GetListItem(WEC_C_TYPE.Attribute.ID, WEC_C_TYPE.Attribute.ID, WEC_C_TYPE.Attribute.NAME, null, cond));
                
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_C_CHANNELlIST.Attribute.STATUS));                                 
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                                                                                        
            txtTYPE.Items.AddRange(FormHelper.GetListItem(WEC_C_CHANNELlIST.Attribute.TYPE));

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtAID.Disabled = true; this.txtAID.Value = Convert.ToString(userBase2.Curraid);
            this.txtID.Attributes["class"] = "dis";
            this.txtAID.Attributes["class"] = "dis";
            //this.txtURL.Disabled = true;
            //this.txtURL.Attributes["class"] = "dis";
            //this.txtREMARK.Disabled = true;
            //this.txtREMARK.Attributes["class"] = "dis";
            //this.txtADDRESS.Disabled = true;
            //this.txtADDRESS.Attributes["class"] = "dis";

            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_C_CHANNELlIST>.GetRowData(WEC_C_CHANNELlIST.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString                
                     txtTYPE.Value=valObj.TYPE.ToString();

                     //if (txtTYPE.Value.Equals("0"))//线下
                     //{
                     //    txtADDRESS.Value = Convert.ToString(valObj.ADDRESS);//Convert.ToString 
                     //    txtURL.Disabled = true;
                     //    this.txtURL.Attributes["class"] = "dis";
                     //    txtREMARK.Disabled = true;
                     //    this.txtREMARK.Attributes["class"] = "dis";
                     //}
                     //else if (txtTYPE.Value.Equals("1"))//线上
                     //{
                     //    txtURL.Value = Convert.ToString(valObj.ADDRESS);//Convert.ToString 
                     //    txtADDRESS.Disabled = true;
                     //    this.txtADDRESS.Attributes["class"] = "dis";
                     //    txtREMARK.Disabled = true;
                     //    this.txtREMARK.Attributes["class"] = "dis";
                     //}
                     //else if (txtTYPE.Value.Equals("2"))
                     //{
                     //    txtREMARK.Value = Convert.ToString(valObj.ADDRESS);//Convert.ToString 
                     //    txtADDRESS.Disabled = true;
                     //    this.txtADDRESS.Attributes["class"] = "dis";
                     //    txtURL.Disabled = true;
                     //    this.txtURL.Attributes["class"] = "dis";
                     //}
                     txtADDRESS.Value = Convert.ToString(valObj.ADDRESS);
                     txtURL.Value = Convert.ToString(valObj.ADDRESS);
                     txtREMARK.Value = Convert.ToString(valObj.ADDRESS);
                    
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString                
                    
                    
              
                   txtCATEGORY_ID.Value = Convert.ToString(valObj.CATEGORY_ID);//Convert.ToInt32         

                   
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
            WEC_C_CHANNELlIST valObj = new WEC_C_CHANNELlIST();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtNAME.Value !="" )
                valObj.NAME = Convert.ToString(txtNAME.Value);
            
            
            if(txtURL.Value !="" )
                valObj.URL = Convert.ToString(txtURL.Value);
            
            
            if(txtREMARK.Value !="" )
                valObj.REMARK = Convert.ToString(txtREMARK.Value);
            
            
            if(txtCATEGORY_ID.Value !="" )
                valObj.CATEGORY_ID = Convert.ToInt32(txtCATEGORY_ID.Value);
            
            
         
            
            
            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);
            
            
            if(txtADDRESS.Value !="" )
                valObj.ADDRESS = Convert.ToString(txtADDRESS.Value);
            
            
            if(txtTYPE.Value !="" )
                valObj.TYPE = Convert.ToInt32(txtTYPE.Value);




            string path = WebHelper.GetAppPath() + "UploadFiles/Code/" + userBase2.Curraid + "/";
            string fullPath = System.Web.HttpContext.Current.Server.MapPath(path);
            if (!Directory.Exists(fullPath)) Directory.CreateDirectory(fullPath);

            string filename =  DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg.重命名";


            valObj.FILEPATH = path + filename;

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_C_CHANNELlIST>.Update(valObj, WEC_C_CHANNELlIST.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_C_CHANNELlIST>.Insert(valObj, WEC_C_CHANNELlIST.Attribute.ID);
                keyid = valObj.ID.ToString();
            }

            bool isSuccess = WeiXinUtil.Factory(this).getCode(fullPath + filename, Convert.ToInt32(valObj.ID));

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
                       // ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "alert(\"aaa\")", true);
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "alert(\"bbb\")", true);
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtID.Value ="";
                    
                    
                    txtAID.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtNAME.Value ="";
                    
                    
                    txtURL.Value ="";
                    
                    
                    txtREMARK.Value ="";
                    
                    
                    txtCATEGORY_ID.Value ="";
                    
                    
                   
                    
                    
                    txtNOTE.Value ="";
                    
                    
                    txtADDRESS.Value ="";
                    
                    
                    txtTYPE.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

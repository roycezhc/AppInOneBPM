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

public partial class WEC_CS_MSGMODELEdit : BaseAdminPage
{
    WEC_CS_MSGMODEL valObj =new WEC_CS_MSGMODEL();
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
                                                          
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");             
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_CS_MSGMODEL.Attribute.STATUS));


            txtAID.Value = Convert.ToString( userBase2.Curraid);
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).GetRowData(WEC_CS_MSGMODEL.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                

                    txtMODELNAME.Value = valObj.MODELNAME;

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtMODELCONTENT.Value = Convert.ToString(valObj.MODELCONTENT);//Convert.ToString
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
            WEC_CS_MSGMODEL valObj = new WEC_CS_MSGMODEL();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);



            valObj.AID = Convert.ToDecimal(userBase2.Curraid);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtMODELCONTENT.Value !="" )
                valObj.MODELCONTENT = Convert.ToString(txtMODELCONTENT.Value);

            if (txtMODELNAME.Value!="") {
                valObj.MODELNAME = Convert.ToString(txtMODELNAME.Value);
            }
            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).Update(valObj, WEC_CS_MSGMODEL.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).Insert(valObj, WEC_CS_MSGMODEL.Attribute.ID);
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
                    
                    
                
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtMODELCONTENT.Value ="";
                    txtMODELNAME.Value = "";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

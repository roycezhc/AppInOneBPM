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
public partial class WF_WFOBJECTEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_WFOBJECT valObj =new WF_WFOBJECT();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected int wfid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["WF_OBJ_ID"]))
        {
            keyid = Request["WF_OBJ_ID"];
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            //txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.STATUS));
            if (!string.IsNullOrEmpty(Request["WFCName"]))
            {
                txtWF_OBJ_NAME.Value = Request["WFCName"];
            }
            txtWFID_SRC.Value = wfid.ToString();
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WF_WFOBJECT>.Factory(conn).GetRowData(WF_WFOBJECT.Attribute.WF_OBJ_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtWF_OBJ_ID.Value = Convert.ToString(valObj.WF_OBJ_ID);//Convert.ToInt32                
                    
                    txtWF_OBJ_NAME.Value = Convert.ToString(valObj.WF_OBJ_NAME);//Convert.ToString                
                    
                    txtWFID_SRC.Value = Convert.ToString(valObj.WFID_SRC);//Convert.ToInt32                
                    
                    txtFORM_ID.Value = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32                
                    
                    txtTYPE_ID.Value = Convert.ToString(valObj.TYPE_ID);//Convert.ToInt32                
                    
                    //txtSTATUS.Value = Convert.ToString(valObj.STATUS);//Convert.ToInt32                

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
            WF_WFOBJECT valObj = new WF_WFOBJECT();

            if (txtWFID_SRC.Value != "")
                valObj.WFID_SRC = Convert.ToInt32(txtWFID_SRC.Value);

            if (hidFORM_ID.Value != "")
                valObj.FORM_ID = Convert.ToInt32(hidFORM_ID.Value);

            if (keyid == "") {
                if (BLLTable<WF_WFOBJECT>.Exists(valObj)) {
                    litWarn.Text = "该流程实例已经存在，请重新选择一个表单！";
                    return;
                }
            }

            if(txtWF_OBJ_ID.Value !="" )
                valObj.WF_OBJ_ID = Convert.ToInt32(txtWF_OBJ_ID.Value);
            
            
            if(txtWF_OBJ_NAME.Value !="" )
                valObj.WF_OBJ_NAME = Convert.ToString(txtWF_OBJ_NAME.Value);





            if (hidTYPE_ID.Value != "")
                valObj.TYPE_ID = Convert.ToInt32(hidTYPE_ID.Value);


           // if (txtSTATUS.Value != "")
                valObj.STATUS = 1;// Convert.ToInt32(txtSTATUS.Value);

            if (keyid != "")
            {
                valObj.WF_OBJ_ID = Convert.ToInt32(keyid);
                count = BLLTable<WF_WFOBJECT>.Factory(conn).Update(valObj, WF_WFOBJECT.Attribute.WF_OBJ_ID);
            }
            else
            {
                valObj.ADDTIME = DateTime.Now ;
                valObj.ADDER = "admin";
                count = BLLTable<WF_WFOBJECT>.Factory(conn).Insert(valObj, WF_WFOBJECT.Attribute.WF_OBJ_ID);
                keyid = valObj.WF_OBJ_ID.ToString();
               
                BLLTable<WF_INFO>.Factory(conn).Update(WF_INFO.Attribute.WFID, valObj.WFID_SRC, WF_INFO.Attribute.STATUS, 1);


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
                        if (lstCol[i].FieldName == "STATUS")
                        {
                            if (val == "1")
                            {
                                val = "正常";
                            }
                            else {
                                val = "禁用";
                            }
                        }

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
                        string dataStr = "(" + ViewState["sbData"].ToString() + ")";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                }
                else
                {
 

                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

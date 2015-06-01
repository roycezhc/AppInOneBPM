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

public partial class V_DEVICELISTEdit : BaseAdminPage
{
    V_DEVICELIST valObj =new V_DEVICELIST();
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
            

            this.txtV_DEVICELIST_ID.Disabled = true; this.txtV_DEVICELIST_ID.Value = "0";
            this.txtV_DEVICELIST_ID.Attributes["class"] = "hide";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<V_DEVICELIST>.Factory(conn).GetRowData(V_DEVICELIST.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtV_DEVICELIST_ID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtV_DEVICELIST_USER_ID.Value = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal                
                    
                    txtV_DEVICELIST_DEVICE_ID.Value = Convert.ToString(valObj.DEVICE_ID);//Convert.ToString                
                    
                    txtV_DEVICELIST_KIND.Value = Convert.ToString(valObj.KIND);//Convert.ToInt32                
                    
                    txtV_DEVICELIST_DEBUG.Value = Convert.ToString(valObj.DEBUG);//Convert.ToInt32                
                    
                    txtV_DEVICELIST_STATUS.Value = Convert.ToString(valObj.STATUS);//Convert.ToInt32                
                    
                    txtV_DEVICELIST_AF_ADDTIEM.Value = Convert.ToString(valObj.AF_ADDTIEM);//Convert.ToDateTime                
                    
                    txtV_DEVICELIST_AF_EDITTIME.Value = Convert.ToString(valObj.AF_EDITTIME);//Convert.ToDateTime                
                    
                    txtV_DEVICELIST_TOKEN_ID.Value = Convert.ToString(valObj.TOKEN_ID);//Convert.ToString                
                    
                    txtV_DEVICELIST_STAFF_NAME.Value = Convert.ToString(valObj.STAFF_NAME);//Convert.ToString
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
            V_DEVICELIST valObj = new V_DEVICELIST();
            
            
            if(txtV_DEVICELIST_ID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtV_DEVICELIST_ID.Value);
            
            
            if(txtV_DEVICELIST_USER_ID.Value !="" )
                valObj.USER_ID = Convert.ToDecimal(txtV_DEVICELIST_USER_ID.Value);
            
            
            if(txtV_DEVICELIST_DEVICE_ID.Value !="" )
                valObj.DEVICE_ID = Convert.ToString(txtV_DEVICELIST_DEVICE_ID.Value);
            
            
            if(txtV_DEVICELIST_KIND.Value !="" )
                valObj.KIND = Convert.ToInt32(txtV_DEVICELIST_KIND.Value);
            
            
            if(txtV_DEVICELIST_DEBUG.Value !="" )
                valObj.DEBUG = Convert.ToInt32(txtV_DEVICELIST_DEBUG.Value);
            
            
            if(txtV_DEVICELIST_STATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtV_DEVICELIST_STATUS.Value);
            
            
            if(txtV_DEVICELIST_AF_ADDTIEM.Value !="" )
                valObj.AF_ADDTIEM = Convert.ToDateTime(txtV_DEVICELIST_AF_ADDTIEM.Value);
            
            
            if(txtV_DEVICELIST_AF_EDITTIME.Value !="" )
                valObj.AF_EDITTIME = Convert.ToDateTime(txtV_DEVICELIST_AF_EDITTIME.Value);
            
            
            if(txtV_DEVICELIST_TOKEN_ID.Value !="" )
                valObj.TOKEN_ID = Convert.ToString(txtV_DEVICELIST_TOKEN_ID.Value);
            
            
            if(txtV_DEVICELIST_STAFF_NAME.Value !="" )
                valObj.STAFF_NAME = Convert.ToString(txtV_DEVICELIST_STAFF_NAME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<V_DEVICELIST>.Factory(conn).Update(valObj, V_DEVICELIST.Attribute.ID);
            }
            else
            {
                count = BLLTable<V_DEVICELIST>.Factory(conn).Insert(valObj, V_DEVICELIST.Attribute.ID);
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
                    
                    
                    txtV_DEVICELIST_ID.Value ="";
                    
                    
                    txtV_DEVICELIST_USER_ID.Value ="";
                    
                    
                    txtV_DEVICELIST_DEVICE_ID.Value ="";
                    
                    
                    txtV_DEVICELIST_KIND.Value ="";
                    
                    
                    txtV_DEVICELIST_DEBUG.Value ="";
                    
                    
                    txtV_DEVICELIST_STATUS.Value ="";
                    
                    
                    txtV_DEVICELIST_AF_ADDTIEM.Value ="";
                    
                    
                    txtV_DEVICELIST_AF_EDITTIME.Value ="";
                    
                    
                    txtV_DEVICELIST_TOKEN_ID.Value ="";
                    
                    
                    txtV_DEVICELIST_STAFF_NAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

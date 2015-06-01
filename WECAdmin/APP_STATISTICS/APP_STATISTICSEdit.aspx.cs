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

public partial class APP_STATISTICSEdit : BaseAdminPage
{
    APP_STATISTICS valObj =new APP_STATISTICS();
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
                                             
            txtAPP_STATISTICS_AF_ADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtAPP_STATISTICS_ID.Disabled = true; this.txtAPP_STATISTICS_ID.Value = "0";
            this.txtAPP_STATISTICS_ID.Attributes["class"] = "hide";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<APP_STATISTICS>.Factory(conn).GetRowData(APP_STATISTICS.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtAPP_STATISTICS_ID.Value = Convert.ToString(valObj.ID);//Convert.ToInt32                
                    
                    txtAPP_STATISTICS_AF_ADDTIME.Value = (valObj.AF_ADDTIME == DateTime.MinValue) ? "" : valObj.AF_ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtAPP_STATISTICS_IP.Value = Convert.ToString(valObj.IP);//Convert.ToString                
                    
                    txtAPP_STATISTICS_LONG.Value = Convert.ToString(valObj.LONG);//Convert.ToString                
                    
                    txtAPP_STATISTICS_LAT.Value = Convert.ToString(valObj.LAT);//Convert.ToString                
                    
                    txtAPP_STATISTICS_DEVICE_SYS.Value = Convert.ToString(valObj.DEVICE_SYS);//Convert.ToString                
                    
                    txtAPP_STATISTICS_VER_CODE.Value = Convert.ToString(valObj.VER_CODE);//Convert.ToString                
                    
                    txtAPP_STATISTICS_DEVICE_MODEL.Value = Convert.ToString(valObj.DEVICE_MODEL);//Convert.ToString                
                    
                    txtAPP_STATISTICS_STAFF_ID.Value = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal                
                    
                    txtAPP_STATISTICS_DEVICE_ID.Value = Convert.ToString(valObj.DEVICE_ID);//Convert.ToString                
                    
                    txtAPP_STATISTICS_VER_NAME.Value = Convert.ToString(valObj.VER_NAME);//Convert.ToString
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
            APP_STATISTICS valObj = new APP_STATISTICS();
            
            
            if(txtAPP_STATISTICS_ID.Value !="" )
                valObj.ID = Convert.ToInt32(txtAPP_STATISTICS_ID.Value);
            
            
            if(txtAPP_STATISTICS_AF_ADDTIME.Value !="" )
                valObj.AF_ADDTIME = Convert.ToDateTime(txtAPP_STATISTICS_AF_ADDTIME.Value);
            
            
            if(txtAPP_STATISTICS_IP.Value !="" )
                valObj.IP = Convert.ToString(txtAPP_STATISTICS_IP.Value);
            
            
            if(txtAPP_STATISTICS_LONG.Value !="" )
                valObj.LONG = Convert.ToString(txtAPP_STATISTICS_LONG.Value);
            
            
            if(txtAPP_STATISTICS_LAT.Value !="" )
                valObj.LAT = Convert.ToString(txtAPP_STATISTICS_LAT.Value);
            
            
            if(txtAPP_STATISTICS_DEVICE_SYS.Value !="" )
                valObj.DEVICE_SYS = Convert.ToString(txtAPP_STATISTICS_DEVICE_SYS.Value);
            
            
            if(txtAPP_STATISTICS_VER_CODE.Value !="" )
                valObj.VER_CODE = Convert.ToString(txtAPP_STATISTICS_VER_CODE.Value);
            
            
            if(txtAPP_STATISTICS_DEVICE_MODEL.Value !="" )
                valObj.DEVICE_MODEL = Convert.ToString(txtAPP_STATISTICS_DEVICE_MODEL.Value);
            
            
            if(txtAPP_STATISTICS_STAFF_ID.Value !="" )
                valObj.STAFF_ID = Convert.ToDecimal(txtAPP_STATISTICS_STAFF_ID.Value);
            
            
            if(txtAPP_STATISTICS_DEVICE_ID.Value !="" )
                valObj.DEVICE_ID = Convert.ToString(txtAPP_STATISTICS_DEVICE_ID.Value);
            
            
            if(txtAPP_STATISTICS_VER_NAME.Value !="" )
                valObj.VER_NAME = Convert.ToString(txtAPP_STATISTICS_VER_NAME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToInt32(keyid);
                count = BLLTable<APP_STATISTICS>.Factory(conn).Update(valObj, APP_STATISTICS.Attribute.ID);
            }
            else
            {
                count = BLLTable<APP_STATISTICS>.Factory(conn).Insert(valObj, APP_STATISTICS.Attribute.ID);
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
                    
                    
                    txtAPP_STATISTICS_ID.Value ="";
                    
                    
                    txtAPP_STATISTICS_AF_ADDTIME.Value ="";
                    
                    
                    txtAPP_STATISTICS_IP.Value ="";
                    
                    
                    txtAPP_STATISTICS_LONG.Value ="";
                    
                    
                    txtAPP_STATISTICS_LAT.Value ="";
                    
                    
                    txtAPP_STATISTICS_DEVICE_SYS.Value ="";
                    
                    
                    txtAPP_STATISTICS_VER_CODE.Value ="";
                    
                    
                    txtAPP_STATISTICS_DEVICE_MODEL.Value ="";
                    
                    
                    txtAPP_STATISTICS_STAFF_ID.Value ="";
                    
                    
                    txtAPP_STATISTICS_DEVICE_ID.Value ="";
                    
                    
                    txtAPP_STATISTICS_VER_NAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

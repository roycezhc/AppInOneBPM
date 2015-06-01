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
public partial class HR_Scheduling_IniProjectEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_Scheduling_IniProject valObj =new HR_Scheduling_IniProject();
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
            
                                                                                    
            txtStartTime.Value = (DateTime.Now).ToString("yyyy-MM-dd");                                 
            txtEndTime.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true;
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_Scheduling_IniProject>.Factory(conn).GetRowData(HR_Scheduling_IniProject.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToString                
                    
                    txtSelBanciId.Value = Convert.ToString(valObj.SelBanciId);//Convert.ToString                
                    
                    txtXiuXi.Value = Convert.ToString(valObj.XiuXi);//Convert.ToString                
                    
                    txtWorkDayType.Value = Convert.ToString(valObj.WorkDayType);//Convert.ToString                
                    
                    txtStartTime.Value = (valObj.StartTime == DateTime.MinValue) ? "" : valObj.StartTime.ToString("yyyy-MM-dd");                
                    
                    txtEndTime.Value = (valObj.EndTime == DateTime.MinValue) ? "" : valObj.EndTime.ToString("yyyy-MM-dd");                
                    
                    txtFuGaiOrZengBu.Value = Convert.ToString(valObj.FuGaiOrZengBu);//Convert.ToInt32                
                    
                    txtStaffID.Value = Convert.ToString(valObj.StaffID);//Convert.ToString                
                    
                    txtDeptID.Value = Convert.ToString(valObj.DeptID);//Convert.ToString                
                    
                    txtOrgID.Value = Convert.ToString(valObj.OrgID);//Convert.ToString                
                    
                    txtProjectName.Value = Convert.ToString(valObj.ProjectName);//Convert.ToString
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
            HR_Scheduling_IniProject valObj = new HR_Scheduling_IniProject();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToString(txtID.Value);
            
            
            if(txtSelBanciId.Value !="" )
                valObj.SelBanciId = Convert.ToString(txtSelBanciId.Value);
            
            
            if(txtXiuXi.Value !="" )
                valObj.XiuXi = Convert.ToString(txtXiuXi.Value);
            
            
            if(txtWorkDayType.Value !="" )
                valObj.WorkDayType = Convert.ToString(txtWorkDayType.Value);
            
            
            if(txtStartTime.Value !="" )
                valObj.StartTime = Convert.ToDateTime(txtStartTime.Value);
            
            
            if(txtEndTime.Value !="" )
                valObj.EndTime = Convert.ToDateTime(txtEndTime.Value);
            
            
            if(txtFuGaiOrZengBu.Value !="" )
                valObj.FuGaiOrZengBu = Convert.ToInt32(txtFuGaiOrZengBu.Value);
            
            
            if(txtStaffID.Value !="" )
                valObj.StaffID = Convert.ToString(txtStaffID.Value);
            
            
            if(txtDeptID.Value !="" )
                valObj.DeptID = Convert.ToString(txtDeptID.Value);
            
            
            if(txtOrgID.Value !="" )
                valObj.OrgID = Convert.ToString(txtOrgID.Value);
            
            
            if(txtProjectName.Value !="" )
                valObj.ProjectName = Convert.ToString(txtProjectName.Value);

            if (keyid != "")
            {
                valObj.ID = keyid;
                count = BLLTable<HR_Scheduling_IniProject>.Factory(conn).Update(valObj, HR_Scheduling_IniProject.Attribute.ID);
            }
            else
            {
                count = BLLTable<HR_Scheduling_IniProject>.Factory(conn).Insert(valObj, HR_Scheduling_IniProject.Attribute.ID);
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
                        string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
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
                    
                    
                    txtSelBanciId.Value ="";
                    
                    
                    txtXiuXi.Value ="";
                    
                    
                    txtWorkDayType.Value ="";
                    
                    
                    txtStartTime.Value ="";
                    
                    
                    txtEndTime.Value ="";
                    
                    
                    txtFuGaiOrZengBu.Value ="";
                    
                    
                    txtStaffID.Value ="";
                    
                    
                    txtDeptID.Value ="";
                    
                    
                    txtOrgID.Value ="";
                    
                    
                    txtProjectName.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

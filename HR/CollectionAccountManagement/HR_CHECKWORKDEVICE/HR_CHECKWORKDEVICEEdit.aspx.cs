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
using System.IO;
using System.Data;
using System.Xml;
using AgileFrame.AppInOne.CheckWork.OrgManger;
public partial class HR_CHECKWORKDEVICEEdit2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_CHECKWORKDEVICE valObj =new HR_CHECKWORKDEVICE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected string path = HttpContext.Current.Server.MapPath("~/HR/CollectionAccountManagement/MulSystemXMLProgram/");
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "…Ë±∏±‡º≠";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["DeviceID"]))
        {
            keyid = Request["DeviceID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            OtherDeviceHelper.GetTableDataSet(path, new HR_DEPT());
            OtherDeviceHelper.GetTableDataSet(path, new HR_STAFF());
            txtUSE_FLAG.Items.AddRange(FormHelper.GetListItem(HR_CHECKWORKDEVICE.Attribute.USE_FLAG));
            txtUSE_FLAG.Items.RemoveAt(0);

            ListItem[] deptTables = new ListItem[0];
            ListItem[] staffTables = new ListItem[0];
            GetDeptAndStaffTableFangAnItems(ref deptTables, ref staffTables);
            txtDeptTable.Items.AddRange(deptTables);
            txtStaffTable.Items.AddRange(staffTables);

            this.txtDeviceID.Disabled = true;
            this.txtDeviceID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    HR_CHECKWORKDEVICE val = new HR_CHECKWORKDEVICE();
                    HR_CHECKWORKDEVICE con = new HR_CHECKWORKDEVICE();
                    con._DeviceID = keyid;
                    HR_ORG pyVal = new HR_ORG();
                    pyVal._ORG_NAME = "";
                    Relation rt = new Relation(HR_CHECKWORKDEVICE.Attribute.ORG_ID, HR_ORG.Attribute.ORG_ID);
                    List<HR_CHECKWORKDEVICE> devList = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).Select(val, rt, pyVal, con);
                    if (devList == null || devList.Count < 1) return;
                    txtDeviceID.Value = Convert.ToString(devList[0].DeviceID);//Convert.ToString     
                    txtDeviceName.Value = devList[0].DeviceName;
                    wucSelORG1.ORG_ID = Convert.ToString(devList[0].ORG_ID);//Convert.ToString           
                    wucSelORG1.ORG_NAME = Convert.ToString(devList[0].GetValue(HR_ORG.Attribute.ORG_NAME));
                    txtUSE_FLAG.Value = devList[0].USE_FLAG.ToString();
                    string file = devList[0].DeptTable;
                    file = string.IsNullOrEmpty(file) ? "" : file;
                    if (txtDeptTable.Items.FindByValue(file) != null)
                        txtDeptTable.Value = file;
                    else
                    {
                        if (txtDeptTable.Items.FindByValue("-1") == null)
                            txtDeptTable.Items.Add(new ListItem("¥ÌŒÛ∑Ω∞∏", "-1"));
                        txtDeptTable.Value = "-1";
                    }
                    file = devList[0].StaffTable;
                    file = string.IsNullOrEmpty(file) ? "" : file;
                    if (txtStaffTable.Items.FindByValue(file) != null)
                        txtStaffTable.Value = file;
                    else
                    {
                        if (txtStaffTable.Items.FindByValue("-1") == null)
                            txtStaffTable.Items.Add(new ListItem("¥ÌŒÛ∑Ω∞∏", "-1"));
                        txtStaffTable.Value = "-1";
                    }
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void GetDeptAndStaffTableFangAnItems(ref ListItem[] dept, ref ListItem[] staff)
    {
        List<ListItem> deptList = new List<ListItem>();
        deptList.Add(new ListItem("Œ¥≈‰÷√", ""));
        List<ListItem> staffList = new List<ListItem>();
        staffList.Add(new ListItem("Œ¥≈‰÷√", ""));
        try
        {
            //path = HttpContext.Current.Server.MapPath("~" + path);
            DirectoryInfo di = new DirectoryInfo(path);
            if (di != null && di.Exists)
            {
                List<FileInfo> dbFileInfosNoSort = new List<FileInfo>(di.EnumerateFiles("*.xml", SearchOption.TopDirectoryOnly));
                foreach (FileInfo file in dbFileInfosNoSort)
                {
                    if (!file.Exists || file.Name.Contains("~"))
                        continue;
                    if (OtherDeviceHelper.CheckTableFangAn(file.FullName, new HR_DEPT()))
                        deptList.Add(new ListItem(file.Name, file.Name));
                    else if (OtherDeviceHelper.CheckTableFangAn(file.FullName, new HR_STAFF()))
                        staffList.Add(new ListItem(file.Name, file.Name));
                }
            }
        }
        catch { }
        dept = deptList.ToArray();
        staff = staffList.ToArray();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            HR_CHECKWORKDEVICE valObj = new HR_CHECKWORKDEVICE();
            
            
            if(txtDeviceID.Value !="" )
                valObj.DeviceID = Convert.ToString(txtDeviceID.Value);

            if (txtDeviceName.Value != "")
                valObj.DeviceName = txtDeviceName.Value;

            if (!string.IsNullOrEmpty(wucSelORG1.ORG_ID))
                valObj.ORG_ID = wucSelORG1.ORG_ID;
            
            if(txtUSE_FLAG.Value !="" )
                valObj.USE_FLAG = Convert.ToString(txtUSE_FLAG.Value);

            if (txtDeptTable.Value != "-1")
                valObj.DeptTable = Convert.ToString(txtDeptTable.Value);

            if (txtStaffTable.Value != "-1")
                valObj.StaffTable = Convert.ToString(txtStaffTable.Value);

            if (keyid != "")
            {
                valObj.DeviceID = keyid;
                count = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).Update(valObj, HR_CHECKWORKDEVICE.Attribute.DeviceID);
            }
            else
            {
                count = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).Insert(valObj, HR_CHECKWORKDEVICE.Attribute.DeviceID);
                keyid = valObj.DeviceID.ToString();

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
                    
                    
                    txtDeviceID.Value ="";

                    //zlgchx
                    wucSelORG1 = new ASP.uctrl_sels_wucselorg_ascx();//UCtrl_wucSelORG();//
                    
                    
                    txtUSE_FLAG.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

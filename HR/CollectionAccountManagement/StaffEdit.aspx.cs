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
using AgileFrame.AppInOne.HR;
using AgileFrame.AppInOne.Common;
public partial class HR_CollectionAccountManagement_STAFFEdit2 : AgileFrame.AppInOne.Common.BasePage
{
    HR_STAFF valObj = new HR_STAFF();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected string deptid = "";
    protected string pid = "";
    protected string path = HttpContext.Current.Server.MapPath("~/HR/CollectionAccountManagement/MulSystemXMLProgram/");
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["STAFF_ID"]))
        {
            keyid = Request["STAFF_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["DEPT_ID"]))
        {
            deptid = Request["DEPT_ID"];
        }
        if (!string.IsNullOrEmpty(Request["PID"]))
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {

            txtGENDER.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.GENDER));
            txtWORK_TYPE_CODE.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.WORK_TYPE_CODE));
            txtGENDER.SelectedIndex = 2;

            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_STAFF>.Factory(conn).GetRowData(HR_STAFF.Attribute.STAFF_ID, keyid);
                    if (valObj == null) return;

                    SYS_USER user = BLLTable<SYS_USER>.Factory(conn).GetRowData(SYS_USER.Attribute.STAFF_ID, valObj.STAFF_ID);
                    if (user != null && user.IsNotNull())
                    {
                        txtUSER_ID.Value = Convert.ToString(user.USER_ID);
                        txtUSER_NAME.Value = Convert.ToString(user.USER_NAME);
                        txtUSER_NAME1.Value = Convert.ToString(user.USER_NAME);
                        txtPASS.Value = Convert.ToString(user.PASS);
                    }

                    txtSTAFF_ID.Value = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal                

                    txtSTAFF_NO.Value = Convert.ToString(valObj.STAFF_NO);//Convert.ToString                

                    txtNAME.Value = Convert.ToString(valObj.STAFF_NAME);//Convert.ToString                
                    wucSelDept1.DEPT_ID = valObj.DEPT_ID;
                    //txtDEPT_ID.Value = Convert.ToString(valObj.DEPT_ID);//Convert.ToString                
                    //txtDEPT_Name.Value = BLLTable<HR_DEPT>.Factory(conn).GetOneValue(HR_DEPT.Attribute.DEPT_ID, valObj.DEPT_ID, HR_DEPT.Attribute.DEPT_NAME);
                    wucSelDept1.Enabled = true;

                    txtGENDER.Value = valObj.GENDER;

                    txtPHOTO.Value = Convert.ToString(valObj.PHOTO);//Convert.ToString                

                    txtPOS_NAME.Value = Convert.ToString(valObj.POS_NAME);//Convert.ToString                

                    //txtSTATION_CODE.Value = Convert.ToString(valObj.STATION_CODE);//Convert.ToString                
                    wucSelStation1.STATION_ID = valObj.STATION_CODE;
                    txtWORK_TYPE_CODE.Value = valObj.WORK_TYPE_CODE;

                    txtTECH_LEVEL_CODE.Value = Convert.ToString(valObj.TECH_LEVEL_CODE);//Convert.ToString                

                    txtYMD.Value = Convert.ToString(valObj.YMD);//Convert.ToString                

                    txtMOBILE.Value = Convert.ToString(valObj.MOBILE);//Convert.ToString                

                    txtOFFICE_TEL.Value = Convert.ToString(valObj.OFFICE_TEL);//Convert.ToString                

                    txtCERT_FLAG.Value = Convert.ToString(valObj.CERT_FLAG);//Convert.ToString                

                    txtFIXED_FLAG.Value = Convert.ToString(valObj.FIXED_FLAG);//Convert.ToString                

                    txtON_POS_FLAG.Value = Convert.ToString(valObj.ON_POS_FLAG);//Convert.ToString                

                    txtPROFESSION_CODE.Value = Convert.ToString(valObj.PROFESSION_CODE);//Convert.ToString                

                    txtPROFESSION_BGN_DATE.Value = Convert.ToString(valObj.PROFESSION_BGN_DATE);//Convert.ToString                

                    txtJOIN_DATE.Value = Convert.ToString(valObj.JOIN_DATE);//Convert.ToString                

                    txtPOLITICAL_STATUS_CODE.Value = Convert.ToString(valObj.POLITICAL_STATUS_CODE);//Convert.ToString                

                    txtTITLE_CODE.Value = Convert.ToString(valObj.TITLE_CODE);//Convert.ToString                

                    txtSTATUS_CODE.Value = Convert.ToString(valObj.STATUS_CODE);//Convert.ToString                

                    txtADDR.Value = Convert.ToString(valObj.ADDR);//Convert.ToString                

                    txtEMAIL.Value = Convert.ToString(valObj.EMAIL);//Convert.ToString                

                    txtNATION.Value = Convert.ToString(valObj.NATION);//Convert.ToString                

                    txtNATIVE_PLACE.Value = Convert.ToString(valObj.NATIVE_PLACE);//Convert.ToString                

                    txtPOST_NO.Value = Convert.ToString(valObj.POST_NO);//Convert.ToString                

                    txtDEGREE_CODE.Value = Convert.ToString(valObj.DEGREE_CODE);//Convert.ToString                

                    txtGRAD_SCHOOL.Value = Convert.ToString(valObj.GRAD_SCHOOL);//Convert.ToString                

                    txtGRAD_DATE.Value = Convert.ToString(valObj.GRAD_DATE);//Convert.ToString                

                    txtMAJOR.Value = Convert.ToString(valObj.MAJOR);//Convert.ToString                

                    txtREMARK.Value = Convert.ToString(valObj.REMARK);//Convert.ToString                

                    txtUSER_ID.Value = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal

                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                
                    ViewState["txtSNAME"] = valObj.SNAME;
                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString                

                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                

                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                

                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString
                    //valObj.ORG_ID
                }
                else
                {
                    if (pid != "" && pid != "0")
                    {
                        deptid = BLLTable<HR_STAFF>.Factory(conn).GetOneValue(HR_STAFF.Attribute.STAFF_ID, pid, HR_STAFF.Attribute.DEPT_ID);
                    }

                    if (deptid != "")
                    {
                        wucSelDept1.DEPT_ID = deptid;
                        //wucSelDept1.Enabled = false;
                        //txtDEPT_ID.Value = deptid;
                        //txtDEPT_Name.Value = BLLTable<HR_DEPT>.Factory(conn).GetOneValue(HR_DEPT.Attribute.DEPT_ID, deptid, HR_DEPT.Attribute.DEPT_NAME);
                    }
                }
                LoadOtherDevice(keyid);//载入其他设备的员工信息，并提供编辑
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    private void LoadOtherDevice(string keyid)
    { 
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (ViewState["txtSNAME"] == null || ViewState["txtSNAME"].ToString() != txtSNAME.Value)
        {
            HR_STAFF hadCond = new HR_STAFF();
            hadCond.SNAME = txtSNAME.Value;
            if (BLLTable<HR_STAFF>.Exists(hadCond))
            {
                litWarn.Text = "此员工已经存在，请重新输入！或换个简称。";
                return;
            }
        }
        try
        {
            HR_STAFF valObj = new HR_STAFF();

            if (txtSTAFF_ID.Value != "")
                valObj.STAFF_ID = Convert.ToDecimal(txtSTAFF_ID.Value);


            valObj.STAFF_NO = txtSTAFF_NO.Value;


            valObj.STAFF_NAME = Convert.ToString(txtNAME.Value);


            valObj.DEPT_ID = wucSelDept1.DEPT_ID;

            HR_DEPT dept = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, valObj.DEPT_ID);

            valObj.ORG_ID = dept.ORG_ID;

            valObj.GENDER = Convert.ToString(txtGENDER.Value);


            valObj.PHOTO = Convert.ToString(txtPHOTO.Value);


            valObj.POS_NAME = Convert.ToString(txtPOS_NAME.Value);


            valObj.STATION_CODE = wucSelStation1.STATION_ID;// Convert.ToString(txtSTATION_CODE.Value);


            valObj.WORK_TYPE_CODE = Convert.ToString(txtWORK_TYPE_CODE.Value);


            valObj.TECH_LEVEL_CODE = Convert.ToString(txtTECH_LEVEL_CODE.Value);


            valObj.YMD = txtYMD.Value;


            valObj.MOBILE = Convert.ToString(txtMOBILE.Value);


            valObj.OFFICE_TEL = Convert.ToString(txtOFFICE_TEL.Value);


            valObj.CERT_FLAG = Convert.ToString(txtCERT_FLAG.Value);


            valObj.FIXED_FLAG = Convert.ToString(txtFIXED_FLAG.Value);


            valObj.ON_POS_FLAG = Convert.ToString(txtON_POS_FLAG.Value);


            valObj.PROFESSION_CODE = Convert.ToString(txtPROFESSION_CODE.Value);

            valObj.PROFESSION_BGN_DATE = Convert.ToDateTime(txtPROFESSION_BGN_DATE.Value);

            valObj.JOIN_DATE = Convert.ToDateTime(txtJOIN_DATE.Value);


            valObj.POLITICAL_STATUS_CODE = Convert.ToString(txtPOLITICAL_STATUS_CODE.Value);


            valObj.TITLE_CODE = Convert.ToString(txtTITLE_CODE.Value);


            valObj.STATUS_CODE = Convert.ToString(txtSTATUS_CODE.Value);

            valObj.ADDR = Convert.ToString(txtADDR.Value);

            valObj.EMAIL = Convert.ToString(txtEMAIL.Value);

            valObj.NATION = Convert.ToString(txtNATION.Value);


            valObj.NATIVE_PLACE = Convert.ToString(txtNATIVE_PLACE.Value);

            valObj.POST_NO = Convert.ToString(txtPOST_NO.Value);

            valObj.DEGREE_CODE = Convert.ToString(txtDEGREE_CODE.Value);

            valObj.GRAD_SCHOOL = Convert.ToString(txtGRAD_SCHOOL.Value);

            valObj.GRAD_DATE = Convert.ToDateTime(txtGRAD_DATE.Value);
            valObj.MAJOR = Convert.ToString(txtMAJOR.Value);
            valObj.REMARK = Convert.ToString(txtREMARK.Value);


            if (txtUSER_ID.Value != "")
                valObj.USER_ID = Convert.ToDecimal(txtUSER_ID.Value);

            valObj.SNAME = Convert.ToString(txtSNAME.Value);
            valObj.RNAME = Convert.ToString(txtRNAME.Value);
            valObj.EXP1 = Convert.ToString(txtEXP1.Value);
            valObj.EXP2 = Convert.ToString(txtEXP2.Value);
            valObj.EXP3 = Convert.ToString(txtEXP3.Value);


            if (keyid != "")
            {
                valObj.STAFF_ID = Convert.ToDecimal(keyid);

                count = StaffHelper.EditStaff(valObj);// BLLTable<HR_STAFF>.Factory(conn).Update(valObj, HR_STAFF.Attribute.STAFF_ID);

            }
            else
            {

                keyid = StaffHelper.AddStaff(valObj, pid);
                count = keyid != "" ? 1 : 0;
                //count = BLLTable<HR_STAFF>.Factory(conn).Insert(valObj, HR_STAFF.Attribute.STAFF_ID);
                //keyid = valObj.STAFF_ID.ToString();

            }
            if (count > 0)
            {
                SYS_USER user = BLLTable<SYS_USER>.Factory(conn).GetRowData(SYS_USER.Attribute.STAFF_ID, valObj.STAFF_ID);
                if (user != null && user.IsNotNull())
                {
                    if (txtUSER_NAME.Value != "")
                        user.USER_NAME = Convert.ToString(txtUSER_NAME.Value);

                    if (txtPASS.Value != "")
                        user.PASS = StringHelperExd.StringToMD5(txtPASS.Value);

                    user.EDITTIME = DateTime.Now;

                    int count2 = BLLTable<SYS_USER>.Factory(conn).Update(user, SYS_USER.Attribute.USER_ID);
                }
                else
                {
                    user = new SYS_USER();

                    if (txtUSER_NAME.Value != "")
                        user.USER_NAME = Convert.ToString(txtUSER_NAME.Value);

                    if (txtPASS.Value != "")
                        user.PASS = Convert.ToString(txtPASS.Value);
                    else
                        user.PASS =StringHelperExd.StringToMD5("123456");
                    
                    user.STAFF_ID = valObj.STAFF_ID;
                    user.USER_TYPE = EnumInfo.SYS_UserType.Common.ToString("d");
                    user.USE_FLAG = "1";
                    user.EDITTIME = DateTime.Now;
                    user.ADDTIME = DateTime.Now;
                    user.REAL_NAME = valObj.STAFF_NAME;
                    user.RNAME = user.USER_NAME;
                    user.SNAME = user.USER_NAME;
                    int count2 = BLLTable<SYS_USER>.Factory(conn).Insert(user, SYS_USER.Attribute.USER_ID);
                }

                //StringBuilder sbData = new StringBuilder("({valObj:''");
                //List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                //for (int i = 0; i < lstCol.Count; i++)
                //{
                //    object val = valObj.GetValue(lstCol[i]);
                //    if (val != null)
                //    {
                //        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                //    }
                //}
                //sbData.Append("})");
                string re = "re";
                if (pid != "") {
                    //re = "STAFFManage.aspx?PID="+pid;
                }
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + re + "';}else{window.returnValue = '" + re + "';}window.close();", true);
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

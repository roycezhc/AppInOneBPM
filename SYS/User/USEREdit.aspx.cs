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
using AgileFrame.AppInOne.SYS;

public partial class SYS_USEREdit : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USER valObj = new SYS_USER();
    int count = 0;
    public string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            //Response.Write(keyid);                            
            txtSTATE_FLAG.Items.AddRange(FormHelper.GetListItem(SYS_USER.Attribute.USE_FLAG));

            txtUSER_TYPE.Items.AddRange(FormHelper.GetListItem(SYS_USER.Attribute.USER_TYPE));

            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_USER>.Factory(conn).GetRowData(SYS_USER.Attribute.USER_ID, keyid);
                    if (valObj == null) return;

                    List<SYS_USERROLE> lst = BLLTable<SYS_USERROLE>.Factory(conn).Select(SYS_USERROLE.Attribute.USER_ID, keyid);
                    string user_role = "";
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            user_role += user_role == "" ? lst[i].ROLE_ID.ToString() : "," + lst[i].ROLE_ID;
                        }
                    }

                    hidSelReals.Value = user_role;

                    txtUSER_ID.Value = Convert.ToString(valObj.USER_ID);//Convert.ToDecimal                

                    txtUSER_NAME.Value = Convert.ToString(valObj.USER_NAME);//Convert.ToString                
                    ViewState["txtUSER_NAME"] = valObj.USER_NAME;
                    //txtPASS.Value = Convert.ToString(valObj.PASS);//Convert.ToString                

                    txtEMAIL.Value = Convert.ToString(valObj.EMAIL);//Convert.ToString                

                    txtLOGIN_IPS.Value = Convert.ToString(valObj.LOGIN_IPS);//Convert.ToString    
                    #region   wk(用户新增字段)
                    txtUSER_QQ.Value = Convert.ToString(valObj.USER_QQ);//Convert.ToString       
                    txtUSER_Taobao.Value = Convert.ToString(valObj.USER_Taobao);//Convert.ToString       
                    txtIS_FeiQ_Remind.Checked = Convert.ToBoolean(valObj.IS_FeiQ_Remind);//Convert.ToString     
                    txtIS_EMAIL_Remind.Value = Convert.ToString(valObj.IS_EMAIL_Remind);//Convert.ToString     
                    txtIS_Taobao_Remind.Value = Convert.ToString(valObj.IS_Taobao_Remind);//Convert.ToString     
                    txtIS_QQ_Remind.Value = Convert.ToString(valObj.IS_QQ_Remind);//Convert.ToString  
                    #endregion
                    if (!string.IsNullOrEmpty(valObj.USE_FLAG))
                    {
                        txtSTATE_FLAG.Value = valObj.USE_FLAG.ToString();
                    }
                    if (!string.IsNullOrEmpty(valObj.USER_TYPE))
                    {
                        txtUSER_TYPE.Value = valObj.USER_TYPE.ToString();
                    }

                    HR_STAFF staff = BLLTable<HR_STAFF>.Factory(conn).GetRowData(HR_STAFF.Attribute.STAFF_ID, valObj.STAFF_ID);
                    if (staff == null || staff.IsNull())
                    {
                        litWarn.Text = "此账户未有对应员工信息，建议增加关联或删除无效账户";                        
                    }
                    else
                    {
                        wucSelStaff1.Staff_ID = staff.STAFF_ID;
                        wucSelStaff1.Staff_NAME = valObj.REAL_NAME;   //wk 2012年9月14日 15:29:18
                    }

                    btnSave.Enabled = false;
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
        if (ViewState["txtUSER_NAME"] == null || ViewState["txtUSER_NAME"].ToString() != txtUSER_NAME.Value)
        {
            SYS_USER hadCond = new SYS_USER();
            hadCond.USER_NAME = txtUSER_NAME.Value;
            if (BLLTable<SYS_USER>.Exists(hadCond))
            {
                litWarn.Text = "此用户已经存在，请重新输入！或换个名称。";
                return;
            }
        }
        try
        {
            SYS_USER valObj = new SYS_USER();


            if (txtUSER_ID.Value != "")
                valObj.USER_ID = Convert.ToDecimal(txtUSER_ID.Value);


            if (txtUSER_NAME.Value != "")
                valObj.USER_NAME = Convert.ToString(txtUSER_NAME.Value);


            if (txtPASS.Value != "")
                valObj.PASS =StringHelperExd.StringToMD5(txtPASS.Value);


            if (txtEMAIL.Value != "")
                valObj.EMAIL = Convert.ToString(txtEMAIL.Value);


            if (txtLOGIN_IPS.Value != "")
                valObj.LOGIN_IPS = Convert.ToString(txtLOGIN_IPS.Value);
            #region   wk(用户新增字段)
            //if (txtUSER_QQ.Value != "")
                valObj.USER_QQ = Convert.ToString(txtUSER_QQ.Value);

            if (txtUSER_Taobao.Value != "")
                valObj.USER_Taobao = Convert.ToString(txtUSER_Taobao.Value);

            if (txtIS_FeiQ_Remind.Checked != true)
                valObj.IS_FeiQ_Remind = Convert.ToBoolean(txtIS_FeiQ_Remind.Checked);

            if (txtIS_EMAIL_Remind.Checked != true)
                valObj.IS_EMAIL_Remind = Convert.ToBoolean(txtIS_EMAIL_Remind.Checked);

            if (txtIS_Taobao_Remind.Checked != true)
                valObj.IS_Taobao_Remind = Convert.ToBoolean(txtIS_Taobao_Remind.Checked);

            if (txtIS_QQ_Remind.Checked != true)
                valObj.IS_QQ_Remind = Convert.ToBoolean(txtIS_QQ_Remind.Checked);

            if (txtSTATE_FLAG.Value != "")
                valObj.USE_FLAG = Convert.ToString(txtSTATE_FLAG.Value);
            #endregion

            if (txtUSER_TYPE.Value != "")
                valObj.USER_TYPE = Convert.ToString(txtUSER_TYPE.Value);
            else
                valObj.USER_TYPE = "1";

            valObj.STAFF_ID = wucSelStaff1.Staff_ID;

            valObj.REAL_NAME = wucSelStaff1.Staff_NAME;
            if (keyid != "")
            {
                valObj.EDITTIME = DateTime.Now;
                valObj.USER_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_USER>.Factory(conn).Update(valObj, SYS_USER.Attribute.USER_ID);
            }
            else
            {
                valObj.EDITTIME = DateTime.Now;
                valObj.ADDTIME = DateTime.Now;
                count = BLLTable<SYS_USER>.Factory(conn).Insert(valObj, SYS_USER.Attribute.USER_ID);
                keyid = valObj.USER_ID.ToString();

            }            

            if (count > 0)
            {
                BLLTable<HR_STAFF>.Factory(conn).Update(HR_STAFF.Attribute.STAFF_ID, wucSelStaff1.Staff_ID, HR_STAFF.Attribute.USER_ID, keyid);

                BLLTable<SYS_USERROLE>.Factory(conn).Delete(SYS_USERROLE.Attribute.USER_ID, keyid);//先删除角色用户关联
                string[] roles = StringHelper.GetStringArray(hidSelReals.Value, ',');//再根据当前选择的角色写入关联表
                if (roles != null)
                {
                    for (int i = 0; i < roles.Length; i++)
                    {
                        SYS_USERROLE ur = new SYS_USERROLE();
                        ur.ROLE_ID = int.Parse(roles[i]);
                        ur.USER_ID = int.Parse(keyid);
                        BLLTable<SYS_USERROLE>.Factory(conn).Insert(ur);
                    }
                }

                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        if (lstCol[i] == SYS_USER.Attribute.ADDTIME)
                        {
                            continue;
                        }
                        if (lstCol[i] == SYS_USER.Attribute.EDITTIME)
                        {
                            val = Convert.ToDateTime(val).ToString("yyyy-MM-dd");
                        }
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");
                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    txtUSER_NAME.Value = "";
                    txtPASS.Value = "";
                    txtEMAIL.Value = "";
                    txtLOGIN_IPS.Value = "";
                    txtSTATE_FLAG.Value = "";
                    txtUSER_TYPE.Value = "";
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "parent.addNewToList(\"" + sbData.ToString() + "\");", true);
                    ViewState["hadSave"] = 1;
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

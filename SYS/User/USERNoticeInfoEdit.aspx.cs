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
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;

public partial class SYS_USERNoticeInfoEdit : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USER valObj = new SYS_USER();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "消息通知管理";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
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
                    txtIS_EMAIL_Remind.Checked = Convert.ToBoolean(valObj.IS_EMAIL_Remind);//Convert.ToString     
                    txtIS_Taobao_Remind.Checked = Convert.ToBoolean(valObj.IS_Taobao_Remind);//Convert.ToString     
                    txtIS_QQ_Remind.Checked = Convert.ToBoolean(valObj.IS_QQ_Remind);//Convert.ToString  
                    #endregion
                    HR_STAFF staff = BLLTable<HR_STAFF>.Factory(conn).GetRowData(HR_STAFF.Attribute.STAFF_ID, valObj.STAFF_ID);
                    if (staff == null || staff.IsNull())
                    {
                        litWarn.Text = "此账户未有对应员工信息，建议增加关联或删除无效账户";                        
                    }
                    else
                    {
                        txtREAL_NAME.Value = valObj.REAL_NAME;
                    }

                    btnSave.Enabled = true;
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
        string ipsStr = txtLOGIN_IPS.Value;
        if (!string.IsNullOrEmpty(ipsStr))
        {
            string[] ips = ipsStr.Split(',');
            foreach (string ipstr in ips)
            {
                IPAddress ip = null;
                if (!IPAddress.TryParse(ipstr, out ip))
                {
                    Response.Write("<script type=\"text/javascript\">alert('IP地址" + ipstr + "格式错误！');</script>");
                    return;
                }
            }
            if (ips.Length > 5)
            {
                Response.Write("<script type=\"text/javascript\">alert('工作IP个数大于5个！');</script>");
                return;
            }
        }
        if (!string.IsNullOrEmpty(txtUSER_QQ.Value))
        {
            decimal qq = -1;
            if (!decimal.TryParse(txtUSER_QQ.Value, out qq))
            {
                Response.Write("<script type=\"text/javascript\">alert('QQ号格式错误！');</script>");
                return;
            }
        }
        if (!string.IsNullOrEmpty(txtEMAIL.Value))
        {
            if(!Regex.IsMatch(txtEMAIL.Value, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")) 
            {
                Response.Write("<script type=\"text/javascript\">alert('Email地址格式错误！');</script>");
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

            if (txtEMAIL.Value != "")
                valObj.EMAIL = Convert.ToString(txtEMAIL.Value);

            if (txtLOGIN_IPS.Value != "")
                valObj.LOGIN_IPS = Convert.ToString(txtLOGIN_IPS.Value);
            #region   wk(用户新增字段)
            if (txtUSER_QQ.Value != "")
                valObj.USER_QQ = Convert.ToString(txtUSER_QQ.Value);

            if (txtUSER_Taobao.Value != "")
                valObj.USER_Taobao = Convert.ToString(txtUSER_Taobao.Value);

            //if (txtIS_FeiQ_Remind.Checked != true)
            valObj.IS_FeiQ_Remind = Convert.ToBoolean(txtIS_FeiQ_Remind.Checked);

            //if (txtIS_EMAIL_Remind.Checked != true)
            valObj.IS_EMAIL_Remind = Convert.ToBoolean(txtIS_EMAIL_Remind.Checked);

            //if (txtIS_Taobao_Remind.Checked != true)
            valObj.IS_Taobao_Remind = Convert.ToBoolean(txtIS_Taobao_Remind.Checked);

            //if (txtIS_QQ_Remind.Checked != true)
            valObj.IS_QQ_Remind = Convert.ToBoolean(txtIS_QQ_Remind.Checked);
            #endregion
            if (keyid != "")
            {
                valObj.EDITTIME = DateTime.Now;
                valObj.USER_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_USER>.Factory(conn).Update(valObj, SYS_USER.Attribute.USER_ID);
                if (count > 0)
                    Response.Write("<script type=\"text/javascript\">alert('保存成功！');</script>");
                else
                    Response.Write("<script type=\"text/javascript\">alert('保存失败！');</script>");
            }          
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

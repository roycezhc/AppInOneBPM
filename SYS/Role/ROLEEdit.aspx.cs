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
using AgileFrame.AppInOne.SYS;
public partial class SYS_ROLEEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string pid = "0";
    int count = 0;
    string keyid = "";
    protected string title = "";
    SYS_ROLE valObj = new SYS_ROLE();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            txtCREATER.Value = userBase.RealName;
            try
            {
                if (keyid!="")
                {

                    valObj = BLLTable<SYS_ROLE>.Factory(conn).GetRowData(SYS_ROLE.Attribute.ROLE_ID, keyid);
                    if(valObj==null) return ;

                    txtROLE_ID.Value = Convert.ToString(valObj.ROLE_ID);//Convert.ToInt32                
                    
                    txtROLE_NAME.Value = Convert.ToString(valObj.ROLE_NAME);//Convert.ToString                
                    
                    txtCREATER.Value = Convert.ToString(valObj.CREATER);//Convert.ToString                
                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                

                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString          
                   // txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                
                }
            }
            catch (Exception ex)
            {
                lbInfo.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            SYS_ROLE valObj = new SYS_ROLE();


            if (txtROLE_ID.Value != "")
                valObj.ROLE_ID = Convert.ToInt32(txtROLE_ID.Value);

                valObj.ROLE_NAME = Convert.ToString(txtROLE_NAME.Value);

                //valObj.CREATER = Convert.ToString(txtCREATER.Value);

                valObj.SNAME = Convert.ToString(txtSNAME.Value);


                valObj.RNAME = Convert.ToString(txtRNAME.Value);
            if (keyid!="")
            {
                valObj.ROLE_ID = Convert.ToInt32(keyid);

                count = RoleHelper.EditRole(valObj);// BLLTable<SYS_ROLE>.Factory(conn).Update(valObj, SYS_ROLE.Attribute.ROLE_ID);
            }
            else
            {
                valObj.CREATIME = DateTime.Now;
                keyid = RoleHelper.AddRole(valObj, pid);
                count = keyid == "" ? 0 : 1;// BLLTable<SYS_ROLE>.Factory(conn).Insert(valObj, SYS_ROLE.Attribute.ROLE_ID);

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("({valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        if (lstCol[i] == SYS_ROLE.Attribute.CREATIME) {
                            continue;
                        }
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("})");

                string re = "re";
                if (pid != "")
                {
                    re = "ROLEManage.aspx?PID=" + pid;
                }

                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + re + "';}else{window.returnValue = '" + re + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + re + "';}else{window.returnValue = '" + re + "';}window.close();", true);
                    }
                }
                else
                {
                    txtROLE_NAME.Value = "";
                    txtCREATER.Value = "";
                    ViewState["hadSave"] = 1;
                }
            }
        }
        catch (Exception ex)
        {
            lbInfo.Text = ex.Message;
        }
    }

}

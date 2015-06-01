using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class UCtrl_Sels_wucSelSub_Stru : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string appPath = "";

    public bool Enabled
    {
        set
        {
            btnSelDept.Visible = value;
            txtDEPT_NAME.Disabled = !value;
        }
    }

    public string DEPT_ID
    {
        get
        {
            return hidDEPT_ID.Value != "" ? hidDEPT_ID.Value : "0";
        }
        set
        {
            hidDEPT_ID.Value = value;
            if (txtDEPT_NAME.Value == "")
            {
                txtDEPT_NAME.Value = BLLTable<TJ_SUB_STRU>.Factory(conn).GetOneValue(TJ_SUB_STRU.Attribute.SUB_ID, value, TJ_SUB_STRU.Attribute.SUB_NAME);
            }
        }
    }
    public string DEPT_NAME
    {
        get
        {
            return txtDEPT_NAME.Value;
        }
        set
        {
            txtDEPT_NAME.Value = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        appPath = WebHelper.GetAppPath();

        StringBuilder sbJS = new StringBuilder();
        sbJS.Append("<script type='text/javascript'>function selDept_E(me){}; function selDept(me) {");
        sbJS.Append("var hidOrg=$(\"input[id$='hidORG_ID']\");var orgidstr='';if(hidOrg.length>0){if(hidOrg.val()==''){alert('请先选择分支机构！');return;}else{orgidstr='&ORG_ID='+hidOrg.val();}}");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "HR/TJ_SUB_STRU/DeptSel.aspx?r=' + Math.random()+orgidstr, 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');");
        sbJS.Append("if (result == undefined || result == '') return;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.name;");
        sbJS.Append("puts[1].value = obj.id;");
        sbJS.Append("if(selDept_E){selDept_E(me);}");
        sbJS.Append("}</script>");
        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelDept"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelDept", sbJS.ToString());
        }
    }
}
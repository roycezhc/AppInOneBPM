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

public partial class UCtrl_wucSelORG : AgileFrame.AppInOne.Common.BaseUserControl
{
    private string conn = "conn";
    protected string appPath = "";

    public bool Enabled
    {
        set
        {
            btnSelDept.Visible = value;
            txtORG_NAME.Disabled = !value;
        }
    }

    public string ORG_ID
    {
        get
        {
           return hidORG_ID.Value != "" ? hidORG_ID.Value : "0";
        }
        set
        {
            hidORG_ID.Value = value;
            if (txtORG_NAME.Value == "")
            {
                txtORG_NAME.Value = BLLTable<HR_ORG>.Factory(conn).GetOneValue(HR_ORG.Attribute.ORG_ID, value, HR_ORG.Attribute.ORG_NAME);
            }
        }
    }
    public string ORG_NAME
    {
        get
        {
            return txtORG_NAME.Value;
        }
        set
        {
            txtORG_NAME.Value = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        appPath = WebHelper.GetAppPath();

        StringBuilder sbJS = new StringBuilder();
        sbJS.Append("<script type='text/javascript'>function selORG(me) {");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "HR/ORG/ORGSel.aspx?r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');");
        sbJS.Append("if (result == undefined || result == '') return;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.name;");
        sbJS.Append("puts[1].value = obj.id;");
        sbJS.Append("}</script>");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelORG"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelORG", sbJS.ToString());
        }

    }
}
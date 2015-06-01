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
public partial class UCtrl_Sels_wucSelDept : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string appPath = "";

    protected string leftText = "";

    public string orgid = "";
    public string pdeptid = "";

    public string ORG_ID
    {
        get { return orgid; }
        set { orgid = value; }
    }

    public string P_DEPT_ID
    {
        get { return pdeptid; }
        set { pdeptid = value; }
    }

    public string LeftText
    {
        get { return string.IsNullOrEmpty(leftText) ? "" : ("<a>" + leftText + "</a>"); }
        set { leftText = value; }
    }

    protected string sWidth = "";

    public string SWidth
    {
        get { return sWidth; }
        set
        {
            if (string.IsNullOrEmpty(value))
                return;
            sWidth = value;
            try
            {
                txtDEPT_NAME.Style.Value = "float:left;width:" + value + ";";
            }
            catch { }
        }
    }

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
                txtDEPT_NAME.Value = BLLTable<HR_DEPT>.Factory(conn).GetOneValue(HR_DEPT.Attribute.DEPT_ID, value, HR_DEPT.Attribute.DEPT_NAME);
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
        sbJS.Append("<script type='text/javascript'>function selDept_E(me){}; function selDept(me,orgid,pdeptid) {");
        sbJS.Append("window.me=me;");
        sbJS.Append("var orgidstr='';if(orgid>0){orgidstr='&ORG_ID='+orgid}");
        sbJS.Append("var pdeptidstr='';if(pdeptid>0){pdeptidstr='&P_DEPT_ID='+pdeptid;}");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "HR/DEPT/DeptSel.aspx?r=' + Math.random()+orgidstr+pdeptidstr, 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:;');");
        sbJS.Append("if (result == undefined || result == '') return;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.name;");
        sbJS.Append("puts[1].value = obj.id;");
        sbJS.Append("if(selDept_E){selDept_E(me);}");
        sbJS.Append("}\r\n");

        sbJS.Append("function cb2(){result = window.returnValue;\r\n");
        sbJS.Append("var obj = eval(result);\r\n");
        sbJS.Append("console.log('asdasdas:'+result);\r\n");
        sbJS.Append("$(me).prev().prev().val(obj.name);\r\n");
        sbJS.Append("$(me).prev().val(obj.id);\r\n");
        sbJS.Append("}</script>");
        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelDept"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelDept", sbJS.ToString());
        }
    }
}
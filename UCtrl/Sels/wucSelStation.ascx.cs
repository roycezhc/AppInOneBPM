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
public partial class UCtrl_Sels_wucSelStation : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string appPath = "";

    public bool Enabled
    {
        set
        {
            btnSelStation.Visible = value;
            txtDEPT_NAME.Disabled = !value;
        }
    }
    //public string 
    public string STATION_ID
    {
        get
        {
            return hidStation_ID.Value != "" ? hidStation_ID.Value : "0";
        }
        set
        {
            hidStation_ID.Value = value;
            if (txtDEPT_NAME.Value == "")
            {
                txtDEPT_NAME.Value = BLLTable<HR_STATION>.Factory(conn).GetOneValue(HR_STATION.Attribute.STATION_ID, value, HR_STATION.Attribute.STATION_NAME);
            }
        }
    }
    public string STATION_NAME
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
        sbJS.Append("<script type='text/javascript'>function selStation_E(me){}; function selStation(me) {");
        sbJS.Append("window.me=me;");
        sbJS.Append("var hidOrg=$(\"input[id$='hidORG_ID']\");var orgidstr='';if(hidOrg.length>0){if(hidOrg.val()==''){alert('请先选择机构！');return;}else{orgidstr='&ORG_ID='+hidOrg.val();}}");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "HR/STATION/StationSelect.aspx?r=' + Math.random()+orgidstr, 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');");
        sbJS.Append("if (result == undefined || result == '') return;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.name;");
        sbJS.Append("puts[1].value = obj.id;");
        sbJS.Append("if(selDept_E){selStation_E(me);}");
        sbJS.Append("}");

        sbJS.Append("function cb2(){result = window.returnValue;\r\n");
        sbJS.Append("var obj = eval(result);\r\n");
        sbJS.Append("console.log('asdasdas:'+result);\r\n");
        sbJS.Append("$(me).prev().prev().val(obj.name);\r\n");
        sbJS.Append("$(me).prev().val(obj.id);\r\n");
        sbJS.Append("}</script>");
        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelSTATION_ID"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSeSTATION_ID", sbJS.ToString());
        }
    }
}
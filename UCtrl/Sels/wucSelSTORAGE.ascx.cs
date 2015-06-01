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
public partial class UCtrl_wucSelSTORAGE : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string appPath = "";
    
    public bool ShowBtn
    {
        set
        {
            btnSelSTOR.Visible = value;
        }
    }

    public bool Enabled
    {
        set
        {
            btnSelSTOR.Visible = value;
            txtSTOR_NAME.Disabled = !value;
        }
    }

    public decimal STOR_ID
    {
        get
        {
            return hidSTOR_ID.Value != "" ? decimal.Parse(hidSTOR_ID.Value) : 0;
        }
        set
        {
            hidSTOR_ID.Value = value.ToString();
            txtSTOR_NAME.Value = BLLTable<HR_STAFF>.Factory(conn).GetOneValue(HR_STAFF.Attribute.STAFF_ID, value, HR_STAFF.Attribute.SNAME);
        }
    }
    public string STOR_NAME
    {
        get
        {
            return txtSTOR_NAME.Value;
        }
        set
        {
            txtSTOR_NAME.Value = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        appPath = WebHelper.GetAppPath();

        StringBuilder sbJS = new StringBuilder();
        sbJS.Append("<script type='text/javascript'>function selSTORAGE(me) {");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "PSM/STORAGE/STORAGESel.aspx?r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;');");
        sbJS.Append("if (result == undefined || result == '') return;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("if($(me).attr('type')=='text'){$(me).val(obj.Name);$(me).next().val(obj.ID);}else{");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.Name;");
        sbJS.Append("puts[1].value = obj.ID;}");
        sbJS.Append("}</script>");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelSTORAGE"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelSTORAGE", sbJS.ToString());
        }

    }
}
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
public partial class UCtrl_wucSelStaff : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string appPath = "";

    protected string leftText = "";

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
                txtStaff_NAME.Style.Value = "float:left;width:" + value + ";";
            }
            catch { }
        }
    }


    public bool Enabled
    {
        set
        {
            btnSelStaff.Visible = value;
            txtStaff_NAME.Disabled = !value;
        }
    }

    public decimal Staff_ID
    {
        get
        {
            return hidStaff_ID.Value != "" ? decimal.Parse(hidStaff_ID.Value) : 0;
        }
        set
        {
            hidStaff_ID.Value = value.ToString();
            if (txtStaff_NAME.Value == "")
            {
                txtStaff_NAME.Value = BLLTable<HR_STAFF>.Factory(conn).GetOneValue(HR_STAFF.Attribute.STAFF_ID, value, HR_STAFF.Attribute.STAFF_NAME);
            }
        }
    }
    public string Staff_NAME
    {
        get
        {
            return txtStaff_NAME.Value;
        }
        set
        {
            txtStaff_NAME.Value = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        appPath = WebHelper.GetAppPath();

        StringBuilder sbJS = new StringBuilder();
        sbJS.Append("<script type='text/javascript'>function selDept_First(me){return true;}; function selStaff(me) {");
        sbJS.Append("window.me=me;");
        sbJS.Append("if(selDept_First){if(selDept_First(me)==false){return;}}");
        sbJS.Append("var moreP=$(me).attr('moreP');if(moreP==undefined){moreP='';}");
        sbJS.Append("var result = window.showModalDialog('" + appPath + "HR/Staff/STAFFSel.aspx?r=' + Math.random()+'&'+moreP, 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;');");
        
        sbJS.Append("if (!(result == undefined || result == '')) { ");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("var puts = $(me).parent().find('input');");
        sbJS.Append("puts[0].value = obj.Name;");
        sbJS.Append("puts[1].value = obj.ID;}}");

        sbJS.Append("function cb(){result = window.returnValue;");
        sbJS.Append("var obj = eval(result);");
        sbJS.Append("$(me).prev().prev().val(obj.Name);");
        sbJS.Append("$(me).prev().val(obj.ID);");
        sbJS.Append("}</script>");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelStaff"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelStaff", sbJS.ToString());
        }

    }
}
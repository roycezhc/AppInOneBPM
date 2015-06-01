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
using AgileFrame.Common;

public partial class UCtrl_wucSelTemplate : AgileFrame.AppInOne.Common.BaseUserControl
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
                txtTABLE_NAME.Style.Value = "float:left;width:" + value + ";";
            }
            catch { }
        }
    }

    public bool Enabled
    {
        set
        {
            btnSelDept.Visible = value;
            txtTABLE_NAME.Disabled = !value;
        }
    }
    //DEPT_ID
    public string TABLE_ID
    {
        get
        {
            return hidTABLE_ID.Value != "" ? hidTABLE_ID.Value : "0";
        }
        set
        {
            hidTABLE_ID.Value = value;
            if (txtTABLE_NAME.Value == "")
            {
                ITableImplement itable1 = new ITableImplementHelper(conn).Factory(DBTableName);
                
                txtTABLE_NAME.Value
                    = BLLTable<ITableImplement>.Factory(conn).GetOneValue(new AttributeItem(DBTableName, ID_FIELD),
                    value, new AttributeItem(DBTableName, NAME_FIELD));
            }
        }
    }
    //DEPT_NAME
    public string TABLE_NAME
    {
        get
        {
            return txtTABLE_NAME.Value;
        }
        set
        {
            txtTABLE_NAME.Value = value;
        }
    }

    #region 模板式输入参数

    protected string DBTableName = "";//表名
    protected string ID_FIELD = "";//表的id
    protected string NAME_FIELD = "";//表的名称
    protected string PID_FIELD = "";//表的父对象id
    protected string IsTypeTree = "";//是否为树结构
    ITableImplement itable = null;
    ITableImplement itable_P = null;

    private bool initParam()
    {
        if (string.IsNullOrEmpty(Request["template"]))//表名
            DBTableName = Convert.ToString(Request["template"]);
        if (string.IsNullOrEmpty(Request["template_id"]))//表的id
            ID_FIELD = Convert.ToString(Request["template_id"]);
        if (string.IsNullOrEmpty(Request["template_name"]))//表的名称
            NAME_FIELD = Convert.ToString(Request["template_name"]);
        if (string.IsNullOrEmpty(Request["template_pid"]))//表的父对象id
            PID_FIELD = Convert.ToString(Request["template_pid"]);
        if (string.IsNullOrEmpty(Request["template_type"]))//是否为树结构
            IsTypeTree = Convert.ToString(Request["template_type"]);

        itable = new ITableImplementHelper(conn).Factory(DBTableName);
        if (string.IsNullOrEmpty(DBTableName)
            || string.IsNullOrEmpty(ID_FIELD)
            || string.IsNullOrEmpty(NAME_FIELD)
            || itable == null || itable.IsNull()
            )
        {
            return false;
        }
        return true;
    }

    private string getParamStr()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("&template=").Append(DBTableName);
        sb.Append("&template_id=").Append(ID_FIELD);
        sb.Append("&template_name=").Append(NAME_FIELD);
        sb.Append("&template_pid=").Append(PID_FIELD);
        sb.Append("&template_type=").Append(IsTypeTree);
        return sb.ToString();
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        appPath = WebHelper.GetAppPath();

        if (!initParam()) return;//zlg

        StringBuilder sbJS = new StringBuilder();
        //支持单选结构：
        //树结构
        if (IsTypeTree == "1")
        {
            sbJS.Append("<script type='text/javascript'>function selDept_First(me){}; function selDept(me) {");
            if (!string.IsNullOrEmpty(PID_FIELD))
            {
                sbJS.Append("var hidOrg=$(\"input[id$='hidORG_ID']\");var orgidstr='';if(hidOrg.length>0){if(hidOrg.val()==''){alert('请先选择父对象！');return;}else{orgidstr='&ORG_ID='+hidOrg.val();}}");
            }
            else
            {
                sbJS.Append("var orgidstr='';");
            }
            //多了这两句
            sbJS.Append("if(selDept_First){if(selDept_First(me)==false){return;}}");
            sbJS.Append("var moreP=$(me).attr('moreP');if(moreP==undefined){moreP='';}");
            //HR/DEPT/DeptSel.aspx
            sbJS.Append("var result = window.showModalDialog('" + appPath + "UCtrl/Sels/DeptSel.aspx?r=' + Math.random()+orgidstr+'&'+moreP" + getParamStr() + ", 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;');");
            sbJS.Append("if (result == undefined || result == '') return;");
            sbJS.Append("var obj = eval(result);");
            sbJS.Append("var puts = $(me).parent().find('input');");
            sbJS.Append("puts[0].value = obj.name;");
            sbJS.Append("puts[1].value = obj.id;");
            sbJS.Append("if(selDept_First){selDept_First(me);}");
            sbJS.Append("}</script>");
        }
        else//非树结构
        {
            sbJS.Append("<script type='text/javascript'>function selDept_First(me){return true;}; function selStaff(me) {");
            if (!string.IsNullOrEmpty(PID_FIELD))
            {
                sbJS.Append("var hidOrg=$(\"input[id$='hidORG_ID']\");var orgidstr='';if(hidOrg.length>0){if(hidOrg.val()==''){alert('请先选择父对象！');return;}else{orgidstr='&ORG_ID='+hidOrg.val();}}");
            }
            else
            {
                sbJS.Append("var orgidstr='';");
            }
            sbJS.Append("if(selDept_First){if(selDept_First(me)==false){return;}}");
            sbJS.Append("var moreP=$(me).attr('moreP');if(moreP==undefined){moreP='';}");
            //HR/Staff/STAFFSel.aspx
            sbJS.Append("var result = window.showModalDialog('" + appPath + "UCtrl/Sels/STAFFSel.aspx?r=' + Math.random()+orgidstr+'&'+moreP" + getParamStr() + ", 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=no;');");
            sbJS.Append("if (result == undefined || result == '') return;");
            sbJS.Append("var obj = eval(result);");
            sbJS.Append("var puts = $(me).parent().find('input');");
            sbJS.Append("puts[0].value = obj.Name;");
            sbJS.Append("puts[1].value = obj.ID;");
            sbJS.Append("}</script>");
        }
        string js1 = sbJS.ToString().Replace("ORG_ID", PID_FIELD)
            .Replace("", "");
        if (!Page.ClientScript.IsClientScriptBlockRegistered("gotoSelDept"))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "gotoSelDept", js1);
        }
    }
}
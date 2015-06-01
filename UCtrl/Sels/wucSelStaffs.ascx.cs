using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class UCtrl_wucSelStaffs: AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string selMore = "";
    protected string dirPre = "";
    string getDirPre()
    {
        string str = "";
        int rootDepth = Request.Url.Segments.Length - 2;
        if (Request.ApplicationPath.Length > 1)
        {
            rootDepth -= 1;
        }
        for (int i = 0; i < rootDepth; i++)
        {
            str += "../";
        }
        return str;
    }

    public bool isSelMore
    {
        set
        {
            if (value == true)
            {
                selMore = "&sel=1";
            }
            else
            {
                selMore = "";
            }
        }
        get
        {
            if (selMore != "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    public string GetSelEmpIDS()
    {
        return hidStaffIDS.Value;
    }

    public void SetSelEmps(string empids)
    {
        hidStaffIDS.Value = empids;
        litEmps.Text = StaffHelper.ShowSelEmpHTML(empids,false);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            dirPre = getDirPre();

            ClientScriptManager sm =Page.ClientScript;
            if(!sm.IsClientScriptIncludeRegistered("selEmp")){
               sm.RegisterClientScriptInclude("selEmp",dirPre+"UCtrl/js/SelEmp.js");
            }
        }
    }
}
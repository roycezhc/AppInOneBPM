using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
/// <summary>
/// 模版示例
/// </summary>
public partial class UCtrl_DeptSels : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            DeptHelper.InitDeptDPTree(trDpt.Nodes, "0", "", "");

        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {

        StringBuilder sb = new StringBuilder();
        foreach (TreeNode tn in trDpt.CheckedNodes)
        {
            if (sb.Length > 0)
            {
                sb.Append(",");
            }
            sb.Append("{DptID:'" + tn.Value + "',DptName:'" + tn.Text + "'}");
        }
        string js = "";
        if (sb.Length > 0)
        {
            js = "var str=\"[" + sb.ToString() + "]\";if (window.opener){window.opener.returnValue = str;}else{window.returnValue = str;}window.close();";
        }
        AgileFrame.Core.ScriptHelper.ResponseScriptToEnd(Page, js, false);

    }
}
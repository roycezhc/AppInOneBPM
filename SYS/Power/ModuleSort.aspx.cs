using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class sys_MenuInfoSort: AgileFrame.AppInOne.Common.BasePage
{
    SYS_MODULE condObj = new SYS_MODULE();
    SYS_MODULE valObj = new SYS_MODULE();
    List<SYS_MODULE> listObj = new List<SYS_MODULE>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request["PID"]))
            {
                condObj.P_MDL_ID =Request["PID"];
                BindList(condObj);
            }
           
        }
    }

    private void BindList(SYS_MODULE condObj)
    {
        valObj.OrderBy(SYS_MODULE.Attribute.SORT_NO, Order.Asc);
        listObj = BLLTable<SYS_MODULE>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        string[] arr =StringHelper.GetStringArray(Request["hidSortInfo"],'|');
        if (arr != null&&arr.Length>0)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                string[] aaa = arr[i].Split(',');
                BLLTable<SYS_MODULE>.Factory(conn).Update(SYS_MODULE.Attribute.MDL_ID, aaa[0], SYS_MODULE.Attribute.SORT_NO, aaa[1]);

                //BLLTable.UpdateCol(SYS_MODULE.Attribute.SortNum, aaa[1], sys_ModuleInfo.Attribute.ModuleID, aaa[0], 1);
            }
        }
        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes();location.href='../../OK.aspx';", false);
    }
}


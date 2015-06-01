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
using AgileFrame.Core.WebSystem;
public partial class HR_DEPT_DeptInfoSort2 : AgileFrame.AppInOne.Common.BasePage
{
    HR_DEPT condObj = new HR_DEPT();
    HR_DEPT valObj = new HR_DEPT();
    List<HR_DEPT> listObj = new List<HR_DEPT>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["ntype"] == "org")
            {
                condObj.ORG_ID = Request["id"];
                condObj.P_DEPT_ID = "0";
            }
            else
            {
                condObj.P_DEPT_ID = Request["id"];
            }


            BindList(condObj);

        }
    }

    private void BindList(HR_DEPT condObj)
    {
        condObj.OrderBy(HR_DEPT.Attribute.SORT_NO,Order.Asc);
        listObj = BLLTable<HR_DEPT>.Factory(conn).Select(valObj, condObj);        
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
                BLLTable<HR_DEPT>.Factory(conn).Update(HR_DEPT.Attribute.DEPT_ID, aaa[0], HR_DEPT.Attribute.SORT_NO, aaa[1]);

                //BLLTable.UpdateCol(HR_DEPT.Attribute.SortNum, aaa[1], sys_ModuleInfo.Attribute.ModuleID, aaa[0], 1);
            }
        }
        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes();location.href='../../OK.aspx';", false);
    }
}


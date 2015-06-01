using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;

public partial class DEPT_MoveTo : AgileFrame.AppInOne.Common.BasePage
{
    string keyid = "";
    protected string title = LanguageService.GetLanguageString("SystemMenuEdit", "部门转移");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                HR_DEPT valObj = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, keyid);
                if (valObj == null)
                {
                    this.btnOK.Enabled = false;
                }
                else
                {
                    txtDeptName.Value = valObj.DEPT_NAME;
                    
                    wucSelDept1.DEPT_ID = valObj.P_DEPT_ID; 
                    //wucSelDept1.Enabled = false;
                }
            }
           
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        #region//备用变量声明
        string gotoUrl = "../../OK.aspx?p=0";
        int re = 0;
        string msg ="新增记录";
        HR_DEPT valObj = new HR_DEPT();
        #endregion

        valObj.DEPT_NAME = txtDeptName.Value;
        
        //树结构操作
        if (keyid !="")
        {
            valObj.P_DEPT_ID = wucSelDept1.DEPT_ID;
            valObj.DEPT_ID = keyid;
            re = DeptHelper.EditDept(valObj);// BLLTable<HR_DEPT>.Factory(conn).Update(valObj, HR_DEPT.Attribute.DEPT_ID);
        }

        #region//执行结果处理
        if (re > 0)
        {

            if (Request["tree"] != null)
            {
                StringBuilder sb = new StringBuilder("");
                if (Request["toEdit"] == null)
                {

                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes(true);location.href='" + gotoUrl + "';", false);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes(true);location.href='" + gotoUrl + "';", false);
                }
            }
            else
            {
                ScriptHelper.AlertAndGo(Page, msg + "成功！", gotoUrl);
            }
        }
        else
        {
            ScriptHelper.AlertAndGo(Page, msg + "失败！", gotoUrl);
        }
        #endregion
    }
}


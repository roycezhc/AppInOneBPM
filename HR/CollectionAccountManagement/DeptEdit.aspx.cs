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

public partial class HR_CollectionAccountManagement_DeptEdit2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    string keyid = "";
    string pid = "";
    string ntype = "";
    protected string title = LanguageService.GetLanguageString("SystemMenuEdit", "部门编辑");
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = title;
        if (!string.IsNullOrEmpty(Request["ntype"]))
        {
            ntype = Request["ntype"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["id"]))
        {
            if (Request["toEdit"] != null)
            {
                keyid = Request["id"];
            }
            else
            {
                //增加
                title = "增设部门";
                pid = Request["id"];
            }
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                #region//修改时信息初始化
                HR_DEPT valObj = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, keyid);
                if (valObj == null)
                {
                    this.btnOK.Enabled = false;
                }
                else
                {
                    txtDeptName.Value = valObj.DEPT_NAME;
                    txtSortNum.Value = valObj.SORT_NO.ToString();
                    wucSelORG1.Enabled = false;
                    wucSelORG1.ORG_ID = valObj.ORG_ID;
                    
                    wucSelDept1.DEPT_ID = valObj.P_DEPT_ID; 
                    wucSelDept1.Enabled = true;

                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                

                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString                

                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                

                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                

                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString
                }

                #endregion
            }
            else if (pid != "0")
            {
                if (ntype == "org")
                {
                    wucSelDept1.DEPT_ID = "0";
                    wucSelORG1.ORG_ID = pid;
                }
                else
                {
                    wucSelDept1.DEPT_ID = pid;
                    HR_DEPT dept = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, pid);
                    //HR_ORG orgVal = BLLTable<HR_ORG>.Factory(conn).GetRowData(HR_ORG.Attribute.ORG_ID, orgid);
                    if (dept != null) wucSelORG1.ORG_ID = dept.ORG_ID;
                }
                wucSelORG1.Enabled = false;
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        #region//备用变量声明
        string gotoUrl = "../../OK.aspx?p=0";
        if (pid != "")
        {
            gotoUrl += "&PID=" + pid;
        }
        int re = 0;
        string msg ="新增记录";
        HR_DEPT valObj = new HR_DEPT();
        #endregion

        #region//实例对象赋值
        valObj.DEPT_NAME = txtDeptName.Value;
        valObj.SORT_NO =Convert.ToInt32(txtSortNum.Value);
        valObj.ORG_ID = wucSelORG1.ORG_ID;

        if (txtSNAME.Value != "")
            valObj.SNAME = Convert.ToString(txtSNAME.Value);


        if (txtRNAME.Value != "")
            valObj.RNAME = Convert.ToString(txtRNAME.Value);

        if (txtEXP1.Value != "")
            valObj.EXP1 = Convert.ToString(txtEXP1.Value);


        if (txtEXP2.Value != "")
            valObj.EXP2 = Convert.ToString(txtEXP2.Value);


        if (txtEXP3.Value != "")
            valObj.EXP3 = Convert.ToString(txtEXP3.Value);
        #endregion

        
        #region//执行修改或新增
        if (keyid !="")
        {
            valObj.P_DEPT_ID = wucSelDept1.DEPT_ID;
            valObj.DEPT_ID = keyid;
            re = DeptHelper.EditDept(valObj);// BLLTable<HR_DEPT>.Factory(conn).Update(valObj, HR_DEPT.Attribute.DEPT_ID);
        }
        else
        {
            if (ntype == "org")
            {
                valObj.P_DEPT_ID = "0";
            }
            else {
                valObj.P_DEPT_ID = pid;
            }
            keyid = DeptHelper.AddDept(valObj, valObj.P_DEPT_ID);
            re = keyid != "" ? 1 : 0;
        }
        #endregion

        #region//执行结果处理
        if (re > 0)
        {

            if (Request["tree"] != null)
            {
                StringBuilder sb = new StringBuilder("{");
                sb.Append("rid:'").Append(pid).Append("',id:'");
                sb.Append(keyid).Append("',pid:'").Append(pid).Append("',no:").Append(valObj.SORT_NO).Append(",sc:1,name:'");
                sb.Append(valObj.DEPT_NAME).Append("',ntype:'dept'}");
                if (Request["toEdit"] == null)
                {

                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.addSubNodeForOprPage(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.editNodeForOprPage(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
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


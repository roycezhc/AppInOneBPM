using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class SYS_DataPower_DP_DEPT : AgileFrame.AppInOne.Common.BasePage
{
    protected string userid = "";
    protected string roleid = "";

    protected string date_type = HR_DEPT.Attribute.DEPT_ID.LongName.Replace("[", "").Replace("]", "");

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "部门权限范围配置";

        if (Request["USER_ID"] != null)
        {
            userid = Request["USER_ID"];
        }
        if (Request["ROLE_ID"] != null)
        {
            roleid = Request["ROLE_ID"];
        }
        if (!IsPostBack)
        {
            tvDept.ShowCheckBoxes = TreeNodeTypes.All;
            DeptHelper.InitDeptDPTree(tvDept.Nodes, "0", userid, roleid);
            
            if (userid != "")
            {
                SYS_USERDATA val = new SYS_USERDATA();
                val.USER_ID = decimal.Parse(userid);
                val.DATA_TYPE = date_type;

                List<SYS_USERDATA> lst = BLLTable<SYS_USERDATA>.Factory(conn).Select(new SYS_USERDATA(), val);
                if (lst.Count == 1 && lst[0].DATA_ID == "0")
                {
                    ckAll.Checked = true;
                }
            }

            if (roleid != "")
            {
                SYS_ROLEDATA val = new SYS_ROLEDATA();
                val.ROLE_ID = decimal.Parse(roleid);
                val.DATA_TYPE = date_type;

                List<SYS_ROLEDATA> lst = BLLTable<SYS_ROLEDATA>.Factory(conn).Select(new SYS_ROLEDATA(), val);
                if (lst.Count == 1 && lst[0].DATA_ID == "0")
                {
                    ckAll.Checked = true;
                }
            }
        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ckAll.Checked == true)
        {
            if (userid != "")
            {
                SYS_USERDATA val = new SYS_USERDATA();
                val.USER_ID = decimal.Parse(userid);
                val.DATA_TYPE = date_type;
                BLLTable<SYS_USERDATA>.Factory(conn).Delete(val);

                val.DATA_ID = "0";
                BLLTable<SYS_USERDATA>.Factory(conn).Insert(val);
            }
            else if (roleid != "")
            {
                SYS_ROLEDATA val = new SYS_ROLEDATA();
                val.ROLE_ID = decimal.Parse(roleid);
                val.DATA_TYPE = date_type;
                BLLTable<SYS_ROLEDATA>.Factory(conn).Delete(val);

                val.DATA_ID = "0";
                BLLTable<SYS_ROLEDATA>.Factory(conn).Insert(val);
            }
        }
        else
        {
            int num = 0;
            if (userid != "")
            {
                SYS_USERDATA val = new SYS_USERDATA();
                val.USER_ID = decimal.Parse(userid);
                val.DATA_TYPE = date_type;
                BLLTable<SYS_USERDATA>.Factory(conn).Delete(val);

                foreach (TreeNode tn in tvDept.CheckedNodes)
                {
                    val.DATA_ID = tn.Value;
                    num+=BLLTable<SYS_USERDATA>.Factory(conn).Insert(val);
                }
            }
            else if (roleid != "")
            {
                SYS_ROLEDATA val = new SYS_ROLEDATA();
                val.ROLE_ID = decimal.Parse(roleid);
                val.DATA_TYPE = date_type;
                BLLTable<SYS_ROLEDATA>.Factory(conn).Delete(val);

                foreach (TreeNode tn in tvDept.CheckedNodes)
                {
                    val.DATA_ID = tn.Value;
                    num+=BLLTable<SYS_ROLEDATA>.Factory(conn).Insert(val);
                }
            }
            if (num > 0)
            {
                litWarn.Text = "保存成功";
            }
            else
            {
                litWarn.Text = "保存失败";
            }
        }
    }
}
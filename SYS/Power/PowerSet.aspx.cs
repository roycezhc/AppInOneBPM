using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SystemManage_Role_mdlPowerSelect : AgileFrame.AppInOne.Common.BasePage
{
    string roleid = "";
    string userid = "";

    protected string paraStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ROLE_ID"] != null)
        {
            roleid = Request["ROLE_ID"];
            paraStr = "ROLE_ID="+roleid;
        }
        if (Request["USER_ID"] != null)
        {
            userid = Request["USER_ID"];
            paraStr = "USER_ID=" + userid;
        }
        if (!IsPostBack)
        {

            SYS_MODULE ccc = new SYS_MODULE();
            ccc.NEED_POWER = "1";
            ccc.P_MDL_ID="0";
            repModule.DataSource = BLLTable<SYS_MODULE>.Factory(conn).Select(new SYS_MODULE(), ccc);
            repModule.DataBind();
        }


    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (roleid != "")
        {
            BLLTable<SYS_ROLE_MDLPOWER_DIC>.Factory(conn).Delete(SYS_ROLE_MDLPOWER_DIC.Attribute.ROLE_ID,roleid);
        }
        else if (userid != "")
        {
            BLLTable<SYS_USER_MDLPOWER_DIC>.Factory(conn).Delete(SYS_USER_MDLPOWER_DIC.Attribute.USER_ID,userid);
        }

        for (int i = 0; i < repModule.Items.Count; i++)
        {
            TreeView tvMdl = (TreeView)repModule.Items[i].FindControl("tvModule");
            //Response.Write(tvMdl.CheckedNodes.Count.ToString() + "<hr/>");

            foreach (TreeNode tn in tvMdl.CheckedNodes)
            {
                if (roleid != "")
                {
                    SYS_ROLE_MDLPOWER_DIC val = new SYS_ROLE_MDLPOWER_DIC();
                    val.ROLE_ID = int.Parse(roleid);
                    if (tn.ToolTip != "权限字典")
                    {
                        val.PAGE_URL = tn.Value;// arr[1];
                        val.DIC_ID = 0;//关联表里存放的是页面地址，没有权限字典的数据，这点很重要，可以根据此判断用户是否有进入某页面
                    }
                    else
                    {
                        val.PAGE_URL = tn.Parent.Value;
                        val.DIC_ID = int.Parse(tn.Value);

                    }
                    if (!BLLTable<SYS_ROLE_MDLPOWER_DIC>.Exists(val))
                    {
                        BLLTable<SYS_ROLE_MDLPOWER_DIC>.Factory(conn).Insert(val);
                    }
                }
                else if (userid != "")
                {
                    SYS_USER_MDLPOWER_DIC val = new SYS_USER_MDLPOWER_DIC();
                    val.USER_ID = decimal.Parse(userid);
                    if (tn.ToolTip != "权限字典")
                    {
                        val.PAGE_URL = tn.Value;// arr[1];
                        val.DIC_ID = 0;//关联表里存放的是页面地址，没有权限字典的数据，这点很重要，可以根据此判断用户是否有进入某页面
                    }
                    else
                    {
                        val.PAGE_URL = tn.Parent.Value;
                        val.DIC_ID = int.Parse(tn.Value);

                    }
                    if (!BLLTable<SYS_USER_MDLPOWER_DIC>.Exists(val))
                    {
                        BLLTable<SYS_USER_MDLPOWER_DIC>.Factory(conn).Insert(val);
                    }
                }
            }
        }
        // Response.Write(repModule.Items.Count.ToString());
        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "window.close();", false);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            HtmlInputHidden hid = (HtmlInputHidden)e.Item.FindControl("hidMDLID");

            TreeView tvMdl = (TreeView)e.Item.FindControl("tvModule");
            if (hid != null && tvMdl != null)
            {
                new ModuleHelper(conn).InitModulePower(tvMdl.Nodes, hid.Value, userid,roleid);
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class HR_ORGManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("ORGManage.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("ORGManage.aspx", path);
    }

    HR_ORG valObj = new HR_ORG();
    HR_ORG condObj = new HR_ORG();
    List<HR_ORG> listObj = new List<HR_ORG>();
    int recount = -1;//查询总记录数
    protected string title = "";
    protected string pid = "0";
    private void BindList(HR_ORG condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_ORG.Attribute.ORG_ID, Order.Desc);
        listObj = BLLTable<HR_ORG>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (Request["PID"] != null) {
            pid = Request["PID"];
            
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;

            if (pid == "" || pid == "0") {
                a_top.Visible = false;
            }

            #endregion
            #region//数据初始化
            
            #endregion
            if (pid == "0")
            {
                liToTop.Visible = false;
            }
            else {
                liToTop.Visible = true;
            }
            condObj.P_ORG_ID = pid;
            hidCondition.Value = condObj.ToJson(20);
            BindList(condObj, 1);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_ORG>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_ORG();

        
        
        if(txtORG_ID.Value !="" )
            condObj.Like(HR_ORG.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
        
        
        if(txtORG_NAME.Value !="" )
            condObj.Like(HR_ORG.Attribute.ORG_NAME, Convert.ToString(txtORG_NAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_ORG>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            //HtmlInputCheckBox ckOrg = (HtmlInputCheckBox)e.Item.FindControl("ckORG");
            //if (ckOrg != null) {
            //    HR_ORG cond=new HR_ORG();
            //    cond.P_ORG_ID=ckOrg.Value;
            //    if (BLLTable<HR_ORG>.Exists(cond))
            //    {
            //        Literal litSub = (Literal)e.Item.FindControl("litSub");
            //        if (litSub != null)
            //        {
            //            litSub.Text = "---<a href='ORGManage.aspx?PID=" + cond.P_ORG_ID + "'><b>下级机构</b></a>";
            //        }
            //    }
            //}
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
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

public partial class SYS_DataPower_ORGPower: AgileFrame.AppInOne.Common.BasePage
{
    HR_ORG valObj = new HR_ORG();
    HR_ORG condObj = new HR_ORG();
    List<HR_ORG> listObj = new List<HR_ORG>();
    int recount = -1;//查询总记录数
    protected string title = "";
    string pid = "0";
    string userid = "";
    protected string paraStr = "";
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
        if (Request["USER_ID"] != null)
        {
            userid = Request["USER_ID"];
            paraStr = "?USER_ID="+userid;
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 30;
            
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
            StringBuilder orgids =new StringBuilder();
            if (userid != "")
            {
                SYS_USERDATA cond=new SYS_USERDATA();
                cond.USER_ID=decimal.Parse(userid);
                cond.DATA_TYPE = HR_ORG.Attribute.ORG_ID.LongName.Replace("[", "").Replace("]", "");
                //Response.Write(HR_ORG.Attribute.ORG_ID.LongName.Replace("[","").Replace("]",""));
                List<SYS_USERDATA> lst = BLLTable<SYS_USERDATA>.Factory(conn).Select(new SYS_USERDATA(), cond);
                if (lst != null) {
                    for (int i = 0; i < lst.Count; i++) {
                        if (orgids.Length > 0) {
                            orgids.Append(",");
                        }
                        orgids.Append(lst[i].DATA_ID);
                    }
                }
            }

            condObj.P_ORG_ID = pid;
            if (orgids.Length > 0) {
                condObj.In(HR_ORG.Attribute.ORG_ID, orgids.ToString());
            }
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

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
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
            HtmlInputCheckBox ckOrg = (HtmlInputCheckBox)e.Item.FindControl("ckORG");
            if (ckOrg != null) {
                HR_ORG cond=new HR_ORG();
                cond.P_ORG_ID=ckOrg.Value;
                if (BLLTable<HR_ORG>.Exists(cond))
                {
                    Literal litSub = (Literal)e.Item.FindControl("litSub");
                    if (litSub != null)
                    {
                        litSub.Text = "---<a href='ORGPower.aspx?PID=" + cond.P_ORG_ID + "'><b>下级机构</b></a>";
                    }
                }
            }
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
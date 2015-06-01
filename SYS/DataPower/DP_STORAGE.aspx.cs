using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.SYS;
public partial class SYS_DP_STORAGEManage : AgileFrame.AppInOne.Common.BasePage
{
    IM_STORAGE valObj = new IM_STORAGE();
    IM_STORAGE condObj = new IM_STORAGE();
    List<IM_STORAGE> listObj = new List<IM_STORAGE>();
    int recount = -1;//查询总记录数
    protected string title = "";

    protected string date_type = IM_STORAGE.Attribute.STOR_ID.LongName.Replace("[", "").Replace("]", "");
    protected string userid = "";
    protected string roleid = "";
    protected string paraStr = "";
    private void BindList(IM_STORAGE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(IM_STORAGE.Attribute.STOR_ID, Order.Desc);


        listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["USER_ID"] != null)
        {
            userid = Request["USER_ID"];
            paraStr = "USER_ID=" + userid;
        }
        if (Request["ROLE_ID"] != null)
        {
            roleid = Request["ROLE_ID"];
            paraStr = "ROLE_ID=" + roleid;
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;

            #endregion
            #region//数据初始化

            #endregion




            string condids = "";
            #region//数据权限条件构造
            if (userid != "")
            {
                condids = UserHelper.GetUserDataIDS(userid, IM_STORAGE.Attribute.STOR_ID);
            }
            if (roleid != "")
            {
                if (condids != "")
                {
                    condids += ",";
                }
                condids = RoleHelper.GetRoleDataIDS(roleid, IM_STORAGE.Attribute.STOR_ID);
            }
            #endregion
            if (condids != "")
            {
                if (!(condids == "0" || condids == "0,0"))
                {
                    condObj.In(IM_STORAGE.Attribute.STOR_ID, condids);
                    hidCondition.Value = condObj.ToJson(20);

                }
                BindList(condObj, 1);

            }
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class WF_F_COLUMNManage:BaseAdminPage
{

    TF_F_COLUMN valObj = new TF_F_COLUMN();
    TF_F_COLUMN condObj = new TF_F_COLUMN();
    List<TF_F_COLUMN> listObj = new List<TF_F_COLUMN>();
    int recount = -1;//查询总记录数
    protected string title = "";
    protected string formid = "";
    private void BindList(TF_F_COLUMN condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_F_COLUMN.Attribute.SORT_NO, Order.Asc);

        if (formid != "") {
            condObj.FORM_ID = int.Parse(formid);
        }

        listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        
        repList.DataSource = listObj.Where(s=>s.IS_DEFAULT=="0");
        repList.DataBind();
        aspPager.RecordCount = recount;

        //repDefault.DataSource = listObj.Where(s => s.IS_DEFAULT == "1");
        //repDefault.DataBind();

        TF_F_COLUMN ccc = new TF_F_COLUMN();
        if (Request["ntype"] == "TF_FORM-mx")
        {
            ccc.FORM_ID = -1;
        }
        else
        {
            ccc.FORM_ID = 0;
        }
        listObj = BLLTable<TF_F_COLUMN>.Factory(conn).Select(valObj, ccc);
        repDefault.DataSource = listObj;
        repDefault.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["tree"]) && !string.IsNullOrEmpty(Request["id"]))
        {
            formid = Request["id"];
        }
        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 30;

            #endregion
            TF_FORM tbObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, formid);
            title = "表单 " + tbObj.F_NAME + " 的栏目列表";

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_F_COLUMN>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_F_COLUMN();

        if(txtCTRL_TYPE.Value !="" )
            condObj.Like(TF_F_COLUMN.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));

        if(txtIS_NEED.Value !="" )
            condObj.Like(TF_F_COLUMN.Attribute.IS_NEED, Convert.ToInt32(txtIS_NEED.Value));
        

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
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
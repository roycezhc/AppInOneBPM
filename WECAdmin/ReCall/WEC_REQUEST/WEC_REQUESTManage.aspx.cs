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
using AgileFrame.Core.WebSystem;

public partial class WEC_REQUESTManage : BaseAdminPage
{
    public string webpath;
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
       
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("WEC_REQUESTManage.aspx", path);
    }
    public string pid = "0", kind = "0";

    protected WEC_REQUEST valObj = new WEC_REQUEST();
    WEC_REQUEST condObj = new WEC_REQUEST();
    protected List<WEC_REQUEST> listObj = new List<WEC_REQUEST>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_REQUEST condObj, int curPage)
    {
        if (!string.IsNullOrEmpty(kind))
        {
            condObj.KIND = Convert.ToInt32(kind);
        }

        if (!string.IsNullOrEmpty(userBase2.Curraid)) condObj.AID = Convert.ToInt32(userBase2.Curraid);

        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_REQUEST.Attribute.TID, Order.Desc);

        #region//数据权限条件

        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        webpath = WebHelper.GetAppPath();
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["kind"] != null)
        {
            kind = Request["kind"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            //aspPager.ShowInputBox = AgileFrame.Core.WebSystem.WebCtrls.ShowInputBox.Auto;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化

            txtMATCH_TYPE.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.MATCH_TYPE));
            txtKIND.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.KIND));
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.STATUS));
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new WEC_REQUEST();

        if (txtTID.Value != "")
            condObj.Like(WEC_REQUEST.Attribute.TID, Convert.ToDecimal(txtTID.Value));


        if (txtAID.Value != "")
            condObj.Like(WEC_REQUEST.Attribute.AID, Convert.ToDecimal(txtAID.Value));


        if (txtKEYWORD.Value != "")
            condObj.Like(WEC_REQUEST.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));


        if (txtMATCH_TYPE.Value != "")
            condObj.MATCH_TYPE = Convert.ToInt32(txtMATCH_TYPE.Value);


        if (txtMEMO.Value != "")
            condObj.Like(WEC_REQUEST.Attribute.MEMO, Convert.ToString(txtMEMO.Value));


        if (txtKIND.Value != "")
            condObj.KIND = Convert.ToInt32(txtKIND.Value);


        if (txtSTATUS.Value != "")
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);


        if (txtADDTIME.Value != "")
            condObj.Like(WEC_REQUEST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
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
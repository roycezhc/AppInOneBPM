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
public partial class HR_STAFF_STAFFSels : BasePage
{
    protected string showLeftLinks(string path, string pname)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("STAFFSels.aspx?p=1", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("STAFFSels.aspx?p=1", path);
    }
    protected string pid = "0";
    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                //string[] aaa = arr[i].Split(',');
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            //string[] aaa = str.Split(',');
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    HR_STAFF valObj = new HR_STAFF();
    HR_STAFF condObj = new HR_STAFF();
    List<HR_STAFF> listObj = new List<HR_STAFF>();
    /// <summary>查询总记录数</summary>
    int recount = -1;
    public string title = new HR_STAFF()._ZhName;
    /// <summary>操作结果计数</summary>
    public int count = 0;
    /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();

    private void BindList(HR_STAFF condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);
        listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 外部传入 非主键参数
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "选择";
        Page.Title = title;

        #endregion

        if (!IsPostBack)
        {
            txtGENDER.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.GENDER));
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_STAFF roleOld = new HR_STAFF();
                roleOld.Where(HR_STAFF.Attribute.STAFF_ID, Request["ids"].ToString());
                listObj = BLLTable<HR_STAFF>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].STAFF_ID + "',Name:'" + listObj[i].STAFF_NAME + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].STAFF_ID;
                }
            }

            btn_Find.Text = LanguageService.GetLanguageString("btnFind", "查询");
            Page.Title = title + LanguageService.GetLanguageString("Choose", "选择");
            aspPager.PageSize = 15;

            condObj.PID = decimal.Parse(pid);

            BindList(condObj, 1);
            aspPager.CurrentPageIndex = 1;

        }

    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_STAFF>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
        {
            condObj = new HR_STAFF();

            condObj.PID = decimal.Parse(pid);

            if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                condObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);

            if (txtSNAME.Value != "")
                condObj.Like(HR_STAFF.Attribute.SNAME, Convert.ToDecimal(txtSNAME.Value));

            if (txtRNAME.Value != "")
                condObj.Like(HR_STAFF.Attribute.RNAME, Convert.ToDecimal(txtRNAME.Value));

            if (txtSTAFF_NO.Value != "")
                condObj.Like(HR_STAFF.Attribute.STAFF_NO, Convert.ToString(txtSTAFF_NO.Value));


            if (txtNAME.Value != "")
                condObj.Like(HR_STAFF.Attribute.STAFF_NAME, Convert.ToString(txtNAME.Value));

            if (txtGENDER.Value != "")
                condObj.GENDER = Convert.ToString(txtGENDER.Value);


            if (txtSTATION_CODE.Value != "")
                condObj.Like(HR_STAFF.Attribute.STATION_CODE, Convert.ToString(txtSTATION_CODE.Value));




            if (txtMOBILE.Value != "")
                condObj.Like(HR_STAFF.Attribute.MOBILE, Convert.ToString(txtMOBILE.Value));


            if (txtTITLE_CODE.Value != "")
                condObj.Like(HR_STAFF.Attribute.TITLE_CODE, Convert.ToString(txtTITLE_CODE.Value));

            if (txtEMAIL.Value != "")
                condObj.Like(HR_STAFF.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));

            listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repList.DataSource = listObj;
            repList.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (hidOld.Value != "")
        {
            HtmlInputCheckBox ck = (HtmlInputCheckBox)e.Item.FindControl("chkSel");
            string id = ck.Attributes["value"];

            if (IsInOld(hidInitIDS.Value, id, ','))
            {
                ck.Checked = true;
            }
        }
    }
}
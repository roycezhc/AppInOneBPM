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
public partial class IM_STORAG_STORAGESels : AgileFrame.AppInOne.Common.BasePage
{
    public string title = new IM_STORAGE()._ZhName;

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
    IM_STORAGE valObj = new IM_STORAGE();
    IM_STORAGE condObj = new IM_STORAGE();
    List<IM_STORAGE> listObj = new List<IM_STORAGE>();
    int recount = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                IM_STORAGE roleOld = new IM_STORAGE();
                roleOld.Where(IM_STORAGE.Attribute.STOR_ID, Request["ids"].ToString());
                listObj = BLLTable<IM_STORAGE>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].STOR_ID + "',Name:'" + listObj[i].NAME + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].STOR_ID;
                }
            }
            try
            {

                listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repList.DataSource = listObj;
                repList.DataBind();
                aspPager.RecordCount = recount; hidCondition.Value = condObj.ToJson(20);
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    private void BindList(IM_STORAGE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(IM_STORAGE.Attribute.STOR_ID, Order.Desc);
        listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new IM_STORAGE();
        if (txtNAME.Value != "")
            condObj.Like(IM_STORAGE.Attribute.NAME, Convert.ToString(txtNAME.Value));


        if (txtSNAME.Value != "")
            condObj.Like(IM_STORAGE.Attribute.SNAME, Convert.ToString(txtSNAME.Value));


        if (txtRNAME.Value != "")
            condObj.Like(IM_STORAGE.Attribute.RNAME, Convert.ToString(txtRNAME.Value));


        if (wucSelORG1.ORG_ID != "")
            condObj.Like(IM_STORAGE.Attribute.ORG_ID, Convert.ToString(wucSelORG1.ORG_ID));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);

    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
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
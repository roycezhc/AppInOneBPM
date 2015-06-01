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

public partial class Sels : BasePage //BaseAdminPage
{
    public string title = new WEC_A_VOTEDETAIL()._ZhName;

    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    WEC_A_VOTEDETAIL valObj = new WEC_A_VOTEDETAIL();
    WEC_A_VOTEDETAIL condObj = new WEC_A_VOTEDETAIL();
    List<WEC_A_VOTEDETAIL> listObj = new List<WEC_A_VOTEDETAIL>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        base.InitModule(ref valObj, ref KeyID, ref fieldList);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_A_VOTEDETAIL.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_A_VOTEDETAIL.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_A_VOTEDETAIL roleOld = new WEC_A_VOTEDETAIL();
                roleOld.Where(WEC_A_VOTEDETAIL.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_A_VOTEDETAIL>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].ID + "',Name:'" + listObj[i].ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].ID;
                }
            }
            try
            {

                listObj = BLLTable<WEC_A_VOTEDETAIL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repList.DataSource = listObj;
                repList.DataBind();
                aspPager.RecordCount = recount;
            }
            catch (Exception ex)
            {
                 litWarn.Text = ex.Message;
            }



        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new WEC_A_VOTEDETAIL();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtVID.Value !="" )
            condObj.VID = Convert.ToDecimal(txtVID.Value);
        
        
        if(txtSORT.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.SORT, Convert.ToDecimal(txtSORT.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtPIC_URL.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
        
        
        if(txtOUT_URL.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.OUT_URL, Convert.ToString(txtOUT_URL.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_A_VOTEDETAIL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_A_VOTEDETAIL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repList.DataSource = listObj;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }

    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            recount = aspPager.RecordCount;
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<WEC_A_VOTEDETAIL>(hidCondition.Value);
            }
            List<WEC_A_VOTEDETAIL> listVal = BLLTable<WEC_A_VOTEDETAIL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
            repList.DataSource = listVal;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }
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
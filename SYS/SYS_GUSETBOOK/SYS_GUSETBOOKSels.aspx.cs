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

public partial class SYS_GUSETBOOKSels : BaseAdminPage
{
    public string title = new SYS_GUSETBOOK()._ZhName;

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
    SYS_GUSETBOOK valObj = new SYS_GUSETBOOK();
    SYS_GUSETBOOK condObj = new SYS_GUSETBOOK();
    List<SYS_GUSETBOOK> listObj = new List<SYS_GUSETBOOK>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
        #endregion
        condObj.OrderBy(SYS_GUSETBOOK.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                SYS_GUSETBOOK roleOld = new SYS_GUSETBOOK();
                roleOld.Where(SYS_GUSETBOOK.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<SYS_GUSETBOOK>.Select(valObj, roleOld);
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

                listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new SYS_GUSETBOOK();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
        
        
        if(txtMEMO.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.MEMO, Convert.ToString(txtMEMO.Value));
        
        
        if(txtEMAIL.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
        
        
        if(txtMOBIL.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.MOBIL, Convert.ToString(txtMOBIL.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtANSWER.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.ANSWER, Convert.ToString(txtANSWER.Value));
        
        
        if(txtUSERNAME.Value !="" )
            condObj.Like_OR(SYS_GUSETBOOK.Attribute.USERNAME, Convert.ToString(txtUSERNAME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_GUSETBOOK>(hidCondition.Value);
            }
            List<SYS_GUSETBOOK> listVal = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
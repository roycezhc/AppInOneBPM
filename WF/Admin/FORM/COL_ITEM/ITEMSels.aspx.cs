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
public partial class WF_F_COLUMN_ITEMSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_F_COLUMN_ITEM()._ZhName;

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
    TF_F_COLUMN_ITEM valObj = new TF_F_COLUMN_ITEM();
    TF_F_COLUMN_ITEM condObj = new TF_F_COLUMN_ITEM();
    List<TF_F_COLUMN_ITEM> listObj = new List<TF_F_COLUMN_ITEM>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP1);
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP2);
        //hideTableColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP1);
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP2);
        //hideFindColumnList.Add(TF_F_COLUMN_ITEM.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_F_COLUMN_ITEM roleOld = new TF_F_COLUMN_ITEM();
                roleOld.Where(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Request["ids"].ToString());
                listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].ITEM_ID + "',Name:'" + listObj[i].ITEM_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].ITEM_ID;
                }
            }
            try
            {

                listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_F_COLUMN_ITEM();
        
        
        if(txtITEM_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, Convert.ToInt32(txtITEM_ID.Value));
        
        
        if(txtFORM_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.FORM_ID, Convert.ToInt32(txtFORM_ID.Value));
        
        
        if(txtCOLUMN_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.COLUMN_ID, Convert.ToInt32(txtCOLUMN_ID.Value));
        
        
        if(txtVALUE.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.VALUE, Convert.ToString(txtVALUE.Value));
        
        
        if(txtTEXT.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.TEXT, Convert.ToString(txtTEXT.Value));
        
        
        if(txtDROP_REAL.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.DROP_REAL, Convert.ToString(txtDROP_REAL.Value));
        
        
        if(txtCOL_HIDE.Value !="" )
            condObj.Like_OR(TF_F_COLUMN_ITEM.Attribute.COL_HIDE, Convert.ToString(txtCOL_HIDE.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_F_COLUMN_ITEM>(hidCondition.Value);
            }
            List<TF_F_COLUMN_ITEM> listVal = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
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
public partial class TF_TB_FIELDSels2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_TB_FIELD()._ZhName;

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
    TF_TB_FIELD valObj = new TF_TB_FIELD();
    TF_TB_FIELD condObj = new TF_TB_FIELD();
    List<TF_TB_FIELD> listObj = new List<TF_TB_FIELD>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_TB_FIELD.Attribute.EXP1);
        //hideTableColumnList.Add(TF_TB_FIELD.Attribute.EXP2);
        //hideTableColumnList.Add(TF_TB_FIELD.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_TB_FIELD.Attribute.EXP1);
        //hideFindColumnList.Add(TF_TB_FIELD.Attribute.EXP2);
        //hideFindColumnList.Add(TF_TB_FIELD.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_TB_FIELD.Attribute.FIELD_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_TB_FIELD roleOld = new TF_TB_FIELD();
                roleOld.Where(TF_TB_FIELD.Attribute.FIELD_ID, Request["ids"].ToString());
                listObj = BLLTable<TF_TB_FIELD>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].FIELD_ID + "',Name:'" + listObj[i].FIELD_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].FIELD_ID;
                }
            }
            try
            {

                listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_TB_FIELD();
        
        
        if(txtFIELD_ID.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.FIELD_ID, Convert.ToInt32(txtFIELD_ID.Value));
        
        
        if(txtFIELD_NAME.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.FIELD_NAME, Convert.ToString(txtFIELD_NAME.Value));
        
        
        if(txtFIELD_TYPE.Value !="" )
            //condObj.FIELD_TYPE = Convert.ToString(txtFIELD_TYPE.Value);
        
        
        if(txtDB_TYPE.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.DB_TYPE, Convert.ToString(txtDB_TYPE.Value));
        
        
        if(txtIS_NULL.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.IS_NULL, Convert.ToInt32(txtIS_NULL.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtDEFAULT_VAL.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.DEFAULT_VAL, Convert.ToString(txtDEFAULT_VAL.Value));
        
        
        if(txtTB_ID.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtCTRL_TYPE.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like_OR(TF_TB_FIELD.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_TB_FIELD>(hidCondition.Value);
            }
            List<TF_TB_FIELD> listVal = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
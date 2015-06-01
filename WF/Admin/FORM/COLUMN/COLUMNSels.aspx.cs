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
public partial class WF_F_COLUMNSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new TF_F_COLUMN()._ZhName;

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
    TF_F_COLUMN valObj = new TF_F_COLUMN();
    TF_F_COLUMN condObj = new TF_F_COLUMN();
    List<TF_F_COLUMN> listObj = new List<TF_F_COLUMN>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_F_COLUMN.Attribute.EXP1);
        //hideTableColumnList.Add(TF_F_COLUMN.Attribute.EXP2);
        //hideTableColumnList.Add(TF_F_COLUMN.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_F_COLUMN.Attribute.EXP1);
        //hideFindColumnList.Add(TF_F_COLUMN.Attribute.EXP2);
        //hideFindColumnList.Add(TF_F_COLUMN.Attribute.EXP3);
        #endregion
        condObj.OrderBy(TF_F_COLUMN.Attribute.COLUMN_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                TF_F_COLUMN roleOld = new TF_F_COLUMN();
                roleOld.Where(TF_F_COLUMN.Attribute.COLUMN_ID, Request["ids"].ToString());
                listObj = BLLTable<TF_F_COLUMN>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].COLUMN_ID + "',Name:'" + listObj[i].COLUMN_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].COLUMN_ID;
                }
            }
            try
            {

                listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new TF_F_COLUMN();
        
        
        if(txtCOLUMN_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.COLUMN_ID, Convert.ToInt32(txtCOLUMN_ID.Value));
        
        
        if(txtFORM_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.FORM_ID, Convert.ToInt32(txtFORM_ID.Value));
        
        
        if(txtTB_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtFIELD_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.FIELD_ID, Convert.ToInt32(txtFIELD_ID.Value));
        
        
        if(txtSHOW_NAME.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.SHOW_NAME, Convert.ToString(txtSHOW_NAME.Value));
        
        
        if(txtCTRL_TYPE.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));
        
        
        if(txtMAX_VAL.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.MAX_VAL, Convert.ToInt32(txtMAX_VAL.Value));
        
        
        if(txtMIN_VAL.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.MIN_VAL, Convert.ToInt32(txtMIN_VAL.Value));
        
        
        if(txtIS_NEED.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.IS_NEED, Convert.ToInt32(txtIS_NEED.Value));
        
        
        if(txtCAL_FORMULA.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.CAL_FORMULA, Convert.ToString(txtCAL_FORMULA.Value));
        
        
        if(txtSUM_FIELD_ID.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.SUM_FIELD_ID, Convert.ToString(txtSUM_FIELD_ID.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like_OR(TF_F_COLUMN.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_F_COLUMN>(hidCondition.Value);
            }
            List<TF_F_COLUMN> listVal = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
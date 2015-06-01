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

public partial class WEC_C_CHANNELlISTSels : BaseAdminPage
{
    public string title = new WEC_C_CHANNELlIST()._ZhName;

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
    WEC_C_CHANNELlIST valObj = new WEC_C_CHANNELlIST();
    WEC_C_CHANNELlIST condObj = new WEC_C_CHANNELlIST();
    List<WEC_C_CHANNELlIST> listObj = new List<WEC_C_CHANNELlIST>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_C_CHANNELlIST.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_C_CHANNELlIST roleOld = new WEC_C_CHANNELlIST();
                roleOld.Where(WEC_C_CHANNELlIST.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_C_CHANNELlIST>.Select(valObj, roleOld);
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

                listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_C_CHANNELlIST();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtURL.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.URL, Convert.ToString(txtURL.Value));
        
        
        if(txtREMARK.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.REMARK, Convert.ToString(txtREMARK.Value));
        
        
        if(txtCATEGORY_ID.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.CATEGORY_ID, Convert.ToInt32(txtCATEGORY_ID.Value));
        
        
        if(txtQRCODE.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.QRCODE, Convert.ToString(txtQRCODE.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtADDRESS.Value !="" )
            condObj.Like_OR(WEC_C_CHANNELlIST.Attribute.ADDRESS, Convert.ToString(txtADDRESS.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_C_CHANNELlIST>(hidCondition.Value);
            }
            List<WEC_C_CHANNELlIST> listVal = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
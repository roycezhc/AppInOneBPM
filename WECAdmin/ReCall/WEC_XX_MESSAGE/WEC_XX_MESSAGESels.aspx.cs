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

public partial class WEC_XX_MESSAGESels : BaseAdminPage
{
    public string title = new WEC_XX_MESSAGE()._ZhName;

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
    WEC_XX_MESSAGE valObj = new WEC_XX_MESSAGE();
    WEC_XX_MESSAGE condObj = new WEC_XX_MESSAGE();
    List<WEC_XX_MESSAGE> listObj = new List<WEC_XX_MESSAGE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_XX_MESSAGE.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_XX_MESSAGE roleOld = new WEC_XX_MESSAGE();
                roleOld.Where(WEC_XX_MESSAGE.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_XX_MESSAGE>.Select(valObj, roleOld);
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

                listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_XX_MESSAGE();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtOPENID.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.OPENID, Convert.ToString(txtOPENID.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
        
        
        if(txtS_CONTENT.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.S_CONTENT, Convert.ToString(txtS_CONTENT.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtISCOLLECT.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.ISCOLLECT, Convert.ToString(txtISCOLLECT.Value));
        
        
        if(txtLATITUDE.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.LATITUDE, Convert.ToString(txtLATITUDE.Value));
        
        
        if(txtLONGITUDE.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.LONGITUDE, Convert.ToString(txtLONGITUDE.Value));
        
        
        if(txtPRECISION.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.PRECISION, Convert.ToString(txtPRECISION.Value));
        
        
        if(txtCITY.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.CITY, Convert.ToString(txtCITY.Value));
        
        
        if(txtPROVINCE.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.PROVINCE, Convert.ToString(txtPROVINCE.Value));
        
        
        if(txtCOUNTRY.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.COUNTRY, Convert.ToString(txtCOUNTRY.Value));
        
        
        if(txtHEADIMGURL.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.HEADIMGURL, Convert.ToString(txtHEADIMGURL.Value));
        
        
        if(txtCHANNELID.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.CHANNELID, Convert.ToDecimal(txtCHANNELID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_XX_MESSAGE.Attribute.AID, Convert.ToDecimal(txtAID.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_XX_MESSAGE>(hidCondition.Value);
            }
            List<WEC_XX_MESSAGE> listVal = BLLTable<WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
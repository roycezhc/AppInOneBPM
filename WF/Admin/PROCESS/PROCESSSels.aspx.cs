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
public partial class WF_PROCESS_TPLSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new WF_PROCESS_TPL()._ZhName;

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
    WF_PROCESS_TPL valObj = new WF_PROCESS_TPL();
    WF_PROCESS_TPL condObj = new WF_PROCESS_TPL();
    List<WF_PROCESS_TPL> listObj = new List<WF_PROCESS_TPL>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP1);
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP2);
        //hideTableColumnList.Add(WF_PROCESS_TPL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP1);
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP2);
        //hideFindColumnList.Add(WF_PROCESS_TPL.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WF_PROCESS_TPL.Attribute.PROCID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WF_PROCESS_TPL roleOld = new WF_PROCESS_TPL();
                roleOld.Where(WF_PROCESS_TPL.Attribute.PROCID, Request["ids"].ToString());
                listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].PROCID + "',Name:'" + listObj[i].PROCID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].PROCID;
                }
            }
            try
            {

                listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WF_PROCESS_TPL();
        
        
        if(txtPROCID.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.PROCID, Convert.ToInt32(txtPROCID.Value));
        
        
        if(txtPROC_NAME.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.PROC_NAME, Convert.ToString(txtPROC_NAME.Value));
        
        
        if(txtWFCID.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.WFID, Convert.ToString(txtWFCID.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtEDITIME.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.EDITIME, Convert.ToDateTime(txtEDITIME.Value));
        
        
        if(txtGUID.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.GUID, Convert.ToString(txtGUID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToString(txtSTATUS.Value);
        
        
        if(txtSHOW_CONDITION.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.CONDITION, Convert.ToString(txtSHOW_CONDITION.Value));
        
        
        if(txtSHOW_FORMULA.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.FORMULAR, Convert.ToString(txtSHOW_FORMULA.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like_OR(WF_PROCESS_TPL.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WF_PROCESS_TPL>(hidCondition.Value);
            }
            List<WF_PROCESS_TPL> listVal = BLLTable<WF_PROCESS_TPL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
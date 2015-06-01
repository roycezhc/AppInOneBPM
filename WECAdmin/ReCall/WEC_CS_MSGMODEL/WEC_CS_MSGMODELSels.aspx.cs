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

public partial class WEC_CS_MSGMODELSels : BaseAdminPage
{
    public string title = new WEC_CS_MSGMODEL()._ZhName;

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
    WEC_CS_MSGMODEL valObj = new WEC_CS_MSGMODEL();
    WEC_CS_MSGMODEL condObj = new WEC_CS_MSGMODEL();
    List<WEC_CS_MSGMODEL> listObj = new List<WEC_CS_MSGMODEL>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_CS_MSGMODEL.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_CS_MSGMODEL roleOld = new WEC_CS_MSGMODEL();
                roleOld.Where(WEC_CS_MSGMODEL.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_CS_MSGMODEL();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_CS_MSGMODEL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_CS_MSGMODEL.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_CS_MSGMODEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtMODELCONTENT.Value !="" )
            condObj.Like_OR(WEC_CS_MSGMODEL.Attribute.MODELCONTENT, Convert.ToString(txtMODELCONTENT.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CS_MSGMODEL>(hidCondition.Value);
            }
            List<WEC_CS_MSGMODEL> listVal = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
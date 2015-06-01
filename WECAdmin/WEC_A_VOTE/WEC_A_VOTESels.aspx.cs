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

public partial class WEC_A_VOTESels : BaseAdminPage
{
    public string title = new WEC_A_VOTE()._ZhName;

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
    WEC_A_VOTE valObj = new WEC_A_VOTE();
    WEC_A_VOTE condObj = new WEC_A_VOTE();
    List<WEC_A_VOTE> listObj = new List<WEC_A_VOTE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_A_VOTE.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_A_VOTE roleOld = new WEC_A_VOTE();
                roleOld.Where(WEC_A_VOTE.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_A_VOTE>.Factory(conn).Select(valObj, roleOld);
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

                listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_A_VOTE();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtKEYWORD.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtPICURL.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
        
        
        if(txtINSTRUCTION.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.INSTRUCTION, Convert.ToString(txtINSTRUCTION.Value));
        
        
        if(txtPIC_SHOW.Value !="" )
            condObj.PIC_SHOW = Convert.ToInt32(txtPIC_SHOW.Value);
        
        
        if(txtIS_RADIO.Value !="" )
            condObj.IS_RADIO = Convert.ToInt32(txtIS_RADIO.Value);
        
        
        if(txtSELECT_NUM.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.SELECT_NUM, Convert.ToInt32(txtSELECT_NUM.Value));
        
        
        if(txtTIME.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.TIME, Convert.ToString(txtTIME.Value));
        
        
        if(txtRESULT.Value !="" )
            condObj.Like_OR(WEC_A_VOTE.Attribute.RESULT, Convert.ToInt32(txtRESULT.Value));
        
        
        if(txtSHARE.Value !="" )
            condObj.SHARE = Convert.ToInt32(txtSHARE.Value);
        
        
        if(txtKIND.Value !="" )
            condObj.KIND = Convert.ToInt32(txtKIND.Value);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_A_VOTE>(hidCondition.Value);
            }
            List<WEC_A_VOTE> listVal = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
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

public partial class WEC_PUBLICLISTSels : BaseAdminPage
{
    public string title = new WEC_PUBLICLIST()._ZhName;

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
    WEC_PUBLICLIST valObj = new WEC_PUBLICLIST();
    WEC_PUBLICLIST condObj = new WEC_PUBLICLIST();
    List<WEC_PUBLICLIST> listObj = new List<WEC_PUBLICLIST>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_PUBLICLIST.Attribute.AID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_PUBLICLIST roleOld = new WEC_PUBLICLIST();
                roleOld.Where(WEC_PUBLICLIST.Attribute.AID, Request["ids"].ToString());
                listObj = BLLTable<WEC_PUBLICLIST>.Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].AID + "',Name:'" + listObj[i].AID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].AID;
                }
            }
            try
            {

                listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_PUBLICLIST();
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtUSER_ID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));
        
        
        if(txtPLC_NAME.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.PLC_NAME, Convert.ToString(txtPLC_NAME.Value));
        
        
        if(txtPLC_SOURCEID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.PLC_SOURCEID, Convert.ToString(txtPLC_SOURCEID.Value));
        
        
        if(txtWECHAT_ID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.WECHAT_ID, Convert.ToString(txtWECHAT_ID.Value));
        
        
        if(txtAVATAR_URL.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.AVATAR_URL, Convert.ToString(txtAVATAR_URL.Value));
        
        
        if(txtAPI_KEY.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.API_KEY, Convert.ToString(txtAPI_KEY.Value));
        
        
        if(txtTOKEN.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.TOKEN, Convert.ToString(txtTOKEN.Value));
        
        
        if(txtLOCATION.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.LOCATION, Convert.ToString(txtLOCATION.Value));
        
        
        if(txtEMAIL.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
        
        
        if(txtFUNS.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.FUNS, Convert.ToInt32(txtFUNS.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.TYPE, Convert.ToInt32(txtTYPE.Value));
        
        
        if(txtSTART_DAY.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.START_DAY, Convert.ToDateTime(txtSTART_DAY.Value));
        
        
        if(txtEND_DAY.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.END_DAY, Convert.ToDateTime(txtEND_DAY.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.STATUS, Convert.ToInt32(txtSTATUS.Value));
        
        
        if(txtPACKAGE_ID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.PACKAGE_ID, Convert.ToDecimal(txtPACKAGE_ID.Value));
        
        
        if(txtIS_NEWS.Value !="" )
            condObj.IS_NEWS = Convert.ToInt32(txtIS_NEWS.Value);
        
        
        if(txtDEFAULT_REPLAY.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY, Convert.ToString(txtDEFAULT_REPLAY.Value));
        
        
        if(txtDEFAULT_REPLAY_FALG.Value !="" )
            condObj.DEFAULT_REPLAY_FALG = Convert.ToInt32(txtDEFAULT_REPLAY_FALG.Value);
        
        
        if(txtLBS_DISTANCE.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.LBS_DISTANCE, Convert.ToDecimal(txtLBS_DISTANCE.Value));
        
        
        if(txtAPPID.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.APPID, Convert.ToString(txtAPPID.Value));
        
        
        if(txtAPPSESECRET.Value !="" )
            condObj.Like_OR(WEC_PUBLICLIST.Attribute.APPSESECRET, Convert.ToString(txtAPPSESECRET.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_PUBLICLIST>(hidCondition.Value);
            }
            List<WEC_PUBLICLIST> listVal = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
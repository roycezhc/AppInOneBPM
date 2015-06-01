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

public partial class HR_CHKWKDIVKEYVALUESels2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_CHKWKDIVKEYVALUE()._ZhName;

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
    HR_CHKWKDIVKEYVALUE valObj = new HR_CHKWKDIVKEYVALUE();
    HR_CHKWKDIVKEYVALUE condObj = new HR_CHKWKDIVKEYVALUE();
    List<HR_CHKWKDIVKEYVALUE> listObj = new List<HR_CHKWKDIVKEYVALUE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHKWKDIVKEYVALUE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_CHKWKDIVKEYVALUE roleOld = new HR_CHKWKDIVKEYVALUE();
                roleOld.Where(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Request["ids"].ToString());
                listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].OtherKeyFieldName + "',Name:'" + listObj[i].OtherKeyFieldName + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].OtherKeyFieldName;
                }
            }
            try
            {

                listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_CHKWKDIVKEYVALUE();
        
        
        if(txtGroupId.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.GroupId, Convert.ToInt32(txtGroupId.Value));
        
        
        if(txtDeviceID.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.DeviceID, Convert.ToString(txtDeviceID.Value));
        
        
        if(txtAIOTableName.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName, Convert.ToString(txtAIOTableName.Value));
        
        
        if(txtAIOKeyFieldName.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName, Convert.ToString(txtAIOKeyFieldName.Value));
        
        
        if(txtOtherKeyFieldName.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Convert.ToString(txtOtherKeyFieldName.Value));
        
        
        if(txtAIOKeyValue.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue, Convert.ToString(txtAIOKeyValue.Value));
        
        
        if(txtOtherKeyValue.Value !="" )
            condObj.Like_OR(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue, Convert.ToString(txtOtherKeyValue.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHKWKDIVKEYVALUE>(hidCondition.Value);
            }
            List<HR_CHKWKDIVKEYVALUE> listVal = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
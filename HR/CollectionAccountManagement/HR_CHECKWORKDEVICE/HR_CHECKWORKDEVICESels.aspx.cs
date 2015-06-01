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
public partial class HR_CHECKWORKDEVICESels2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_CHECKWORKDEVICE()._ZhName;

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
    HR_CHECKWORKDEVICE valObj = new HR_CHECKWORKDEVICE();
    HR_CHECKWORKDEVICE condObj = new HR_CHECKWORKDEVICE();
    List<HR_CHECKWORKDEVICE> listObj = new List<HR_CHECKWORKDEVICE>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_CHECKWORKDEVICE.Attribute.DeviceID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_CHECKWORKDEVICE roleOld = new HR_CHECKWORKDEVICE();
                roleOld.Where(HR_CHECKWORKDEVICE.Attribute.DeviceID, Request["ids"].ToString());
                listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].DeviceID + "',Name:'" + listObj[i].DeviceID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].DeviceID;
                }
            }
            try
            {

                listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_CHECKWORKDEVICE();
        
        
        if(txtDeviceID.Value !="" )
            condObj.Like_OR(HR_CHECKWORKDEVICE.Attribute.DeviceID, Convert.ToString(txtDeviceID.Value));
        
        
        if(txtORG_ID.Value !="" )
            condObj.Like_OR(HR_CHECKWORKDEVICE.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
        
        
        if(txtUSE_FLAG.Value !="" )
            condObj.USE_FLAG = Convert.ToString(txtUSE_FLAG.Value);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHECKWORKDEVICE>(hidCondition.Value);
            }
            List<HR_CHECKWORKDEVICE> listVal = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
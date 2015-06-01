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
public partial class IM_PURORDERSels : AgileFrame.AppInOne.Common.BasePage
{
    public string title = new IM_PURORDER()._ZhName;

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
    IM_PURORDER valObj = new IM_PURORDER();
    IM_PURORDER condObj = new IM_PURORDER();
    List<IM_PURORDER> listObj = new List<IM_PURORDER>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        condObj.OrderBy(IM_PURORDER.Attribute.PORD_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                IM_PURORDER roleOld = new IM_PURORDER();
                roleOld.Where(IM_PURORDER.Attribute.PORD_ID, Request["ids"].ToString());
                listObj = BLLTable<IM_PURORDER>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].PORD_ID + "',Name:'" + listObj[i].PORD_ID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].PORD_ID;
                }
            }
            try
            {

                listObj = BLLTable<IM_PURORDER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new IM_PURORDER();
        
        
        if(txtPORD_ID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.PORD_ID, Convert.ToDecimal(txtPORD_ID.Value));
        
        
        if(txtPORD_NO.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.PORD_NO, Convert.ToString(txtPORD_NO.Value));
        
        
        if(txtC_DATE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.C_DATE, Convert.ToDateTime(txtC_DATE.Value));
        
        
        if(txtORG_ID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
        
        
        if(txtDEPT_ID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.DEPT_ID, Convert.ToString(txtDEPT_ID.Value));
        
        
        if(txtSUP_ID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.SUP_ID, Convert.ToDecimal(txtSUP_ID.Value));
        
        
        if(txtPERSON_HID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.PERSON_HID, Convert.ToDecimal(txtPERSON_HID.Value));
        
        
        if(txtTS_NO.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.TS_NO, Convert.ToString(txtTS_NO.Value));
        
        
        if(txtGOODES_NUM.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.GOODES_NUM, Convert.ToDecimal(txtGOODES_NUM.Value));
        
        
        if(txtARRIVAL_DATE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.ARRIVAL_DATE, Convert.ToDateTime(txtARRIVAL_DATE.Value));
        
        
        if(txtPACKAGE_TYPE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.PACKAGE_TYPE, Convert.ToString(txtPACKAGE_TYPE.Value));
        
        
        if(txtTS_DEPT.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.TS_DEPT, Convert.ToString(txtTS_DEPT.Value));
        
        
        if(txtPHONE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
        
        
        if(txtCOST_PEICE_FLAG.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.COST_PEICE_FLAG, Convert.ToString(txtCOST_PEICE_FLAG.Value));
        
        
        if(txtSTOR_ID.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.STOR_ID, Convert.ToDecimal(txtSTOR_ID.Value));
        
        
        if(txtDEDUCTION_RATE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.DEDUCTION_RATE, Convert.ToDecimal(txtDEDUCTION_RATE.Value));
        
        
        if(txtTAX_RATE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.TAX_RATE, Convert.ToDecimal(txtTAX_RATE.Value));
        
        
        if(txtCREATER.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.CREATER, Convert.ToString(txtCREATER.Value));
        
        
        if(txtCHECKER.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.CHECKER, Convert.ToString(txtCHECKER.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtREMARK.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.REMARK, Convert.ToString(txtREMARK.Value));
        
        
        if(txtEXP1.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.EXP1, Convert.ToString(txtEXP1.Value));
        
        
        if(txtEXP2.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.EXP2, Convert.ToString(txtEXP2.Value));
        
        
        if(txtEXP3.Value !="" )
            condObj.Like_OR(IM_PURORDER.Attribute.EXP3, Convert.ToString(txtEXP3.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<IM_PURORDER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<IM_PURORDER>(hidCondition.Value);
            }
            List<IM_PURORDER> listVal = BLLTable<IM_PURORDER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
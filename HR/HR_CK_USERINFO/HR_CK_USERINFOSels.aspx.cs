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
using AgileFrame.AppInOne.SYS;
public partial class HR_CK_USERINFOSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_CK_USERINFO()._ZhName;

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
    HR_CK_USERINFO valObj = new HR_CK_USERINFO();
    HR_CK_USERINFO condObj = new HR_CK_USERINFO();
    List<HR_CK_USERINFO> listObj = new List<HR_CK_USERINFO>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_CK_USERINFO.Attribute.USERID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_CK_USERINFO roleOld = new HR_CK_USERINFO();
                roleOld.Where(HR_CK_USERINFO.Attribute.USERID, Request["ids"].ToString());
                listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].USERID + "',Name:'" + listObj[i].USERID + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].USERID;
                }
            }
            try
            {

                listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_CK_USERINFO();
        
        
        if(txtUSERID.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
        
        
        if(txtSTAFF_ID.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
        
        
        if(txtBADGENUMBER.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.BADGENUMBER, Convert.ToString(txtBADGENUMBER.Value));
        
        
        if(txtSSN.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.SSN, Convert.ToString(txtSSN.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtGENDER.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.GENDER, Convert.ToString(txtGENDER.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtPAGER.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.PAGER, Convert.ToString(txtPAGER.Value));
        
        
        if(txtBIRTHDAY.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.BIRTHDAY, Convert.ToDateTime(txtBIRTHDAY.Value));
        
        
        if(txtHIREDDAY.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.HIREDDAY, Convert.ToDateTime(txtHIREDDAY.Value));
        
        
        if(txtSTREET.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.STREET, Convert.ToString(txtSTREET.Value));
        
        
        if(txtCITY.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.CITY, Convert.ToString(txtCITY.Value));
        
        
        if(txtSTATE.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.STATE, Convert.ToString(txtSTATE.Value));
        
        
        if(txtZIP.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.ZIP, Convert.ToString(txtZIP.Value));
        
        
        if(txtOPHONE.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.OPHONE, Convert.ToString(txtOPHONE.Value));
        
        
        if(txtFPHONE.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.FPHONE, Convert.ToString(txtFPHONE.Value));
        
        
        if(txtVERIFICATIONMETHOD.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD, Convert.ToInt16(txtVERIFICATIONMETHOD.Value));
        
        
        if(txtDEFAULTDEPTID.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.DEFAULTDEPTID, Convert.ToInt16(txtDEFAULTDEPTID.Value));
        
        
        if(txtSECURITYFLAGS.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.SECURITYFLAGS, Convert.ToInt16(txtSECURITYFLAGS.Value));
        
        
        if(txtATT.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.ATT, Convert.ToInt16(txtATT.Value));
        
        
        if(txtINLATE.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.INLATE, Convert.ToInt16(txtINLATE.Value));
        
        
        if(txtOUTEARLY.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.OUTEARLY, Convert.ToInt16(txtOUTEARLY.Value));
        
        
        if(txtOVERTIME.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.OVERTIME, Convert.ToInt16(txtOVERTIME.Value));
        
        
        if(txtSEP.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.SEP, Convert.ToInt16(txtSEP.Value));
        
        
        if(txtHOLIDAY.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.HOLIDAY, Convert.ToInt16(txtHOLIDAY.Value));
        
        
        if(txtMINZU.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.MINZU, Convert.ToString(txtMINZU.Value));
        
        
        if(txtPASSWORD.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.PASSWORD, Convert.ToString(txtPASSWORD.Value));
        
        
        if(txtLUNCHDURATION.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.LUNCHDURATION, Convert.ToInt16(txtLUNCHDURATION.Value));
        
        
        if(txtMVerifyPass.Value !="" )
            condObj.Like_OR(HR_CK_USERINFO.Attribute.MVerifyPass, Convert.ToString(txtMVerifyPass.Value));
        

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CK_USERINFO>(hidCondition.Value);
            }
            List<HR_CK_USERINFO> listVal = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
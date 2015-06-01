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
public partial class HR_CHECKINOUTSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new HR_CHECKINOUT()._ZhName;

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
    HR_CHECKINOUT valObj = new HR_CHECKINOUT();
    HR_CHECKINOUT condObj = new HR_CHECKINOUT();
    List<HR_CHECKINOUT> listObj = new List<HR_CHECKINOUT>();
    int recount = -1;
   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_CHECKINOUT.Attribute.CHECKTIME, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_CHECKINOUT roleOld = new HR_CHECKINOUT();
                roleOld.Where(HR_CHECKINOUT.Attribute.CHECKTIME, Request["ids"].ToString());
                listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].CHECKTIME + "',Name:'" + listObj[i].CHECKTIME + "'}";//�����Name������ʾ���б��У��������ض��塣
                    hidInitIDS.Value += listObj[i].CHECKTIME;
                }
            }
            try
            {

                listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_CHECKINOUT();
        
        
        if(txtUSERID.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
        
        
        if(txtCHECKTIME.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.CHECKTIME, Convert.ToDateTime(txtCHECKTIME.Value));
        
        
        if(txtSTAFF_ID.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
        
        
        if(txtCHECKTYPE.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.CHECKTYPE, Convert.ToString(txtCHECKTYPE.Value));
        
        
        if(txtVERIFYCODE.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.VERIFYCODE, Convert.ToInt32(txtVERIFYCODE.Value));
        
        
        if(txtSENSORID.Value !="" )
            condObj.Like_OR(HR_CHECKINOUT.Attribute.SENSORID, Convert.ToString(txtSENSORID.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHECKINOUT>(hidCondition.Value);
            }
            List<HR_CHECKINOUT> listVal = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
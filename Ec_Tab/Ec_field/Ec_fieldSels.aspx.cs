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

public partial class Ec_fieldSels : BaseAdminPage
{
    public string title = new Ec_field()._ZhName;

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
    Ec_field valObj = new Ec_field();
    Ec_field condObj = new Ec_field();
    List<Ec_field> listObj = new List<Ec_field>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_field.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_field.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_field.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_field.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_field.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_field.Attribute.EXP3);
        #endregion
        condObj.OrderBy(Ec_field.Attribute.Fieldid, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                Ec_field roleOld = new Ec_field();
                roleOld.Where(Ec_field.Attribute.Fieldid, Request["ids"].ToString());
                listObj = BLLTable<Ec_field>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Fieldid + "',Name:'" + listObj[i].Fieldid + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].Fieldid;
                }
            }
            try
            {

                listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new Ec_field();
        
        
        if(txtFieldid.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Fieldid, Convert.ToInt32(txtFieldid.Value));
        
        
        if(txtTabid.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtColumnname.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Columnname, Convert.ToString(txtColumnname.Value));
        
        
        if(txtTablename.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Tablename, Convert.ToString(txtTablename.Value));
        
        
        if(txtGeneratedtype.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Generatedtype, Convert.ToInt32(txtGeneratedtype.Value));
        
        
        if(txtUitype.Value !="" )
            condObj.Uitype = Convert.ToString(txtUitype.Value);
        
        
        if(txtFieldname.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Fieldname, Convert.ToString(txtFieldname.Value));
        
        
        if(txtFieldlabel.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Fieldlabel, Convert.ToString(txtFieldlabel.Value));
        
        
        if(txtReadonly.Value !="" )
            condObj.Readonly = Convert.ToInt32(txtReadonly.Value);
        
        
        if(txtPresence.Value !="" )
            condObj.Presence = Convert.ToInt32(txtPresence.Value);
        
        
        if(txtSelected.Value !="" )
            condObj.Selected = Convert.ToInt32(txtSelected.Value);
        
        
        if(txtMaximumlength.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Maximumlength, Convert.ToInt32(txtMaximumlength.Value));
        
        
        if(txtSequence.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
        
        
        if(txtBlock.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Block, Convert.ToInt32(txtBlock.Value));
        
        
        if(txtDisplaytype.Value !="" )
            condObj.Displaytype = Convert.ToInt32(txtDisplaytype.Value);
        
        
        if(txtTypeofdata.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Typeofdata, Convert.ToString(txtTypeofdata.Value));
        
        
        if(txtQuickcreate.Value !="" )
            condObj.Quickcreate = Convert.ToInt32(txtQuickcreate.Value);
        
        
        if(txtQuickcreatesequence.Value !="" )
            condObj.Like_OR(Ec_field.Attribute.Quickcreatesequence, Convert.ToInt32(txtQuickcreatesequence.Value));
        
        
        if(txtInfo_type.Value !="" )
            condObj.Info_type = Convert.ToString(txtInfo_type.Value);
        
        
        if(txtCtrlType.Value !="" )
            condObj.CtrlType = Convert.ToString(txtCtrlType.Value);

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_field>(hidCondition.Value);
            }
            List<Ec_field> listVal = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
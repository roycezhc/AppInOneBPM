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

public partial class Ec_relatedlistsSels : BaseAdminPage
{
    public string title = new Ec_relatedlists()._ZhName;

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
    Ec_relatedlists valObj = new Ec_relatedlists();
    Ec_relatedlists condObj = new Ec_relatedlists();
    List<Ec_relatedlists> listObj = new List<Ec_relatedlists>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP3);
        #endregion
        condObj.OrderBy(Ec_relatedlists.Attribute.Relation_id, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                Ec_relatedlists roleOld = new Ec_relatedlists();
                roleOld.Where(Ec_relatedlists.Attribute.Relation_id, Request["ids"].ToString());
                listObj = BLLTable<Ec_relatedlists>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Relation_id + "',Name:'" + listObj[i].Relation_id + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].Relation_id;
                }
            }
            try
            {

                listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new Ec_relatedlists();
        
        
        if(txtRelation_id.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Relation_id, Convert.ToInt32(txtRelation_id.Value));
        
        
        if(txtTabid.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtRelated_tabid.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Related_tabid, Convert.ToInt32(txtRelated_tabid.Value));
        
        
        if(txtName.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Name, Convert.ToString(txtName.Value));
        
        
        if(txtSequence.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
        
        
        if(txtLabel.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Label, Convert.ToString(txtLabel.Value));
        
        
        if(txtPresence.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Presence, Convert.ToInt32(txtPresence.Value));
        
        
        if(txtTabTableName.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.TabTableName, Convert.ToString(txtTabTableName.Value));
        
        
        if(txtColumnName_PK.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.ColumnName_PK, Convert.ToString(txtColumnName_PK.Value));
        
        
        if(txtColumnName_FK.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.ColumnName_FK, Convert.ToString(txtColumnName_FK.Value));
        
        
        if(txtRelated_tabTableName.Value !="" )
            condObj.Like_OR(Ec_relatedlists.Attribute.Related_tabTableName, Convert.ToString(txtRelated_tabTableName.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_relatedlists>(hidCondition.Value);
            }
            List<Ec_relatedlists> listVal = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
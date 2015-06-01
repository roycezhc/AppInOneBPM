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

public partial class Ec_blocksSels : BaseAdminPage
{
    public string title = new Ec_blocks()._ZhName;

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
    Ec_blocks valObj = new Ec_blocks();
    Ec_blocks condObj = new Ec_blocks();
    List<Ec_blocks> listObj = new List<Ec_blocks>();
    int recount = -1;
   /// <summary>视图界面帮助类，实现枚举变量转换</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_blocks.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_blocks.Attribute.EXP3);
        #endregion
        condObj.OrderBy(Ec_blocks.Attribute.Blockid, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "查询");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                Ec_blocks roleOld = new Ec_blocks();
                roleOld.Where(Ec_blocks.Attribute.Blockid, Request["ids"].ToString());
                listObj = BLLTable<Ec_blocks>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Blockid + "',Name:'" + listObj[i].Blockid + "'}";//这里的Name用于显示在列表中，请自行重定义。
                    hidInitIDS.Value += listObj[i].Blockid;
                }
            }
            try
            {

                listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new Ec_blocks();
        
        
        if(txtBlockid.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Blockid, Convert.ToInt32(txtBlockid.Value));
        
        
        if(txtTabid.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtBlocklabel.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Blocklabel, Convert.ToString(txtBlocklabel.Value));
        
        
        if(txtSequence.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
        
        
        if(txtShow_title.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Show_title, Convert.ToInt32(txtShow_title.Value));
        
        
        if(txtVisible.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Visible, Convert.ToInt32(txtVisible.Value));
        
        
        if(txtCreate_view.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Create_view, Convert.ToInt32(txtCreate_view.Value));
        
        
        if(txtEdit_view.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Edit_view, Convert.ToInt32(txtEdit_view.Value));
        
        
        if(txtDetail_view.Value !="" )
            condObj.Like_OR(Ec_blocks.Attribute.Detail_view, Convert.ToInt32(txtDetail_view.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_blocks>(hidCondition.Value);
            }
            List<Ec_blocks> listVal = BLLTable<Ec_blocks>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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
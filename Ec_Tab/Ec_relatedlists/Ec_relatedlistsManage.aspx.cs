using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;

public partial class Ec_relatedlistsManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_relatedlistsManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("Ec_relatedlistsManage.aspx", path);
    }
    protected string pid="0";

    Ec_relatedlists valObj = new Ec_relatedlists();
    Ec_relatedlists condObj = new Ec_relatedlists();
    List<Ec_relatedlists> listObj = new List<Ec_relatedlists>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(Ec_relatedlists condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(Ec_relatedlists.Attribute.Relation_id, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

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
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            //aspPager.ShowInputBox = AgileFrame.Core.WebSystem.WebCtrls.ShowInputBox.Auto;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_relatedlists>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new Ec_relatedlists();

        
        
        if(txtRelation_id.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Relation_id, Convert.ToInt32(txtRelation_id.Value));
        
        
        if(txtTabid.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtRelated_tabid.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Related_tabid, Convert.ToInt32(txtRelated_tabid.Value));
        
        
        if(txtName.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Name, Convert.ToString(txtName.Value));
        
        
        if(txtSequence.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
        
        
        if(txtLabel.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Label, Convert.ToString(txtLabel.Value));
        
        
        if(txtPresence.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Presence, Convert.ToInt32(txtPresence.Value));
        
        
        if(txtTabTableName.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.TabTableName, Convert.ToString(txtTabTableName.Value));
        
        
        if(txtColumnName_PK.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.ColumnName_PK, Convert.ToString(txtColumnName_PK.Value));
        
        
        if(txtColumnName_FK.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.ColumnName_FK, Convert.ToString(txtColumnName_FK.Value));
        
        
        if(txtRelated_tabTableName.Value !="" )
            condObj.Like(Ec_relatedlists.Attribute.Related_tabTableName, Convert.ToString(txtRelated_tabTableName.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_relatedlists>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
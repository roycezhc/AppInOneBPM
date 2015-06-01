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

public partial class WEC_ArticleManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_ArticleManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_ArticleManage.aspx", path);
    }
     protected string pid = "0", deptid="";

    WEC_Article valObj = new WEC_Article();
    WEC_Article condObj = new WEC_Article();
    List<WEC_Article> listObj = new List<WEC_Article>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_Article condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_Article.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        if (deptid != "")
        {
            condObj.CID = deptid;
            //Response.Write(deptid);
        }
        else
        {
            condObj.Where("CID = '' or CID is null");
        }

        listObj = BLLTable<WEC_Article>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["id"] != null)
        {
            deptid = Request["id"];
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
            condObj = JsonServiceBase.FromJson<WEC_Article>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_Article();

        
        
        if(txtID.Value !="" )
            condObj.Like(WEC_Article.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtCID.Value !="" )
            condObj.Like(WEC_Article.Attribute.CID, Convert.ToString(txtCID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like(WEC_Article.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like(WEC_Article.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtDES.Value !="" )
            condObj.Like(WEC_Article.Attribute.DES, Convert.ToString(txtDES.Value));
        
        
        if(txtCONTENT.Value !="" )
            condObj.Like(WEC_Article.Attribute.CONTENT, Convert.ToString(txtCONTENT.Value));
        
        
        if(txtURL.Value !="" )
            condObj.Like(WEC_Article.Attribute.URL, Convert.ToString(txtURL.Value));
        
        
        if(txtPIC_URL.Value !="" )
            condObj.Like(WEC_Article.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
        
        
        if(txtMODEL_ID.Value !="" )
            condObj.Like(WEC_Article.Attribute.MODEL_ID, Convert.ToDecimal(txtMODEL_ID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_Article>(hidCondition.Value);
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
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

public partial class SYS_GUSETBOOKManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_GUSETBOOKManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("SYS_GUSETBOOKManage.aspx", path);
    }
    protected string pid="0";

    SYS_GUSETBOOK valObj = new SYS_GUSETBOOK();
    SYS_GUSETBOOK condObj = new SYS_GUSETBOOK();
    List<SYS_GUSETBOOK> listObj = new List<SYS_GUSETBOOK>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_GUSETBOOK condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_GUSETBOOK.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<SYS_GUSETBOOK>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_GUSETBOOK.Attribute.EXP3);
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
            
            txtTYPE.Items.AddRange(FormHelper.GetListItem(SYS_GUSETBOOK.Attribute.TYPE));                    
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_GUSETBOOK>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_GUSETBOOK();

        
        
        if(txtID.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
        
        
        if(txtMEMO.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.MEMO, Convert.ToString(txtMEMO.Value));
        
        
        if(txtEMAIL.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
        
        
        if(txtMOBIL.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.MOBIL, Convert.ToString(txtMOBIL.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtANSWER.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.ANSWER, Convert.ToString(txtANSWER.Value));
        
        
        if(txtUSERNAME.Value !="" )
            condObj.Like(SYS_GUSETBOOK.Attribute.USERNAME, Convert.ToString(txtUSERNAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_GUSETBOOK>(hidCondition.Value);
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
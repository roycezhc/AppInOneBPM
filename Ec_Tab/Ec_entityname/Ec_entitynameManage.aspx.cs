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

public partial class Ec_entitynameManage : BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_entitynameManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("Ec_entitynameManage.aspx", path);
    }
    protected string pid="0";

    Ec_entityname valObj = new Ec_entityname();
    Ec_entityname condObj = new Ec_entityname();
    List<Ec_entityname> listObj = new List<Ec_entityname>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(Ec_entityname condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(Ec_entityname.Attribute.Tabid, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
        
        listObj = BLLTable<Ec_entityname>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP3);
        #endregion
        Ec_entityname val = new Ec_entityname();
        List<AttributeItem> lstCol = val.af_AttributeItemList;
        foreach (AttributeItem aa in lstCol)
        {
            string a = aa.ZhName;
            BaseCtrlType b = aa.CtrlType();
            //string c = aa.GetBlockID();
            //bool d = aa.IsVisible();

        }
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
            condObj = JsonServiceBase.FromJson<Ec_entityname>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new Ec_entityname();

        
        
        if(txtTabid.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtModulename.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Modulename, Convert.ToString(txtModulename.Value));
        
        
        if(txtTablename.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Tablename, Convert.ToString(txtTablename.Value));
        
        
        if(txtFieldname.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Fieldname, Convert.ToString(txtFieldname.Value));
        
        
        if(txtEntityidfield.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Entityidfield, Convert.ToString(txtEntityidfield.Value));
        
        
        if(txtRemarks.Value !="" )
            condObj.Like(Ec_entityname.Attribute.Remarks, Convert.ToString(txtRemarks.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_entityname>(hidCondition.Value);
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
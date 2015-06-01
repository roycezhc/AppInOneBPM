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

public partial class WEC_MODELManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_MODELManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_MODELManage.aspx", path);
    }
    protected string pid="0";

    WEC_MODEL valObj = new WEC_MODEL();
    WEC_MODEL condObj = new WEC_MODEL();
    List<WEC_MODEL> listObj = new List<WEC_MODEL>();
    int recount = -1;//查询总记录数
    protected string title = "";
    public string aid="";
    private void BindList(WEC_MODEL condObj, int curPage)
    {
        valObj.af_PageBy(WEC_MODEL.Attribute.TYPE, Order.Asc);
        
        //if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
        //    condObj.af_PageBy(WEC_MODEL.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        valObj.setConn(conn).setModule(ModuleName);
        List<ITableImplement> valueList;
        List<Relation> relationList;
        if (valObj.GetModule(out valueList, out relationList) > 0)
            listObj = BLLTable<WEC_MODEL>.Factory(conn).SelectByPage(valObj, relationList, valueList, condObj, aspPager.PageSize, curPage, ref recount);    
        else
            listObj = BLLTable<WEC_MODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        aid = userBase2.Curraid;
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_MODEL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_MODEL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_MODEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_MODEL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_MODEL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_MODEL.Attribute.EXP3);
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
            
            txtTYPE.Items.AddRange(FormHelper.GetListItem(WEC_MODEL.Attribute.TYPE));                    
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_MODEL.Attribute.STATUS));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_MODEL>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_MODEL();

        
        
        if(txtID.Value !="" )
            condObj.Like(WEC_MODEL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
        
        
        if(txtPIC_URL.Value !="" )
            condObj.Like(WEC_MODEL.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
        
        
        if(txtPATH.Value !="" )
            condObj.Like(WEC_MODEL.Attribute.PATH, Convert.ToString(txtPATH.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(WEC_MODEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtNAME.Value !="" )
            condObj.Like(WEC_MODEL.Attribute.NAME, Convert.ToString(txtNAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_MODEL>(hidCondition.Value);
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
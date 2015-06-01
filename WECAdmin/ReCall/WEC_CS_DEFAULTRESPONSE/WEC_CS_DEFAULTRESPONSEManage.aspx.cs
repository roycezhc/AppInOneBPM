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

public partial class WEC_CS_DEFAULTRESPONSEManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_DEFAULTRESPONSEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_CS_DEFAULTRESPONSEManage.aspx", path);
    }
    protected string pid="0";

    WEC_CS_DEFAULTRESPONSE valObj = new WEC_CS_DEFAULTRESPONSE();
    WEC_CS_DEFAULTRESPONSE condObj = new WEC_CS_DEFAULTRESPONSE();
    List<WEC_CS_DEFAULTRESPONSE> listObj = new List<WEC_CS_DEFAULTRESPONSE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_CS_DEFAULTRESPONSE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_CS_DEFAULTRESPONSE.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<WEC_CS_DEFAULTRESPONSE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CS_DEFAULTRESPONSE.Attribute.EXP3);
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
                                
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_CS_DEFAULTRESPONSE.Attribute.STATUS));                    
            txtSTARTTIME.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtENDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_CS_DEFAULTRESPONSE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_CS_DEFAULTRESPONSE();

        
        
        if(txtID.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtADDTIME.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtSTATUS.Value != "" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtSTARTTIME.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME, Convert.ToDateTime(txtSTARTTIME.Value));
        
        
        if(txtENDTIME.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME, Convert.ToDateTime(txtENDTIME.Value));
        
        
        if(txtMSGCONTENT.Value != "" )
            condObj.Like(WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT, Convert.ToString(txtMSGCONTENT.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_CS_DEFAULTRESPONSE>(hidCondition.Value);
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
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
public partial class CRM_CUSTManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("CRM_CUSTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("CRM_CUSTManage.aspx", path);
    }
    protected string pid="0";

    CRM_CUST valObj = new CRM_CUST();
    CRM_CUST condObj = new CRM_CUST();
    List<CRM_CUST> listObj = new List<CRM_CUST>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(CRM_CUST condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(CRM_CUST.Attribute.Cus_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<CRM_CUST>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideTableColumnList.Add(CRM_CUST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP1);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP2);
        //hideFindColumnList.Add(CRM_CUST.Attribute.EXP3);
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
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            #endregion
            #region//数据初始化
            
            txtState.Items.AddRange(FormHelper.GetListItem(CRM_CUST.Attribute.State));
            txtIsSign.Items.AddRange(FormHelper.GetListItem(CRM_CUST.Attribute.IsSign));                    
            txtAddTime.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtEditTime.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<CRM_CUST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new CRM_CUST();

        
        
        if(txtCus_ID.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Cus_ID, Convert.ToInt32(txtCus_ID.Value));
        
        
        if(txtCus_Name.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Cus_Name, Convert.ToString(txtCus_Name.Value));
        
        
        if(txtJob.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Job, Convert.ToString(txtJob.Value));
        
        
        if(txtRelationTxt.Value !="" )
            condObj.Like(CRM_CUST.Attribute.RelationTxt, Convert.ToString(txtRelationTxt.Value));
        
        
        if(txtRecorder.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Recorder, Convert.ToString(txtRecorder.Value));
        
        
        if(txtMobPhone.Value !="" )
            condObj.Like(CRM_CUST.Attribute.MobPhone, Convert.ToString(txtMobPhone.Value));
        
        
        if(txtPhone.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Phone, Convert.ToString(txtPhone.Value));
        
        
        if(txtContactName.Value !="" )
            condObj.Like(CRM_CUST.Attribute.ContactName, Convert.ToString(txtContactName.Value));
        
        
        if(txtShopName.Value !="" )
            condObj.Like(CRM_CUST.Attribute.ShopName, Convert.ToString(txtShopName.Value));
        
        
        if(txtShopAddr.Value !="" )
            condObj.Like(CRM_CUST.Attribute.ShopAddr, Convert.ToString(txtShopAddr.Value));
        
        
        if(txtQQ.Value !="" )
            condObj.Like(CRM_CUST.Attribute.QQ, Convert.ToString(txtQQ.Value));
        
        
        if(txtWW.Value !="" )
            condObj.Like(CRM_CUST.Attribute.WW, Convert.ToString(txtWW.Value));
        
        
        if(txtEmail.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Email, Convert.ToString(txtEmail.Value));
        
        
        if(txtAddress.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Address, Convert.ToString(txtAddress.Value));
        
        
        if(txtTrade.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Trade, Convert.ToString(txtTrade.Value));
        
        
        if(txtType.Value !="" )
            condObj.Like(CRM_CUST.Attribute.Type, Convert.ToInt32(txtType.Value));
        
        
        if(txtState.Value !="" )
            condObj.State = Convert.ToInt32(txtState.Value);
        
        
        if(txtIsSign.Value !="" )
            condObj.IsSign = Convert.ToInt32(txtIsSign.Value);
        
        
        if(txtAddTime.Value !="" )
            condObj.Like(CRM_CUST.Attribute.AddTime, Convert.ToDateTime(txtAddTime.Value));
        
        
        if(txtEditTime.Value !="" )
            condObj.Like(CRM_CUST.Attribute.EditTime, Convert.ToDateTime(txtEditTime.Value));
        
        
        if(txtPATH.Value !="" )
            condObj.Like(CRM_CUST.Attribute.PATH, Convert.ToString(txtPATH.Value));
        
        
        if(txtPNAME.Value !="" )
            condObj.Like(CRM_CUST.Attribute.PNAME, Convert.ToString(txtPNAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<CRM_CUST>(hidCondition.Value);
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
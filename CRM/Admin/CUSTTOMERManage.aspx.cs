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
public partial class V_CRM_CUSTTOMERManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("V_CRM_CUSTTOMERManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("V_CRM_CUSTTOMERManage.aspx", path);
    }
    protected string pid="0";

    V_CRM_CUSTTOMER valObj = new V_CRM_CUSTTOMER();
    V_CRM_CUSTTOMER condObj = new V_CRM_CUSTTOMER();
    List<V_CRM_CUSTTOMER> listObj = new List<V_CRM_CUSTTOMER>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(V_CRM_CUSTTOMER condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(V_CRM_CUSTTOMER.Attribute.Cus_ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<V_CRM_CUSTTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
       
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
                                
            txtBirthday.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtAddTime.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtEditTime.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtLoadHighSeasTime.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_CRM_CUSTTOMER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new V_CRM_CUSTTOMER();

        
        
        if(txtCus_ID.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Cus_ID, Convert.ToInt32(txtCus_ID.Value));
        
        
        if(txtCompanyName.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.CompanyName, Convert.ToString(txtCompanyName.Value));
        
        
        if(txtCompanyAddress.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.CompanyAddress, Convert.ToString(txtCompanyAddress.Value));
        
        
        if(txtShopName.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.ShopName, Convert.ToString(txtShopName.Value));
        
        
        if(txtShopNameURL.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.ShopNameURL, Convert.ToString(txtShopNameURL.Value));
        
        
        if(txtCustSex.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.CustSex, Convert.ToInt32(txtCustSex.Value));
        
        
        if(txtBirthday.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Birthday, Convert.ToDateTime(txtBirthday.Value));
        
        
        if(txtWangWangId.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.WangWangId, Convert.ToString(txtWangWangId.Value));
        
        
        if(txtCustQQ.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.CustQQ, Convert.ToString(txtCustQQ.Value));
        
        
        if(txtLastEditors.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.LastEditors, Convert.ToString(txtLastEditors.Value));
        
        
        if(txtCus_Name.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Cus_Name, Convert.ToString(txtCus_Name.Value));
        
        
        if(txtJob.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Job, Convert.ToString(txtJob.Value));
        
        
        if(txtRelationTxt.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.RelationTxt, Convert.ToString(txtRelationTxt.Value));
        
        
        if(txtRecorder.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Recorder, Convert.ToString(txtRecorder.Value));
        
        
        if(txtPhone.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Phone, Convert.ToString(txtPhone.Value));
        
        
        if(txtContactName.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.ContactName, Convert.ToString(txtContactName.Value));
        
        
        if(txtEmail.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Email, Convert.ToString(txtEmail.Value));
        
        
        if(txtAddress.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Address, Convert.ToString(txtAddress.Value));
        
        
        if(txtTrade.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Trade, Convert.ToString(txtTrade.Value));
        
        
        if(txtType.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.Type, Convert.ToInt32(txtType.Value));
        
        
        if(txtState.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.State, Convert.ToInt32(txtState.Value));
        
        
        if(txtIsSign.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.IsSign, Convert.ToInt32(txtIsSign.Value));
        
        
        if(txtAddTime.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.AddTime, Convert.ToDateTime(txtAddTime.Value));
        
        
        if(txtEditTime.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.EditTime, Convert.ToDateTime(txtEditTime.Value));
        
        
        if(txtLoadHighSeasTime.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.LoadHighSeasTime, Convert.ToDateTime(txtLoadHighSeasTime.Value));
        
        
        if(txtMobPhone.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.MobPhone, Convert.ToString(txtMobPhone.Value));
        
        
        if(txtPATH.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.PATH, Convert.ToString(txtPATH.Value));
        
        
        if(txtPNAME.Value !="" )
            condObj.Like(V_CRM_CUSTTOMER.Attribute.PNAME, Convert.ToString(txtPNAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_CRM_CUSTTOMER>(hidCondition.Value);
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
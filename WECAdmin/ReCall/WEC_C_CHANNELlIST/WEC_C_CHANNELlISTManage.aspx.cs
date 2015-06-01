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

public partial class WEC_C_CHANNELlISTManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_C_CHANNELlISTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_C_CHANNELlISTManage.aspx", path);
    }
    protected string pid="0";

    WEC_C_CHANNELlIST valObj = new WEC_C_CHANNELlIST();
    WEC_C_CHANNELlIST condObj = new WEC_C_CHANNELlIST();
    List<WEC_C_CHANNELlIST> listObj = new List<WEC_C_CHANNELlIST>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_C_CHANNELlIST condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_C_CHANNELlIST.Attribute.ID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
        if (!string.IsNullOrEmpty(userBase2.Curraid)) condObj.AID = Convert.ToInt32(userBase2.Curraid);
        listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
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
            
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_C_CHANNELlIST.Attribute.STATUS));                    
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            txtTYPE.Items.AddRange(FormHelper.GetListItem(WEC_C_CHANNELlIST.Attribute.TYPE));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_C_CHANNELlIST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_C_CHANNELlIST();

        
        
        if(txtID.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtURL.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.URL, Convert.ToString(txtURL.Value));
        
        
        if(txtREMARK.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.REMARK, Convert.ToString(txtREMARK.Value));
        
        
        if(txtCATEGORY_ID.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.CATEGORY_ID, Convert.ToInt32(txtCATEGORY_ID.Value));
        
        
        if(txtQRCODE.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.QRCODE, Convert.ToString(txtQRCODE.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtADDRESS.Value !="" )
            condObj.Like(WEC_C_CHANNELlIST.Attribute.ADDRESS, Convert.ToString(txtADDRESS.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_C_CHANNELlIST>(hidCondition.Value);
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
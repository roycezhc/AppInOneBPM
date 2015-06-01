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

public partial class WEC_XX_MESSAGEManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_XX_MESSAGEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_XX_MESSAGEManage.aspx", path);
    }
    protected string pid="0";

    V_WEC_XX_MESSAGE valObj = new V_WEC_XX_MESSAGE();
    V_WEC_XX_MESSAGE condObj = new V_WEC_XX_MESSAGE();
    List<V_WEC_XX_MESSAGE> listObj = new List<V_WEC_XX_MESSAGE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(V_WEC_XX_MESSAGE condObj, int curPage)
    {
        valObj.Distinct = true;
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(V_WEC_XX_MESSAGE.Attribute.ID, Order.Desc);

        /*
        SELECT     dbo.WEC_XX_MESSAGE.*
FROM         dbo.WEC_XX_MESSAGE INNER JOIN
                          (SELECT     *,OPENID AS id, MAX(ADDTIME) AS maxtime
                            FROM          dbo.WEC_XX_MESSAGE AS WEC_XX_MESSAGE_1
                            GROUP BY OPENID) AS aa ON dbo.WEC_XX_MESSAGE.ADDTIME = aa.maxtime AND dbo.WEC_XX_MESSAGE.OPENID = aa.id
         */
        #region//数据权限条件

        #endregion
        //condObj.PID = decimal.Parse(pid);
        if (!userBase2.Curraid.Equals(""))
        {
            condObj.AID = Convert.ToDecimal(userBase2.Curraid);
        }

        
        listObj = BLLTable<V_WEC_XX_MESSAGE>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_XX_MESSAGE.Attribute.EXP3);
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

            txtTYPE.Items.AddRange(FormHelper.GetListItem(V_WEC_XX_MESSAGE.Attribute.TYPE));                    
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_WEC_XX_MESSAGE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new V_WEC_XX_MESSAGE();

        
        
        if(txtID.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtOPENID.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.OPENID, Convert.ToString(txtOPENID.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
        
        
        if(txtS_CONTENT.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.S_CONTENT, Convert.ToString(txtS_CONTENT.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtISCOLLECT.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.ISCOLLECT, Convert.ToString(txtISCOLLECT.Value));
        
        
        if(txtLATITUDE.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.LATITUDE, Convert.ToString(txtLATITUDE.Value));
        
        
        if(txtLONGITUDE.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.LONGITUDE, Convert.ToString(txtLONGITUDE.Value));
        
        
        if(txtPRECISION.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.PRECISION, Convert.ToString(txtPRECISION.Value));
        
        
        if(txtCITY.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.CITY, Convert.ToString(txtCITY.Value));
        
        
        if(txtPROVINCE.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.PROVINCE, Convert.ToString(txtPROVINCE.Value));
        
        
        if(txtCOUNTRY.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.COUNTRY, Convert.ToString(txtCOUNTRY.Value));
        
        
        if(txtHEADIMGURL.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.HEADIMGURL, Convert.ToString(txtHEADIMGURL.Value));
        
        
        if(txtCHANNELID.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.CHANNELID, Convert.ToDecimal(txtCHANNELID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like(V_WEC_XX_MESSAGE.Attribute.AID, Convert.ToDecimal(txtAID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<V_WEC_XX_MESSAGE>(hidCondition.Value);
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
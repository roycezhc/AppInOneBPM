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

public partial class WEC_PUBLICLISTManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_PUBLICLISTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_PUBLICLISTManage.aspx", path);
    }
     protected string pid = "0";

    protected WEC_PUBLICLIST valObj = new WEC_PUBLICLIST();
    protected WEC_PUBLICLIST condObj = new WEC_PUBLICLIST();
    protected List<WEC_PUBLICLIST> listObj = new List<WEC_PUBLICLIST>();
    protected int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_PUBLICLIST condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_PUBLICLIST.Attribute.AID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WEC_PUBLICLIST>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_PUBLICLIST.Attribute.EXP3);
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
                                
            txtSTART_DAY.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtEND_DAY.Value = "";//Convert.ToDateTime(DateTime.Now);
            txtIS_NEWS.Items.AddRange(FormHelper.GetListItem(WEC_PUBLICLIST.Attribute.IS_NEWS));
            txtDEFAULT_REPLAY_FALG.Items.AddRange(FormHelper.GetListItem(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_PUBLICLIST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_PUBLICLIST();

        
        
        if(txtAID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtUSER_ID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));
        
        
        if(txtPLC_NAME.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.PLC_NAME, Convert.ToString(txtPLC_NAME.Value));
        
        
        if(txtPLC_SOURCEID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.PLC_SOURCEID, Convert.ToString(txtPLC_SOURCEID.Value));
        
        
        if(txtWECHAT_ID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.WECHAT_ID, Convert.ToString(txtWECHAT_ID.Value));
        
        
        if(txtAVATAR_URL.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.AVATAR_URL, Convert.ToString(txtAVATAR_URL.Value));
        
        
        if(txtAPI_KEY.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.API_KEY, Convert.ToString(txtAPI_KEY.Value));
        
        
        if(txtTOKEN.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.TOKEN, Convert.ToString(txtTOKEN.Value));
        
        
        if(txtLOCATION.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.LOCATION, Convert.ToString(txtLOCATION.Value));
        
        
        if(txtEMAIL.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
        
        
        if(txtFUNS.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.FUNS, Convert.ToInt32(txtFUNS.Value));
        
        
        if(txtTYPE.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.TYPE, Convert.ToInt32(txtTYPE.Value));
        
        
        if(txtSTART_DAY.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.START_DAY, Convert.ToDateTime(txtSTART_DAY.Value));
        
        
        if(txtEND_DAY.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.END_DAY, Convert.ToDateTime(txtEND_DAY.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.STATUS, Convert.ToInt32(txtSTATUS.Value));
        
        
        if(txtPACKAGE_ID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.PACKAGE_ID, Convert.ToDecimal(txtPACKAGE_ID.Value));
        
        
        if(txtIS_NEWS.Value !="" )
            condObj.IS_NEWS = Convert.ToInt32(txtIS_NEWS.Value);
        
        
        if(txtDEFAULT_REPLAY.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY, Convert.ToString(txtDEFAULT_REPLAY.Value));
        
        
        if(txtDEFAULT_REPLAY_FALG.Value !="" )
            condObj.DEFAULT_REPLAY_FALG = Convert.ToInt32(txtDEFAULT_REPLAY_FALG.Value);
        
        
        if(txtLBS_DISTANCE.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.LBS_DISTANCE, Convert.ToDecimal(txtLBS_DISTANCE.Value));
        
        
        if(txtAPPID.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.APPID, Convert.ToString(txtAPPID.Value));
        
        
        if(txtAPPSESECRET.Value !="" )
            condObj.Like(WEC_PUBLICLIST.Attribute.APPSESECRET, Convert.ToString(txtAPPSESECRET.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_PUBLICLIST>(hidCondition.Value);
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
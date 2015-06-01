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

public partial class WEC_ACTIVITYSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_ACTIVITYSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_ACTIVITYSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    WEC_ACTIVITY valObj = new WEC_ACTIVITY();
    WEC_ACTIVITY condObj = new WEC_ACTIVITY();
    List<WEC_ACTIVITY> listObj = new List<WEC_ACTIVITY>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_ACTIVITY.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_ACTIVITY.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_ACTIVITY.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_ACTIVITY.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_ACTIVITY.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_ACTIVITY.Attribute.EXP3);
        #endregion
        //多级数据表页面才用到
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<WEC_ACTIVITY>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<WEC_ACTIVITY>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_ACTIVITY>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
        {
            condObj = new WEC_ACTIVITY();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtKEYWORD.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
            
            
            if(txtINSTRUCTION.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.INSTRUCTION, Convert.ToString(txtINSTRUCTION.Value));
            
            
            if(txtTIME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TIME, Convert.ToString(txtTIME.Value));
            
            
            if(txtSTART_PICURL.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.START_PICURL, Convert.ToString(txtSTART_PICURL.Value));
            
            
            if(txtWIN_PICURL.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.WIN_PICURL, Convert.ToString(txtWIN_PICURL.Value));
            
            
            if(txtOUT_PICURL.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.OUT_PICURL, Convert.ToString(txtOUT_PICURL.Value));
            
            
            if(txtEND_THEME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.END_THEME, Convert.ToString(txtEND_THEME.Value));
            
            
            if(txtEND_PICURL.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.END_PICURL, Convert.ToString(txtEND_PICURL.Value));
            
            
            if(txtTYPE_ONE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_ONE, Convert.ToString(txtTYPE_ONE.Value));
            
            
            if(txtPIC_ONE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_ONE, Convert.ToString(txtPIC_ONE.Value));
            
            
            if(txtNAME_ONE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_ONE, Convert.ToString(txtNAME_ONE.Value));
            
            
            if(txtNUM_ONE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_ONE, Convert.ToInt32(txtNUM_ONE.Value));
            
            
            if(txtTYPE_TWO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_TWO, Convert.ToString(txtTYPE_TWO.Value));
            
            
            if(txtPIC_TWO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_TWO, Convert.ToString(txtPIC_TWO.Value));
            
            
            if(txtNAME_TWO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_TWO, Convert.ToString(txtNAME_TWO.Value));
            
            
            if(txtNUM_TWO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_TWO, Convert.ToInt32(txtNUM_TWO.Value));
            
            
            if(txtTYPE_THREE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_THREE, Convert.ToString(txtTYPE_THREE.Value));
            
            
            if(txtPIC_THREE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_THREE, Convert.ToString(txtPIC_THREE.Value));
            
            
            if(txtNAME_THREE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_THREE, Convert.ToString(txtNAME_THREE.Value));
            
            
            if(txtNUM_THREE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_THREE, Convert.ToInt32(txtNUM_THREE.Value));
            
            
            if(txtTYPE_FOUR.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_FOUR, Convert.ToString(txtTYPE_FOUR.Value));
            
            
            if(txtPIC_FOUR.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_FOUR, Convert.ToString(txtPIC_FOUR.Value));
            
            
            if(txtNAME_FOUR.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_FOUR, Convert.ToString(txtNAME_FOUR.Value));
            
            
            if(txtNUM_FOUR.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_FOUR, Convert.ToInt32(txtNUM_FOUR.Value));
            
            
            if(txtTYPE_FIVE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_FIVE, Convert.ToString(txtTYPE_FIVE.Value));
            
            
            if(txtPIC_FIVE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_FIVE, Convert.ToString(txtPIC_FIVE.Value));
            
            
            if(txtNAME_FIVE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_FIVE, Convert.ToString(txtNAME_FIVE.Value));
            
            
            if(txtNUM_FIVE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_FIVE, Convert.ToInt32(txtNUM_FIVE.Value));
            
            
            if(txtTYPE_SIX.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TYPE_SIX, Convert.ToString(txtTYPE_SIX.Value));
            
            
            if(txtPIC_SIX.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PIC_SIX, Convert.ToString(txtPIC_SIX.Value));
            
            
            if(txtNAME_SIX.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME_SIX, Convert.ToString(txtNAME_SIX.Value));
            
            
            if(txtNUM_SIX.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUM_SIX, Convert.ToInt32(txtNUM_SIX.Value));
            
            
            if(txtCONFIRM_PWD.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.CONFIRM_PWD, Convert.ToString(txtCONFIRM_PWD.Value));
            
            
            if(txtSN_RENAME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.SN_RENAME, Convert.ToString(txtSN_RENAME.Value));
            
            
            if(txtTEL_RENAME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.TEL_RENAME, Convert.ToString(txtTEL_RENAME.Value));
            
            
            if(txtSHOW_NUM.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.SHOW_NUM, Convert.ToInt32(txtSHOW_NUM.Value));
            
            
            if(txtSN_CODE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.SN_CODE, Convert.ToInt32(txtSN_CODE.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtCONTENT.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.CONTENT, Convert.ToString(txtCONTENT.Value));
            
            
            if(txtINFO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.INFO, Convert.ToString(txtINFO.Value));
            
            
            if(txtUSE_INSTRUCTION.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.USE_INSTRUCTION, Convert.ToString(txtUSE_INSTRUCTION.Value));
            
            
            if(txtEND_INSTRUCTION.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.END_INSTRUCTION, Convert.ToString(txtEND_INSTRUCTION.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtFOR_PEOPLE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.FOR_PEOPLE, Convert.ToInt32(txtFOR_PEOPLE.Value));
            
            
            if(txtPROBABILITY.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PROBABILITY, Convert.ToString(txtPROBABILITY.Value));
            
            
            if(txtNUMBER_TIMES.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NUMBER_TIMES, Convert.ToInt32(txtNUMBER_TIMES.Value));
            
            
            if(txtMOST_NUM_TIMES.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.MOST_NUM_TIMES, Convert.ToInt32(txtMOST_NUM_TIMES.Value));
            
            
            if(txtKIND.Value !="" )
                condObj.KIND = Convert.ToInt32(txtKIND.Value);
            
            
            if(txtINFORMATION.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.INFORMATION, Convert.ToString(txtINFORMATION.Value));
            
            
            if(txtWIN_INFO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.WIN_INFO, Convert.ToString(txtWIN_INFO.Value));
            
            
            if(txtNO_WIN_INFO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.NO_WIN_INFO, Convert.ToString(txtNO_WIN_INFO.Value));
            
            
            if(txtSHOW_WIN_USRE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.SHOW_WIN_USRE, Convert.ToInt32(txtSHOW_WIN_USRE.Value));
            
            
            if(txtPLAY_AUDIO.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.PLAY_AUDIO, Convert.ToInt32(txtPLAY_AUDIO.Value));
            
            
            if(txtMP3_URL.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.MP3_URL, Convert.ToString(txtMP3_URL.Value));
            
            
            if(txtRULES.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.RULES, Convert.ToString(txtRULES.Value));
            
            
            if(txtSYSTEM_SCORE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.SYSTEM_SCORE, Convert.ToInt32(txtSYSTEM_SCORE.Value));
            
            
            if(txtCUSTOM_SCORE.Value !="" )
                condObj.Like(WEC_ACTIVITY.Attribute.CUSTOM_SCORE, Convert.ToInt32(txtCUSTOM_SCORE.Value));

            listObj = BLLTable<WEC_ACTIVITY>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        #region//多级数据表页面才用到，取消注释
        //pid = Request[hidSelID.Name];
        //WEC_ACTIVITY valObj = BLLTable<WEC_ACTIVITY>.GetRowData(WEC_ACTIVITY.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_ACTIVITYSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_ACTIVITY>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
public partial class TF_TB_FIELDManage2:BaseAdminPage
{

    protected Dictionary<string, string> dicCtrlType = null;
    TF_TB_FIELD valObj = new TF_TB_FIELD();
    TF_TB_FIELD condObj = new TF_TB_FIELD();
    List<TF_TB_FIELD> listObj = new List<TF_TB_FIELD>();
    int recount = -1;//查询总记录数
    protected string title = "";
    int tbid = 0;
    private void BindList(TF_TB_FIELD condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_TB_FIELD.Attribute.SORT_NO, Order.Asc);

        if (Request["defaultfield"] != null)
        {
            condObj.TB_ID = 0;
        }
        else
        {
            
            condObj.TB_ID = tbid;
        }
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;

        TF_TB_FIELD ccc = new TF_TB_FIELD();
        if (Request["ntype"] == "table-mx")
        {
            ccc.TB_ID = -1;
        }
        else {
            ccc.TB_ID = 0;
        }
        listObj = BLLTable<TF_TB_FIELD>.Factory(conn).Select(valObj, ccc);
        repDefault.DataSource = listObj;
        repDefault.DataBind();


    }

    protected void Page_Load(object sender, EventArgs e)
    {
        condObj.af_PageBy(TF_TB_FIELD.Attribute.TB_ID, Order.Desc);
        title = valObj._ZhName + "管理";
        Page.Title = title;
        tbid = int.Parse(Request["id"]);
        if (!IsPostBack)
        {
            dicCtrlType = TF_Common.GetCtrlTypeDic();
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 30;

            #endregion
            TF_TABLE tbObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, tbid);
            title = "表 "+tbObj.CH_NAME + " 的字段列表";

            #region//数据初始化
            
            //txtFIELD_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TB_FIELD.Attribute.FIELD_TYPE));
            #endregion

            if (Request["defaultfield"] != null) {
                btnFind.Enabled = false;
               // ulBtns.Visible = false;
            }
            BindList(condObj, 1);

        //     fangan.Columns.Add("*TableName");//表名
        //fangan.Columns.Add("UserId");//员工编号
        //fangan.Columns.Add("TYPE");
        //fangan.Columns.Add("CheckOWA");//考勤类型，请假、年假、公休、病假等
        //fangan.Columns.Add("UnWorkStartTime");//抵消工作开始时间
        //fangan.Columns.Add("UnWorkEndTime");//抵消工作结束时间
        //fangan.Columns.Add("OnWorkStartTime");//工作时间开始时间
        //fangan.Columns.Add("OnWorkEndTime");//工作时间结束时间

            string path = Server.MapPath("~" + CheckInOutHelper.CheckOnWorkAttendanceFangAnPath);

            ViewState["TB_NAME"] = tbObj.TB_NAME;
            DataTable dt = CheckInOutHelper.GetOneCheckOnWorkAttendanceFangAn(tbObj.TB_NAME);

            if (dt.Rows.Count <= 0)
            {
                DataRow dr = dt.NewRow();
                dr["*TableName"] = tbObj.TB_NAME;
                dr["UserId"] = "STAFF_ID";
                //dr["TYPE"] = "'"+tbObj.CH_NAME+"' as TYPE";
                dr["CheckOWA"] = "";
                dr["UnWorkStartTime"] = "";
                dr["UnWorkEndTime"] = "";
                dr["OnWorkStartTime"] = "";
                dr["OnWorkEndTime"] = "";
                dt.Rows.Add(dr);
            }
            repFangAn.DataSource = dt;
            repFangAn.DataBind();
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_TB_FIELD>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_TB_FIELD();
       
        if(txtFIELD_NAME.Value !="" )
            condObj.Like(TF_TB_FIELD.Attribute.FIELD_NAME, Convert.ToString(txtFIELD_NAME.Value));
        
        
        if(txtFIELD_TYPE.Value !="" )
            //condObj.FIELD_TYPE = Convert.ToString(txtFIELD_TYPE.Value);

        if(txtIS_NULL.Value !="" )
            condObj.Like(TF_TB_FIELD.Attribute.IS_NULL, Convert.ToInt32(txtIS_NULL.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like(TF_TB_FIELD.Attribute.NOTE, Convert.ToString(txtNOTE.Value));


        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
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
    protected void btnSaveFangAn_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = CheckInOutHelper.GetCheckOnWorkAttendanceFangAnTable(ViewState["TB_NAME"].ToString());
            DataRow dr;
            if (dt.Rows.Count <= 0)
            {
                dr = dt.NewRow();
            }
            else { 
               dr=dt.Rows[0];
            }

            

            dr["*TableName"] = Request["txtTableName"];
            dr["UserId"] = Request["txtUserId"];
            //dr["TYPE"] = Request["txtTYPE"];
            dr["CheckOWA"] = Request["txtCheckOWA"];
            dr["UnWorkStartTime"] = Request["txtUnWorkStartTime"];
            dr["UnWorkEndTime"] = Request["txtUnWorkEndTime"];
            dr["OnWorkStartTime"] = Request["txtOnWorkStartTime"];
            dr["OnWorkEndTime"] = Request["txtOnWorkEndTime"];
            if (dt.Rows.Count <= 0)
            {
                dt.Rows.Add(dr);
            }

            string path = Server.MapPath("~"+CheckInOutHelper.CheckOnWorkAttendanceFangAnPath);
            CheckInOutHelper.SaveCheckOnWorkAttendanceFangAn(dt, path);

            litWarn.Text ="保存方案成功";
        }
        catch(Exception ex) {
            litWarn.Text = ex.Message;
        }
    }
}
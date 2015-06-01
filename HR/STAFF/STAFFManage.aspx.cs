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
public partial class HR_STAFFManage:BaseAdminPage
{
    protected string showLeftLinks(string path,string pname,int rowIndex) {
        string url = "STAFFManage.aspx?p=1";
        if (deptid != "")
        {
            url += "&DeptID=" + deptid;
        }
        if (litPathLink.Text == "") {
            litPathLink.Text = CommonHelper.GetPathLinks(url, pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath(url, path);
    }
    protected string deptid = "";
    HR_STAFF valObj = new HR_STAFF();
    HR_STAFF condObj = new HR_STAFF();
    HR_DEPT_STAFF condDep = new HR_DEPT_STAFF();
    List<HR_STAFF> listObj = new List<HR_STAFF>();
    int recount = -1;//查询总记录数
    protected string title = "";

    protected string pid = "0";
    
    private void BindList(HR_STAFF condObj, int curPage)
    {
        if (valObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            valObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);

        if (deptid != "")
        {
            condDep.DEPT_ID = deptid;
            //Response.Write(deptid);
        }
        else
        {
            condDep.Where("HR_DEPT_STAFF.DEPT_ID = '' or HR_DEPT_STAFF.DEPT_ID is null");
        }
        //condObj.PID = decimal.Parse(pid);

        valObj.LoadAllAttributes(false);
        showTableColumnList.Add(HR_STAFF.Attribute.PATH);
        showTableColumnList.Add(HR_STAFF.Attribute.PNAME);
        showTableColumnList.Add(HR_STAFF.Attribute.GENDER);
        valObj.Add(showTableColumnList.ToArray());

        Relation rel = new Relation(HR_STAFF.Attribute.STAFF_ID, HR_DEPT_STAFF.Attribute.STAFF_ID);
        List<ITableImplement> lst = new List<ITableImplement>();
        lst.Add(condDep);
        lst.Add(condObj);

        listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, rel, new HR_DEPT_STAFF(), lst, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
        
        //部门领导
        HR_DEPT_MANAGER valObj2 = new HR_DEPT_MANAGER();
        HR_DEPT_MANAGER condObj2 = new HR_DEPT_MANAGER();
        valObj2.Top(1);
        condObj2.DEPT_ID = deptid;
        List<HR_DEPT_MANAGER> listObj2 = BLLTable<HR_DEPT_MANAGER>.Factory(conn).Select(valObj2, condObj2);
        repList_DEPT_MANAGER.DataSource = listObj2;
        repList_DEPT_MANAGER.DataBind();

        //岗位信息
        HR_STATION valObj3 = new HR_STATION();
        HR_STATION condObj3 = new HR_STATION();
        Relation r1 = new Relation(HR_STATION.Attribute.LEVEL_ID,HR_STATION_LEVEL.Attribute.LEVEL_ID);
        Relation r2 = new Relation(HR_STATION.Attribute.TYPE_ID, HR_STATION_TYPE.Attribute.TYPE_ID); 

        List<Relation> lstRelatio=new List<Relation>();
        lstRelatio.Add(r1);
        lstRelatio.Add(r2);

        HR_STATION_TYPE valType = new HR_STATION_TYPE();
        valType.TYPE_NAME = "";
        HR_STATION_LEVEL valLevel = new HR_STATION_LEVEL();
        valLevel.LEVEL_NAME = "";
        List<ITableImplement> lstTable = new List<ITableImplement>();
        lstTable.Add(valType);
        lstTable.Add(valLevel);

        condObj3.DEPT_ID = deptid;

        List<ITableImplement> lstCond = new List<ITableImplement>();
        lstCond.Add(condObj3);

        List<HR_STATION> listObj3 = BLLTable<HR_STATION>.Factory(conn).Select(valObj3, lstRelatio, lstTable, lstCond);
        repList_HR_STATION.DataSource = listObj3;
        repList_HR_STATION.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        #region//回发数据初始化
        if (Request["id"] != null)
        {
            deptid = Request["id"];
        }
        if (Request["DeptID"] != null)
        {
            deptid = Request["DeptID"];
        }
        if (Request["PID"] != null && Request["tree"]==null)
        {
            pid = Request["PID"];
        }

        title = valObj._ZhName + "管理";
        Page.Title = title;

        #endregion

        if (!IsPostBack)
        {
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "20";
            aspPager.PageSize = 20;

            if (deptid != "") {
                a_top.HRef += "?DeptID="+deptid;
            }
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            
            #endregion

            #region//数据初始化
            ddlSort.Items.Add(new ListItem("默认", HR_STAFF.Attribute.STAFF_ID.LongName + "|DESC"));

            ddlSort.Items.Add(new ListItem(HR_STAFF.Attribute.STAFF_ID.ZhName+"|升", HR_STAFF.Attribute.STAFF_ID.LongName+"|ASC"));
            ddlSort.Items.Add(new ListItem(HR_STAFF.Attribute.STAFF_ID.ZhName + "|降", HR_STAFF.Attribute.STAFF_ID.LongName + "|DESC"));

            ddlSort.Items.Add(new ListItem(HR_STAFF.Attribute.SNAME.ZhName + "|升", HR_STAFF.Attribute.SNAME.LongName + "|ASC"));
            ddlSort.Items.Add(new ListItem(HR_STAFF.Attribute.SNAME.ZhName + "|降", HR_STAFF.Attribute.SNAME.LongName + "|DESC"));


            txtGENDER.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.GENDER));
            txtWORK_TYPE_CODE.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.WORK_TYPE_CODE));

            #endregion

            hidCondition.Value = condObj.ToJson(20);

            BindList(condObj, 1);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_STAFF>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_STAFF();

        if(txtSTAFF_NO.Value !="" )
            condObj.Like(HR_STAFF.Attribute.STAFF_NO, Convert.ToString(txtSTAFF_NO.Value));
        if(txtNAME.Value !="" )
            condObj.Like(HR_STAFF.Attribute.STAFF_NAME, Convert.ToString(txtNAME.Value));
        if(txtDEPT_ID.Value !="" )
            condObj.Like(HR_STAFF.Attribute.DEPT_ID, Convert.ToString(txtDEPT_ID.Value));
        if(txtGENDER.Value !="" )
            condObj.GENDER = Convert.ToString(txtGENDER.Value);

        if(txtPOS_NAME.Value !="" )
            condObj.Like(HR_STAFF.Attribute.POS_NAME, Convert.ToString(txtPOS_NAME.Value));
        
        
        if(txtSTATION_CODE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.STATION_CODE, Convert.ToString(txtSTATION_CODE.Value));
        
        
        if(txtWORK_TYPE_CODE.Value !="" )
            condObj.WORK_TYPE_CODE = Convert.ToString(txtWORK_TYPE_CODE.Value);
        
        
        if(txtTECH_LEVEL_CODE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.TECH_LEVEL_CODE, Convert.ToString(txtTECH_LEVEL_CODE.Value));

        if(txtMOBILE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.MOBILE, Convert.ToString(txtMOBILE.Value));
        
        
        if(txtOFFICE_TEL.Value !="" )
            condObj.Like(HR_STAFF.Attribute.OFFICE_TEL, Convert.ToString(txtOFFICE_TEL.Value));
        
        
        if(txtCERT_FLAG.Value !="" )
            condObj.Like(HR_STAFF.Attribute.CERT_FLAG, Convert.ToString(txtCERT_FLAG.Value));

        if(txtON_POS_FLAG.Value !="" )
            condObj.Like(HR_STAFF.Attribute.ON_POS_FLAG, Convert.ToString(txtON_POS_FLAG.Value));

        if(txtJOIN_DATE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.JOIN_DATE, Convert.ToString(txtJOIN_DATE.Value));

        if(txtTITLE_CODE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.TITLE_CODE, Convert.ToString(txtTITLE_CODE.Value));
        
        
        if(txtSTATUS_CODE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.STATUS_CODE, Convert.ToString(txtSTATUS_CODE.Value));


        if(txtDEGREE_CODE.Value !="" )
            condObj.Like(HR_STAFF.Attribute.DEGREE_CODE, Convert.ToString(txtDEGREE_CODE.Value));
        

        
        if(txtMAJOR.Value !="" )
            condObj.Like(HR_STAFF.Attribute.MAJOR, Convert.ToString(txtMAJOR.Value));
        

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_STAFF>(hidCondition.Value);
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

    protected void lbColSort_Command(object sender, CommandEventArgs e)
    {
        //string[] sortArr = Request[hidColSort.Name].Split('`')[0].Split(',');
        //txtNAME.Value = sortArr[1];
        //AttributeItem item = new AttributeItem(sortArr[0]);
        //if (sortArr[1].ToLower() == "asc") {
        //    condObj.af_PageBy(item, Order.Asc);
        //}
        //else
        //{
        //    condObj.af_PageBy(item, Order.Desc);
        //}
        //BindList(condObj, 1);
    }
    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        string[] sortArr = ddlSort.SelectedValue.Split('|');
        AttributeItem item = new AttributeItem(sortArr[0]);
        if (sortArr[1].ToLower() == "asc")
        {
            condObj.af_PageBy(item, Order.Asc);
        }
        else
        {
            condObj.af_PageBy(item, Order.Desc);
        }
        BindList(condObj, 1);
    }
}
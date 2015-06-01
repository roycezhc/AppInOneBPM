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
using System.IO;
using AgileFrame.AppInOne.CheckWork.OrgManger;
public partial class HR_CHECKWORKDEVICEManage2:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKWORKDEVICEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("HR_CHECKWORKDEVICEManage.aspx", path);
    }
    protected string pid="0";

    HR_CHECKWORKDEVICE valObj = new HR_CHECKWORKDEVICE();
    HR_CHECKWORKDEVICE condObj = new HR_CHECKWORKDEVICE();
    List<HR_CHECKWORKDEVICE> listObj = new List<HR_CHECKWORKDEVICE>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(HR_CHECKWORKDEVICE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(HR_CHECKWORKDEVICE.Attribute.DeviceID, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
        HR_ORG orgVal = new HR_ORG();
        orgVal._ORG_NAME = "";
        Relation rt = new Relation(HR_CHECKWORKDEVICE.Attribute.ORG_ID, HR_ORG.Attribute.ORG_ID);

        listObj = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).SelectByPage(valObj, rt, orgVal, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKWORKDEVICE.Attribute.EXP3);
        #endregion
        title = "设备管理";
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
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//数据初始化
            
            txtUSE_FLAG.Items.AddRange(FormHelper.GetListItem(HR_CHECKWORKDEVICE.Attribute.USE_FLAG));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHECKWORKDEVICE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    #region 组织机构获取
    private void GetOtherOrg(ref int deptCount, ref int staffCount, ref string msg)
    {
        deptCount = 0;
        staffCount = 0;
        msg = "";
        if (string.IsNullOrEmpty(hidCondition.Value))
            return;
        string[] deviceIds = hidCondition.Value.Split(',');
        HR_CHECKWORKDEVICE con = new HR_CHECKWORKDEVICE();
        con.In(HR_CHECKWORKDEVICE.Attribute.DeviceID, deviceIds);
        List<HR_CHECKWORKDEVICE> devList = BLLTable<HR_CHECKWORKDEVICE>.Factory(conn).Select(new HR_CHECKWORKDEVICE(), con);
        if (devList.Count < 1)
            return;
        List<DeviceOrg> orgList = new List<DeviceOrg>();
        msg += "<div class='maskmsgtool' style='width:500px; height:20px;'><a onclick=\"$('.main').unmask();\">关闭</a></div>";
        msg += "<div class='msgtblist' style='width:500px;'>";
        msg += "<table style='width:100%;'>";
        msg += "    <thead>";
        msg += "        <tr>";
        msg += "            <td colspan='4' style='width:500px;'>详细信息</td>";
        msg += "        </tr>";
        msg += "        <tr>";
        msg += "            <td style='width:60px;'>设备ID</td>";
        msg += "            <td style='width:180px;'>设备名</td>";
        msg += "            <td style='width:160px;'>部门表(新增/总数)</td>";
        msg += "            <td style='width:160px;'>员工表(新增/总数)</td>";
        msg += "        </tr>";
        msg += "    </thead>";
        msg += "    <tbody>";
        foreach (HR_CHECKWORKDEVICE dev in devList)
        {
            msg += "        <tr>";
            msg += "            <td class='first''>" + dev.DeviceID + "</td>";
            msg += "            <td>" + dev.DeviceName + "</td>";
            DeviceOrg devOrg = null;
            GetOtherOrg(dev, ref devOrg);
            orgList.Add(devOrg);
            msg += "            <td>" + devOrg.deptMsg + "</td>";
            msg += "            <td>" + devOrg.staffMsg + "</td>";
            msg += "        </tr>";
        }
        msg += "    </tbody>";
        RemoveRepeatAndInsertAioByName(orgList, ref deptCount, ref staffCount);
        msg += "    <tbody>";
        msg += "        <tr style='background:#eee;'>";
        msg += "            <td colspan='2' style='text-align:right;'>根据部门/员工名称去重后获取记录数：</td>";
        msg += "            <td>" + staffCount + "</td>";
        msg += "            <td>" + deptCount + "</td>";
        msg += "        </tr>";
        msg += "    </tbody>";
        msg += "</table>";
        msg += "</div>";
    }

    private void RemoveRepeatAndInsertAioByName(List<DeviceOrg> orgList, ref int staffCount, ref int deptCount)
    {
        deptCount = 0;
        staffCount = 0;
        if (orgList == null || orgList.Count < 1)
            return;
    }

    private void GetOtherOrg(HR_CHECKWORKDEVICE dev, ref DeviceOrg devOrg)
    {
        devOrg = new DeviceOrg(dev);
        if (!devOrg.enable)
            return;
    }

    #endregion

    protected void btn_GetDivice_Click(object sender, EventArgs e)
    {
        int deptCount = 0;
        int staffCount = 0;
        string msg = "";
        GetOtherOrg(ref deptCount, ref staffCount, ref msg);
        //DateTime dt = DateTime.Now;
        //while ((DateTime.Now - dt).TotalSeconds < 3)
        //{ }
        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "showMsgMask('" + msg.Replace("  ", " ").Replace("'", "\\'").Replace("\"", "\\\"") + "');", true);
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new HR_CHECKWORKDEVICE();

        
        
        if(txtDeviceID.Value !="" )
            condObj.Like(HR_CHECKWORKDEVICE.Attribute.DeviceID, Convert.ToString(txtDeviceID.Value));

        if (txtDeviceName.Value != "")
            condObj.Like(HR_CHECKWORKDEVICE.Attribute.DeviceName, Convert.ToString(txtDeviceName.Value));


        if (!string.IsNullOrEmpty(wucSelORG1.ORG_ID) && !string.IsNullOrEmpty(wucSelORG1.ORG_NAME))
            condObj.ORG_ID = wucSelORG1.ORG_ID;
        
        
        if(txtUSE_FLAG.Value !="" )
            condObj.USE_FLAG = Convert.ToString(txtUSE_FLAG.Value);

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<HR_CHECKWORKDEVICE>(hidCondition.Value);
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
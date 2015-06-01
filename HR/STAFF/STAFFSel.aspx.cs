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
public partial class HR_STAFFSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("STAFFSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("STAFFSel.aspx", path);
    }
    protected string pid = "0";

    HR_STAFF valObj = new HR_STAFF();
    HR_STAFF condObj = new HR_STAFF();
    List<HR_STAFF> listObj = new List<HR_STAFF>();
    int recount = -1;
    protected string title = "";
    protected string deptid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);

        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["DEPT_ID"] != null)
        {
            deptid = Request["DEPT_ID"];
            condObj.DEPT_ID = deptid;
        }
        title = valObj._ZhName + "选择";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request[hidSelID.Name]))
        {
            pid = Request[hidSelID.Name];
        }
        if (!IsPostBack)
        {
            if (valObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                valObj.af_PageBy(HR_STAFF.Attribute.STAFF_ID, Order.Desc);

            txtGENDER.Items.AddRange(FormHelper.GetListItem(HR_STAFF.Attribute.GENDER));

            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 15;
            try
            {
                condObj.PID = decimal.Parse(pid);
                listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
        //Response.Write(Request[hidSelID.Name]);
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<HR_STAFF>(hidCondition.Value);
            }
            listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_STAFF();

            condObj.PID = decimal.Parse(pid);

            if (txtSNAME.Value != "")
                condObj.Like(HR_STAFF.Attribute.SNAME, Convert.ToDecimal(txtSNAME.Value));

            if (txtRNAME.Value != "")
                condObj.Like(HR_STAFF.Attribute.RNAME, Convert.ToDecimal(txtRNAME.Value));
            
            if(txtSTAFF_NO.Value !="" )
                condObj.Like(HR_STAFF.Attribute.STAFF_NO, Convert.ToString(txtSTAFF_NO.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(HR_STAFF.Attribute.STAFF_NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtDEPT_ID.Value !="" )
                condObj.Like(HR_STAFF.Attribute.DEPT_ID, Convert.ToString(txtDEPT_ID.Value));
            
            
            if(txtGENDER.Value !="" )
                condObj.GENDER = Convert.ToString(txtGENDER.Value);
            
            
            if(txtSTATION_CODE.Value !="" )
                condObj.Like(HR_STAFF.Attribute.STATION_CODE, Convert.ToString(txtSTATION_CODE.Value));
            

            
            
            if(txtMOBILE.Value !="" )
                condObj.Like(HR_STAFF.Attribute.MOBILE, Convert.ToString(txtMOBILE.Value));
            
            
            if(txtOFFICE_TEL.Value !="" )
                condObj.Like(HR_STAFF.Attribute.OFFICE_TEL, Convert.ToString(txtOFFICE_TEL.Value));

            if(txtON_POS_FLAG.Value !="" )
                condObj.Like(HR_STAFF.Attribute.ON_POS_FLAG, Convert.ToString(txtON_POS_FLAG.Value));

            
            if(txtTITLE_CODE.Value !="" )
                condObj.Like(HR_STAFF.Attribute.TITLE_CODE, Convert.ToString(txtTITLE_CODE.Value));

            if(txtEMAIL.Value !="" )
                condObj.Like(HR_STAFF.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));

            listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        pid = Request[hidSelID.Name];
        HR_STAFF valObj = BLLTable<HR_STAFF>.Factory(conn).GetRowData(HR_STAFF.Attribute.STAFF_ID, pid);
        litPathLink.Text = CommonHelper.GetPathLinks("STAFFSel.aspx", pid, valObj.PATH, valObj.PNAME);
        a_top.Visible = true;

        
        condObj.PID = decimal.Parse(pid);
        listObj = BLLTable<HR_STAFF>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SYS_PAGE_TBFIND_COLSManage:BaseAdminPage
{
    SYS_PAGE_TBFIND_COLS valObj = new SYS_PAGE_TBFIND_COLS();
    SYS_PAGE_TBFIND_COLS condObj = new SYS_PAGE_TBFIND_COLS();
    List<SYS_PAGE_TBFIND_COLS> listObj = new List<SYS_PAGE_TBFIND_COLS>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(SYS_PAGE_TBFIND_COLS condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(SYS_PAGE_TBFIND_COLS.Attribute.P_COLID, Order.Desc);
        

        listObj = BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        

        title = valObj._ZhName + "管理";
        Page.Title = title;
        string MDL_ID = Request["MDL_ID"];
        string mdldir = "";
        if (string.IsNullOrEmpty(MDL_ID))
            return;
        mdldir = BLLTable<SYS_MODULE>.Factory(conn).GetOneValue(SYS_MODULE.Attribute.MDL_ID, MDL_ID, SYS_MODULE.Attribute.PAGE_URL);
        if (string.IsNullOrEmpty(mdldir))
            return;
        condObj._PAGE_URL = mdldir;
        BindList(condObj);        
        //if (!IsPostBack)
        //{
        //    BindList(condObj);            

        //}
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //Response.Write(Request["ckCols"]);
        //Response.Write("<hr/>");
        //Response.Write(Request["ck_TB_SHOW"]);
        //Response.Write("<hr/>");
        //Response.Write(Request["ck_FIND_SHOW"]);
        //Response.Write("<hr/>");

        string[]cols=StringHelper.GetStringArray(Request["ckCols"],',');
        string tbshows = ","+Request["ck_TB_SHOW"]+",";
        //string findshows = "," + Request["ck_FIND_SHOW"] + ",";
        string[] fildcols = StringHelper.GetStringArray(Request["sel_FindCol"], ',');
        SYS_PAGE_TBFIND_COLS valObj = new SYS_PAGE_TBFIND_COLS();
        for (int i = 0; i < cols.Length; i++) {
            valObj.P_COLID = decimal.Parse(cols[i]);
            valObj.TB_SHOW = 0;//
            valObj.FIND_SHOW = 0;//
            if (tbshows.IndexOf("," + cols[i] + ",") != -1) {
                valObj.TB_SHOW = 1;//
            }
            //if (findshows.IndexOf("," + cols[i] + ",") != -1)
            //{
            //    valObj.FIND_SHOW = 1;//
            //}
            valObj.FIND_SHOW = decimal.Parse(fildcols[i]);
            BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Update(valObj, SYS_PAGE_TBFIND_COLS.Attribute.P_COLID);
        }
        ScriptHelper.AlertAndGo(Page, "修改成功！", Request.Url.AbsoluteUri);
        //litWarn.Text = "修改成功！";
        
    }
}
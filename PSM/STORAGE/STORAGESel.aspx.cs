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
public partial class IM_STORAGESel : AgileFrame.AppInOne.Common.BasePage
{
    protected string showLeftLinks(string path, string pname)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("STORAGESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("STORAGESel.aspx", path);
    }
    protected string pid = "0";
    IM_STORAGE valObj = new IM_STORAGE();
    IM_STORAGE condObj = new IM_STORAGE();
    List<IM_STORAGE> listObj = new List<IM_STORAGE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "Ñ¡Ôñ";
        Page.Title = title;
        if (!IsPostBack)
        {
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                condObj.PID = decimal.Parse(pid);
                listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
            }
            listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new IM_STORAGE();

            condObj.PID = decimal.Parse(pid);
            
            if(txtSTOR_ID.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.STOR_ID, Convert.ToDecimal(txtSTOR_ID.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtSNAME.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.SNAME, Convert.ToString(txtSNAME.Value));
            
            
            if(txtRNAME.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.RNAME, Convert.ToString(txtRNAME.Value));
            
            
            if(txtORG_ID.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
            
            
            if(txtSTATE.Value !="" )
                condObj.USE_FLAG = txtSTATE.Value;
            
            
            if(txtREMARK.Value !="" )
                condObj.Like(IM_STORAGE.Attribute.REMARK, Convert.ToString(txtREMARK.Value));

            listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        IM_STORAGE valObj = BLLTable<IM_STORAGE>.Factory(conn).GetRowData(IM_STORAGE.Attribute.STOR_ID, pid);
        litPathLink.Text = CommonHelper.GetPathLinks("STORAGESel.aspx", pid, valObj.PATH, valObj.PNAME);
        a_top.Visible = true;


        condObj.PID = decimal.Parse(pid);
        listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

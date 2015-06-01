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

public partial class Ec_fieldSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //多级数据表页面才用到
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_fieldSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("Ec_fieldSel.aspx", path);
    }
    protected string pid = "0";//多级数据表页面才用到此变量

    Ec_field valObj = new Ec_field();
    Ec_field condObj = new Ec_field();
    List<Ec_field> listObj = new List<Ec_field>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_field.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_field.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_field.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_field.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_field.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_field.Attribute.EXP3);
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
                listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_field>(hidCondition.Value);
            }
            listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new Ec_field();

            
            
            if(txtFieldid.Value !="" )
                condObj.Like(Ec_field.Attribute.Fieldid, Convert.ToInt32(txtFieldid.Value));
            
            
            if(txtTabid.Value !="" )
                condObj.Like(Ec_field.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
            
            
            if(txtColumnname.Value !="" )
                condObj.Like(Ec_field.Attribute.Columnname, Convert.ToString(txtColumnname.Value));
            
            
            if(txtTablename.Value !="" )
                condObj.Like(Ec_field.Attribute.Tablename, Convert.ToString(txtTablename.Value));
            
            
            if(txtGeneratedtype.Value !="" )
                condObj.Like(Ec_field.Attribute.Generatedtype, Convert.ToInt32(txtGeneratedtype.Value));
            
            
            if(txtUitype.Value !="" )
                condObj.Uitype = Convert.ToString(txtUitype.Value);
            
            
            if(txtFieldname.Value !="" )
                condObj.Like(Ec_field.Attribute.Fieldname, Convert.ToString(txtFieldname.Value));
            
            
            if(txtFieldlabel.Value !="" )
                condObj.Like(Ec_field.Attribute.Fieldlabel, Convert.ToString(txtFieldlabel.Value));
            
            
            if(txtReadonly.Value !="" )
                condObj.Readonly = Convert.ToInt32(txtReadonly.Value);
            
            
            if(txtPresence.Value !="" )
                condObj.Presence = Convert.ToInt32(txtPresence.Value);
            
            
            if(txtSelected.Value !="" )
                condObj.Selected = Convert.ToInt32(txtSelected.Value);
            
            
            if(txtMaximumlength.Value !="" )
                condObj.Like(Ec_field.Attribute.Maximumlength, Convert.ToInt32(txtMaximumlength.Value));
            
            
            if(txtSequence.Value !="" )
                condObj.Like(Ec_field.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
            
            
            if(txtBlock.Value !="" )
                condObj.Like(Ec_field.Attribute.Block, Convert.ToInt32(txtBlock.Value));
            
            
            if(txtDisplaytype.Value !="" )
                condObj.Displaytype = Convert.ToInt32(txtDisplaytype.Value);
            
            
            if(txtTypeofdata.Value !="" )
                condObj.Like(Ec_field.Attribute.Typeofdata, Convert.ToString(txtTypeofdata.Value));
            
            
            if(txtQuickcreate.Value !="" )
                condObj.Quickcreate = Convert.ToInt32(txtQuickcreate.Value);
            
            
            if(txtQuickcreatesequence.Value !="" )
                condObj.Like(Ec_field.Attribute.Quickcreatesequence, Convert.ToInt32(txtQuickcreatesequence.Value));
            
            
            if(txtInfo_type.Value !="" )
                condObj.Info_type = Convert.ToString(txtInfo_type.Value);
            
            
            if(txtCtrlType.Value !="" )
                condObj.CtrlType = Convert.ToString(txtCtrlType.Value);

            listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //Ec_field valObj = BLLTable<Ec_field>.Factory(conn).GetRowData(Ec_field.Attribute.Fieldid, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("Ec_fieldSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

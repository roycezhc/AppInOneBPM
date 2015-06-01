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

public partial class Ec_fieldManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_fieldManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("Ec_fieldManage.aspx", path);
    }
    protected string pid="0";

    Ec_field valObj = new Ec_field();
    Ec_field condObj = new Ec_field();
    List<Ec_field> listObj = new List<Ec_field>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(Ec_field condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(Ec_field.Attribute.Fieldid, Order.Desc);
        
        #region//数据权限条件
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<Ec_field>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

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
            
            txtUitype.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Uitype));
            txtReadonly.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Readonly));
            txtPresence.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Presence));
            txtSelected.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Selected));
            txtDisplaytype.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Displaytype));
            txtQuickcreate.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Quickcreate));
            txtInfo_type.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.Info_type));
            txtCtrlType.Items.AddRange(FormHelper.GetListItem(Ec_field.Attribute.CtrlType));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_field>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
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

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<Ec_field>(hidCondition.Value);
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
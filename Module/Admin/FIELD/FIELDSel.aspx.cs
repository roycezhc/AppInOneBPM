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
public partial class TF_TB_FIELDSel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{


    TF_TB_FIELD valObj = new TF_TB_FIELD();
    TF_TB_FIELD condObj = new TF_TB_FIELD();
    List<TF_TB_FIELD> listObj = new List<TF_TB_FIELD>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "选择";
        Page.Title = title;
        condObj.TB_ID = -100;
        if (Request["TB_ID"] != null) {
            condObj.TB_ID = int.Parse(Request["TB_ID"]);
        }
        if (Request["formid"] != null)
        {

            condObj.TB_ID = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, Request["formid"]).TB_ID;
        }
        condObj.CREATED = 0;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                    condObj.af_PageBy(TF_TB_FIELD.Attribute.FIELD_ID, Order.Desc);
                listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_TB_FIELD>(hidCondition.Value);
            }
            if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                condObj.af_PageBy(TF_TB_FIELD.Attribute.FIELD_ID, Order.Desc);
            listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            if(txtFIELD_NAME.Value !="" )
                condObj.Like(TF_TB_FIELD.Attribute.FIELD_NAME, Convert.ToString(txtFIELD_NAME.Value));
            
            
            //if(txtFIELD_TYPE.Value !="" )
            //    condObj.f = Convert.ToString(txtFIELD_TYPE.Value);
            
            
            //if(txtDB_TYPE.Value !="" )
            //    condObj.Like(TF_TB_FIELD.Attribute.DB_TYPE, Convert.ToString(txtDB_TYPE.Value));
            
            
            //if(txtIS_NULL.Value !="" )
            //    condObj.Like(TF_TB_FIELD.Attribute.IS_NULL, Convert.ToInt32(txtIS_NULL.Value));
            
            
            //if(txtNOTE.Value !="" )
            //    condObj.Like(TF_TB_FIELD.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

            //if(txtCTRL_TYPE.Value !="" )
            //    condObj.Like(TF_TB_FIELD.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));

            if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                condObj.af_PageBy(TF_TB_FIELD.Attribute.FIELD_ID, Order.Desc);
            listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(TF_TB_FIELD.Attribute.FIELD_ID, Order.Desc);
        listObj = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

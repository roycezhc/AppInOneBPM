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
public partial class WF_FORMSel : AgileFrame.AppInOne.Common.BaseAdminPage
{

    TF_FORM valObj = new TF_FORM();
    TF_FORM condObj = new TF_FORM();
    List<TF_FORM> listObj = new List<TF_FORM>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(TF_FORM.Attribute.TB_ID, Order.Desc);
        title = valObj._ZhName + "选择";
        condObj.M_FORM_ID = 0;
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                    condObj.af_PageBy(TF_FORM.Attribute.FORM_ID, Order.Desc);
                listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_FORM>(hidCondition.Value);
            }
            if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                condObj.af_PageBy(TF_FORM.Attribute.FORM_ID, Order.Desc);
            listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_FORM();


            
            if(txtF_NAME.Value !="" )
                condObj.Like(TF_FORM.Attribute.F_NAME, Convert.ToString(txtF_NAME.Value));


            if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
                condObj.af_PageBy(TF_FORM.Attribute.FORM_ID, Order.Desc);
            listObj = BLLTable<TF_FORM>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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

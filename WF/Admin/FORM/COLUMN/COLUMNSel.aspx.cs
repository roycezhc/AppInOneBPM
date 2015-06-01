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
using AgileFrame.AppInOne.WF;
public partial class WF_F_COLUMNSel : AgileFrame.AppInOne.Common.BaseAdminPage
{

    TF_F_COLUMN valObj = new TF_F_COLUMN();
    TF_F_COLUMN condObj = new TF_F_COLUMN();
    List<TF_F_COLUMN> listObj = new List<TF_F_COLUMN>();
    List<TF_F_COLUMN> listObj2 = new List<TF_F_COLUMN>();
    int recount = -1;
    int wfid = 0;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(TF_F_COLUMN.Attribute.COLUMN_ID, Order.Desc);
        title = valObj._ZhName + "Ñ¡Ôñ";
        Page.Title = title;

        if (Request["formid"] != null)
        {
            condObj.FORM_ID = int.Parse(Request["formid"]);
        }
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);

                FORM_BLL sub_bll = new FORM_BLL(condObj.FORM_ID);

                if (sub_bll.HadSubForm)
                {
                    condObj = new TF_F_COLUMN();
                    condObj.FORM_ID = sub_bll.GetSubForm().FORM_ID;
                    listObj2 = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                }

                listObj.AddRange(listObj2);

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
                condObj = JsonServiceBase.FromJson<TF_F_COLUMN>(hidCondition.Value);
            }
            listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_F_COLUMN();


            
            if(txtSHOW_NAME.Value !="" )
                condObj.Like(TF_F_COLUMN.Attribute.SHOW_NAME, Convert.ToString(txtSHOW_NAME.Value));
            

            listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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

        listObj = BLLTable<TF_F_COLUMN>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}

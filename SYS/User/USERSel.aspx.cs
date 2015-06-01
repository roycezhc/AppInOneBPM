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
public partial class SYS_USERSel : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USER valObj = new SYS_USER();
    SYS_USER condObj = new SYS_USER();
    List<SYS_USER> listObj = new List<SYS_USER>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "Ñ¡Ôñ";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<SYS_USER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_USER>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_USER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_USER();

            
            
            if(txtUSER_ID.Value !="" )
                condObj.Like(SYS_USER.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));
            
            
            if(txtUSER_NAME.Value !="" )
                condObj.Like(SYS_USER.Attribute.USER_NAME, Convert.ToString(txtUSER_NAME.Value));
            
            
            if(txtPASS.Value !="" )
                condObj.Like(SYS_USER.Attribute.PASS, Convert.ToString(txtPASS.Value));
            
            
            if(txtEMAIL.Value !="" )
                condObj.Like(SYS_USER.Attribute.EMAIL, Convert.ToString(txtEMAIL.Value));
            
            
            if(txtLOGIN_IPS.Value !="" )
                condObj.Like(SYS_USER.Attribute.LOGIN_IPS, Convert.ToString(txtLOGIN_IPS.Value));
            
            
            if(txtSTATE_FLAG.Value !="" )
                condObj.USE_FLAG = Convert.ToString(txtSTATE_FLAG.Value);
            
            
            if(txtEDITIME.Value !="" )
                condObj.Like(SYS_USER.Attribute.EDITTIME, Convert.ToDateTime(txtEDITIME.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(SYS_USER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtUSER_TYPE.Value !="" )
                condObj.USER_TYPE = Convert.ToString(txtUSER_TYPE.Value);

            listObj = BLLTable<SYS_USER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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

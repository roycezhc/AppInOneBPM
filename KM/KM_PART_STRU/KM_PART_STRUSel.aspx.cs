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
public partial class KM_PART_STRUSel : AgileFrame.AppInOne.Common.BasePage
{
    KM_PART_STRU valObj = new KM_PART_STRU();
    KM_PART_STRU condObj = new KM_PART_STRU();
    List<KM_PART_STRU> listObj = new List<KM_PART_STRU>();
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
                listObj = BLLTable<KM_PART_STRU>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<KM_PART_STRU>(hidCondition.Value);
            }
            listObj = BLLTable<KM_PART_STRU>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new KM_PART_STRU();

            
            
            if(txtPART_ID.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_ID, Convert.ToString(txtPART_ID.Value));
            
            
            if(txtPART_NAME.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_NAME, Convert.ToString(txtPART_NAME.Value));
            
            
            if(txtK_PART_ID.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.K_PART_ID, Convert.ToString(txtK_PART_ID.Value));
            
            
            if(txtPART_CONTENT.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_CONTENT, Convert.ToString(txtPART_CONTENT.Value));
            
            
            if(txtPART_CLASS_ID.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_CLASS_ID, Convert.ToString(txtPART_CLASS_ID.Value));
            
            
            if(txtPART_EA_SIGN.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_EA_SIGN, Convert.ToString(txtPART_EA_SIGN.Value));
            
            
            if(txtPART_AUTHOR.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_AUTHOR, Convert.ToString(txtPART_AUTHOR.Value));
            
            
            if(txtPART_IS_READ.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.PART_IS_READ, Convert.ToString(txtPART_IS_READ.Value));
            
            
            if(txtSORT_NO.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.SORT_NO, Convert.ToDecimal(txtSORT_NO.Value));
            
            
            if(txtIDPATH.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.IDPATH, Convert.ToString(txtIDPATH.Value));
            
            
            if(txtKNAME.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.KNAME, Convert.ToString(txtKNAME.Value));
            
            
            if(txtSNAME.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.SNAME, Convert.ToString(txtSNAME.Value));
            
            
            if(txtRNAME.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.RNAME, Convert.ToString(txtRNAME.Value));
            
            
            if(txtSUB_NUM.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.SUB_NUM, Convert.ToDecimal(txtSUB_NUM.Value));
            
            
            if(txtSUBOBJECT_NUM.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.SUBOBJECT_NUM, Convert.ToDecimal(txtSUBOBJECT_NUM.Value));
            
            
            if(txtUSE_FLAG.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.USE_FLAG, Convert.ToString(txtUSE_FLAG.Value));
            
            
            if(txtEXP1.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.EXP1, Convert.ToString(txtEXP1.Value));
            
            
            if(txtEXP2.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.EXP2, Convert.ToString(txtEXP2.Value));
            
            
            if(txtEXP3.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.EXP3, Convert.ToString(txtEXP3.Value));
            
            
            if(txtEXP4.Value !="" )
                condObj.Like(KM_PART_STRU.Attribute.EXP4, Convert.ToString(txtEXP4.Value));

            listObj = BLLTable<KM_PART_STRU>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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

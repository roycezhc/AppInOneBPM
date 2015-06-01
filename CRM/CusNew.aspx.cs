using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.EventAndDelegate;
using AgileFrame.AppInOne.Common;using AgileFrame.AppInOne.SYS;
using AgileFrame.Core;

public partial class PRCS_CusNew : AgileFrame.AppInOne.Common.BasePage
{
    int proid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["ProID"]))
        {
            proid = Convert.ToInt32(Request["ProID"]);
        }
        if (!IsPostBack)
        {
            //this.Master.SetGoBackLink("ProCusNew.aspx?ProID=" + proid);
            if (!String.IsNullOrEmpty(this.Request["CusID"]))
            {
                try
                {
                    CRM_CUST entity = new CRM_CUST();
                    entity.Cus_ID = Convert.ToInt32(this.Request["CusID"]);
                    entity = BLLTable<CRM_CUST>.Factory(conn).GetRowData(entity);

                    txtCustomer_Name.Value = entity.Cus_Name;
                    txtJob.Value = entity.Job;
                    txtRelationTxt.Value = entity.RelationTxt;
                }
                catch (Exception ex)
                {
                    //PageHelper.Error(Page, ex);
                }
            }
        }

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCustomer_Name.Value != "")
            {
                CRM_CUST entity = new CRM_CUST();
                entity.Cus_Name = txtCustomer_Name.Value;
                entity.Job = txtJob.Value;
                entity.RelationTxt = txtRelationTxt.Value;
                try
                {
                    if (!String.IsNullOrEmpty(this.Request["type"]) && !String.IsNullOrEmpty(this.Request["CusID"]))
                    {
                        BLLTable<CRM_CUST>.Factory(conn).Update(entity, CRM_CUST.Attribute.Cus_ID);
                    }
                    else
                    {
                        BLLTable<CRM_CUST>.Factory(conn).Insert(entity, CRM_CUST.Attribute.Cus_ID);
                        Response.Redirect("CusList.aspx");
                    }
                }
                catch (Exception ex)
                {
                    //PageHelper.Error(Page, ex);
                }
            }
            else
                ScriptHelper.Alert(Page, "信息为空！");
        }
        catch
        {
           ScriptHelper.Alert(Page, "已经存在此客户！");
        }
    }
}

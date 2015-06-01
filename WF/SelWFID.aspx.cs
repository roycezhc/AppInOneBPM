using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;

public partial class WF_SelWFID :BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {

            List<WF_TYPE> lstType = BLLTable<WF_TYPE>.Factory(conn).Select(new WF_TYPE(), new WF_TYPE());
            repType.DataSource = lstType;
            repType.DataBind();

           
           
            //if (lst != null && lst.Count>0)
            //{
            //    if (lst.Count > 1)
            //    {
            //        for (int i = 0; i < lst.Count; i++)
            //        {
            //            rblWF.Items.Add(new ListItem(lst[i].WFCNAME, lst[i].WFID.ToString()));
            //        }
            //    }
            //    else {
            //        Response.Redirect("Edit.aspx?WFID=" + lst[0].WFID);
            //    }
            //}
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Edit.aspx?WFID=" + rblWF.SelectedValue);
    }
    protected void repType_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        WF_TYPE ttt = (WF_TYPE)e.Item.DataItem;
        if (ttt != null) {
            int typeid = ttt.TYPE_ID;

            WF_INFO ccc = new WF_INFO();
            ccc.TYPE_ID = typeid;
            ccc.STATUS = "1";

            Repeater repWF = (Repeater)e.Item.FindControl("repWF");
          

            List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), ccc);
            repWF.DataSource = lst;
            repWF.DataBind();

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SYS_BILL_TBColSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string tbs = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["billid"] != null) {
            SYS_BILL valObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, Request["billid"]);
            if (valObj != null&&!string.IsNullOrEmpty(valObj._CONN_SOURCE))
            {
                tbs = valObj._CONN_SOURCE;
                //string[] arr = StringHelper.GetStringArray(valObj.CONN_SOURCE, ',');
                //if (arr != null)
                //{
                //    for (int i = 0; i < arr.Length; i++)
                //    {
                //        string[] aaa = arr[i].Split('.');
                //        if (aaa.Length > 2)
                //        {
                //            tbs += tbs == "" ? aaa[0] + "." + aaa[2] : "," + aaa[0] + "." + aaa[2];
                //        }
                //        else
                //        {
                //            tbs += tbs == "" ? aaa[0] + "." + aaa[1] : "," + aaa[0] + "." + aaa[1];
                //        }
                //    }
                //}
            }
        }
    }
}
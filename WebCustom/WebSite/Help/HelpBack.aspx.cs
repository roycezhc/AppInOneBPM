using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Text;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class WECAdmin_WebSite_Menu_MenuBack : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //显示子节点
        if (Request["ShowSubNodes"] != null)
        {
            #region
            string pid = Request["id"];
            WEC_HELPER obj = new WEC_HELPER();
            WEC_HELPER objval = new WEC_HELPER();
            obj.PID = pid;
        
            objval.OrderBy(WEC_HELPER.Attribute.SORT_ID, Order.Asc);

            List<WEC_HELPER> lst = BLLTable<WEC_HELPER>.Select(objval, obj);
            if (lst.Count > 0)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < lst.Count; i++)
                {
                    if (i > 0)
                    {
                        sb.Append(",");
                    }
                    obj = new WEC_HELPER();
                    obj.PID = lst[i].ID;
                
                    int subcount = BLLTable<WEC_HELPER>.Factory(conn).Select(new WEC_HELPER(), obj).Count;
                    sb.Append("{rid:'").Append(lst[i].PID).Append("',id:'").Append(lst[i].ID.ToString());
                    sb.Append("',pid:'").Append(lst[i].PID.ToString()).Append("',no:").Append(lst[i].SORT_ID);
                    sb.Append(",sc:").Append(subcount);
                    sb.Append(",name:'").Append(lst[i].TITLE).Append("'}");

                }
                sb.Append("]");
                Response.Write(sb.ToString());
            }



            #endregion
        }

        //删除群组
        if (Request["DelNodeID"] != null)
        {
            string keyid = Request["id"];


            int re = BLLTable<WEC_HELPER>.Delete(WEC_HELPER.Attribute.ID, keyid);
            if (re > 0)
            {

            }
            Response.Write(re.ToString());

        }
        Response.End();
    }
}
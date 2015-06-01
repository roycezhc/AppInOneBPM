using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
using AgileFrame.AppInOne.OA;
using AgileFrame.AppInOne.SYS;

public partial class BackSvr : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserBaseExd userExd = new UserBaseExd(userBase);

            //显示子节点
            if (Request["getSubNodes"] != null)
            {
                string nodetype = Request["ntype"];
                StringBuilder sb = new StringBuilder("[");
                string pid = Request["id"];//orgid/deptid/taskid
                //if (nodetype == "root" || nodetype == "")
                //{
                    #region
                    KM_KNMA obj = new KM_KNMA();
                    KM_KNMA val = new KM_KNMA();
                    obj.P_KNMA_ID = pid;
                    val.OrderBy(KM_KNMA.Attribute.SORT_NO, Order.Asc);
                    List<KM_KNMA> lst = BLLTable<KM_KNMA>.Factory(conn).Select(val, obj);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            decimal subcount = 1;
                            sb.Append("{id:'").Append(lst[i].KNMA_ID);
                            sb.Append("',pid:'").Append(lst[i].P_KNMA_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append(subcount.ToString());
                            sb.Append(",name:'").Append(lst[i].KNMA_NAME).Append("',ntype:'knode'}");
                        }
                    }
                    #endregion
                //}
                sb.Append("]");
                Response.Write(sb.ToString());
            }
            Response.End();
        }
    }
}
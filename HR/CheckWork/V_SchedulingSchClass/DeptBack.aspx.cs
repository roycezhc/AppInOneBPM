using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
public partial class V_SchedulingSchClass_DEPT_DeptBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //显示子节点
            if (Request["ShowSubNodes"] != null)
            {
                string nodetype = Request["ntype"];
                StringBuilder sb = new StringBuilder("[");
                string pid = Request["id"];//orgid/deptid/taskid
                if (nodetype == "org")
                {
                    #region
                    HR_ORG obj = new HR_ORG();
                    HR_ORG val = new HR_ORG();
                    obj.P_ORG_ID = pid;

                    val.OrderBy(HR_ORG.Attribute.SORT_NO, Order.Asc);
                    List<HR_ORG> lst = BLLTable<HR_ORG>.Factory(conn).Select(val, obj);
                    if (lst.Count!=null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            decimal subcount = lst[i].SUB_NUM;// lst[i].SUB_NUM > 0 ? lst[i].SUB_NUM : 1;
                            sb.Append("{id:'").Append(lst[i].ORG_ID);
                            sb.Append("',pid:'").Append(lst[i].P_ORG_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append(subcount.ToString());
                            sb.Append(",name:'").Append(lst[i].ORG_NAME).Append("',ntype:'org'}");
                        }
                    }
                    #endregion
                }
                if (nodetype == "org" || nodetype == "dept")
                {
                    #region
                    HR_DEPT obj = new HR_DEPT();
                    HR_DEPT val = new HR_DEPT();
                    if (nodetype == "org") {
                        obj.ORG_ID = pid;
                        obj.P_DEPT_ID = "0";
                    }
                    else {
                        obj.P_DEPT_ID = pid;
                    }
                    val.OrderBy(HR_DEPT.Attribute.SORT_NO, Order.Asc);

                    HR_STAFF stfVal = new HR_STAFF();
                    stfVal.DEPT_ID = "";
                    stfVal.STAFF_ID = 0;
                    stfVal.STAFF_NAME = "";
                    HR_STAFF stfCon = new HR_STAFF();
                    stfCon.DEPT_ID = obj.P_DEPT_ID;
                    List<HR_STAFF> stflst = BLLTable<HR_STAFF>.Factory(conn).Select(stfVal, stfCon);
                    if (stflst.Count > 0)
                    {
                        for (int i = 0; i < stflst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{rid:'").Append(stflst[i].DEPT_ID).Append("',id:'").Append(stflst[i].STAFF_ID.ToString());
                            sb.Append("',pid:'").Append(stflst[i].DEPT_ID.ToString()).Append("',no:").Append(stflst[i].STAFF_ID);
                            sb.Append(",sc:").Append("0");
                            sb.Append(",name:'").Append(stflst[i].STAFF_NAME.Replace("?粀", "").Replace("\0", "").Replace("?", "").Replace("粀", "")).Append("',ntype:'man'}");

                        }

                    }

                    List<HR_DEPT> lst = BLLTable<HR_DEPT>.Factory(conn).Select(val, obj);
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            int subcount = BLLTable<HR_DEPT>.Factory(conn).Select(HR_DEPT.Attribute.P_DEPT_ID, lst[i].DEPT_ID).Count;
                            subcount += BLLTable<HR_STAFF>.Factory(conn).Select(HR_STAFF.Attribute.DEPT_ID, lst[i].DEPT_ID).Count;

                            sb.Append("{rid:'").Append(lst[i].P_DEPT_ID).Append("',id:'").Append(lst[i].DEPT_ID.ToString());
                            sb.Append("',pid:'").Append(lst[i].P_DEPT_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append(subcount.ToString());
                            sb.Append(",name:'").Append(lst[i].DEPT_NAME).Append("',ntype:'dept'}");

                        }
                       
                    }
                    #endregion
                }
                sb.Append("]");
                Response.Write(sb.ToString());
            }
            Response.End();
        }
    }
}

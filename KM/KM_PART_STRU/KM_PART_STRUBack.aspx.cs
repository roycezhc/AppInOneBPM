using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Text;
using AgileFrame.AppInOne.HR;

public partial class KM_PART_STRUBack : AgileFrame.AppInOne.Common.BasePage
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
                    KM_PART_STRU obj = new KM_PART_STRU();
                    KM_PART_STRU val = new KM_PART_STRU();
                    obj.K_PART_ID = pid;

                    val.OrderBy(KM_PART_STRU.Attribute.SORT_NO, Order.Asc);
                    List<KM_PART_STRU> lst = BLLTable<KM_PART_STRU>.Factory(conn).Select(val, obj);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            decimal subcount = lst[i].SUB_NUM;// lst[i].SUB_NUM > 0 ? lst[i].SUB_NUM : 1;
                            sb.Append("{id:'").Append(lst[i].PART_ID);
                            sb.Append("',pid:'").Append(lst[i].K_PART_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append(subcount.ToString());
                            sb.Append(",name:'").Append(lst[i].PART_NAME).Append("',ntype:'org'}");
                        }
                    }
                    #endregion
                }
                if (nodetype == "org" || nodetype == "dept")
                {
                    #region
                    KM_PART_STRU obj = new KM_PART_STRU();
                    KM_PART_STRU val = new KM_PART_STRU();
                    if (nodetype == "org")
                    {
                        obj.PART_ID = pid;
                        obj.K_PART_ID = "0";
                    }
                    else
                    {
                        obj.K_PART_ID = pid;
                    }
                    val.OrderBy(KM_PART_STRU.Attribute.SORT_NO, Order.Asc);

                    List<KM_PART_STRU> lst = BLLTable<KM_PART_STRU>.Factory(conn).Select(val, obj);
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            int subcount = BLLTable<KM_PART_STRU>.Factory(conn).Select(KM_PART_STRU.Attribute.K_PART_ID, lst[i].PART_ID).Count;

                            sb.Append("{rid:'").Append(lst[i].K_PART_ID).Append("',id:'").Append(lst[i].PART_ID.ToString());
                            sb.Append("',pid:'").Append(lst[i].K_PART_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append(subcount.ToString());
                            sb.Append(",name:'").Append(lst[i].PART_NAME).Append("',ntype:'dept'}");

                        }

                    }
                    #endregion
                }
                sb.Append("]");
                Response.Write(sb.ToString());
            }
            //删除群组
            if (Request["DelNodeID"] != null)
            {
                string keyid = Request["id"];
                int re = DeptHelper.DelDept(keyid);// BLLTable<HR_DEPT>.Factory(conn).Delete(HR_DEPT.Attribute.DEPT_ID, keyid);
                Response.Write(re.ToString());
            }
            //修改序号
            if (Request["UpdateSort"] != null)
            {
                string chgid1 = Request["chgid1"];
                string chgsort1 = Request["chgsort1"].ToString();
                string chgid2 = Request["chgid2"];
                string chgsort2 = Request["chgsort2"].ToString();
                try
                {
                    // int re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort1, sys_ModuleInfo.Attribute.ModuleID, chgid1, 1);
                    //re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort2, sys_ModuleInfo.Attribute.ModuleID, chgid2, 1);
                    int re = BLLTable<KM_PART_STRU>.Factory(conn).Update(KM_PART_STRU.Attribute.PART_ID, chgid1, KM_PART_STRU.Attribute.SORT_NO, chgsort1);
                    re = BLLTable<KM_PART_STRU>.Factory(conn).Update(KM_PART_STRU.Attribute.PART_ID, chgid2, KM_PART_STRU.Attribute.SORT_NO, chgsort2);

                    Response.Write(re.ToString());
                }
                catch
                {
                    Response.Write("0");
                }

            }

            Response.End();
        }
    }
}
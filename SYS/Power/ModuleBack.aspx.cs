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
public partial class Admin_SYS_MenuBack : AgileFrame.AppInOne.Common.BasePage
{
    //抽象封装
    private string getTree(ITableImplement val, AttributeItem pid, AttributeItem sortAttr, AttributeItem a)
    {
        return "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //显示子节点
            if (Request["ShowSubNodes"] != null || Request["getSubNodes"] != null)
            {
                #region
                string pid = Request["id"];
                SYS_MODULE obj = new SYS_MODULE();
                SYS_MODULE val = new SYS_MODULE();

                obj.SetValue(SYS_MODULE.Attribute.P_MDL_ID, pid);
                val.OrderBy(SYS_MODULE.Attribute.SORT_NO, Order.Asc);

                List<SYS_MODULE> lst = BLLTable<SYS_MODULE>.Factory(conn).Select(val, obj);
                if (lst.Count > 0)
                {
                    StringBuilder sb = new StringBuilder("[");
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (i > 0)
                        {
                            sb.Append(",");
                        }
                        int subcount = BLLTable<SYS_MODULE>.Factory(conn).Select(SYS_MODULE.Attribute.P_MDL_ID, lst[i].MDL_ID).Count;

                        sb.Append("{rid:'").Append(lst[i].P_MDL_ID).Append("',id:'").Append(lst[i].MDL_ID.ToString());
                        sb.Append("',pid:'").Append(lst[i].P_MDL_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                        sb.Append(",sc:").Append(subcount.ToString());
                        sb.Append(",name:'").Append(lst[i].MDL_NAME).Append("',ntype:'mdl'}");

                    }
                    sb.Append("]");
                    Response.Write(sb.ToString());
                }



                #endregion
            }
            //删除群组
            if (Request["DelNodeID"] != null || Request["deleteNode"] != null)
            {
               
                string keyid = Request["id"];
                int re = BLLTable<SYS_MODULE>.Factory(conn).Delete(SYS_MODULE.Attribute.MDL_ID, keyid);
                string msg = "删除失败";
                if (re > 0)
                {
                    msg = "删除成功";
                    SYS_MODULE cond = new SYS_MODULE();
                    cond.MDL_ID = keyid;
                    //BLLTable<SYS_MODULE>.UpdateAuto(cond, SYS_MODULE.Attribute.SUBCOUNT, -1);
                    //BllTable.UpdateCol(sys_ModuleInfo.Attribute.SubCount, 1, sys_ModuleInfo.Attribute.ModuleID, Request["pid"], 3);
                }
                string str = "{re:" + re + ",msg:'" + msg + "'}";
                Response.Write(re.ToString());
            }
            //修改序号
            if (Request["UpdateSort"] != null)
            {
                string msg = "排序失败";
                string chgid1 = Request["chgid1"];
                string chgsort1 = Request["chgsort1"].ToString();
                string chgid2 = Request["chgid2"];
                string chgsort2 = Request["chgsort2"].ToString();
                int re = 0;
                try
                {
                   // int re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort1, sys_ModuleInfo.Attribute.ModuleID, chgid1, 1);
                    //re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort2, sys_ModuleInfo.Attribute.ModuleID, chgid2, 1);
                    re = BLLTable<SYS_MODULE>.Factory(conn).Update(SYS_MODULE.Attribute.MDL_ID, chgid1, SYS_MODULE.Attribute.SORT_NO, chgsort1);
                    re = BLLTable<SYS_MODULE>.Factory(conn).Update(SYS_MODULE.Attribute.MDL_ID, chgid2, SYS_MODULE.Attribute.SORT_NO, chgsort2);
                    msg = "排序成功";
                    //Response.Write(re.ToString());
                }
                catch {
                   // Response.Write("0");
                }
                string str = "{re:" + re + ",msg:'" + msg + "'}";
                Response.Write(re.ToString());
            }

            Response.End();
        }
    }
}

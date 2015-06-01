using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class HR_STATIONBack : AgileFrame.AppInOne.Common.BasePage
{
    int delStattion(decimal delid)
    {
        HR_STATION old = BLLTable<HR_STATION>.Factory(conn).GetRowData(HR_STATION.Attribute.STATION_ID, delid);
        int re = BLLTable<HR_STATION>.Factory(conn).Delete(HR_STATION.Attribute.STATION_ID, delid);
        if (re > 0 && old.PID>0)
        {
            HR_STATION pCond = new HR_STATION();
            pCond.STATION_ID = old.PID;
            BLLTable<HR_STATION>.UpdateAuto(pCond, HR_STATION.Attribute.SUB_NUM, -1);
        }
        return re;
    }
    protected void Page_Load(object sender, EventArgs e)
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
                if (lst.Count != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        decimal subcount = 1;// lst[i].SUB_NUM;// lst[i].SUB_NUM > 0 ? lst[i].SUB_NUM : 1;
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
                if (nodetype == "org")
                {
                    obj.ORG_ID = pid;
                    obj.P_DEPT_ID = "0";
                }
                else
                {
                    obj.P_DEPT_ID = pid;
                }
                val.OrderBy(HR_DEPT.Attribute.SORT_NO, Order.Asc);

                List<HR_DEPT> lst = BLLTable<HR_DEPT>.Factory(conn).Select(val, obj);
                if (lst.Count > 0)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        int subcount = 1;// BLLTable<HR_DEPT>.Factory(conn).Select(HR_DEPT.Attribute.P_DEPT_ID, lst[i].DEPT_ID).Count;

                        sb.Append("{rid:'").Append(lst[i].P_DEPT_ID).Append("',id:'").Append(lst[i].DEPT_ID.ToString());
                        sb.Append("',pid:'").Append(lst[i].P_DEPT_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                        sb.Append(",sc:").Append(subcount.ToString());
                        sb.Append(",name:'").Append(lst[i].DEPT_NAME).Append("',ntype:'dept'}");

                    }

                }
                #endregion
            }
            #region
            HR_STATION objSta = new HR_STATION();
            HR_STATION valSta = new HR_STATION();
            if (nodetype == "org") {
                objSta.ORG_ID = pid;
                objSta.DEPT_ID = "0";
            }
            else if (nodetype == "dept")
            {
                objSta.DEPT_ID = pid;
            }
            else {
                objSta.PID = decimal.Parse(pid);
            }
            //objSta.P_ORG_ID = pid;

            valSta.OrderBy(HR_STATION.Attribute.SORT_NO, Order.Asc);
            List<HR_STATION> lstSta = BLLTable<HR_STATION>.Factory(conn).Select(valSta, objSta);
            if (lstSta.Count != null)
            {
                for (int i = 0; i < lstSta.Count; i++)
                {
                    if (sb.Length > 2)
                    {
                        sb.Append(",");
                    }
                    decimal subcount = lstSta[i].SUB_NUM;// lst[i].SUB_NUM > 0 ? lst[i].SUB_NUM : 1;
                    sb.Append("{id:'").Append(lstSta[i].STATION_ID);
                    sb.Append("',pid:'").Append(lstSta[i].PID.ToString()).Append("',no:").Append(lstSta[i].SORT_NO);
                    sb.Append(",sc:").Append(subcount.ToString());
                    sb.Append(",name:'").Append(lstSta[i].STATION_NAME).Append("',ntype:'station'}");
                }
            }
            #endregion

            sb.Append("]");
            Response.Write(sb.ToString());
        }

        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelSTATION_ID"] != null)
        {
            int re = delStattion(decimal.Parse(Request["DelSTATION_ID"]));// BLLTable<HR_STATION>.Factory(conn).Delete(HR_STATION.Attribute.STATION_ID, Request["DelSTATION_ID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            //HR_STATION cond = new HR_STATION();
            //cond.In(HR_STATION.Attribute.STATION_ID, Request["DelKeyIDS"]);
            int re = 0;// BLLTable<HR_STATION>.Factory(conn).Delete(cond);
            string[] arr = StringHelper.GetStringArray(Request["DelKeyIDS"], ',');
            for (int i = 0; i < arr.Length; i++) { 
                re+= delStattion(decimal.Parse(arr[i]));
            }
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            HR_STATION val = new HR_STATION();
            val.STATION_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<HR_STATION>.Factory(conn).Update(val, HR_STATION.Attribute.STATION_ID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
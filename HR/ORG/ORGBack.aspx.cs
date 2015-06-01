using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class HR_ORGBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelORG_ID"] != null)
        {
            int re = ORGHelper.DelORG(Request["DelORG_ID"]);// BLLTable<HR_ORG>.Factory(conn).Delete(HR_ORG.Attribute.ORG_ID, Request["DelORG_ID"]);
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
            //HR_ORG cond = new HR_ORG();
            //cond.In(HR_ORG.Attribute.ORG_ID, Request["DelKeyIDS"]);
            int re = ORGHelper.DelORG(Request["DelKeyIDS"]);// BLLTable<HR_ORG>.Factory(conn).Delete(cond);
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
            HR_ORG val = new HR_ORG();
            val.ORG_ID = Request["FieldKeyID"];
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<HR_ORG>.Factory(conn).Update(val, HR_ORG.Attribute.ORG_ID);
            Response.Write("修改用户信息成功");

        }

        //显示子节点
        if (Request["ShowSubNodes"] != null)
        {
            #region
            string pid = Request["id"];
            HR_ORG obj = new HR_ORG();
            HR_ORG val = new HR_ORG();
            obj.P_ORG_ID = pid;

            val.OrderBy(HR_ORG.Attribute.SORT_NO, Order.Asc);

            List<HR_ORG> lst = BLLTable<HR_ORG>.Factory(conn).Select(val, obj);
            if (lst.Count > 0)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < lst.Count; i++)
                {
                    if (i > 0)
                    {
                        sb.Append(",");
                    }
                    int subcount = BLLTable<HR_ORG>.Factory(conn).Select(HR_ORG.Attribute.P_ORG_ID, lst[i].ORG_ID).Count;

                    sb.Append("{rid:'").Append(lst[i].P_ORG_ID).Append("',id:'").Append(lst[i].ORG_ID.ToString());
                    sb.Append("',pid:'").Append(lst[i].P_ORG_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                    sb.Append(",sc:").Append(subcount.ToString());
                    sb.Append(",name:'").Append(lst[i].ORG_NAME).Append("'}");

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
            int re = BLLTable<HR_ORG>.Factory(conn).Delete(HR_ORG.Attribute.ORG_ID, keyid);
            if (re > 0)
            {
                HR_ORG cond = new HR_ORG();
                cond.ORG_ID = keyid;
            }
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
                int re = BLLTable<HR_ORG>.Factory(conn).Update(HR_ORG.Attribute.ORG_ID, chgid1, HR_ORG.Attribute.SORT_NO, chgsort1);
                re = BLLTable<HR_ORG>.Factory(conn).Update(HR_ORG.Attribute.ORG_ID, chgid2, HR_ORG.Attribute.SORT_NO, chgsort2);

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
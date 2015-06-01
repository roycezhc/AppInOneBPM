using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_CHECKER_TPLBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["SetToStep"] != null)
        {
            string ids = Request["SetToStep"];
            int stepid = int.Parse(Request["StepID"]);

            WF_STEP_TPL step= BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID,stepid);

           

            HR_STAFF cond = new HR_STAFF();
            cond.In(HR_STAFF.Attribute.STAFF_ID,ids);
            List<HR_STAFF> lst = BLLTable<HR_STAFF>.Factory(conn).Select(new HR_STAFF(), cond);
            for (int i = 0; i < lst.Count; i++) {
                WF_CHECKER_TPL val = new WF_CHECKER_TPL();
                val.WFID = step.WFID;
                val.PROCID = step.PROCID;
                val.STEP_ID = stepid;
                val.STAFF_ID = lst[i].STAFF_ID.ToString();
                if (!BLLTable<WF_CHECKER_TPL>.Exists(val))
                {
                    val.CHECKER_TYPE = "1";

                    val.CONDITION = "";
                    val.FORMULAR = "";
                    val.STAFF_NAME = lst[i].STAFF_NAME;
                    val.STATUS = "1";
                    BLLTable<WF_CHECKER_TPL>.Factory(conn).Insert(val, WF_CHECKER_TPL.Attribute.CHECKER_ID);
                }
            }
            WF_CHECKER_TPL delObj1=new WF_CHECKER_TPL();
             delObj1.WFID = step.WFID;
                delObj1.PROCID = step.PROCID;
                delObj1.STEP_ID = stepid;
            delObj1.STEP_ID=stepid;
            if (BLLTable<WF_CHECKER_TPL>.Count(delObj1) > lst.Count)
            {
                WF_CHECKER_TPL delOld = new WF_CHECKER_TPL();
                delOld.WFID = step.WFID;
                delOld.PROCID = step.PROCID;
                delOld.STEP_ID = stepid;
                delOld.CHECKER_TYPE = "1";
                delOld.Where("STAFF_ID not in(" + ids + ")");
                BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(delOld);
            }
        }
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelCHECKER_ID"] != null)
        {
            int re = BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(WF_CHECKER_TPL.Attribute.CHECKER_ID, Request["DelCHECKER_ID"]);
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
            WF_CHECKER_TPL cond = new WF_CHECKER_TPL();
            cond.In(WF_CHECKER_TPL.Attribute.CHECKER_ID, Request["DelKeyIDS"]);
            int re = BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(cond);
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
            WF_CHECKER_TPL val = new WF_CHECKER_TPL();
            val.CHECKER_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_CHECKER_TPL>.Factory(conn).Update(val, WF_CHECKER_TPL.Attribute.CHECKER_ID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
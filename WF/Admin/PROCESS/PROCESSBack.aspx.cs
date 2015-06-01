using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_PROCESS_TPLBack : AgileFrame.AppInOne.Common.BasePage
{

    int DelPROC(int wfid,int procid,ref string msg)
    {
        WF_STEP_TPL condStep = new WF_STEP_TPL();
        condStep.WFID = wfid;
        condStep.PROCID = procid;
        condStep.STEP_TYPE = 1;
        if (BLLTable<WF_STEP_TPL>.Exists(condStep))
        {
            msg = "{re:0,msg:'存在步骤，不能删除!'}";
            return 0;
        }
        else {
            WF_PROCESS_TPL delCond = new WF_PROCESS_TPL();
            delCond.WFID = wfid;
            delCond.PROCID = procid;
            msg = "{re:1,msg:'删除成功!'}";
            int re= BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(delCond);
            if (re > 0) {
                WF_STEP_TPL ccc = new WF_STEP_TPL();
                ccc.WFID = wfid;
                ccc.PROCID = procid;
                BLLTable<WF_STEP_TPL>.Factory(conn).Delete(ccc);

                WF_CHECKER_TPL ccc1 = new WF_CHECKER_TPL();
                ccc1.WFID = wfid;
                ccc1.PROCID = procid;
                BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(ccc1);
            }
            return re;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelPROCID"] != null)
        {
            if (BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.PROCID, Request["DelPROCID"]) == null)
            {

                int re = BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(WF_PROCESS_TPL.Attribute.PROCID, Request["DelPROCID"]);
                if (re > 0)
                {
                    Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
                }
                else
                {
                    Response.Write("删除失败！");
                }
            }
            else {
                Response.Write("不能删除！");
            }
        }
        if (Request["DelByKeyID"] != null)
        {
            string msg = "";
            DelPROC(int.Parse(Request["WFID"]), int.Parse(Request["DelByKeyID"]), ref msg);
            Response.Write(msg);
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            WF_STEP_TPL cond1 = new WF_STEP_TPL();
            cond1.In(WF_STEP_TPL.Attribute.PROCID, Request["DelKeyIDS"]);
            if (!BLLTable<WF_STEP_TPL>.Exists(cond1))
            {

                WF_PROCESS_TPL cond = new WF_PROCESS_TPL();
                cond.In(WF_PROCESS_TPL.Attribute.PROCID, Request["DelKeyIDS"]);
                int re = BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(cond);
                if (re > 0)
                {
                    Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
                }
                else
                {
                    Response.Write("删除失败！");
                }
            }
            else
            {
                Response.Write("不能删除！");
            }
        }

        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            WF_PROCESS_TPL val = new WF_PROCESS_TPL();
            val.PROCID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_PROCESS_TPL>.Factory(conn).Update(val, WF_PROCESS_TPL.Attribute.PROCID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
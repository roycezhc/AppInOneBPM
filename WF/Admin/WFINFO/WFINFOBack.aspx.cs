using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.WF;
using AgileFrame.AppInOne.SYS;
public partial class WF_INFOBack : AgileFrame.AppInOne.Common.BasePage
{
    int delWFINFO(string wfid,out string msg)
    {
        msg = "";
        WF_STEP_TPL ccc1 = new WF_STEP_TPL();
        ccc1.WFID = int.Parse(wfid);
        ccc1.STEP_TYPE = 1;
        if (BLLTable<WF_STEP_TPL>.Exists(ccc1))
        {
            msg = "存在步骤，不能删除！";
            return 0;
        }
        WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, wfid);

        int re = BLLTable<WF_INFO>.Factory(conn).Delete(WF_INFO.Attribute.WFID, wfid);
        if (re > 0)
        {
            BLLTable<WF_PROCESS>.Factory(conn).Delete(WF_PROCESS.Attribute.WFID, wfid);
            BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(WF_PROCESS_TPL.Attribute.WFID, wfid);

            BLLTable<WF_STEP>.Factory(conn).Delete(WF_STEP.Attribute.WFID, wfid);
            BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.WFID, wfid);

            BLLTable<WF_CHECKER>.Factory(conn).Delete(WF_CHECKER.Attribute.WFID, wfid);
            BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(WF_CHECKER_TPL.Attribute.WFID, wfid);

            BLLTable<WF_PROCVAR>.Factory(conn).Delete(WF_PROCVAR.Attribute.WFID, wfid);
            BLLTable<WF_PROCVAR_TPL>.Factory(conn).Delete(WF_PROCVAR_TPL.Attribute.WFID, wfid);

            BLLTable<WF_STEPATH>.Factory(conn).Delete(WF_STEPATH.Attribute.WFID, wfid);
            BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(WF_STEPATH_TPL.Attribute.WFID, wfid);

            //jinshenjian 
            BLLTable<WF_WFOBJECT>.Factory(conn).Delete(WF_WFOBJECT.Attribute.WFID_SRC, wfid);
            //jinshenjian 
    
            WFCOMMON_DAL.DelWFTable(wf.WFID);
        }
        return re;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelWFCID"] != null)
        {
            //WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
            string msg = "";
            int re = delWFINFO(Request["DelWFCID"],out msg);// BLLTable<WF_INFO>.Factory(conn).Delete(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        if (Request["DelByKeyID"] != null)
        {
            string msg = "删除工作流成功";
            int re = delWFINFO(Request["DelByKeyID"],out msg);
            if (re > 0)
            {
                Response.Write("{re:1,msg:'" + msg + "'}");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("{re:0,msg:'" + msg + "'}");
            }
        }
        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            string[] arr = StringHelper.GetStringArray(Request["DelKeyIDS"], ',');
            int re = 0;
            string msg = "删除工作流成功";
            for (int i = 0; i < arr.Length; i++)
            {
                string mmm = "";
                re += delWFINFO(arr[i], out mmm);
                msg += mmm;
            }
            //WF_INFO cond = new WF_INFO();
            //cond.In(WF_INFO.Attribute.WFID, Request["DelKeyIDS"]);
            //int re = BLLTable<WF_INFO>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                //WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
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
            WF_INFO val = new WF_INFO();
            val.WFID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_INFO>.Factory(conn).Update(val, WF_INFO.Attribute.WFID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
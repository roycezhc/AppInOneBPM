using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_STEP_FORM_TPLBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["selCOLUMN"] != null)
        {
            WF_STEP_FORM_TPL valObj = new WF_STEP_FORM_TPL();
            int stepid = int.Parse(Request["StepID"]);

            WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);
            valObj.WFID = stepObj.WFID;
            valObj.PROCID = stepObj.PROCID;
            valObj.STEP_ID = stepid;
            valObj.COLUMN_ID = Convert.ToInt32(Request["selCOLUMN"]);

            TF_F_COLUMN wfObj = BLLTable<TF_F_COLUMN>.Factory(conn).GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, valObj.COLUMN_ID);

            valObj.FORM_ID = wfObj.FORM_ID;

            BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Insert(valObj, WF_STEP_FORM_TPL.Attribute.STEP_FID);

            Response.Write(valObj._COLUMN_ID.ToString());
        }
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelByKeyID"] != null)
        {
            int re = BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Delete(WF_STEP_FORM_TPL.Attribute.STEP_FID, Request["DelByKeyID"]);
            if (re > 0)
            {
                Response.Write("{re:1,msg:'删除成功！'}");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("{re:0,msg:'删除失败！'}");
            }
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            WF_STEP_FORM_TPL cond = new WF_STEP_FORM_TPL();
            cond.In(WF_STEP_FORM_TPL.Attribute.STEP_FID, Request["DelKeyIDS"]);
            int re = BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Delete(cond);
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
            WF_STEP_FORM_TPL val = new WF_STEP_FORM_TPL();
            val.STEP_FID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Update(val, WF_STEP_FORM_TPL.Attribute.STEP_FID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
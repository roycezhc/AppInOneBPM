using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WEC_ACTIVITYBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelID"] != null)
        {
          
            int re = BLLTable<WEC_ACTIVITY>.Delete(WEC_ACTIVITY.Attribute.ID, Request["DelID"]);
            WEC_ACTIVITY conf = new WEC_ACTIVITY();
            conf.ID = Convert.ToDecimal(Request["DelID"]);
            WEC_ACTIVITY activity = BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(),conf);
            int re_r=BLLTable<WEC_REQUEST>.Delete(WEC_REQUEST.Attribute.TID,activity.R_ID);
            int re_s = BLLTable<WEC_ACTIVITY_SNCODE>.Delete(WEC_ACTIVITY_SNCODE.Attribute.A_ID, Request["DelID"]);
            if (re > 0&&re_r>=0&&re_s>=0)
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
            WEC_ACTIVITY cond = new WEC_ACTIVITY();
            cond.In(WEC_ACTIVITY.Attribute.ID, Request["DelKeyIDS"]);
            

            List<WEC_ACTIVITY> list=BLLTable<WEC_ACTIVITY>.Select(new WEC_ACTIVITY(),cond);
            int re = BLLTable<WEC_ACTIVITY>.Delete(cond);
            string str = "";
            foreach(WEC_ACTIVITY a in list){
                str += a.R_ID + ",";
            }
            str=str.Substring(0,str.Length-1);

            WEC_REQUEST cond2 = new WEC_REQUEST();
            cond2.In(WEC_REQUEST.Attribute.TID,str);
            int re_r = BLLTable<WEC_REQUEST>.Delete(cond2);

            WEC_ACTIVITY_SNCODE cond3 = new WEC_ACTIVITY_SNCODE();
            cond3.In(WEC_ACTIVITY_SNCODE.Attribute.A_ID, Request["DelKeyIDS"]);
            //WEC_ACTIVITY activity = BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(), conf);
            //int re_r = BLLTable<WEC_REQUEST>.Delete(WEC_REQUEST.Attribute.TID, activity.R_ID);
            int re_s = BLLTable<WEC_ACTIVITY_SNCODE>.Delete(cond3);
            
            if (re > 0&&re_r>=0&&re_s>=0)
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
            WEC_ACTIVITY val = new WEC_ACTIVITY();
            val.ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WEC_ACTIVITY>.Update(val, WEC_ACTIVITY.Attribute.ID);
            Response.Write("修改用户信息成功");

        }
        Response.End();
    }
}
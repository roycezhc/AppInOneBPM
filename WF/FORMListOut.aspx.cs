using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.CMS;
using AgileFrame.AppInOne.WF;
using System.Data;
using AgileFrame.Core;

public partial class WF_FORMListOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int intWfId = Common.GetReqIntValue("wfid");
        string strWhere = Common.GetReqStrValue("where");
        int recount = -1;
        string strCOLS = "";
        string[] arr = null;
        DataTable dt = null;

        WFOBJECT_BLL wfbll = new WFOBJECT_BLL(intWfId);
        FORM_BLL bllform = null;
        if (wfbll.Base != null)
        {
            bllform = wfbll.FORM_BLL;
        }

        if (bllform != null)
        {
            dt = bllform.WF_SelectByPage(intWfId, 12, 1, ref recount, strWhere, out strCOLS);

            //在合同里增加 金额 字段
            arr = StringHelper.GetStringArray(strCOLS, ',');
            
        }

        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "GB2312";
        //Response.ContentEncoding = System.Text.Encoding.UTF8;

        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode("流程列表" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls"));
        Response.ContentType = "application/vnd.ms-excel";  
        string header = "";
        string body = "";
        header += "编号\t";
        header += "提交人\t";
        header += "申请单名称\t";
        header += "申请部门\t";
        header += "提交时间\t";
        header += "审批情况\t";
        if (arr != null)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                string[] aaa = arr[i].Split(':');
                if (aaa.Length > 1)
                    header += aaa[1] + "\t";
            }
        }
        header += "\n";

        if (dt != null)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                body += Convert.ToString(dt.Rows[i]["RECID"]) + "\t";
                body += Convert.ToString(dt.Rows[i]["CSTAFF_NAME"]) + "\t";
                body += Convert.ToString(dt.Rows[i]["RECNAME"]) + "\t";
                body += Convert.ToString(dt.Rows[i]["DEPT_NAME"]) + "\t";
                body += Convert.ToString(dt.Rows[i]["ADDTIME"]) + "\t";
                body += WFEnum.GetRecStatus(Convert.ToString(dt.Rows[i]["STATUS"])) + "\t";
                if (arr != null)
                {
                    for (int j = 0; j < arr.Length; j++)
                    {
                        string[] aaa = arr[j].Split(':');
                        if (aaa.Length > 1)
                            body += Convert.ToString(dt.Rows[i][aaa[0]]) + "\t";
                    }
                }
                body += "\n";
            }
        }

        Response.Write(header);
        Response.Write(body);
        Response.End();
    }
}
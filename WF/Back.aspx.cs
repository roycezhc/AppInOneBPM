using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;

public partial class WF_Back :BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region
        if (!string.IsNullOrEmpty(Request["DEL_RECID"]))
        {
            int recid = int.Parse(Request["DEL_RECID"]);

            WF_FORMBASE objVal = BLLTable<WF_FORMBASE>.Factory(conn).GetRowData(WF_FORMBASE.Attribute.RECID, recid);
            WFRecordInfo recObj = new WFRecordInfo(objVal, true);
            if (objVal != null)
            {
                int wfid = objVal.WFID;
                // Dictionary<string, FormField> dicObj = WFRecord.GetFormFieldDicByRecID(wfid, recid);
                if (objVal.STATUS == "0")
                {
                    recObj.DeleteByRecID(wfid, recid);
                    if (preUrl == "")
                    {
                        preUrl = "FormList.aspx?WFID=" + wfid + "&Mine=" + StringHelperExd.GetRandomCode(6);
                    }
                    else
                    {
                        if (preUrl.IndexOf("&r=") != -1)
                        {
                            preUrl = preUrl.Replace("&r=", "&r=" + StringHelperExd.GetRandomCode(3));
                        }
                        else
                        {
                            if (preUrl.IndexOf("?") != -1)
                            {
                                preUrl += "&r=" + StringHelperExd.GetRandomCode(6);
                            }
                            else
                            {
                                preUrl += "?r=" + StringHelperExd.GetRandomCode(6);
                            }
                        }
                    }
                    Response.Redirect(preUrl);
                    //ScriptHelper.AlertAndGo(Page, "删除成功！", preUrl);
                }
                else
                {
                    if (userBase.UserType == "1")
                    {
                        recObj.DeleteByRecID(wfid, recid);
                        if (preUrl == "")
                        {
                            preUrl = "FormList.aspx?WFID=" + wfid + "&Mine=" + StringHelperExd.GetRandomCode(6);
                        }
                        else
                        {
                            if (preUrl.IndexOf("&r=") != -1)
                            {
                                preUrl = preUrl.Replace("&r=", "&r=" + StringHelperExd.GetRandomCode(3));
                            }
                            else
                            {
                                if (preUrl.IndexOf("?") != -1)
                                {
                                    preUrl += "&r=" + StringHelperExd.GetRandomCode(6);
                                }
                                else
                                {
                                    preUrl += "?r=" + StringHelperExd.GetRandomCode(6);
                                }
                            }
                        }
                        Response.Redirect(preUrl);
                        //ScriptHelper.AlertAndGo(Page, "删除成功！", preUrl);
                    }
                    else
                    {
                        Response.Write("<h3>已经在审批中，不能删除!<a href='" + preUrl + "'>返回</a></h3>");
                    }
                }
            }
            else
            {
                ScriptHelper.AlertAndGo(Page, "该记录不存在或已被删除！", preUrl);
            }
        }

        #endregion

        if (Request["GetRECNO"] != null)
        {
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(WFRecordInfo.GetRECNO(Request["DEPT_ID"]));
            Response.End();
        }
        if (Request["showlog"] != null)
        {
            #region
            WF_CHECK_LOG ccc = new WF_CHECK_LOG();
            ccc.WFID = int.Parse(Request["WFID"]);
            ccc.PROCID = int.Parse(Request["PROCID"]);
            ccc.STEP_ID = int.Parse(Request["StepID"]);
            ccc.RECID = int.Parse(Request["RECID"]);
            WF_CHECK_LOG log = BLLTable<WF_CHECK_LOG>.Factory(conn).GetRowData(ccc);
            if (log != null)
            {
                try
                {
                    StringBuilder sb = new StringBuilder();
                    string[] a = StringHelper.GetStringArray(log.RESULTS, '|');
                    string[] b = StringHelper.GetStringArray(log.CHECKERS, '|');
                    string[] c = StringHelper.GetStringArray(log.CHECK_TIMES, '|');
                    string[] d = null;
                    string[] f = null;
                    if (!string.IsNullOrEmpty(log.NOTES))
                    {
                        d = StringHelper.GetStringArray(log.NOTES, '|');
                    }
                    if (!string.IsNullOrEmpty(log.ANNEX_FILE))
                    {
                        f = StringHelper.GetStringArray(log.ANNEX_FILE, '|');
                    }
                    for (int i = 0; i < a.Length; i++)
                    {
                        string mbr = "", entrust = "";

                        if (b[i].IndexOf(":") >= 0)
                        {
                            mbr = b[i].Split(':')[0];
                            entrust = b[i].Split(':')[1];
                        }
                        else
                        {
                            mbr = b[i];
                        }
                        sb.Append("<div class='l-row'><p><span>" + mbr + "</span><b>" + WFEnum.GetLogResult(a[i]) + "</b>");
                        sb.Append("<span>" + entrust + "</span>");
                        sb.Append("<label>" + c[i] + "</label></p>");
                        if (d != null && d.Length > i)
                        {
                            sb.Append("<p>" + d[i] + "</p>");
                        }
                        else
                        {
                            sb.Append("<p>无</p>");
                        }
                        if (f != null)
                        {
                            if (!string.IsNullOrEmpty(f[i]))
                            {
                                sb.Append("<p>附件：");
                                string[] lstAnnex = f[i].Split(',');
                                foreach (string strAnnex in lstAnnex)
                                {
                                    sb.Append("<a href='" + WebHelper.GetAppPath() + strAnnex + "' target='_blank'>" + strAnnex.Substring(strAnnex.LastIndexOf("/") + 1) + "</a></br>");
                                }
                                sb.Append("</p>");
                            }
                        }
                        sb.Append("</div>");
                    }
                    Response.Write(sb.ToString());
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                Response.Write("<div class='l-row'><p>无审批记录</p></div>");
            }

            #endregion
        }

        if (Request["selVal"] != null)
        {
            //获取父下拉框选中的ITEM_ID
            V_TF_F_COLUMN_ITEM objVC = new V_TF_F_COLUMN_ITEM();
            objVC.COLUMN_ID = Convert.ToInt32(Request["Pcolumnid"]);
            objVC.VALUE = Request["selVal"];

            V_TF_F_COLUMN_ITEM objI = BLLTable<V_TF_F_COLUMN_ITEM>.GetRowData(objVC);

            //获取子下拉框的内容项
            if (objI != null)
            {
                V_TF_F_COLUMN_ITEM objV = new V_TF_F_COLUMN_ITEM();
                objV.Distinct = true;
                objV.VALUE = "";
                objV.TEXT = "";

                objVC = new V_TF_F_COLUMN_ITEM();
                objVC.COLUMN_ID = Convert.ToInt32(Request["columnid"]);
                objVC.DROP_REAL = Convert.ToString(objI.ITEM_ID);

                List<V_TF_F_COLUMN_ITEM> lstv = BLLTable<V_TF_F_COLUMN_ITEM>.Select(objV, objVC);

                if (lstv.Count > 0)
                {
                    Response.Write("{\"list\":" + JsonUtil.getJsonStr<V_TF_F_COLUMN_ITEM>(lstv) + ",\"first\":\"" + lstv[0].ITEM_ID + "\"}");
                }
                else
                {
                    Response.Write("{\"list\":\"\",\"first\":\"\"}");
                }
            }
           
        }

        Response.End();

    }
}
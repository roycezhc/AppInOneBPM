using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class Admin_WorkFlow_CondSet : AgileFrame.AppInOne.Common.BasePage
{
    string createDataObj(string condStr)
    {
        StringBuilder condData = new StringBuilder("{Col1:'");
        string opr = "=";
        string[] arr = WFCondition.SplitCondLR(condStr, null, "", out opr);
        if (arr[0].IndexOf("-") != -1)
        {
            string[] aaa = arr[0].Split('-');
            condData.Append(aaa[0]).Append("',ColOpr:'-',Col2:'");
            condData.Append(aaa[1]).Append("',");
        }
        else if (arr[0].IndexOf("+") != -1)
        {
            string[] aaa = arr[0].Split('+');
            condData.Append(aaa[0]).Append("',ColOpr:'+',Col2:'");
            condData.Append(aaa[1]).Append("',");
        }
        else
        {
            condData.Append(arr[0]).Append("',ColOpr:'',Col2:'',");
        }
        condData.Append("ReOpr:'").Append(opr).Append("',");// selOpr.val() + "',";
        condData.Append("Re:'").Append(arr[1]).Append("'}");//
        return condData.ToString();
    }
    public string condNum = "0";
    string from = "";//默认为转入条件,2步骤转出条件，3审核人条件，4特定申请使用哪个流程的条件
    int keyid = 0;//from=1，2步骤ID,=3表示审核人ID，=4表示特定申请使用哪个流程配制ID

    int wfid = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Convert.ToInt32(Request["KeyID"]);//3 审核人条件
        }
        if (!string.IsNullOrEmpty(Request["STEP_ID"]))
        {
            keyid = Convert.ToInt32(Request["STEP_ID"]);//2 普通路径条件 
        }
        if (!string.IsNullOrEmpty(Request["StepID"]))
        {
            keyid = Convert.ToInt32(Request["StepID"]);
        }
        if (keyid == 0) {
            Response.Write("非法连接！");
            Response.End();
        }
        
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = Convert.ToInt32(Request["WFID"]);
        }
        if (!string.IsNullOrEmpty(Request["from"]))
        {
            from = Request["from"];//2 普通路径条件 3 审核人条件
        }

        if (!IsPostBack)
        {
            //Response.Write(Request.Url.AbsoluteUri);
            if (wfid > 0)
            {
                var ocjWFC = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, wfid);
                //afname = ocjWFC.WFName;
                //wfcname = ocjWFC.WFCNAME;

                //List<WFCondCol> lstCol = BLLTable<WFCondCol>.GetRowsList(WFCondCol.Attribute.WFName, afname);
                //for (int i = 0; i < lstCol.Count; i++)
                //{
                //    litCol1.Text += "<option value=\"" + lstCol[i].ColName + "\" title=\"" + lstCol[i].ColNote + "\">" + lstCol[i].ColCName + "</option>";
                //    litCol2.Text += "<option value=\"" + lstCol[i].ColName + "\" title=\"" + lstCol[i].ColNote + "\">" + lstCol[i].ColCName + "</option>";

                //    //ListItem li1 = new ListItem(lstCol[i].ColCName, lstCol[i].ColName);
                //    //selCol1.Items.Add(li1);

                //    //ListItem li2 = new ListItem(lstCol[i].ColCName, lstCol[i].ColName);
                //    //selCol2.Items.Add(li2);
                //}
                string colsHtml = WFAdmin.GetSelectTbColsHtmlByWFID(wfid);
                //Response.Write(colsHtml + afname);
                litCol1.Text = colsHtml;
                litCol2.Text = colsHtml;
            }


            btnBack.Attributes.Add("onclick", "window.close();return false;");
            string condStr = "";
            string formula = "";
            if (Request["setPathCond"] != null)//设置路径条件
            {
                WF_STEPATH_TPL cond = new WF_STEPATH_TPL();
                cond.STEP_ID = int.Parse(Request["StepID"]);
                cond.NEXT_ID = int.Parse(Request["NextID"]);
                WF_STEPATH_TPL Obj = BLLTable<WF_STEPATH_TPL>.Factory(conn).GetRowData(new WF_STEPATH_TPL(), cond);
                WF_STEP_TPL ObjStep1 = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, cond.STEP_ID);
                WF_STEP_TPL ObjStep = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, cond.NEXT_ID);
                litStep.Text = ObjStep1.STEP_NAME + " 到 " + ObjStep.STEP_NAME;
                if (Obj != null)
                {
                    condStr = Obj.CONDITION;
                    formula = Obj.FORMULAR;
                }
                //Response.Write(condStr);
            }
            if (keyid > 0)
            {
                if (from == "1")//步骤显示条件--无用  chx
                {
                    WF_STEP_TPL Obj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, keyid);
                    litStep.Text = Obj.STEP_NAME;
                    if (Obj != null)
                    {
                        condStr = Obj.CONDITION;
                        formula = Obj.FORMULAR;
                    }
                }
                else if (from == "2")//普通路径条件
                {
                    //Response.Write("ddd");
                    WF_STEPATH_TPL cond = new WF_STEPATH_TPL();
                    cond.STEP_ID = keyid;
                    cond.NEXT_ID = int.Parse(Request["NextID"]);
                    cond.PATH_TYPE=int.Parse(Request["PATH_TYPE"]);
                    WF_STEPATH_TPL Obj = BLLTable<WF_STEPATH_TPL>.Factory(conn).GetRowData(new WF_STEPATH_TPL(), cond);
                    WF_STEP_TPL ObjStep1 = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, keyid);
                    WF_STEP_TPL ObjStep = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, cond.NEXT_ID);
                    litStep.Text = ObjStep1.STEP_NAME + " 到 " + ObjStep.STEP_NAME;
                    if (Obj != null)
                    {
                        condStr = Obj.CONDITION;
                        formula = Obj.FORMULAR;
                    }
                }

                else if (from == "3")//审核人条件
                {
                    WF_CHECKER_TPL ObjCk = BLLTable<WF_CHECKER_TPL>.Factory(conn).GetRowData(WF_CHECKER_TPL.Attribute.CHECKER_ID, keyid);
                    if (ObjCk != null)
                    {
                        litStep.Text = ObjCk.STAFF_NAME;
                        condStr = ObjCk.CONDITION;
                        formula = ObjCk.FORMULAR;
                    }
                }
                else if (from == "4")//使用哪个过程条件
                {

                    WF_PROCESS_TPL recSet = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, keyid);
                    litStep.Text = recSet.PROC_NAME;
                    condStr = recSet.CONDITION;
                    formula = recSet.FORMULAR;
                }
                else if (from == "5")//通知人条件
                {
                    WF_NOTIFIER_TPL ObjCk = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).GetRowData(WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID, keyid);
                    if (ObjCk != null)
                    {
                        litStep.Text = ObjCk.STAFF_NAME;
                        condStr = ObjCk.CONDITION;
                        formula = ObjCk.FORMULAR;
                    }
                }
                //else if (from == "6")//通知人条件
                //{
                //    WF_STEPState recSet = BLLTable<WF_STEPState>.Factory(conn).GetRowData(WF_STEPState.Attribute.StateID, keyid);
                //    litStep.Text = "可选状态条件";
                //    condStr = recSet.CONDITION;
                //    formula = recSet.FORMULAR;
                //}
                
            }
            //Response.Write(condStr);
            if (!string.IsNullOrEmpty(condStr))
            {
                string show = formula.Substring(0, 4);
                selIsShow.Value = show;
                string str = condStr;
                if (str.Trim() != "")
                {
                    string[] arrCond = StringHelper.GetStringArray(str, '|');
                    condNum = arrCond.Length.ToString();
                    for (int i = 0; i < arrCond.Length; i++)
                    {
                        StringBuilder sbThml = new StringBuilder("<tr id='tr_");//show:
                        int Num = i + 1;
                        sbThml.Append(Num).Append("'><td><span>");
                        sbThml.Append(Num).Append("</span></td><td>");
                        sbThml.Append("<input name='txtCond_").Append(Num).Append("' readonly='readonly' type='text' value='");//
                        sbThml.Append(arrCond[i]).Append("' title=\"").Append(createDataObj(arrCond[i])).Append("\" /></td><td>");
                        sbThml.Append("<a href='#' onclick='editCond(this);'>修改</a>&nbsp;&nbsp;<a href='#' onclick='delCond(this);'>删除</a></td></tr>");
                        litConds.Text += sbThml.ToString();
                    }
                }
                if (formula.Length > 5)
                {
                    txtGongShi.Value = formula.Substring(5);
                }
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {

        string gotoUrl = "WF_STEPManage.aspx";
        if (Request["preUrl"] != null)
        {
            gotoUrl = Request["preUrl"];
        }
        else
        {
            gotoUrl = "../ok.aspx";
        }
        int Num = Convert.ToInt32(Request["hidCondNum"]);
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= Num; i++)
        {
            if (!string.IsNullOrEmpty(Request["txtCond_" + i.ToString()]))
            {
                string conddata = Request["txtCond_" + i.ToString()];
                if (sb.Length > 0)
                {
                    sb.Append("|");
                }
                sb.Append(conddata);
            }
        }
        //if (Request["open"] == null)
        //{
        if (Request["setPathCond"] != null)//设置路径条件
        {
            WF_STEPATH_TPL cond = new WF_STEPATH_TPL();
            cond.STEP_ID = int.Parse(Request["StepID"]);
            cond.NEXT_ID = int.Parse(Request["NextID"]);
            
            WF_STEPATH_TPL upStep = new WF_STEPATH_TPL();
            upStep.CONDITION = sb.ToString();
            if (upStep.CONDITION.Length > 1)
            {
                upStep.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upStep.FORMULAR = "";
            }
            BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(upStep, cond);
        }
        if (from == "1")//显示步骤条件--无用
        {
            WF_STEP_TPL upStep = new WF_STEP_TPL();
            upStep.STEP_ID = keyid;
            upStep.CONDITION = sb.ToString();
            if (upStep.CONDITION.Length > 1)
            {
                upStep.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upStep.FORMULAR = "";
            }
            BLLTable<WF_STEP_TPL>.Factory(conn).Update(upStep, WF_STEP_TPL.Attribute.STEP_ID);
        }
        else if (from == "2")//普通路径条件
        {
            WF_STEPATH_TPL cond = new WF_STEPATH_TPL();
            cond.STEP_ID = keyid;
            cond.NEXT_ID = int.Parse(Request["NextID"]);
            cond.PATH_TYPE = int.Parse(Request["PATH_TYPE"]);
            WF_STEPATH_TPL upStep = new WF_STEPATH_TPL();
            upStep.CONDITION = sb.ToString();
            if (upStep.CONDITION.Length > 1)
            {
                upStep.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upStep.FORMULAR = "";
            }
            BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(upStep, cond);
        }
        else if (from == "3")//审核人条件设置
        {
            WF_CHECKER_TPL upCh = new WF_CHECKER_TPL();
            upCh.CHECKER_ID = keyid;
            upCh.CONDITION = sb.ToString();
            if (upCh.CONDITION.Length > 1)
            {
                upCh.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upCh.FORMULAR = "";
            }
            BLLTable<WF_CHECKER_TPL>.Factory(conn).Update(upCh, WF_CHECKER_TPL.Attribute.CHECKER_ID);
        }
        else if (from == "4")//选择过程条件
        {
            WF_PROCESS_TPL upSet = new WF_PROCESS_TPL();
            upSet.PROCID = keyid;
            upSet.CONDITION = sb.ToString();
            if (upSet.CONDITION.Length > 1)
            {
                upSet.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upSet.FORMULAR = "";
            }
            BLLTable<WF_PROCESS_TPL>.Factory(conn).Update(upSet, WF_PROCESS_TPL.Attribute.PROCID);
        }
        else if (from == "5")//通知人条件设置
        {
            WF_NOTIFIER_TPL upCh = new WF_NOTIFIER_TPL();
            upCh.NOTIFIER_ID = keyid;
            upCh.CONDITION = sb.ToString();
            if (upCh.CONDITION.Length > 1)
            {
                upCh.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
            }
            else
            {
                upCh.FORMULAR = "";
            }
            BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Update(upCh, WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID);
        }
        //else if (from == "6")
        //{
        //    WF_STEPState upSet = new WF_STEPState();
        //    upSet.StateID = keyid;
        //    upSet.CONDITION = sb.ToString();
        //    if (upSet.CONDITION.Length > 1)
        //    {
        //        upSet.FORMULAR = selIsShow.Value + ":" + txtGongShi.Value.Trim();
        //    }
        //    else
        //    {
        //        upSet.FORMULAR = "";
        //    }
        //    BLLTable<WF_STEPState>.Factory(conn).Update(upSet);
        //}

        if (Request["setpSetting"] != null)
        {
            //Response.Write(Request.Url.AbsoluteUri);
            string randStr = StringHelperExd.GetRandomCode(6);
            string url = Request.Url.AbsoluteUri;
            if (url.IndexOf("&r=") != -1)
            {
                Regex reg = new Regex(@"&r=\w+");
                url = reg.Replace(url, "&r=" + randStr);
            }
            else {
                url += "&r=" + randStr;
            }
            //Response.Write(url);
            //ScriptHelper.AlertAndGo(Page, "条件保存成功！", url);
            ScriptHelper.Alert(Page, "条件保存成功！");
            //Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            AgileFrame.Core.ScriptHelper.ResponseScript(Page, "if (window.opener){window.opener.returnValue = \"ok\";}else{window.returnValue = \"ok\";}window.close();", true);
        }
        //Response.Redirect(gotoUrl);
        //}
        //else//打开条件配制窗口，无论是修改还是新增条件，都只需要返回条件和公式即可
        //{
        //    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "window.returnValue=\"" + sb.ToString() + "`" + txtGongShi.Value.Trim() + "\";window.close();", false);
        //}
    }
}

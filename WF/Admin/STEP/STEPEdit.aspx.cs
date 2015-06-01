using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_STEP_TPLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_STEP_TPL valObj = new WF_STEP_TPL();
    int count = 0;
    public string keyid = "";
    protected string title = "";
    protected int wfid = 0;
    protected int procid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑 ";
        
        if (!string.IsNullOrEmpty(Request["STEP_ID"]))
        {
            keyid = Request["STEP_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            procid = int.Parse(Request["PROCID"]);
            
            if (ViewState["PROCID"] != null) {
                procid = Convert.ToInt32(ViewState["PROCID"]);
            }
            
        }
        if (procid > 0)
        {
            if (wfid == 0)
            {
                WF_PROCESS_TPL pvalue = BLLTable<WF_PROCESS_TPL>.Factory(conn).GetRowData(WF_PROCESS_TPL.Attribute.PROCID, procid);
                title += pvalue.PROC_NAME + "-";
                wfid = pvalue.WFID;
            }
        }
        else {
            if (keyid == "")
            {
                Response.Write("非法连接！");
                Response.End();
            }

        }
        if (!IsPostBack)
        {
           
            if (!string.IsNullOrEmpty(Request["pathset"]))
            {
                btnSave.Enabled = false;
               
            }
            txtWFCID.Value = wfid.ToString();
            txtPROCID.Value = procid.ToString();

            txtBACK_TYPE.Items.AddRange(FormHelper.GetListItem(WF_STEP_TPL.Attribute.BACK_TYPE));

            //if (txtSTEP_TYPE.Items.Count > 1)
            //{
            //    txtSTEP_TYPE.SelectedIndex = 1;
            //}
            if (!string.IsNullOrEmpty(Request["stepType"]))
            {
                txtSTEP_TYPE.Value = Request["stepType"];
                txtSTEP_TYPE.Disabled = true;
            }

            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, keyid);
                    title += valObj.STEP_NAME + "-" + valObj.STEP_ID;

                    if (valObj == null) return;
                    txtSTEP_ID.Value = Convert.ToString(valObj.STEP_ID);//Convert.ToInt32                
                    txtSTEP_NAME.Value = Convert.ToString(valObj.STEP_NAME);//Convert.ToString                
                    txtPROCID.Value = Convert.ToString(valObj.PROCID);//Convert.ToInt32                
                    txtWFCID.Value = valObj.WFID.ToString();
                    //txtSTEP_NOTE.Value = Convert.ToString(valObj.STEP_NOTE);//Convert.ToString                
                    txtSHOW_CONDITION.Value = Convert.ToString(valObj.CONDITION);//Convert.ToString                
                    txtSHOW_FORMULA.Value = Convert.ToString(valObj.FORMULAR);//Convert.ToString                
                    txtSTEP_TYPE.Value = valObj.STEP_TYPE.ToString();
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString
                    txtBACK_TYPE.Value = Convert.ToString(valObj.BACK_TYPE);
                    txtWF_STEP_TPL_LIFE_TIME.Value =  Convert.ToString(valObj.LIFE_TIME);
                    wucSelStaff1.SetSelEmps(valObj.NOTICE_MBR);

                    txtWF_STEP_TPL_ISALLOW_GOTO.Checked = valObj.ISALLOW_GOTO;

                    ViewState["PROCID"] = valObj.PROCID;
                    if (valObj.STEP_TYPE.ToString() == WFEnum.StepType.Activity.ToString("d"))
                    {
                        WF_CHECKER_TPL hhh1 = new WF_CHECKER_TPL();
                        hhh1.STEP_ID = valObj.STEP_ID;
                        hhh1.WFID = valObj.WFID;
                        hhh1.PROCID = valObj.PROCID;
                        bool hadChecker = BLLTable<WF_CHECKER_TPL>.Exists(hhh1);

                        WF_STEP_FORM_TPL hhh2 = new WF_STEP_FORM_TPL();
                        hhh2.STEP_ID = valObj.STEP_ID;
                        hhh2.WFID = valObj.WFID;
                        hhh2.PROCID = valObj.PROCID;
                        bool hadCKForm = BLLTable<WF_STEP_FORM_TPL>.Exists(hhh2);

                        WF_STEPATH_TPL hhh3 = new WF_STEPATH_TPL();
                        hhh3.STEP_ID = valObj.STEP_ID;
                        hhh3.WFID = valObj.WFID;
                        hhh3.PROCID = valObj.PROCID;
                        hhh3.CONDITION = "";
                        //hhh3.Where("(WF_STEPATH_TPL.Condition<>'' and WF_STEPATH_TPL.Condition is not null)");
                        //bool hadCond = BLLTable<WF_STEPATH_TPL>.Exists(hhh3);

                        WF_STEPATH_TPL val30 = new WF_STEPATH_TPL();
                        val30.CONDITION = "";
                        val30.NEXT_ID = 1;
                        WF_STEP_TPL val31 = new WF_STEP_TPL(); val31.STEP_NAME = ""; val31.STEP_ID = 1;

                        List<WF_STEP_TPL> list3 = BLLTable<WF_STEP_TPL>.Select(val31, new Relation(WF_STEPATH_TPL.Attribute.NEXT_ID, WF_STEP_TPL.Attribute.STEP_ID)
                        , val30, hhh3);

                        litMore.Text += "<dl><dt>后继节点：</dt><dd>" + (list3.Count > 0 ? list3[0].STEP_NAME : "未配置") + "</dd></dl>";
                        litMore.Text += "<dl><dt>审核人：</dt><dd>" + (hadChecker == true ? "已配置" : "未配置") + "</dd></dl>";
                        litMore.Text += "<dl><dt>活动审批表单：</dt><dd>" + (hadCKForm == true ? "已配置" : "未配置") + "</dd></dl>";
                        litMore.Text += "<dl><dt>活动条件：</dt><dd>" + (list3.Count > 0 && list3[0].CONDITION != null ? list3[0].CONDITION : "未配置") + "</dd></dl>";
                    }
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["setpSetting"] != null)
            {
                btnOK.Enabled = false;
                //btnCloseWin.Disabled = true;
                btnCloseWin.Attributes["onclick"] = "window.parent.close();";
                txtSTEP_TYPE.Disabled = true;
            }
        } 
        Page.Title = title;
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            WF_STEP_TPL valObj = new WF_STEP_TPL();

            if (txtWFCID.Value != "")
                valObj.WFID = Convert.ToInt32(txtWFCID.Value);
            if (txtSTEP_ID.Value != "")
                valObj.STEP_ID = Convert.ToInt32(txtSTEP_ID.Value);
            if (txtSTEP_NAME.Value != "")
                valObj.STEP_NAME = Convert.ToString(txtSTEP_NAME.Value);
            if (txtPROCID.Value != "")
                valObj.PROCID = Convert.ToInt32(txtPROCID.Value);

            valObj.ISALLOW_GOTO = txtWF_STEP_TPL_ISALLOW_GOTO.Checked;

            if (txtWF_STEP_TPL_LIFE_TIME.Value != "")
                valObj.LIFE_TIME =  Convert.ToInt32(txtWF_STEP_TPL_LIFE_TIME.Value);


            //获取通知人
            valObj.NOTICE_MBR = wucSelStaff1.GetSelEmpIDS();

            if (txtSTEP_TYPE.Value != "")
                valObj.STEP_TYPE = Convert.ToInt32(txtSTEP_TYPE.Value);
            if (txtNOTE.Value != "")
                valObj.NOTE = Convert.ToString(txtNOTE.Value);

            if (txtBACK_TYPE.Value != "")
                valObj.BACK_TYPE = Convert.ToInt32(txtBACK_TYPE.Value);
            //List<WF_STEPATH_TPL> lstPath = null;

            if (keyid != "")
            {
                valObj.STEP_ID = Convert.ToInt32(keyid);
                count = BLLTable<WF_STEP_TPL>.Factory(conn).Update(valObj, WF_STEP_TPL.Attribute.STEP_ID);
            }
            else
            {
                valObj.CONDITION = txtSHOW_CONDITION.Value;
                valObj.FORMULAR = txtSHOW_FORMULA.Value;
               
                //WF_STEPATH_TPL pathCond=new WF_STEPATH_TPL();
                //pathCond.NEXT_ID=0;
                //pathCond.WFID = wfid;
                //pathCond.PROCID = procid;
                //lstPath = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(new WF_STEPATH_TPL(), pathCond);

                count = BLLTable<WF_STEP_TPL>.Factory(conn).Insert(valObj, WF_STEP_TPL.Attribute.STEP_ID);
                keyid = valObj.STEP_ID.ToString();

                if (count > 0)
                {
                    #region//根据建立步骤的顺序建立默认过程路径

                    //WF_STEPATH_TPL path1 = new WF_STEPATH_TPL();
                    //path1.WFID = wfid;
                    //path1.PROCID = procid;
                    //path1.NODE_TYPE = 0;
                    //path1.STEP_ID = int.Parse(keyid);
                    //BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(path1, WF_STEPATH_TPL.Attribute.PATH_ID);


                    //WF_RULE_TPL preUp = new WF_RULE_TPL();
                    //preUp.STEPS_OUT = keyid;
                    //preUp.NEXT_RULE_ID = rule_e.RULE_ID;
                    //preUp.RULE_ID = rule_pre.RULE_ID;
                    //if (preIsEnd) {
                    //    preUp.RULE_TYPE = 1;
                    //}
                    //BLLTable<WF_RULE_TPL>.Factory(conn).Update(preUp, WF_RULE_TPL.Attribute.RULE_ID);

                    //path1.STEP_TYPE = "1";
                    //path1.RULE_ID = preUp.RULE_ID;
                    //path1.STEP_ID = int.Parse(keyid);
                    //BLLTable<WF_RULEPATH_TPL>.Factory(conn).Insert(path1, WF_RULEPATH_TPL.Attribute.R_PATH_ID);

                    ////根据建立步骤的先后顺序  构造默认的步骤路径
                    //if (lstPath != null && lstPath.Count > 0)
                    //{
                    //    for (int i = 0; i < lstPath.Count; i++)
                    //    {
                    //        WF_STEPATH_TPL cond1 = new WF_STEPATH_TPL();
                    //        cond1.WFID = wfid;
                    //        cond1.PROCID = procid;
                    //        cond1.STEP_ID = lstPath[i].STEP_ID;
                    //        WF_STEPATH_TPL val1 = new WF_STEPATH_TPL();
                    //        val1.NEXT_ID = int.Parse(keyid);

                    //        BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(val1, cond1);

                    //        WF_STEPATH_TPL cond2 = new WF_STEPATH_TPL();
                    //        cond2.WFID = wfid;
                    //        cond2.PROCID = procid;
                    //        cond2.STEP_ID = int.Parse(keyid);
                    //        WF_STEPATH_TPL val2 = new WF_STEPATH_TPL();
                    //        val2.PREV_ID = lstPath[i].STEP_ID;
                    //        BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(val2, cond2);


                    //        WF_STEPATH_TPL preVal = new WF_STEPATH_TPL();
                           
                    //        preVal.PREV_ID = lstPath[i].STEP_ID;
                    //        preVal.STEP_ID = valObj.STEP_ID;
                    //        preVal.NEXT_ID = 0;
                    //        preVal.WFID = valObj.WFID;
                    //        preVal.PROCID = valObj.PROCID;
                    //        if (!BLLTable<WF_STEPATH_TPL>.Exists(preVal))
                    //        {
                    //            preVal.CONDITION = "";
                    //            preVal.FORMULAR = "";
                    //            BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(preVal);
                    //        }

                    //        WF_STEP_TPL condUp = new WF_STEP_TPL();
                    //        condUp.WFID = wfid;
                    //        condUp.PROCID = procid;
                    //        condUp.STEP_ID = lstPath[i].STEP_ID;
                    //        WF_STEP_TPL upVal = new WF_STEP_TPL();
                    //        upVal.NEXT_IDS = valObj.STEP_ID.ToString();
                    //        BLLTable<WF_STEP_TPL>.Factory(conn).Update(upVal, condUp);

                    //    }
                    //}
                    //else
                    //{
                    //    WF_STEPATH_TPL preVal = new WF_STEPATH_TPL();
                    //    preVal.PREV_ID = 0;
                    //    preVal.STEP_ID = valObj.STEP_ID;
                    //    preVal.NEXT_ID = 0;
                    //    preVal.WFID = valObj.WFID;
                    //    preVal.PROCID = valObj.PROCID;
                    //    if (!BLLTable<WF_STEPATH_TPL>.Exists(preVal))
                    //    {
                    //        preVal.CONDITION = "";
                    //        preVal.FORMULAR = "";
                    //        BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(preVal);
                    //    }
                    //}
                    #endregion
                }
            }
            if (count > 0)
            {
                if (Request["tree"] != null)
                {
                    string gotoUrl = "../../../ok.aspx";
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append("0").Append("',no:").Append(valObj.SORT_NUM).Append(",sc:0,name:'");

                    string type = "step";
                    if (valObj.STEP_TYPE.ToString() == WFEnum.StepType.Begin.ToString("d"))
                    {
                        type = "begin";
                    }
                    if (valObj.STEP_TYPE.ToString() == WFEnum.StepType.End.ToString("d"))
                    {
                        type = "end";
                    }
                    if (valObj.STEP_TYPE.ToString() == WFEnum.StepType.Roate.ToString("d"))
                    {
                        type = "roate";
                    }
                    sb.Append(valObj.STEP_NAME).Append("',ntype:'" + type + "'}");

                    if (Request["edit"] == null)
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                }
                else
                {
                    StringBuilder sbData = new StringBuilder();
                    if (ViewState["sbData"] != null)
                    {
                        sbData.Append(ViewState["sbData"].ToString()).Append(",");
                    }
                    sbData.Append("{valObj:''");
                    List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                    for (int i = 0; i < lstCol.Count; i++)
                    {
                        object val = valObj.GetValue(lstCol[i]);
                        if (val != null)
                        {
                            sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                            if (lstCol[i] == WF_STEP_TPL.Attribute.STEP_TYPE)
                            {
                                sbData.Append(",").Append("STEP_TYPE_NAME").Append(":'").Append(FormHelper.GetText(WF_STEP_TPL.Attribute.STEP_TYPE, val)).Append("'");
                                if (val.ToString() == "2")
                                {
                                    sbData.Append(",").Append("HIDE").Append(":'hide'");
                                }
                            }

                        }
                    }
                    sbData.Append("}");

                    Button btn = (Button)sender;
                    if (btn.ID.IndexOf("btnOK") != -1)
                    {
                        if (Request["preUrl"] != null)
                        {
                            Response.Redirect(Request["preUrl"]);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = \"[" + sbData + "]\";}else{window.returnValue = \"[" + sbData + "]\";}window.close();", true);
                        }
                    }
                    else
                    {
                        litWarn.Text = litWarn.Text == "" ? "添加节点成功！" : litWarn.Text += "成功！";
                        ViewState["sbData"] = sbData.ToString();
                        txtSTEP_ID.Value = "";
                        txtSHOW_CONDITION.Value = "";
                        txtSHOW_FORMULA.Value = "";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
}

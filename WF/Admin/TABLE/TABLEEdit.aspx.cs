using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
using AgileFrame.Core;
public partial class TF_TABLEEdit2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_TABLE valObj = new TF_TABLE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    int pid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["TB_ID"]))
        {
            keyid = Request["TB_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (Request["tree"] != null && Request["edit"] != null)
        {
            keyid = Request["id"];
        }
        if (!string.IsNullOrEmpty(Request["mx"]))
        {
            pid = int.Parse(Request["id"]);
        }
        if (!IsPostBack)
        {
            txtTB_NAME_PRE.Value = "WFTB_";
            txtTB_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TABLE.Attribute.TB_TYPE));
            if (txtTB_TYPE.Items.Count > 1)
            {
                txtTB_TYPE.SelectedIndex = 1;
            }
            this.txtTB_ID.Disabled = true;
            this.txtTB_ID.Attributes["class"] = "dis";
            try
            {
                if (pid > 0)
                {
                    TF_TABLE pObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, pid);
                    if (pObj.TB_NAME.LastIndexOf('_') != -1)
                    {
                        string[] arr = pObj.TB_NAME.Split('_');
                        txtTB_NAME_PRE.Value = arr[0] + "_";
                        txtTB_NAME.Value = pObj.TB_NAME.Substring(txtTB_NAME_PRE.Value.Length) + "_MX";

                        litTB_NAME_PRE.Text = txtTB_NAME_PRE.Value;
                    }
                    else
                    {
                        txtTB_NAME.Value = pObj.TB_NAME + "_MX";
                        txtTB_NAME_PRE.Value = "";
                        litTB_NAME_PRE.Text = "";
                    }
                }
                ViewState["OLDNAME"] = "";
                if (keyid != "")
                {
                    valObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, keyid);
                    if (valObj == null) return;
                    txtTB_ID.Value = Convert.ToString(valObj.TB_ID);//Convert.ToInt32                

                    if (valObj.TB_NAME.LastIndexOf('_') != -1)
                    {
                        string[] arr = valObj.TB_NAME.Split('_');
                        txtTB_NAME_PRE.Value = arr[0] + "_";
                        txtTB_NAME.Value = valObj.TB_NAME.Substring(txtTB_NAME_PRE.Value.Length);

                        litTB_NAME_PRE.Text = txtTB_NAME_PRE.Value;
                    }
                    else
                    {
                        txtTB_NAME.Value = valObj.TB_NAME;
                        txtTB_NAME_PRE.Value = "";
                        litTB_NAME_PRE.Text = "";
                    }
                    ViewState["OLDNAME"] = valObj.TB_NAME;

                    txtCH_NAME.Value = Convert.ToString(valObj.CH_NAME);//Convert.ToString                
                    //txtM_TB_ID.Value = Convert.ToString(valObj.M_TB_ID);//Convert.ToInt32                
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                
                    txtTB_TYPE.Value = valObj.TB_TYPE.ToString();
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString

                    TF_FORM useTB = new TF_FORM();
                    useTB.Where("TB_ID=" + keyid + " or TB_IDS like '%," + keyid + ",%'");
                    if (BLLTable<TF_FORM>.Exists(useTB))
                    {
                        txtTB_NAME.Disabled = true;

                        txtTB_TYPE.Disabled = true;
                    }
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            TF_TABLE valObj = new TF_TABLE();

            if (txtTB_NAME.Value != "")
                valObj.TB_NAME = txtTB_NAME_PRE.Value + txtTB_NAME.Value;

            if (ViewState["OLDNAME"].ToString() != txtTB_NAME.Value)
            {
                if (BLLTable<TF_TABLE>.Exists(valObj))
                {
                    litWarn.Text = "该表已经存在，请重新输入！";
                    return;
                }
            }
            if (txtTB_ID.Value != "")
                valObj.TB_ID = Convert.ToInt32(txtTB_ID.Value);

            if (txtCH_NAME.Value != "")
                valObj.CH_NAME = Convert.ToString(txtCH_NAME.Value);

            //if (txtM_TB_ID.Value != "")
            valObj.M_TB_ID = pid;

            if (txtSORT_NO.Value != "")
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);

            if (txtTB_TYPE.Value != "")
                valObj.TB_TYPE = Convert.ToInt32(txtTB_TYPE.Value);

            if (txtNOTE.Value != "")
                valObj.NOTE = Convert.ToString(txtNOTE.Value);

            if (keyid != "")
            {
                valObj.TB_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_TABLE>.Factory(conn).Update(valObj, TF_TABLE.Attribute.TB_ID);
                if (count > 0)
                {
                    AgileFrame.Common.TF_TABLEHelper.Factory(conn).EditTable(ViewState["OLDNAME"].ToString(), valObj, ref errMsg);
                }
            }
            else
            {
                valObj.CREATED = AgileFrame.Common.TF_TABLEHelper.Factory(conn).AddTableWithDefaultCols(valObj,"","", ref errMsg);

                count = BLLTable<TF_TABLE>.Factory(conn).Insert(valObj, TF_TABLE.Attribute.TB_ID);
                keyid = valObj.TB_ID.ToString();
            }
            if (count > 0)
            {
                if (Request["tree"] != null)
                {
                    string gotoUrl = "../../../ok.aspx";
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append("0").Append("',no:").Append(valObj.SORT_NO).Append(",sc:1,name:'");
                    if (valObj.M_TB_ID > 0)
                    {
                        sb.Append(valObj.CH_NAME).Append("',ntype:'table-mx'}");
                    }
                    else
                    {
                        sb.Append(valObj.CH_NAME).Append("',ntype:'table'}");
                    }
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
                    StringBuilder sbData = new StringBuilder("({valObj:''");
                    List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                    for (int i = 0; i < lstCol.Count; i++)
                    {
                        object val = valObj.GetValue(lstCol[i]);
                        if (val != null)
                        {
                            sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                        }
                    }
                    sbData.Append("})");

                    Button btn = (Button)sender;
                    if (btn.ID.IndexOf("btnOK") != -1)
                    {
                        if (ViewState["hadSave"] == null)
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                        }
                    }
                    else
                    {
                        txtTB_NAME.Value = "";
                        txtCH_NAME.Value = "";
                        txtNOTE.Value = "";
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

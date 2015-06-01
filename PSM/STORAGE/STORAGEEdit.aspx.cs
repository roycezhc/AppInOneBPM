using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.PSM;

public partial class IM_STORAGEEdit : AgileFrame.AppInOne.Common.BasePage
{
    IM_STORAGE valObj = new IM_STORAGE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected string pid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["PID"]))
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {

            txtSTATE.Items.AddRange(FormHelper.GetListItem(IM_STORAGE.Attribute.USE_FLAG));

            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<IM_STORAGE>.Factory(conn).GetRowData(IM_STORAGE.Attribute.STOR_ID, keyid);
                    if (valObj == null) return;


                    txtSTOR_ID.Value = Convert.ToString(valObj.STOR_ID);//Convert.ToDecimal                

                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString                

                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                

                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString                

                    wucSelORG1.ORG_ID = Convert.ToString(valObj.ORG_ID);//Convert.ToString                
                    wucSelORG1.Enabled = false;

                    txtSTATE.Value = Convert.ToString(valObj.USE_FLAG);

                    txtREMARK.Value = Convert.ToString(valObj.REMARK);//Convert.ToString

                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                

                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                

                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString

                }
                else {
                    if (pid != "" && pid != "0")
                    {
                        string org_id = BLLTable<IM_STORAGE>.Factory(conn).GetOneValue(IM_STORAGE.Attribute.STOR_ID, pid, IM_STORAGE.Attribute.ORG_ID);
                        wucSelORG1.ORG_ID = org_id;
                        wucSelORG1.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.ToString();//.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            IM_STORAGE valObj = new IM_STORAGE();


            if (txtSTOR_ID.Value != "")
                valObj.STOR_ID = Convert.ToDecimal(txtSTOR_ID.Value);

            valObj.NAME = Convert.ToString(txtNAME.Value);

            valObj.SNAME = Convert.ToString(txtSNAME.Value);

            valObj.RNAME = Convert.ToString(txtRNAME.Value);

            valObj.ORG_ID = wucSelORG1.ORG_ID;


            valObj.USE_FLAG = txtSTATE.Value;

            valObj.REMARK = Convert.ToString(txtREMARK.Value);

            valObj.EXP1 = Convert.ToString(txtEXP1.Value);

            valObj.EXP2 = Convert.ToString(txtEXP2.Value);

            valObj.EXP3 = Convert.ToString(txtEXP3.Value);

            if (keyid != "")
            {
                valObj.STOR_ID = Convert.ToInt32(keyid);
                count = STORAGHelper.EditSTORAGE(valObj);// BLLTable<IM_STORAGE>.Factory(conn).Update(valObj, IM_STORAGE.Attribute.STOR_ID);
            }
            else
            {
                keyid = STORAGHelper.AddSTORAGE(valObj, pid);// BLLTable<IM_STORAGE>.Factory(conn).Insert(valObj, IM_STORAGE.Attribute.STOR_ID);
                count = keyid == "" ? 0 : 1;

            }
            if (count > 0)
            {
                //StringBuilder sbData = new StringBuilder("({valObj:''");
                //List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                //for (int i = 0; i < lstCol.Count; i++)
                //{
                //    object val = valObj.GetValue(lstCol[i]);
                //    if (val != null)
                //    {
                //        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                //    }
                //}
                //sbData.Append("})");
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                Button btn = (Button)sender;

                string re = "re";
                if (pid != "")
                {
                    re = "STORAGEManage.aspx?PID=" + pid;
                }

                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + re + "';}else{window.returnValue = '" + re + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + re + "';}else{window.returnValue = '" + re + "';}window.close();", true);
                    }
                }
                else
                {
                    txtNAME.Value = "";
                    txtSNAME.Value = "";
                    txtRNAME.Value = "";
                    txtREMARK.Value = "";
                    txtSTOR_ID.Value = "";
                    txtSTATE.Value = "";
                    ViewState["hadSave"] = 1;
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

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
using AgileFrame.AppInOne.HR;
public partial class HR_ORGEdit : AgileFrame.AppInOne.Common.BasePage
{
    HR_ORG valObj =new HR_ORG();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected string pid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["ORG_ID"]))
        {
            keyid = Request["ORG_ID"];
        }
        if (!string.IsNullOrEmpty(Request["PID"]))
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_ORG>.Factory(conn).GetRowData(HR_ORG.Attribute.ORG_ID, keyid);
                    if (valObj == null) return;

                    txtSortNum.Value = valObj.SORT_NO.ToString();
                    txtORG_ID.Value = Convert.ToString(valObj.ORG_ID);//Convert.ToString                

                    txtORG_NAME.Value = Convert.ToString(valObj.ORG_NAME);//Convert.ToString                

                    wucSelORG1.ORG_ID = Convert.ToString(valObj.P_ORG_ID);//Convert.ToString
                    wucSelORG1.Enabled = false;
                    //wucSelORG1.ORG_NAME = BLLTable<HR_ORG>.Factory(conn).GetOneValue(HR_ORG.Attribute.ORG_ID, valObj.P_ORG_ID, HR_ORG.Attribute.ORG_NAME);

                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                

                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString                

                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                

                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                

                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString

                    wucSelORG1.Enabled = false;
                }
                else {
                    if (pid != "" && pid != "0")
                    {
                        wucSelORG1.ORG_ID = pid ;//Convert.ToString
                        wucSelORG1.Enabled = false;
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
            HR_ORG valObj = new HR_ORG();
            //if(txtORG_ID.Value !="" )
           
            if(txtORG_NAME.Value !="" )
                valObj.ORG_NAME = Convert.ToString(txtORG_NAME.Value);

            valObj.P_ORG_ID = wucSelORG1.ORG_ID;
            valObj.SORT_NO = Convert.ToInt32(txtSortNum.Value);

            if (txtSNAME.Value != "")
                valObj.SNAME = Convert.ToString(txtSNAME.Value);


            if (txtRNAME.Value != "")
                valObj.RNAME = Convert.ToString(txtRNAME.Value);

            if (txtEXP1.Value != "")
                valObj.EXP1 = Convert.ToString(txtEXP1.Value);


            if (txtEXP2.Value != "")
                valObj.EXP2 = Convert.ToString(txtEXP2.Value);


            if (txtEXP3.Value != "")
                valObj.EXP3 = Convert.ToString(txtEXP3.Value);

            if (keyid != "")
            {
                valObj.ORG_ID =keyid;
                count = ORGHelper.EditORG(valObj);// BLLTable<HR_ORG>.Factory(conn).Update(valObj, HR_ORG.Attribute.ORG_ID);
            }
            else
            {
                //count = BLLTable<HR_ORG>.Factory(conn).Insert(valObj);
                keyid = ORGHelper.AddORG(valObj, valObj.P_ORG_ID);// valObj.ORG_ID.ToString();
                count = keyid != "" ? 1 : 0;
            }
            if (count > 0)
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
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

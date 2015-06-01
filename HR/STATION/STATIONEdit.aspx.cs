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
using AgileFrame.AppInOne.Common;
public partial class HR_STATIONEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    HR_STATION valObj =new HR_STATION();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected string org = "0";
    protected string dept = "0";
    protected string pid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "¸ÚÎ»ÐÅÏ¢±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["STATION_ID"]))
        {
            keyid = Request["STATION_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["ORG_ID"]))
        {
            org = Request["ORG_ID"];
        }
        if (!string.IsNullOrEmpty(Request["DEPT_ID"]))
        {
            dept = Request["DEPT_ID"];
            //Response.Write(BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, dept).ORG_ID);
        }
        if (!string.IsNullOrEmpty(Request["P_ID"]))
        {
            pid = Request["P_ID"];
        }
        if (!IsPostBack)
        {

            txtTYPE_NAME.Items.AddRange(FormHelper.GetListItem(HR_STATION_TYPE.Attribute.TYPE_ID, HR_STATION_TYPE.Attribute.TYPE_ID, HR_STATION_TYPE.Attribute.TYPE_NAME));
            txtLEVEL_NAME.Items.AddRange(FormHelper.GetListItem(HR_STATION_LEVEL.Attribute.LEVEL_ID,HR_STATION_LEVEL.Attribute.LEVEL_ID,HR_STATION_LEVEL.Attribute.LEVEL_NAME));

            this.txtSTATION_ID.Disabled = true;
            this.txtSTATION_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<HR_STATION>.Factory(conn).GetRowData(HR_STATION.Attribute.STATION_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtSTATION_ID.Value = Convert.ToString(valObj.STATION_ID);//Convert.ToDecimal                
                    
                    txtSTATION_NAME.Value = Convert.ToString(valObj.STATION_NAME);//Convert.ToString                
                    
                    //txtPID.Value = Convert.ToString(valObj.PID);//Convert.ToDecimal                
                    
                    //txtPATH.Value = Convert.ToString(valObj.PATH);//Convert.ToString                
                    
                    //txtSUB_NUM.Value = Convert.ToString(valObj.SUB_NUM);//Convert.ToDecimal                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToDecimal      

                    txtMBR_NUM.Value = Convert.ToString(valObj.MBR_NUM);

                    txtLEVEL_NAME.Value = Convert.ToString(valObj.LEVEL_ID);

                    txtTYPE_NAME.Value = Convert.ToString(valObj.TYPE_ID);
                    
                    //txtORG_ID.Value = Convert.ToString(valObj.ORG_ID);//Convert.ToString                
                    
                    //txtDEPT_ID.Value = Convert.ToString(valObj.DEPT_ID);//Convert.ToString
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
            HR_STATION valObj = new HR_STATION();
            
            
            if(txtSTATION_ID.Value !="" )
                valObj.STATION_ID = Convert.ToDecimal(txtSTATION_ID.Value);
            
            
            if(txtSTATION_NAME.Value !="" )
                valObj.STATION_NAME = Convert.ToString(txtSTATION_NAME.Value);

            if (txtMBR_NUM.Value != "")
                valObj.MBR_NUM = Convert.ToInt32(txtMBR_NUM.Value);

            if (txtLEVEL_NAME.Value != "")
                valObj.LEVEL_ID = Convert.ToDecimal(txtLEVEL_NAME.Value);

            if (txtTYPE_NAME.Value != "")
                valObj.TYPE_ID = Convert.ToDecimal(txtTYPE_NAME.Value);
            
            //if(txtPID.Value !="" )
            //    valObj.PID = Convert.ToDecimal(txtPID.Value);
            
            
            //if(txtPATH.Value !="" )
            //    valObj.PATH = Convert.ToString(txtPATH.Value);
            
            
            //if(txtSUB_NUM.Value !="" )
            //    valObj.SUB_NUM = Convert.ToDecimal(txtSUB_NUM.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToDecimal(txtSORT_NO.Value);
            
            
            //if(txtORG_ID.Value !="" )
            //    valObj.ORG_ID = Convert.ToString(txtORG_ID.Value);
            
            
            //if(txtDEPT_ID.Value !="" )
            //    valObj.DEPT_ID = Convert.ToString(txtDEPT_ID.Value);

            if (keyid != "")
            {
                valObj.STATION_ID = Convert.ToInt32(keyid);
                count = BLLTable<HR_STATION>.Factory(conn).Update(valObj, HR_STATION.Attribute.STATION_ID);
            }
            else
            {
                valObj.ORG_ID = org;
                valObj.DEPT_ID = dept;
                if (org == "0" && dept != "") {
                    valObj.ORG_ID = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, dept).ORG_ID;
                }
                valObj.SUB_NUM = 0;
                valObj.PID = decimal.Parse(pid);

                valObj.PATH = "0";
               
                count = BLLTable<HR_STATION>.Factory(conn).Insert(valObj, HR_STATION.Attribute.STATION_ID);
                keyid = valObj.STATION_ID.ToString();

            }
            if (count > 0)
            {
                string path = "0,"+keyid;
                if (valObj.PID > 0)
                {
                    HR_STATION pObj = BLLTable<HR_STATION>.Factory(conn).GetRowData(HR_STATION.Attribute.STATION_ID, valObj.PID);
                    path = pObj.PATH + "," + keyid;

                    HR_STATION pCond = new HR_STATION();
                    pCond.STATION_ID = valObj.PID;
                    BLLTable<HR_STATION>.UpdateAuto(pCond, HR_STATION.Attribute.SUB_NUM, 1);
                }
                
                BLLTable<HR_STATION>.Factory(conn).Update(HR_STATION.Attribute.STATION_ID, keyid, HR_STATION.Attribute.PATH, path);


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
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtSTATION_ID.Value ="";
                    
                    
                    txtSTATION_NAME.Value ="";

                    txtSORT_NO.Value ="";

                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

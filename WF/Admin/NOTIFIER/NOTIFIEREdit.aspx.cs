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
using AgileFrame.AppInOne.WF;
public partial class WF_NOTIFIER_TPLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_NOTIFIER_TPL valObj =new WF_NOTIFIER_TPL();
    int count = 0;
    string keyid = "";
    protected string title = "";
    int stepid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["NOTIFIER_ID"]))
        {
            keyid = Request["NOTIFIER_ID"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["STEP_ID"]))
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        else {
            Response.Write("非法连接！");
            Response.End();
        }

        if (!IsPostBack)
        {
                                                                                                   
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_NOTIFIER_TPL.Attribute.STATUS));

            Sys_User_Level condl = new Sys_User_Level();
            condl._CompanyId = Convert.ToInt32(userBase.OrgID);
            SelLevel.Items.AddRange(FormHelper.GetListItem(Sys_User_Level.Attribute.LEVEL_NUMBER, Sys_User_Level.Attribute.LEVEL_NUMBER, Sys_User_Level.Attribute.LEVEL_NAME, null, condl));

            SelLeaderLevel.Items.AddRange(FormHelper.GetListItem(Sys_User_Level.Attribute.LEVEL_NUMBER, Sys_User_Level.Attribute.LEVEL_NUMBER, Sys_User_Level.Attribute.LEVEL_NAME, null, condl));
            //txtNOTIFIER_TYPE.Items.AddRange(FormHelper.GetListItem(WF_NOTIFIER_TPL.Attribute.NOTIFIER_TYPE));
            if (txtSTATUS.Items.Count > 1)
            {
                txtSTATUS.SelectedIndex = 1;
            }
            //if (txtNOTIFIER_TYPE.Items.Count > 1)
            //{
            //    txtNOTIFIER_TYPE.SelectedIndex = 1;
            //}
            //while (txtNOTIFIER_TYPE.Items.Count > 4)
            //{
            //    txtNOTIFIER_TYPE.Items.RemoveAt(txtNOTIFIER_TYPE.Items.Count - 1);
            //}

            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).GetRowData(WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID, keyid);
                    if(valObj==null) return ;

                    if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelStaff.ToString("d"))
                    {
                        wucSelStaff1.Staff_NAME = valObj.STAFF_NAME;
                        wucSelStaff1.Staff_ID = decimal.Parse(valObj.STAFF_ID);
                    }
                    else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelDept.ToString("d"))
                    {
                        wucSelDept1.DEPT_NAME = valObj.STAFF_NAME;
                        wucSelDept1.DEPT_ID = valObj.STAFF_ID.ToString();
                       
                    }
                    else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelHRole.ToString("d"))
                    {
                        wucSelStation1.STATION_NAME = valObj.STAFF_NAME;
                        wucSelStation1.STATION_ID = valObj.STAFF_ID.ToString();

                    }
                    else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelLevel.ToString("d"))
                    {
                        SelLevel.Value = valObj.STAFF_ID.ToString();
                    }
                    else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelLeaderLevel.ToString("d"))
                    {
                        SelLeaderLevel.Value = valObj.STAFF_ID.ToString();
                    }
                    //txtNOTIFIER_ID.Value = Convert.ToString(valObj.NOTIFIER_ID);//Convert.ToInt32                
                    
                    //txtPROCID.Value = Convert.ToString(valObj.PROCID);//Convert.ToInt32                
                    
                    //txtSTEP_ID.Value = Convert.ToString(valObj.STEP_ID);//Convert.ToInt32                
                    
                    //txtSTAFF_ID.Value = Convert.ToString(valObj.STAFF_ID);//Convert.ToDecimal                
                    
                    //t//xtSTAFF_NAME.Value = Convert.ToString(valObj.STAFF_NAME);//Convert.ToString                
                    
                    txtNOTIFIER_TYPE.Value = Convert.ToString(valObj.NOTIFIER_TYPE);//Convert.ToString                
                    
                    //txtSHOW_CONDITION.Value = Convert.ToString(valObj.CONDITION);//Convert.ToString                
                    
                    //txtSHOW_FORMULA.Value = Convert.ToString(valObj.FORMULAR);//Convert.ToString                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();
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
            WF_NOTIFIER_TPL valObj = new WF_NOTIFIER_TPL();

            //if(txtPROCID.Value !="" )
            //    valObj.PROCID = Convert.ToInt32(txtPROCID.Value);
            
            
            //if(txtSTEP_ID.Value !="" )
            //    valObj.STEP_ID = Convert.ToInt32(txtSTEP_ID.Value);

            if (txtNOTIFIER_TYPE.Value != "")
                valObj.NOTIFIER_TYPE = Convert.ToString(txtNOTIFIER_TYPE.Value);
            
            //if(txtSTAFF_ID.Value !="" )
            //    valObj.STAFF_ID = Convert.ToDecimal(txtSTAFF_ID.Value);
            
            
            //if(txtSTAFF_NAME.Value !="" )
            //    valObj.STAFF_NAME = Convert.ToString(txtSTAFF_NAME.Value);
            if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelStaff.ToString("d"))
            {
                valObj.STAFF_ID = wucSelStaff1.Staff_ID.ToString();
                valObj.STAFF_NAME = wucSelStaff1.Staff_NAME;
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelDept.ToString("d"))
            {
                valObj.STAFF_ID = wucSelDept1.DEPT_ID;
                valObj.STAFF_NAME = wucSelDept1.DEPT_NAME+"[领导]";
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.LeaderDirect.ToString("d"))
            {
                valObj.STAFF_NAME = "直接领导";
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.LeaderInDirect.ToString("d"))
            {
                valObj.STAFF_NAME = "间接领导";
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelHRole.ToString("d"))
            {
                valObj.STAFF_ID = wucSelStation1.STATION_ID;
                valObj.STAFF_NAME = wucSelStation1.STATION_NAME;
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelLevel.ToString("d"))
            {
                valObj.STAFF_ID = SelLevel.Value;
                valObj.STAFF_NAME = SelLevel.Items[SelLevel.SelectedIndex].ToString();
            }
            else if (valObj.NOTIFIER_TYPE == WFEnum.CheckerType.SelLeaderLevel.ToString("d"))
            {
                valObj.STAFF_ID = SelLeaderLevel.Value;
                valObj.STAFF_NAME = SelLeaderLevel.Items[SelLeaderLevel.SelectedIndex].ToString();
            }
            
            //if(txtSHOW_CONDITION.Value !="" )
            //    valObj.CONDITION = Convert.ToString(txtSHOW_CONDITION.Value);
            
            
            //if(txtSHOW_FORMULA.Value !="" )
            //    valObj.FORMULAR = Convert.ToString(txtSHOW_FORMULA.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToString(txtSTATUS.Value);

            if (keyid != "")
            {
                valObj.NOTIFIER_ID = Convert.ToInt32(keyid);
                count = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Update(valObj, WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID);
            }
            else
            {
                valObj.CONDITION = "";
                valObj.FORMULAR = "";
                valObj.STEP_ID = stepid;
                WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID,stepid);
                valObj.PROCID = stepObj.PROCID;
                valObj.WFID = stepObj.WFID;
                count = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Insert(valObj, WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID);
                keyid = valObj.NOTIFIER_ID.ToString();

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

                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    if (ViewState["hadSave"] == null)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = \"postback\";}else{window.returnValue = \"postback\";}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
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

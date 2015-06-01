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

public partial class KM_PART_STRUEdit : AgileFrame.AppInOne.Common.BasePage
{
    KM_PART_STRU valObj =new KM_PART_STRU();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["PART_ID"]))
        {
            keyid = Request["PART_ID"];
        }
        if (!IsPostBack)
        {
            
            

            this.txtPART_ID.Attributes["readonly"] = "readonly";
            this.txtPART_ID.Attributes["disabled"] = "disabled";
            this.txtPART_ID.Style["background-color"] = "Silver";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<KM_PART_STRU>.Factory(conn).GetRowData(KM_PART_STRU.Attribute.PART_ID, Request["PART_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtPART_ID.Value = Convert.ToString(valObj.PART_ID);//Convert.ToString                
                    
                    txtPART_NAME.Value = Convert.ToString(valObj.PART_NAME);//Convert.ToString                
                    
                    txtK_PART_ID.Value = Convert.ToString(valObj.K_PART_ID);//Convert.ToString                
                    
                    txtPART_CONTENT.Value = Convert.ToString(valObj.PART_CONTENT);//Convert.ToString                
                    
                    txtPART_CLASS_ID.Value = Convert.ToString(valObj.PART_CLASS_ID);//Convert.ToString                
                    
                    txtPART_EA_SIGN.Value = Convert.ToString(valObj.PART_EA_SIGN);//Convert.ToString                
                    
                    txtPART_AUTHOR.Value = Convert.ToString(valObj.PART_AUTHOR);//Convert.ToString                
                    
                    txtPART_IS_READ.Value = Convert.ToString(valObj.PART_IS_READ);//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToDecimal                
                    
                    txtIDPATH.Value = Convert.ToString(valObj.IDPATH);//Convert.ToString                
                    
                    txtKNAME.Value = Convert.ToString(valObj.KNAME);//Convert.ToString                
                    
                    txtSNAME.Value = Convert.ToString(valObj.SNAME);//Convert.ToString                
                    
                    txtRNAME.Value = Convert.ToString(valObj.RNAME);//Convert.ToString                
                    
                    txtSUB_NUM.Value = Convert.ToString(valObj.SUB_NUM);//Convert.ToDecimal                
                    
                    txtSUBOBJECT_NUM.Value = Convert.ToString(valObj.SUBOBJECT_NUM);//Convert.ToDecimal                
                    
                    txtUSE_FLAG.Value = Convert.ToString(valObj.USE_FLAG);//Convert.ToString                
                    
                    txtEXP1.Value = Convert.ToString(valObj.EXP1);//Convert.ToString                
                    
                    txtEXP2.Value = Convert.ToString(valObj.EXP2);//Convert.ToString                
                    
                    txtEXP3.Value = Convert.ToString(valObj.EXP3);//Convert.ToString                
                    
                    txtEXP4.Value = Convert.ToString(valObj.EXP4);//Convert.ToString
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
            KM_PART_STRU valObj = new KM_PART_STRU();
            
            
            if(txtPART_ID.Value !="" )
                valObj.PART_ID = Convert.ToString(txtPART_ID.Value);
            
            
            if(txtPART_NAME.Value !="" )
                valObj.PART_NAME = Convert.ToString(txtPART_NAME.Value);
            
            
            if(txtK_PART_ID.Value !="" )
                valObj.K_PART_ID = Convert.ToString(txtK_PART_ID.Value);
            
            
            if(txtPART_CONTENT.Value !="" )
                valObj.PART_CONTENT = Convert.ToString(txtPART_CONTENT.Value);
            
            
            if(txtPART_CLASS_ID.Value !="" )
                valObj.PART_CLASS_ID = Convert.ToString(txtPART_CLASS_ID.Value);
            
            
            if(txtPART_EA_SIGN.Value !="" )
                valObj.PART_EA_SIGN = Convert.ToString(txtPART_EA_SIGN.Value);
            
            
            if(txtPART_AUTHOR.Value !="" )
                valObj.PART_AUTHOR = Convert.ToString(txtPART_AUTHOR.Value);
            
            
            if(txtPART_IS_READ.Value !="" )
                valObj.PART_IS_READ = Convert.ToString(txtPART_IS_READ.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToDecimal(txtSORT_NO.Value);
            
            
            if(txtIDPATH.Value !="" )
                valObj.IDPATH = Convert.ToString(txtIDPATH.Value);
            
            
            if(txtKNAME.Value !="" )
                valObj.KNAME = Convert.ToString(txtKNAME.Value);
            
            
            if(txtSNAME.Value !="" )
                valObj.SNAME = Convert.ToString(txtSNAME.Value);
            
            
            if(txtRNAME.Value !="" )
                valObj.RNAME = Convert.ToString(txtRNAME.Value);
            
            
            if(txtSUB_NUM.Value !="" )
                valObj.SUB_NUM = Convert.ToDecimal(txtSUB_NUM.Value);
            
            
            if(txtSUBOBJECT_NUM.Value !="" )
                valObj.SUBOBJECT_NUM = Convert.ToDecimal(txtSUBOBJECT_NUM.Value);
            
            
            if(txtUSE_FLAG.Value !="" )
                valObj.USE_FLAG = Convert.ToString(txtUSE_FLAG.Value);
            
            
            if(txtEXP1.Value !="" )
                valObj.EXP1 = Convert.ToString(txtEXP1.Value);
            
            
            if(txtEXP2.Value !="" )
                valObj.EXP2 = Convert.ToString(txtEXP2.Value);
            
            
            if(txtEXP3.Value !="" )
                valObj.EXP3 = Convert.ToString(txtEXP3.Value);
            
            
            if(txtEXP4.Value !="" )
                valObj.EXP4 = Convert.ToString(txtEXP4.Value);

            if (keyid != "")
            {
                valObj.PART_ID = keyid;
                count = BLLTable<KM_PART_STRU>.Factory(conn).Update(valObj, KM_PART_STRU.Attribute.PART_ID);
            }
            else
            {
                count = BLLTable<KM_PART_STRU>.Factory(conn).Insert(valObj, KM_PART_STRU.Attribute.PART_ID);
                keyid = valObj.PART_ID.ToString();

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
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

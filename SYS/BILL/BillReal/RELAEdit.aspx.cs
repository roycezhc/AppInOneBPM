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
public partial class SYS_BILL_RELAEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_RELA valObj =new SYS_BILL_RELA();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        txtBILL_ID.Value = "3";
        if (!string.IsNullOrEmpty(Request["BillID"]))
        {
            txtBILL_ID.Value = Request["BillID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            List<SYS_BILL_COL_SYN> listSYNCol = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).Select(SYS_BILL_COL_SYN.Attribute.BILL_ID, txtBILL_ID.Value);
            Dictionary<string, List<SYS_BILL_COL_SYN>> dic = new Dictionary<string, List<SYS_BILL_COL_SYN>>();
            for (int i = 0; i < listSYNCol.Count; i++)
            {
                if (dic.ContainsKey(listSYNCol[i].TABLE_NAME))
                {
                    dic[listSYNCol[i].TABLE_NAME].Add(listSYNCol[i]);
                }
                else
                {
                    List<SYS_BILL_COL_SYN> ll = new List<SYS_BILL_COL_SYN>();
                    ll.Add(listSYNCol[i]);
                    dic.Add(listSYNCol[i].TABLE_NAME, ll);
                }
            }

            foreach(KeyValuePair<string,List<SYS_BILL_COL_SYN>> v in dic) {
                litSynCols.Text += "<select onchange='setCol(this);'>";

                List<SYS_BILL_COL_SYN> lll = v.Value;
                for (int a = 0; a < lll.Count; a++) {
                    litSynCols.Text += "<option value='" + lll[a].TABLE_NAME + "." + lll[a].COL_NAME + "'>" + lll[a].COL_NAME + "</option>";
                }

                litSynCols.Text += "</select>";
            }

            txtRELATION_TYPE.Items.AddRange(FormHelper.GetListItem(SYS_BILL_RELA.Attribute.RELATION_TYPE));

            this.txtBILL_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<SYS_BILL_RELA>.Factory(conn).GetRowData(SYS_BILL_RELA.Attribute.BILL_ID, keyid);
                    if(valObj==null) return ;
                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                
                    
                    txtTABLE_COL_PK.Value = Convert.ToString(valObj.TABLE_COL_PK);//Convert.ToInt32                
                    
                    txtTABLE_COL_FK.Value = Convert.ToString(valObj.TABLE_COL_FK);//Convert.ToInt32                
                    
                    txtRELATION_TYPE.Value=valObj.RELATION_TYPE.ToString();                
                    
                    txtRELATION_TABLE.Value = Convert.ToString(valObj.RELATION_TABLE);//Convert.ToString                
                    
                    txtRELATION_NAME.Value = Convert.ToString(valObj.RELATION_NAME);//Convert.ToString
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
            SYS_BILL_RELA valObj = new SYS_BILL_RELA();
            
            
            if(txtBILL_ID.Value !="" )
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);
            
            
            if(txtTABLE_COL_PK.Value !="" )
                valObj.TABLE_COL_PK = Convert.ToInt32(txtTABLE_COL_PK.Value);
            
            
            if(txtTABLE_COL_FK.Value !="" )
                valObj.TABLE_COL_FK = Convert.ToInt32(txtTABLE_COL_FK.Value);
            
            
            if(txtRELATION_TYPE.Value !="" )
                valObj.RELATION_TYPE = Convert.ToInt32(txtRELATION_TYPE.Value);
            
            
            if(txtRELATION_TABLE.Value !="" )
                valObj.RELATION_TABLE = Convert.ToString(txtRELATION_TABLE.Value);
            
            
            if(txtRELATION_NAME.Value !="" )
                valObj.RELATION_NAME = Convert.ToString(txtRELATION_NAME.Value);

            if (keyid != "")
            {
                valObj.REAL_ID = Convert.ToInt32(keyid);
                count = BLLTable<SYS_BILL_RELA>.Factory(conn).Update(valObj, SYS_BILL_RELA.Attribute.REAL_ID);
            }
            else
            {
                count = BLLTable<SYS_BILL_RELA>.Factory(conn).Insert(valObj, SYS_BILL_RELA.Attribute.REAL_ID);
                keyid = valObj.BILL_ID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtTABLE_COL_PK.Value ="";
                    
                    
                    txtTABLE_COL_FK.Value ="";
                    
                    
                    txtRELATION_TYPE.Value ="";
                    
                    
                    txtRELATION_TABLE.Value ="";
                    
                    
                    txtRELATION_NAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

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
public partial class WF_F_COLUMN_ITEMEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_F_COLUMN_ITEM valObj =new TF_F_COLUMN_ITEM();
    int count = 0;
    public string keyid = "",selVal="";
    protected string title = "";
    protected string colid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ColID"] != null)
        {
            colid = Request["ColID"];
        }
        title = valObj._ZhName + "±à¼­";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ITEM_ID"]))
        {
            keyid = Request["ITEM_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            try
            {
                V_TF_F_COLUMN_ITEM objV = new V_TF_F_COLUMN_ITEM();
                objV.Distinct = true;
                objV.COLUMN_ID = 0;
                objV.SHOW_NAME = "";

                List<V_TF_F_COLUMN_ITEM> lst = BLLTable<V_TF_F_COLUMN_ITEM>.Select(objV);
                ListItem liv = new ListItem();
                liv.Value = "-1";
                liv.Text ="Î´Áª¶¯";
                txtDROP_REALF.Items.Add(liv);

                foreach (V_TF_F_COLUMN_ITEM obj in lst)
                {
                    liv = new ListItem();
                    liv.Value = Convert.ToString(obj.COLUMN_ID);
                    liv.Text = obj.SHOW_NAME;
                    txtDROP_REALF.Items.Add(liv);
                }

                // txtDROP_REALF.Items.AddRange(FormHelper.GetListItem(V_TF_F_COLUMN_ITEM.Attribute.COLUMN_ID, V_TF_F_COLUMN_ITEM.Attribute.COLUMN_ID, V_TF_F_COLUMN_ITEM.Attribute.SHOW_NAME, objv));


                if (keyid != "")
                {

                    valObj = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).GetRowData(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, keyid);
                    if (valObj == null) return;


                    txtITEM_ID.Value = Convert.ToString(valObj.ITEM_ID);//Convert.ToInt32       

                    //txtDROP_REAL.Value = Convert.ToString(valObj.DROP_REAL);
                    selVal = Convert.ToString(valObj.DROP_REAL);

                    TF_F_COLUMN_ITEM objsel = new TF_F_COLUMN_ITEM();
                    objsel = BLLTable<TF_F_COLUMN_ITEM>.GetRowData(TF_F_COLUMN_ITEM.Attribute.ITEM_ID, valObj.DROP_REAL);

                    if (objsel != null)
                    {
                        txtDROP_REALF.Value = Convert.ToString(objsel.COLUMN_ID);
                    }

                    //txtFORM_ID.Value = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32                

                    //txtCOLUMN_ID.Value = Convert.ToString(valObj.COLUMN_ID);//Convert.ToInt32                

                    txtVALUE.Value = Convert.ToString(valObj.VALUE);//Convert.ToString                
                    if (txtVALUE.Value != "")
                    {
                        ckSetVal.Checked = true;
                    }
                    txtTEXT.Value = Convert.ToString(valObj.TEXT);//Convert.ToString                

                    txtCOL_HIDE.Value = Convert.ToString(valObj.COL_HIDE);//Convert.ToString
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
            TF_F_COLUMN_ITEM valObj = new TF_F_COLUMN_ITEM();
            if(txtITEM_ID.Value !="" )
                valObj.ITEM_ID = Convert.ToInt32(txtITEM_ID.Value);
            if (txtVALUE.Value != "" && ckSetVal.Checked == true)
            {
                valObj.VALUE = Convert.ToString(txtVALUE.Value);
            }
            else {
                valObj.VALUE = "";
            }
            if(txtTEXT.Value !="" )
                valObj.TEXT = Convert.ToString(txtTEXT.Value);

            valObj.DROP_REAL = Convert.ToString(hidDROP_REAL.Value);

                valObj.COL_HIDE = Convert.ToString(txtCOL_HIDE.Value);
            if (keyid != "")
            {
                valObj.ITEM_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).Update(valObj, TF_F_COLUMN_ITEM.Attribute.ITEM_ID);
            }
            else
            {
                TF_F_COLUMN colObj = BLLTable<TF_F_COLUMN>.Factory(conn).GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, colid);
                valObj.COLUMN_ID = colObj.COLUMN_ID;
                valObj.FORM_ID = colObj.FORM_ID;
                count = BLLTable<TF_F_COLUMN_ITEM>.Factory(conn).Insert(valObj, TF_F_COLUMN_ITEM.Attribute.ITEM_ID);
                keyid = valObj.ITEM_ID.ToString();
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

                if (ViewState["sbData"] != null)
                {
                    ViewState["sbData"] = ViewState["sbData"].ToString() + "," + sbData.ToString();
                }
                else
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                
                Button btn = (Button)sender;
                if (btn.ID == "btnOK")
                {
                    string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = \"" + dataStr + "\";}else{window.returnValue = \"" + dataStr + "\";}window.close();", true);
                }
                else
                {
                   
                    txtITEM_ID.Value = "";
                    txtVALUE.Value = "";
                    txtTEXT.Value = "";
                    txtDROP_REAL.Value = "";
                    txtCOL_HIDE.Value = "";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

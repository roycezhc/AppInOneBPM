using System;
using System.Collections.Generic;
using System.Data;
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
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.PersistenceLayer;
using AgileFrame.Common;
public partial class SYS_BILL_SYNCOLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_COL_SYN valObj =new SYS_BILL_COL_SYN();
    int count = 0;
    protected string keyid = "";
    protected string title = "";
    protected int colid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["SYN_ID"]))
        {
            keyid = Request["SYN_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }

        if (!string.IsNullOrEmpty(Request["edit"]))
        {
            keyid = Request["id"];
            colid = int.Parse(Request["pid"]);
        }
        else {
            colid = int.Parse(Request["id"]);
        }
        if (ViewState["KEYID"] != null)
        {
            keyid = ViewState["KEYID"].ToString();
        }
        if (!IsPostBack)
        {            
            txtDB_SRC.Items.AddRange(FormHelper.GetListItem(SYS_DATASOURCE.Attribute.SourceName));
            txtDATA_TYPE.Items.Clear();
            //FieldDataType fty = new FieldDataType(DataBaseConnectStringHelper.GetDataBaseType(MyConfigurationSettings.GetValue(txtDB_SRC.Value)), DataBaseDataType.varchar, 20, 0, false);
            //foreach (string tp in fty.AllDataType)
            //{
            //    txtDATA_TYPE.Items.Add(new ListItem(tp, tp));
            //}
            //if (colid > 0)
            //{
            //    SYS_BILL_COL_SYN ccc = new SYS_BILL_COL_SYN();
            //    ccc.IS_AUTO = "0";
            //    ccc.ISPK = "0";
            //}
            //try
            //{
                ViewState["FORM_CTRL_ID"] = "0";
                //Response.Write(colid.ToString()); return;
                SYS_BILL_COL billCol = BLLTable<SYS_BILL_COL>.Factory(conn).GetRowData(SYS_BILL_COL.Attribute.COL_ID, colid);
                SYS_BILL billObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, billCol.BILL_ID);
                hidTABLE_NAME.Value = billObj.TABLE_NAME;
                hidConnSrc.Value = billObj._CONN_SOURCE;
                if (keyid != "")
                {
                    valObj = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).GetRowData(SYS_BILL_COL_SYN.Attribute.COL_SYNID, keyid);
                    if (valObj == null) return;

                    txtISPK.Value = valObj.ISPK;
                    txtCOL_ID.Value = Convert.ToString(valObj.COL_ID);//Convert.ToInt32                

                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                

                    txtTABLE_NAME.Value = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString                
                    txtTABLE_NAME1.Value = valObj.TABLE_NAME;
                    txtCOL_NAME.Value = Convert.ToString(valObj.COL_NAME);//Convert.ToString                
                    ViewState["txtCOL_NAME"] = txtCOL_NAME.Value;

                    txtCOL_NOTE.Value = Convert.ToString(valObj.COL_NOTE);//Convert.ToString                

                    if (valObj.DATA_TYPE.IndexOf('(') >= 0)
                        txtDATA_TYPE.Value = valObj.DATA_TYPE.Substring(0, valObj.DATA_TYPE.IndexOf('(')).ToLower();
                    else
                        txtDATA_TYPE.Value = Convert.ToString(valObj.DATA_TYPE).ToLower();//Convert.ToString                

                    txtDATA_LEN.Value = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32                

                    txtDATA_ACC.Value = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32                

                    txtIS_AUTO.Value = Convert.ToString(valObj.IS_AUTO);//Convert.ToString                
                    txtDB_SRC.Value = valObj.DB_SRC;
                    //Response.Write(valObj.IS_AUTO);
                    txtDVAL.Value = Convert.ToString(valObj.DVAL);//Convert.ToString                
                    
                }
                else
                {
                    txtBILL_ID.Value = billCol.BILL_ID.ToString();
                    txtCOL_ID.Value = colid.ToString();
                    //txtTABLE_NAME.Value = billObj.TABLE_NAME;
                }

            //}
            //catch (Exception ex)
            //{
            //    litWarn.Text = ex.Message;
            //}
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //try
        //{
            SYS_BILL_COL_SYN valObj = new SYS_BILL_COL_SYN();
            if (txtBILL_ID.Value != "")
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);

            //if (keyid == "")
            //{
            //    if (BLLTable<SYS_BILL_COL_SYN>.Exists(valObj))
            //    {
            //        litWarn.Text = "已经存在此字段！";
            //        return;
            //    }
            //}

            #region
            if (txtTABLE_NAME.Value != "")
            {
                valObj.TABLE_NAME = Convert.ToString(txtTABLE_NAME.Value);
            }
            else {
                if (txtTABLE_NAME1.Value != "")
                {
                    valObj.TABLE_NAME = Convert.ToString(txtTABLE_NAME1.Value);
                }
            }

            DataBaseField field = null;
            if (txtCOL_NAME.Value != "")
            {
                valObj.COL_NAME = Convert.ToString(txtCOL_NAME.Value);
                try
                {
                    field = DataBase.Factory(MyConfigurationSettings.GetValue(txtDB_SRC.Value)).DataTables[valObj.TABLE_NAME].DataFields[valObj.COL_NAME];
                }
                catch { field = null; }
            }
            if (field == null)
            {
                litWarn.Text = "保存失败！没有找到该字段！";
                return;
            }

            if (txtCOL_ID.Value !="" )
                valObj.COL_ID = Convert.ToInt32(txtCOL_ID.Value);

            valObj.ISPK = field.IsKeyID ? "1" : "0";

            valObj.COL_NOTE = field.Desc.ZhName;

            valObj.DATA_TYPE = field.DataType.TypeNameString;

            valObj.DATA_LEN = field.DataType.DataLen;

            valObj.DATA_ACC = field.DataType.Scale;

            valObj.IS_AUTO = field.IsAutoIncrease ? "1" : "0";

            valObj.DVAL = field.DefaultValue;

            valObj.DB_SRC = txtDB_SRC.Value;

            valObj.PK_VALCODE = txtPK_VALCODE.Value;
            #endregion

            if (keyid != "")
            {
                valObj.COL_SYNID = Convert.ToInt32(keyid);

                count = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).Update(valObj, SYS_BILL_COL_SYN.Attribute.COL_SYNID);
            }
            else
            {
                valObj.SetInitialized(SYS_BILL_COL_SYN.Attribute.COL_SYNID, false);
                count = BLLTable<SYS_BILL_COL_SYN>.InsertReturnID(valObj);
                keyid = count.ToString();
                ViewState["KEYID"] = keyid;
                if (count > 0 && valObj.ISPK == "1")
                {
                    SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj.ToBILL_COL());
                    billExd.Add();
                }
            }
            if (count > 0)
            {
                if (Request["tree"] != null)
                {
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.COL_ID).Append("',no:1,sc:0,name:'");

                    sb.Append(valObj.COL_NAME + "[" + valObj.COL_NOTE + "]").Append("',ntype:'syncol'}");

                    if (Request["edit"] == null)
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");", false);
                       

                    }
                    litWarn.Text = "保存成功";
                }
                else
                {
                    #region
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
                    else
                    {
                        ViewState["sbData"] += "," + sbData.ToString();
                    }
                    Button btn = (Button)sender;
                    if (btn.ID.IndexOf("btnOK") != -1)
                    {
                        if (ViewState["sbData"] == null)
                        {
                            string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "_FormView();if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "_FormView();if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                        }
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "_FormView();", false);
                        txtTABLE_NAME.Value = "";
                        txtCOL_NAME.Value = "";
                        hidTABLE_NAME.Value = "";

                    }
                    #endregion
                   
                }

                
            }
            else {
                litWarn.Text = "修改失败！";
            } 
        //}
        //catch (Exception ex)
        //{
        //    litWarn.Text = ex.Message;
        //}
    }

}

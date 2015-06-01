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
using AgileFrame.Common;
public partial class SYS_BILL_COLEditTBClient : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_COL valObj = new SYS_BILL_COL();
    int count = 0;
    protected string keyid = "";
    protected string tbname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["COL_ID"]))
        {
            keyid = Request["COL_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }

        if (!string.IsNullOrEmpty(Request["edit"]))
        {
            keyid = Request["id"];
            tbname = Request["pid"];
        }
        else
        {
            tbname = Request["id"];
        }
        if (ViewState["KEYID"] != null)
        {
            keyid = ViewState["KEYID"].ToString();
        }
        if (!IsPostBack)
        {
            //try
            //{
            ViewState["FORM_CTRL_ID"] = "0";

            //SYS_BILL billObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, billid);
            hidTABLE_NAME.Value = tbname;
            foreach (string s in Enum.GetNames(typeof(DataBaseDataType))) {
                string nnn = s.Replace("_","");
                txtDATA_TYPE.Items.Add(new ListItem(nnn, nnn));
            }
            if (keyid != "")
            {
                SYS_BILL_COL col = new SYS_BILL_COL();
                col.TABLE_NAME = tbname;
                col.COL_NAME = keyid;
                SYS_BILL_COL_EXD coleee = new SYS_BILL_COL_EXD(col);//获取本地数据库物理表，原先是表单模块
                valObj = coleee.DB_GetColByField(tbname, keyid);
                if (valObj == null) return;
                if (valObj.COL_NAME.IndexOf("U_") != 0 && valObj.COL_NAME.IndexOf("u_") != 0)
                {
                    Response.Write("对不起！您不具备编辑此字段的权限。");
                    Response.End();
                    return;
                }
                txtISPK.Value = valObj.ISPK;
                txtCOL_ID.Value = Convert.ToString(valObj.COL_ID);//Convert.ToInt32                

                txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                

                txtTABLE_NAME.Value = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString                

                txtCOL_NAME.Value = Convert.ToString(valObj.COL_NAME.Remove(0, 2));//Convert.ToString                
                ViewState["txtCOL_NAME"] = "U_" + txtCOL_NAME.Value;
                hidFK_NAME.Value = valObj.FK_NAME;
                txtCOL_NOTE.Value = Convert.ToString(valObj.COL_NOTE);//Convert.ToString                

                txtDATA_TYPE.Value = valObj.DATA_TYPE;// Response.Write(valObj.DATA_TYPE);    

                txtDATA_LEN.Value = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32                

                txtDATA_ACC.Value = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32                

                txtIS_AUTO.Value = Convert.ToString(valObj.IS_AUTO);//Convert.ToString                

                txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                

                txtCOL_SHOW.Value = Convert.ToString(valObj.FK_SHOW);//Convert.ToString                

                //txtDISPLAY_NAME.Value = Convert.ToString(valObj.DISPLAY_NAME);//Convert.ToString                

                txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                

                txtDVAL.Value = Convert.ToString(valObj.DVAL);//Convert.ToString                


                ViewState["FORM_CTRL_ID"] = valObj.FORM_CTRL_ID;


                txtPK_VALCODE.Value = valObj.PK_VALCODE;
                if ("31,32,33".IndexOf(valObj.FORM_CTRL_ID.ToString()) != -1)
                {
                    liSetItems.Visible = true;
                }



                if (valObj.IS_COL_EXISTS == "1")
                {
                    txtCOL_NAME.Disabled = true;
                    txtDATA_TYPE.Disabled = true;
                    txtDATA_LEN.Disabled = true;
                    txtDATA_ACC.Disabled = true;
                    txtTABLE_NAME.Disabled = true;
                    txtIS_AUTO.Disabled = true;
                    txtISPK.Disabled = true;
                    btnSelCol.Visible = false;
                }
            }
            else
            {
                txtBILL_ID.Value = tbname;

                txtTABLE_NAME.Value = tbname;

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
        SYS_BILL_COL valObj = new SYS_BILL_COL();
        if (txtTABLE_NAME.Value != "")
            valObj.TABLE_NAME = Convert.ToString(txtTABLE_NAME.Value);
        if (txtCOL_NAME.Value != "")
            valObj.COL_NAME = Convert.ToString("U_" + txtCOL_NAME.Value);

        if (keyid == "")
        {
            if (BLLTable<SYS_BILL_COL>.Exists(valObj))
            {
                litWarn.Text = "已经存在此字段！";
                return;
            }
        }

        #region
        valObj.ISPK = txtISPK.Value;
        if (txtCOL_NOTE.Value != "")
            valObj.COL_NOTE = Convert.ToString(txtCOL_NOTE.Value);

        if (txtDATA_TYPE.Value != "")
            valObj.DATA_TYPE = Convert.ToString(txtDATA_TYPE.Value);

        if (txtDATA_LEN.Value != "")
            valObj.DATA_LEN = Convert.ToInt32(txtDATA_LEN.Value);

        if (txtDATA_ACC.Value != "")
            valObj.DATA_ACC = Convert.ToInt32(txtDATA_ACC.Value);

        if (txtIS_AUTO.Value != "")
            valObj.IS_AUTO = Convert.ToString(txtIS_AUTO.Value);

        if (txtSORT_NO.Value != "")
            valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);

        if (txtCOL_SHOW.Value != "")
            valObj.FK_SHOW = Convert.ToString(txtCOL_SHOW.Value);

        if (txtTITLE.Value != "")
            valObj.TITLE = Convert.ToString(txtTITLE.Value);

        if (txtDVAL.Value != "")
            valObj.DVAL = Convert.ToString(txtDVAL.Value);

        if (hidTABLE_NAME.Value != txtTABLE_NAME.Value && txtCONN_SOURCE.Value != "AIO" && valObj.ISPK == "1")
        {
            valObj.ISFK = "1";
        }
        else
        {
            valObj.ISFK = "0";
        }
        valObj.FK_NAME = hidFK_NAME.Value;


        valObj.PK_VALCODE = txtPK_VALCODE.Value;

        #endregion
        string msg = "";
        try
        {
            if (ViewState["txtCOL_NAME"] != null)
            {
                if (ViewState["txtCOL_NAME"].ToString().IndexOf("U_") != 0 && ViewState["txtCOL_NAME"].ToString().IndexOf("u_") != 0)
                {
                    Response.Write("对不起！您不具备编辑此字段的权限。");
                    Response.End();
                    return;
                }
                //valObj.COL_ID = Convert.ToInt32(keyid);
                SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj);
                count = billExd.DB_Update(ViewState["txtCOL_NAME"].ToString(), valObj, ref msg);//.Update(ViewState["txtCOL_NAME"].ToString());// BLLTable<SYS_BILL_COL>.Factory(conn).Update(valObj, SYS_BILL_COL.Attribute.COL_ID);
            }
            else
            {
                if (ViewState["txtCOL_NAME"].ToString().IndexOf("U_") != 0 && ViewState["txtCOL_NAME"].ToString().IndexOf("u_") != 0)
                {
                    Response.Write("对不起！您不具备添加此字段的权限。");
                    Response.End();
                    return;
                }
                SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj);
                count = billExd.DB_AddField(ref msg) == true ? 1 : 0;// BLLTable<SYS_BILL_COL>.Factory(conn).Insert(valObj, SYS_BILL_COL.Attribute.COL_ID);
                keyid = count.ToString();
                ViewState["KEYID"] = keyid;
            }
        }
        catch (Exception ee)
        {
            Response.Write("操作失败，请重新选择节点！");
            Response.End();
        }

        if (count > 0)
        {
            if ("31,32,33".IndexOf(valObj.FORM_CTRL_ID.ToString()) != -1)
            {
                liSetItems.Visible = true;
            }
            else
            {
                liSetItems.Visible = false;
            }
            ViewState["txtCOL_NAME"] = valObj.COL_NAME;
            if (Request["tree"] != null)
            {
                StringBuilder sb = new StringBuilder("{");
                sb.Append("id:'").Append(valObj.COL_NAME.ToString());
                sb.Append("',pid:'").Append(valObj.TABLE_NAME).Append("',no:").Append("1");
                sb.Append(",sc:").Append("0,dev:'" + Request["dev"] + "',tb:'" + Request["tb"] + "'");
                sb.Append(",name:'").Append(valObj.COL_NAME).Append("',note:'[" + valObj.COL_NOTE + "]'").Append(",ntype:'col'}");

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
        else
        {
            litWarn.Text = "修改失败！";
        }
        //}
        //catch (Exception ex)
        //{
        //    litWarn.Text = ex.Message;
        //}
    }

}

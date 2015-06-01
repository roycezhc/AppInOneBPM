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
public partial class SYS_BILL_COLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_COL valObj =new SYS_BILL_COL();
    int count = 0;
    protected string keyid = "";
    protected string title = "";
    protected int billid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
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
            billid = int.Parse(Request["pid"]);
        }
        else
        {
            if (!string.IsNullOrEmpty(Request["id"]))
            {
                billid = int.Parse(Request["id"]);
            }
        }
        if (!string.IsNullOrEmpty(Request["billid"]))
        {
            billid = int.Parse(Request["billid"]);
        }
        if (ViewState["KEYID"] != null)
        {
            keyid = ViewState["KEYID"].ToString();
        }
        if (!IsPostBack)
        {
            foreach (string s in Enum.GetNames(typeof(DataBaseDataType)))
            {
                string nnn = s.Replace("_", "");
                txtDATA_TYPE.Items.Add(new ListItem(nnn, nnn));
            }
            if (billid > 0)
            {
                //txtSEL_KEY.Items.Add(new ListItem("默认主键ID", "BILL_ID"));
                SYS_BILL_BLL bllexd = new SYS_BILL_BLL(billid);
                if (bllexd.PKeyColSyn != null)
                {
                    string name = bllexd.PKeyColSyn.Base._COL_NOTE;
                    if (name == "")
                    {
                        name = bllexd.PKeyColSyn.COL_NAME;
                    }
                    txtSEL_KEY.Items.Add(new ListItem(name, bllexd.PKeyColSyn.COL_NAME));
                }
                SYS_BILL_COL ccc = new SYS_BILL_COL();
                ccc.BILL_ID = billid;
                ccc.FORM_SHOW = "1";
                ccc.IS_AUTO = "0";
                ccc.ISPK = "0";
                List<SYS_BILL_COL> lstCol = BLLTable<SYS_BILL_COL>.Factory(conn).Select(new SYS_BILL_COL(), ccc);
                if (lstCol != null)
                {
                    for (int i = 0; i < lstCol.Count; i++)
                    {
                        //txtCOL_SYN_TO.Items.Add(new ListItem(lstCol[i].COL_NOTE, lstCol[i].COL_NAME));
                        if (lstCol[i].ISPK == "1") {
                            txtSEL_KEY.Items.Add(new ListItem(lstCol[i].COL_NOTE, lstCol[i].COL_NAME));
                        }
                        if (!lstCol[i].IsNumber()) {
                            txtSEL_NAME.Items.Add(new ListItem(lstCol[i].COL_NOTE, lstCol[i].COL_NAME));
                        }
                    }
                }
            }
            //try
            //{
                ViewState["FORM_CTRL_ID"] = "0";

                SYS_BILL billObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, billid);
                hidTABLE_NAME.Value = billObj.TABLE_NAME;

                if (keyid != "")
                {

                    valObj = BLLTable<SYS_BILL_COL>.Factory(conn).GetRowData(SYS_BILL_COL.Attribute.COL_ID, keyid);
                    if (valObj == null) return;

                    txtISPK.Value = valObj.ISPK;
                    txtCOL_ID.Value = Convert.ToString(valObj.COL_ID);//Convert.ToInt32                

                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                

                    txtTABLE_NAME.Value = Convert.ToString(valObj.TABLE_NAME);//Convert.ToString                

                    txtCOL_NAME.Value = Convert.ToString(valObj.COL_NAME);//Convert.ToString                
                    ViewState["txtCOL_NAME"] = txtCOL_NAME.Value;
                    hidFK_NAME.Value = valObj.FK_NAME;
                    txtCOL_NOTE.Value = Convert.ToString(valObj.COL_NOTE);//Convert.ToString                

                    txtDATA_TYPE.Value = Convert.ToString(valObj.DATA_TYPE);//Convert.ToString                

                    txtDATA_LEN.Value = Convert.ToString(valObj.DATA_LEN);//Convert.ToInt32                

                    txtDATA_ACC.Value = Convert.ToString(valObj.DATA_ACC);//Convert.ToInt32                

                    txtIS_AUTO.Value = Convert.ToString(valObj.IS_AUTO);//Convert.ToString                

                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32                

                    txtCOL_SHOW.Value = Convert.ToString(valObj.FK_SHOW);//Convert.ToString                

                    txtDISPLAY_NAME.Value = Convert.ToString(valObj.DISPLAY_NAME);//Convert.ToString                

                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                

                    txtDVAL.Value = Convert.ToString(valObj.DVAL);//Convert.ToString                

                    txtBILL_ROW_FORMULAR.Value = Convert.ToString(valObj.BILL_ROW_FORMULAR);//Convert.ToString                

                    txtBILL_COL_FORMULAR.Value = Convert.ToString(valObj.BILL_COL_FORMULAR);//Convert.ToString                

                    txtBILL_ISHEADER.Value = Convert.ToString(valObj.BILL_ISHEADER);//Convert.ToString                

                    txtBILL_HERDERWIDTH.Value = Convert.ToString(valObj.BILL_HERDERWIDTH);//Convert.ToInt32                

                    txtFORM_CHECKTYPE.Value = Convert.ToString(valObj.FORM_CHECKTYPE);//Convert.ToString                

                    //txtFORM_CTRL_ID.Value = Convert.ToString(valObj.FORM_CTRL_ID);//Convert.ToInt32                
                    ViewState["FORM_CTRL_ID"] = valObj.FORM_CTRL_ID;
                    txtFORM_SHOW.Value = Convert.ToString(valObj.FORM_SHOW);//Convert.ToString                

                    txtFORM_NEED.Value = Convert.ToString(valObj.FORM_NEED);//Convert.ToString                

                    txtFORM_MIN.Value = Convert.ToString(valObj.FORM_MIN);//Convert.ToString                

                    txtFORM_MAX.Value = Convert.ToString(valObj.FORM_MAX);//Convert.ToString                

                    txtFORM_ONEROW.Value = Convert.ToString(valObj.FORM_ONEROW);//Convert.ToString                

                    txtFORM_CTRLWIDTH.Value = Convert.ToString(valObj.FORM_CTRLWIDTH);//Convert.ToInt32                

                    txtSEARCH_INBILL.Value = Convert.ToString(valObj.SEARCH_INBILL);//Convert.ToString                

                    txtSEARCH_TYPE.Value = Convert.ToString(valObj.SEARCH_TYPE);//Convert.ToString                

                    txtSEARCH_FORMULAR.Value = Convert.ToString(valObj.SEARCH_FORMULAR);//Convert.ToString
                    //hidIsFK.Value = valObj.ISFK;
                    txtBILL_AFTREDTL.Value = valObj.BILL_AFTREDTL;

                    //txtTAVLE_EXISTS.Checked = valObj.TABLE_EXISTS == "1";

                    //txtCOL_SYN_TO.Value = valObj.COL_SYN_TO;
                   // txtCONN_SOURCE.Value = valObj.CONN_SOURCE;
                    if (!string.IsNullOrEmpty(valObj.SEL_TB_COL))
                    {
                        string[] arr = valObj.SEL_TB_COL.Split(',');
                        txtSEL_TBNAME.Value = arr[0];// + "," + 
                        txtSEL_KEY.Value = arr[1];// + "," + 
                        txtSEL_NAME.Value = arr[2];
                    }
                    txtPK_VALCODE.Value = valObj.PK_VALCODE;
                    if ("31,32,33".IndexOf(valObj.FORM_CTRL_ID.ToString()) != -1)
                    {
                        liSetItems.Visible = true;
                    }

                    if (billObj.P_BILL_ID > 0)
                    {
                        dl_BILL_COL_FORMULAR.Visible = true;
                        dl_BILL_ROW_FORMULAR.Visible = true;
                    }
                    else
                    {
                        dl_BILL_COL_FORMULAR.Visible = true;
                        
                    }

                    txtSEL_TBNAME.Value = valObj.TABLE_NAME;

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
                    txtBILL_ID.Value = billid.ToString();
                   
                    txtTABLE_NAME.Value = billObj.TABLE_NAME;
                    txtSEL_TBNAME.Value = billObj.TABLE_NAME;
                    SYS_BILL_COL cccmax = new SYS_BILL_COL();
                    cccmax.BILL_ID = billid;
                    string sort = BLLTable<SYS_BILL_COL>.Max(SYS_BILL_COL.Attribute.SORT_NO, cccmax);
                    if (!string.IsNullOrEmpty(sort)) {
                        txtSORT_NO.Value = (int.Parse(sort)+1).ToString();
                    }
                    
                }

                #region//初始化控件类型
                SYS_BILL_CTRL ctrlCond = new SYS_BILL_CTRL();
                ctrlCond.OrderBy(TF_CTRL_TYPE.Attribute.SORT_NO, Order.Asc);
                DataTable dtCtrl = BLLTable<SYS_BILL_CTRL>.SelectForDataTable(new SYS_BILL_CTRL(), ctrlCond);

                //ViewState["CTRL_TYPE"] = txtFORM_CTRL_ID.Value;
                DataView dv1 = new DataView();
                dv1.Table = dtCtrl;
                dv1.RowFilter = "P_CTRL_ID='0'";
                dv1.Sort = "SORT_NO asc";
                for (int i = 0; i < dv1.Count; i++)
                {
                    litCTRL_TYPE.Text += "<optgroup label='" + dv1[i]["CTRL_NAME"].ToString() + "'>";

                    DataView dv2 = new DataView();
                    dv2.Table = dtCtrl;
                    dv2.RowFilter = "P_CTRL_ID='" + dv1[i]["CTRL_ID"].ToString() + "'";
                    dv2.Sort = "SORT_NO asc";
                    for (int a = 0; a < dv2.Count; a++)
                    {
                        if (valObj != null && ViewState["FORM_CTRL_ID"].ToString() == dv2[a]["CTRL_ID"].ToString())
                        {
                            litCTRL_TYPE.Text += "<option value='" + dv2[a]["CTRL_ID"].ToString() + "' selected='selected'>" + dv2[a]["CTRL_NAME"].ToString() + "</option>";
                        }
                        else
                        {
                            litCTRL_TYPE.Text += "<option value='" + dv2[a]["CTRL_ID"].ToString() + "'>" + dv2[a]["CTRL_NAME"].ToString() + "</option>";
                        }
                    }
                    litCTRL_TYPE.Text += "</optgroup>";
                }
                #endregion


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
            if (txtBILL_ID.Value != "")
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);

            if (txtCOL_NAME.Value != "")
                valObj.COL_NAME = Convert.ToString(txtCOL_NAME.Value);

           
            if (keyid == "")
            {
                if (BLLTable<SYS_BILL_COL>.Exists(valObj))
                {
                    litWarn.Text = "已经存在此字段！";
                    return;
                }
            }

            #region
            if (txtTABLE_NAME.Value != "")
                valObj.TABLE_NAME = Convert.ToString(txtTABLE_NAME.Value);


            if (txtCOL_ID.Value !="" )
                valObj.COL_ID = Convert.ToInt32(txtCOL_ID.Value);

            valObj.ISPK = txtISPK.Value;

            if(txtCOL_NOTE.Value !="" )
                valObj.COL_NOTE = Convert.ToString(txtCOL_NOTE.Value);

            if(txtDATA_TYPE.Value !="" )
                valObj.DATA_TYPE = Convert.ToString(txtDATA_TYPE.Value);

            if(txtDATA_LEN.Value !="" )
                valObj.DATA_LEN = Convert.ToInt32(txtDATA_LEN.Value);

            if(txtDATA_ACC.Value !="" )
                valObj.DATA_ACC = Convert.ToInt32(txtDATA_ACC.Value);

            if(txtIS_AUTO.Value !="" )
                valObj.IS_AUTO = Convert.ToString(txtIS_AUTO.Value);

            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);

            if(txtCOL_SHOW.Value !="" )
                valObj.FK_SHOW = Convert.ToString(txtCOL_SHOW.Value);

            if(txtDISPLAY_NAME.Value !="" )
                valObj.DISPLAY_NAME = Convert.ToString(txtDISPLAY_NAME.Value);

            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);

            if(txtDVAL.Value !="" )
                valObj.DVAL = Convert.ToString(txtDVAL.Value);

            if(txtBILL_ROW_FORMULAR.Value !="" )
                valObj.BILL_ROW_FORMULAR = Convert.ToString(txtBILL_ROW_FORMULAR.Value);

            if(txtBILL_COL_FORMULAR.Value !="" )
                valObj.BILL_COL_FORMULAR = Convert.ToString(txtBILL_COL_FORMULAR.Value);

            if(txtBILL_ISHEADER.Value !="" )
                valObj.BILL_ISHEADER = Convert.ToString(txtBILL_ISHEADER.Value);

            if(txtBILL_HERDERWIDTH.Value !="" )
                valObj.BILL_HERDERWIDTH = Convert.ToInt32(txtBILL_HERDERWIDTH.Value);

            if(txtFORM_CHECKTYPE.Value !="" )
                valObj.FORM_CHECKTYPE = Convert.ToString(txtFORM_CHECKTYPE.Value);

           // if(txtFORM_CTRL_ID.Value !="" )
                valObj.FORM_CTRL_ID = int.Parse(Request["txtFORM_CTRL_ID"]);

            if(txtFORM_SHOW.Value !="" )
                valObj.FORM_SHOW = Convert.ToString(txtFORM_SHOW.Value);

            if(txtFORM_NEED.Value !="" )
                valObj.FORM_NEED = Convert.ToString(txtFORM_NEED.Value);

            if(txtFORM_MIN.Value !="" )
                valObj.FORM_MIN = Convert.ToString(txtFORM_MIN.Value);
            
            
            if(txtFORM_MAX.Value !="" )
                valObj.FORM_MAX = Convert.ToString(txtFORM_MAX.Value);
            
            
            if(txtFORM_ONEROW.Value !="" )
                valObj.FORM_ONEROW = Convert.ToString(txtFORM_ONEROW.Value);
            
            
            if(txtFORM_CTRLWIDTH.Value !="" )
                valObj.FORM_CTRLWIDTH = Convert.ToInt32(txtFORM_CTRLWIDTH.Value);
            
            
            if(txtSEARCH_INBILL.Value !="" )
                valObj.SEARCH_INBILL = Convert.ToString(txtSEARCH_INBILL.Value);
            
            
            if(txtSEARCH_TYPE.Value !="" )
                valObj.SEARCH_TYPE = Convert.ToString(txtSEARCH_TYPE.Value);
            
            
            if(txtSEARCH_FORMULAR.Value !="" )
                valObj.SEARCH_FORMULAR = Convert.ToString(txtSEARCH_FORMULAR.Value);

            //valObj.ISFK = hidIsFK.Value;

            //if (hidTABLE_NAME.Value != txtTABLE_NAME.Value && txtCONN_SOURCE.Value != "AIO"&&valObj.ISPK=="1")
            //{
            //    valObj.ISFK = "1";
            //}
            //else {
            //    valObj.ISFK = "0";
            //}
            valObj.FK_NAME = hidFK_NAME.Value;

            valObj.BILL_AFTREDTL = txtBILL_AFTREDTL.Value;
            //valObj.TABLE_EXISTS = txtTAVLE_EXISTS.Checked == true ? "1" : "0";
            //valObj.COL_SYN_TO = txtCOL_SYN_TO.Value;
            //valObj.CONN_SOURCE = txtCONN_SOURCE.Value;

            valObj.PK_VALCODE = txtPK_VALCODE.Value;

            valObj.SEL_TB_COL = txtSEL_TBNAME.Value + "," + txtSEL_KEY.Value + "," + txtSEL_NAME.Value;
            #endregion

            if (keyid != "")
            {
                valObj.COL_ID = Convert.ToInt32(keyid);
                SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj);

                count =  BLLTable<SYS_BILL_COL>.Factory(conn).Update(valObj, SYS_BILL_COL.Attribute.COL_ID);
            }
            else
            {
                SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj);
                count =BLLTable<SYS_BILL_COL>.Factory(conn).Insert(valObj, SYS_BILL_COL.Attribute.COL_ID);
                keyid = count.ToString();
                ViewState["KEYID"] = keyid;
            }
            if (count > 0)
            {
                if ("31,32,33".IndexOf(valObj.FORM_CTRL_ID.ToString()) != -1)
                {
                    liSetItems.Visible = true;
                }
                else {
                    liSetItems.Visible = false;
                }
                if (Request["tree"] != null)
                {
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.BILL_ID).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");

                    sb.Append(valObj.COL_NAME + "[" + valObj.COL_NOTE + "]").Append("',ntype:'col'}");

                    if (Request["edit"] == null)
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "_FormView();parent.TV.showSubNodes(\"" + sb.ToString() + "\");", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "_FormView();parent.TV.editNodeInfo(\"" + sb.ToString() + "\");", false);
                       

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

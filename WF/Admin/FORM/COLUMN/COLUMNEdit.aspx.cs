using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
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
using AgileFrame.AppInOne.WF;
public partial class WF_F_COLUMNEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_F_COLUMN valObj =new TF_F_COLUMN();
    int count = 0;
    protected string keyid = "";
    protected string title = "";
    protected string formid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["COLUMN_ID"]))
        {
            keyid = Request["COLUMN_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["edit"]) && Request["ntype"]=="formcol")
        {
            keyid = Request["id"];
        }
        if (Request["ntype"] == "form" || Request["ntype"] == "form-mx")
        {
            formid = Request["id"];
            txtFORM_ID.Value = formid;
        }
        if (!string.IsNullOrEmpty(Request["formid"]))
        {
            formid = Request["formid"];
            txtFORM_ID.Value = formid;
        }
        if (!IsPostBack)
        { 
            dlCAL_FORMULA.Style.Value="display:none";//.Visible = false;
            dlSUM_FIELD_ID.Style.Value="display:none";//.Visible = false;
            //try
            //{
                ViewState["txtFIELD_ID"] = "";
                if (keyid != "")
                {
                    valObj = BLLTable<TF_F_COLUMN>.Factory(conn).GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, keyid);
                    if (valObj == null) return;

                    txtCOLUMN_ID.Value = Convert.ToString(valObj.COLUMN_ID);//Convert.ToInt32                
                    formid = valObj.FORM_ID.ToString();
                    txtFORM_ID.Value = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32                

                    txtTB_ID.Value = Convert.ToString(valObj.TB_ID);//Convert.ToInt32                

                    hidFIELD_ID.Value = Convert.ToString(valObj.FIELD_ID);//Convert.ToInt32                
                    txtFIELD_ID.Value = BLLTable<TF_TB_FIELD>.Factory(conn).GetOneValue(TF_TB_FIELD.Attribute.FIELD_ID, valObj.FIELD_ID, TF_TB_FIELD.Attribute.NOTE);
                    ViewState["txtFIELD_ID"] = txtFIELD_ID.Value;
                    txtSHOW_NAME.Value = Convert.ToString(valObj.SHOW_NAME);//Convert.ToString                

                    //txtCTRL_TYPE.Value = Convert.ToString(valObj.CTRL_TYPE);//Convert.ToString                

                    txtMAX_VAL.Value = Convert.ToString(valObj.MAX_VAL);//Convert.ToInt32                

                    txtMIN_VAL.Value = Convert.ToString(valObj.MIN_VAL);//Convert.ToInt32                

                    txtIS_NEED.Checked = valObj.IS_NEED == 1 ? true : false;//Convert.ToInt32                

                    //txtCAL_FORMULA.Value = Convert.ToString(valObj.CAL_FORMULA);//Convert.ToString                

                    txtSUM_FIELD_ID.Value = Convert.ToString(valObj.SUM_FIELD_ID);//Convert.ToString                

                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                    txtCAL_FORMULA.Value = valObj.CAL_FORMULA;
                    if (valObj.SHOWIN_HEADER == "1")
                    {
                        txtSHOWIN_HEADR.Checked = true;
                    }
                    else {
                        txtSHOWIN_HEADR.Checked = false;
                    }
                    txtSHOWIN_FORM.Checked = valObj.SHOWIN_FORM == "1" ? true : false;
                    TF_TB_FIELD fieldObj = BLLTable<TF_TB_FIELD>.Factory(conn).GetRowData(TF_TB_FIELD.Attribute.FIELD_ID, valObj.FIELD_ID);
                    if (fieldObj != null)
                    {
                        if (fieldObj.TYPE_CODE == TF_ENUM.FieldTypeCode.Decimal.ToString() ||
                            fieldObj.TYPE_CODE == TF_ENUM.FieldTypeCode.Number.ToString())
                        {
                            //dlCAL_FORMULA.Style.Value = "display:block";//.Visible = true;
                        }
                        else
                        {
                            dlCAL_FORMULA.Visible = false;
                            dlSUM_FIELD_ID.Visible = false;
                        }
                    }
                    else {
                        litWarn.Text = "对应字段关联不正确。";
                    }
                   // Response.Write(fieldObj.TYPE_CODE);
                }
                
                if (txtFORM_ID.Value != "")
                {

                    #region//初始化用于编写公式的可选字段列表
                    TF_FORM formObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, txtFORM_ID.Value);
                    if (formObj != null && formObj.M_FORM_ID>0)
                    {
                        TF_TB_FIELD numccc = new TF_TB_FIELD();
                        numccc.In(TF_TB_FIELD.Attribute.TYPE_CODE, TF_ENUM.FieldTypeCode.Decimal.ToString() + "," + TF_ENUM.FieldTypeCode.Number.ToString());
                        numccc.TB_ID = formObj.TB_ID;
                        List<TF_TB_FIELD> fieldList = BLLTable<TF_TB_FIELD>.Factory(conn).Select(new TF_TB_FIELD(), numccc);
                        if (fieldList != null&&fieldList.Count>0) {
                            StringBuilder sbnumcols = new StringBuilder();
                            fieldList.ForEach(f => {
                                sbnumcols.Append("<a data='" + f.FIELD_NAME + "' onclick='selColToCalInput(this);'>" + f.NOTE + "(" + f.FIELD_NAME + ")</a>");
                            
                            });

                            litNumberFields.Text = sbnumcols.ToString();
                            if (keyid != "")
                            {
                                dlCAL_FORMULA.Style.Value = "display:block";//.Visible = true;
                            }
                            //dlCAL_FORMULA.Visible = true;
                        }
                    }
                    #endregion

                    #region//初始化综合可以用于作为主表某个字段的值的字段列表,这些字段来自明细表
                    if (formObj != null && formObj.M_FORM_ID > 0)
                    {
                        formObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, formObj.M_FORM_ID);
                        if (formObj != null)
                        {
                            TF_TB_FIELD numccc = new TF_TB_FIELD();
                            numccc.In(TF_TB_FIELD.Attribute.TYPE_CODE, TF_ENUM.FieldTypeCode.Decimal.ToString() + "," + TF_ENUM.FieldTypeCode.Number.ToString());
                            numccc.TB_ID = formObj.TB_ID;
                            TF_TABLE tbObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, formObj.TB_ID);
                            List<TF_TB_FIELD> fieldList = BLLTable<TF_TB_FIELD>.Factory(conn).Select(new TF_TB_FIELD(), numccc);
                            if (fieldList != null&&fieldList.Count>0)
                            {
                                StringBuilder sbnumcols = new StringBuilder();
                                fieldList.ForEach(f =>
                                {
                                    sbnumcols.Append("<a class='cansel' data='" + tbObj.TB_NAME + "." + f.FIELD_NAME + "' onclick='selColToSum(this);'>" + f.NOTE + "(" + f.FIELD_NAME + ")</a>");

                                });

                                litSUM_FIELD_ID.Text = sbnumcols.ToString();
                                if (keyid != "")
                                {
                                    dlSUM_FIELD_ID.Style.Value = "display:block";//.Visible = true;
                                }
                                //dlSUM_FIELD_ID.Visible = true;
                            }
                        }
                    }
                    #endregion
                }
                #region//初始化控件类型
                TF_CTRL_TYPE ctrlCond = new TF_CTRL_TYPE();
                ctrlCond.OrderBy(TF_CTRL_TYPE.Attribute.SORT_NO, Order.Asc);
                DataTable dtCtrl = BLLTable<TF_CTRL_TYPE>.SelectForDataTable(new TF_CTRL_TYPE(), ctrlCond);

                ViewState["CTRL_TYPE"] = valObj.CTRL_TYPE;
                DataView dv1 = new DataView();
                dv1.Table = dtCtrl;
                dv1.RowFilter = "P_CTRL_TYPE='0'";
                dv1.Sort = "SORT_NO asc";
                for (int i = 0; i < dv1.Count; i++)
                {
                    litCTRL_TYPE.Text += "<optgroup label='" + dv1[i]["CTRL_NAME"].ToString() + "'>";

                    DataView dv2 = new DataView();
                    dv2.Table = dtCtrl;
                    dv2.RowFilter = "P_CTRL_TYPE='" + dv1[i]["CTRL_TYPE"].ToString() + "'";
                    dv2.Sort = "SORT_NO asc";
                    for (int a = 0; a < dv2.Count; a++)
                    {
                        if (valObj != null && valObj.CTRL_TYPE == dv2[a]["CTRL_TYPE"].ToString())
                        {
                            litCTRL_TYPE.Text += "<option value='" + dv2[a]["CTRL_TYPE"].ToString() + "' selected='selected'>" + dv2[a]["CTRL_NAME"].ToString() + "</option>";
                        }
                        else
                        {
                            litCTRL_TYPE.Text += "<option value='" + dv2[a]["CTRL_TYPE"].ToString() + "'>" + dv2[a]["CTRL_NAME"].ToString() + "</option>";
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
        try
        {
            TF_F_COLUMN valObj = new TF_F_COLUMN();
            if (txtFORM_ID.Value != "")
                valObj.FORM_ID = Convert.ToInt32(txtFORM_ID.Value);

            if (txtFIELD_ID.Value != "")
                valObj.FIELD_ID = Convert.ToInt32(hidFIELD_ID.Value);

            if (ViewState["txtFIELD_ID"].ToString() != txtFIELD_ID.Value)
            {
                if (BLLTable<TF_F_COLUMN>.Exists(valObj))
                {
                    litWarn.Text = "该表字段已经被某栏目使用。";
                    return;
                }
            }
            if(txtCOLUMN_ID.Value !="" )
                valObj.COLUMN_ID = Convert.ToInt32(txtCOLUMN_ID.Value);

            if(txtTB_ID.Value !="" )
                valObj.TB_ID = Convert.ToInt32(txtTB_ID.Value);


            if (txtSHOWIN_HEADR.Checked == true)
            {
                valObj.SHOWIN_HEADER = "1";
            }
            else {
                valObj.SHOWIN_HEADER = "0";
            }
            
            
            if(txtSHOW_NAME.Value !="" )
                valObj.SHOW_NAME = txtSHOW_NAME.Value;
            
            
            //if(txtCTRL_TYPE.Value !="" )
            valObj.CTRL_TYPE = Request["txtCTRL_TYPE"];
            
            
            if(txtMAX_VAL.Value !="" )
                valObj.MAX_VAL = Convert.ToInt32(txtMAX_VAL.Value);
            
            
            if(txtMIN_VAL.Value !="" )
                valObj.MIN_VAL = Convert.ToInt32(txtMIN_VAL.Value);


                valObj.IS_NEED = txtIS_NEED.Checked == true ? 1 : 0;
           
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);

            valObj.CAL_FORMULA = txtCAL_FORMULA.Value;

            valObj.SHOWIN_FORM = txtSHOWIN_FORM.Checked == true ? "1" : "0";

            valObj.SUM_FIELD_ID = txtSUM_FIELD_ID.Value;

            if (keyid != "")
            {
                valObj.COLUMN_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_F_COLUMN>.Factory(conn).Update(valObj, TF_F_COLUMN.Attribute.COLUMN_ID);
            }
            else
            {
                valObj.IS_DEFAULT = "0";
                count = BLLTable<TF_F_COLUMN>.Factory(conn).Insert(valObj, TF_F_COLUMN.Attribute.COLUMN_ID);
                keyid = valObj.COLUMN_ID.ToString();

            }
            if (count > 0)
            {
               

                Button btn = (Button)sender;
                if (Request["tree"] != null)
                {
                    string gotoUrl = "../../../../ok.aspx";
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.FORM_ID).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");
                    sb.Append(valObj.SHOW_NAME).Append("',ntype:'field'}");
                    if (Request["edit"] == null)
                    {

                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                }
                else
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
                    if (btn.ID.IndexOf("btnOK") != -1)
                    {
                        litWarn.Text = "修改栏目信息成功！";
                        if (ViewState["hadSave"] == null)
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                        }
                    }
                    else
                    {
                        litWarn.Text = "修改栏目信息成功！";
                        txtSHOW_NAME.Value = "";

                        //txtCTRL_TYPE.Value ="";

                        txtMAX_VAL.Value = "";
                        txtMIN_VAL.Value = "";
                        txtIS_NEED.Checked = true;
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

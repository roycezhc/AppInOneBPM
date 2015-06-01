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
using AgileFrame.Core.WebSystem;
public partial class WF_FORMEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_FORM valObj =new TF_FORM();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected int pid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["FORM_ID"]))
        {
            keyid = Request["FORM_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["edit"]))
        {
            keyid = Request["id"];
        }
        else {
            pid = int.Parse(Request["id"]);
        }
        if (!IsPostBack)
        {
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtFORM_ID.Value = Convert.ToString(valObj.FORM_ID);//Convert.ToInt32                
                    
                    txtF_NAME.Value = Convert.ToString(valObj.F_NAME);//Convert.ToString                
                    
                    hidTB_ID.Value = Convert.ToString(valObj.TB_ID);//Convert.ToInt32                
                    txtTB_ID.Value = BLLTable<TF_TABLE>.Factory(conn).GetOneValue(TF_TABLE.Attribute.TB_ID, valObj.TB_ID, TF_TABLE.Attribute.CH_NAME);
                    
                    txtTPL_EDIT.Value = Convert.ToString(valObj.TPL_EDIT);//Convert.ToString                
                    
                    txtTPL_SHOW.Value = Convert.ToString(valObj.TPL_SHOW);//Convert.ToString                
                    
                    txtTPL_PRINT.Value = Convert.ToString(valObj.TPL_PRINT);//Convert.ToString                
                    
                    txtTPL_LIST.Value = Convert.ToString(valObj.TPL_LIST);//Convert.ToString                
                    
                    //txtTB_IDS.Value = Convert.ToString(valObj.TB_IDS);//Convert.ToString
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
            TF_FORM valObj = new TF_FORM();

            if(txtFORM_ID.Value !="" )
                valObj.FORM_ID = Convert.ToInt32(txtFORM_ID.Value);

            if(txtF_NAME.Value !="" )
                valObj.F_NAME = txtF_NAME.Value;

            if(txtTB_ID.Value !="" )
                valObj.TB_ID = Convert.ToInt32(hidTB_ID.Value);

            valObj.TPL_EDIT = txtTPL_EDIT.Value;
            valObj.TPL_SHOW =txtTPL_SHOW.Value;
            valObj.TPL_PRINT =txtTPL_PRINT.Value;
            valObj.TPL_LIST = txtTPL_LIST.Value;


            if (keyid != "")
            {
                valObj.FORM_ID = Convert.ToInt32(keyid);
                count = BLLTable<TF_FORM>.Factory(conn).Update(valObj, TF_FORM.Attribute.FORM_ID);
            }
            else
            {
                valObj.M_FORM_ID = pid;
                count = BLLTable<TF_FORM>.Factory(conn).Insert(valObj, TF_FORM.Attribute.FORM_ID);
                keyid = valObj.FORM_ID.ToString();

                if (count > 0)
                {
                    #region//自动插入默认表单栏目
                    TF_TB_FIELD cond = new TF_TB_FIELD();
                    cond.TB_ID = valObj.TB_ID;
                    //cond.In(TF_TB_FIELD.Attribute.TB_ID, valObj.TB_ID + ",0");
                    List<TF_TB_FIELD> lstField = BLLTable<TF_TB_FIELD>.Factory(conn).Select(new TF_TB_FIELD(), cond);
                    if (lstField != null)
                    {
                        TF_F_COLUMN valCol = new TF_F_COLUMN();
                        valCol.TB_ID = valObj.TB_ID;
                        valCol.FORM_ID = valObj.FORM_ID;
                        lstField.ForEach(f =>
                        {
                            valCol.FIELD_ID = f.FIELD_ID;

                            valCol.SHOW_NAME = f.NOTE;
                            valCol.CTRL_TYPE = f.CTRL_TYPE;
                            valCol.SHOWIN_FORM = "1";
                            valCol.MAX_VAL = 0;
                            if (f.TB_ID == 0)
                            {
                                valCol.IS_DEFAULT = "1";
                            }
                            else
                            {
                                valCol.IS_DEFAULT = "0";
                            }
                            valCol.MIN_VAL = 0;
                            valCol.IS_NEED = f.IS_NULL == 1 ? 0 : 1;
                            valCol.SORT_NO = f.SORT_NO;
                            int aaa=BLLTable<TF_F_COLUMN>.Factory(conn).Insert(valCol, TF_F_COLUMN.Attribute.COLUMN_ID);

                            if (aaa > 0)
                            {
                                BLLTable<TF_TB_FIELD>.Factory(conn).Update(TF_TB_FIELD.Attribute.FIELD_ID, f.FIELD_ID,
                            TF_TB_FIELD.Attribute.CREATED, 1);
                            }
                        });
                    }
                    #endregion

                    List<TF_TABLE> lstMX = BLLTable<TF_TABLE>.Factory(conn).Select(TF_TABLE.Attribute.M_TB_ID, valObj.TB_ID);

                    if (lstMX != null && lstMX.Count > 0)
                    {
                        lstMX.ForEach(tb =>
                        {
                            TF_FORM valMX = new TF_FORM();
                            valMX.F_NAME = tb.CH_NAME;
                            valMX.TB_ID = Convert.ToInt32(tb.TB_ID);
                            valMX.TPL_EDIT = "";
                            valMX.TPL_SHOW = "";
                            valMX.TPL_PRINT = "";
                            valMX.TPL_LIST = "";
                            valMX.M_FORM_ID = valObj.FORM_ID;
                            int addmx = BLLTable<TF_FORM>.Factory(conn).Insert(valMX, TF_FORM.Attribute.FORM_ID);

                            #region//自动插入默认表单栏目
                            TF_TB_FIELD condFFF = new TF_TB_FIELD();
                            //condFFF.In(TF_TB_FIELD.Attribute.TB_ID, valMX.TB_ID + ",0");
                            condFFF.TB_ID = valMX.TB_ID;
                            lstField = BLLTable<TF_TB_FIELD>.Factory(conn).Select(new TF_TB_FIELD(), condFFF);
                            if (lstField != null)
                            {
                                TF_F_COLUMN valCol = new TF_F_COLUMN();
                                valCol.TB_ID = valMX.TB_ID;
                                valCol.FORM_ID = valMX.FORM_ID;
                                lstField.ForEach(f =>
                                {
                                    valCol.FIELD_ID = f.FIELD_ID;

                                    valCol.SHOW_NAME = f.NOTE;
                                    valCol.CTRL_TYPE = f.CTRL_TYPE;
                                    valCol.SHOWIN_FORM = "1";
                                    valCol.MAX_VAL = 0;
                                    if (f.TB_ID == 0)
                                    {
                                        valCol.IS_DEFAULT = "1";
                                    }
                                    else
                                    {
                                        valCol.IS_DEFAULT = "0";
                                    }
                                    valCol.MIN_VAL = 0;
                                    valCol.IS_NEED = f.IS_NULL == 1 ? 0 : 1;
                                    valCol.SORT_NO = f.SORT_NO;
                                    int  aaa=BLLTable<TF_F_COLUMN>.Factory(conn).Insert(valCol, TF_F_COLUMN.Attribute.COLUMN_ID);
                                    if (aaa > 0)
                                    {
                                        BLLTable<TF_TB_FIELD>.Factory(conn).Update(TF_TB_FIELD.Attribute.FIELD_ID, f.FIELD_ID,
                                    TF_TB_FIELD.Attribute.CREATED, 1);
                                    }
                                });
                            }
                            #endregion
                        });
                    }
                }
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
                    if (Request["tree"] != null)
                    {
                        string gotoUrl = "../../../ok.aspx";
                        StringBuilder sb = new StringBuilder("{");
                        sb.Append("id:'");
                        sb.Append(keyid).Append("',pid:'").Append("0").Append("',no:").Append(valObj.FORM_ID).Append(",sc:1,name:'");
                        //CHG START 点击节点选择页面条件有误 jin-shenjian 2013/10/26
                        //sb.Append(valObj.F_NAME).Append("',ntype:'form'}");
                        sb.Append(valObj.F_NAME).Append("',ntype:'TF_FORM_MANAGE'}");
                        //CHG END 点击节点选择页面条件有误 jin-shenjian 2013/10/26
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
                        if (ViewState["hadSave"] == null)
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                        }
                    }
                }
                else
                {
                    txtF_NAME.Value ="";
                    txtTB_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

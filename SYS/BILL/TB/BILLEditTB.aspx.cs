using System;
using System.Collections.Generic;
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
public partial class SYS_BILLEditTB : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL valObj =new SYS_BILL();
    int count = 0;
    protected string keyid = "";
    protected string pid = "0";
    protected string title = "";

    string InMTable(string tbs, string tbname)
    {
        string dev = ".";
        string[] arr = StringHelper.GetStringArray(tbs, ',');
        if (arr != null)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                string[] aaa = arr[i].Split('.');
                if (aaa.Length > 2)
                {
                    if (aaa[2] == tbname)
                    {
                        dev = aaa[0] + "." + aaa[1];
                        break;
                    }
                }
                else
                {
                    if (aaa[1] == tbname)
                    {
                        dev = aaa[0] + "." + aaa[1];
                        break;
                    }
                }
            }
        }
        return dev;
    }

    //BILLEditTB.aspx?edit=1&id=CMS_ArtcileRe&pid=0&no=1&sc=1&dev=&tb=&name=CMS_ArtcileRe&ntype=bill&level=01&tree=0.908367020014299
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["BILL_ID"]))
        {
            keyid = Request["BILL_ID"];
        }
        if (Request["ntype"] == "bill" || Request["ntype"] == "bill-mx")
        {
            pid = Request["id"];
            if (Request["edit"] != null)
            {
                pid = Request["pid"];
                keyid = Request["id"];
            }
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            txtDEV.Items.AddRange(FormHelper.GetListItem(SYS_DATASOURCE.Attribute.SourceName));
            txtADDER.Value = userBase.RealName;
            //try
            //{
            //if (keyid != "")
            //{
            //    valObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, keyid);
            //    if(valObj==null) return ;
            //    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                
            //    txtBILL_NAME.Value = Convert.ToString(valObj.BILL_NAME);//Convert.ToString                
            //    txtBILL_TYPE.Value = Convert.ToString(valObj.BILL_TYPE);//Convert.ToString                
            //    txtBILL_SQL.Value = Convert.ToString(valObj.BILL_SQL);//Convert.ToString                
            //    //txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
            //    //txtEDITIME.Value = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd");                
            //    txtADDER.Value = Convert.ToString(valObj.ADDER);//Convert.ToString                
            //    //txtCONN_SOURCE.Value = valObj.CONN_SOURCE;
            //    if (!string.IsNullOrEmpty(valObj.CONN_SOURCE))
            //    {
            //        string[] arr = StringHelper.GetStringArray(valObj.CONN_SOURCE, ',');

            //        for (int i = 0; i < arr.Length; i++)
            //        {
            //            string[] aaa = arr[i].Split('.');
            //            string dev = aaa[0]; string tb = aaa[1];
            //            litHTML.Text += "<p><span>" + dev + "</span>&nbsp;.&nbsp;<span>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + dev + "." + tb + "' type='hidden'/></p>";
            //        }
            //    }
            //    txtTABLE_NAME.Value =valObj.TABLE_NAME.Split('_')[1];//Convert.ToString                
            //    ViewState["TABLE_NAME"] = valObj.TABLE_NAME;
            //    //txtP_BILL_ID.Value = Convert.ToString(valObj.P_BILL_ID);//Convert.ToInt32
            //    txtTAVLE_EXISTS.Checked = valObj.IS_TABLE_EXISTS == "1";

            //    if (valObj.IS_TABLE_EXISTS == "1") {
            //        txtTAVLE_EXISTS.Disabled = true;
            //        txtTABLE_NAME_PRE.Disabled = true;
            //        txtTABLE_NAME.Disabled = true;
            //    }
            //}
            if (Request["ntype"] == "bill" || Request["ntype"] == "bill-mx")
            {
                ckDTL.Disabled = true;
                string name = Request["name"];
                if (!DataBase.Factory(conn).DataTables.Contains(name))
                {
                    litWarn.Text = "表" + name + "不存在，请刷新列表！";
                    btnOK.Enabled = false;
                    btnSave.Enabled = false;
                    _btnOK.Enabled = false;
                    _btnSave.Enabled = false;
                    return; 
                }
                int iii = name.IndexOf("_");
                if (iii != -1)
                {
                    string tbname = name;
                    tbname = tbname.Substring(iii + 1, tbname.Length - iii - 1);
                    txtTABLE_NAME.Value = tbname;
                    txtTABLE_NAME_PRE.Value = name.Split('_')[0] + "_";
                    if (txtTABLE_NAME_PRE.Value.IndexOf("U_") == 0 || txtTABLE_NAME_PRE.Value.IndexOf("u_") == 0)
                    {
                        radSysTable.Checked = false;
                        radClientTable.Checked = true;
                    }
                    else
                    {
                        radSysTable.Checked = true;
                        radClientTable.Checked = false;
                    }
                }
                else
                {
                    txtTABLE_NAME.Value = name;
                }

                ViewState["TABLE_NAME"] = name;
                
                valObj.TABLE_NAME = name;                
                if (DataBase.Factory(conn).DataTables.Contains(valObj.TABLE_NAME))
                {
                    this.txtBILL_NAME.Value = DataBase.Factory(conn).DataTables[valObj.TABLE_NAME].Desc.ZhName;
                }
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
        SYS_BILL valObj = new SYS_BILL();
        if (txtBILL_ID.Value != "")
            valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);
        if (txtBILL_NAME.Value != "")
            valObj.BILL_NAME = txtBILL_NAME.Value;
        if (txtBILL_TYPE.Value != "")
            valObj.BILL_TYPE = Convert.ToString(txtBILL_TYPE.Value);
        if (txtBILL_SQL.Value != "")
            valObj.BILL_SQL = Convert.ToString(txtBILL_SQL.Value);

        valObj.EDITIME = DateTime.Now;

        if (txtADDER.Value != "")
            valObj.ADDER = Convert.ToString(txtADDER.Value);


        if (txtTABLE_NAME.Value != "")
            valObj.TABLE_NAME = txtTABLE_NAME_PRE.Value.Trim() + txtTABLE_NAME.Value.Trim();

        if (!DataBase.Factory(conn).DataTables.Contains(ViewState["TABLE_NAME"].ToString()))
        {
            litWarn.Text = "表" + ViewState["TABLE_NAME"] + "不存在，请刷新列表！";
            btnOK.Enabled = false;
            btnSave.Enabled = false;
            _btnOK.Enabled = false;
            _btnSave.Enabled = false;
            return; 
            return;
        }

        valObj.CONN_SOURCE = Request["selDEVTB"];
        valObj.P_BILL_ID = Convert.ToInt32(pid);



        valObj.IS_TABLE_EXISTS = txtTAVLE_EXISTS.Checked == true ? "1" : "0";

        if (valObj.IS_TABLE_EXISTS == "0")
        {
            if (DataBase.Factory(conn).DataTables.Contains(valObj.TABLE_NAME))
            {
                valObj.IS_TABLE_EXISTS = "1";
            }
        }
        try
        {
            if (keyid != "")
            {
                //valObj.BILL_ID = Convert.ToInt32(keyid);
                valObj.EDITIME = DateTime.Now;
                SYS_BILL_EXD billExd = new SYS_BILL_EXD(valObj);
                count = billExd.DB_UpdateName(ViewState["TABLE_NAME"].ToString());
            }
            else
            {
                valObj.STATUS = "0";
                SYS_BILL_EXD billExd = new SYS_BILL_EXD(valObj);
                string msg = "";
                count = billExd.DB_CreateTable(ckDTL.Checked == true, ref msg) == true ? 1 : 0;

                keyid = count.ToString();
            }
        }
        catch (Exception ee)
        {
            Response.Write("操作失败，请重新选择节点！");
            Response.End();
        }
        string txt = valObj.TABLE_NAME.ToLower().IndexOf("u_") == 0 ? "[系统表]" : "[客户表]";
        if (count > 0)
        {
            ViewState["TABLE_NAME"] = valObj.TABLE_NAME;
            litWarn.Text = "保存" + txt + "成功！";
            if (Request["tree"] != null)
            {
                string dev = ".";
                if (Request["tbs"] != null)
                {
                    dev = InMTable(Request["tbs"], valObj.TABLE_NAME);
                    if (dev == ".")
                    {
                        return;

                    }
                }
                StringBuilder sb = new StringBuilder("{");
                string[] arr = dev.Split('.');
                sb.Append("id:'").Append(valObj.TABLE_NAME);
                sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
                sb.Append(",sc:").Append("1,dev:'" + arr[0] + "',tb:'" + arr[1] + "'");
                sb.Append(",name:'").Append(valObj.TABLE_NAME).Append("',note:'[" + valObj._ZhName + "]'").Append(",ntype:'" + (valObj.P_BILL_ID > 0 ? "bill-mx" : "bill") + "'}");

                if (Request["edit"] == null)
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");", false);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");", false);
                }

            }
            else
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
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    txtBILL_NAME.Value = "";
                    txtBILL_TYPE.Value = "";
                    txtADDER.Value = "";
                    txtTABLE_NAME.Value = "";
                }
            }
        }
        else
        {
            litWarn.Text = "保存" + txt + "失败！";
        }
        //}
        //catch (Exception ex)
        //{
        //    litWarn.Text = ex.Message;
        //}
    }

}

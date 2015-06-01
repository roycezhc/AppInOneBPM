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
public partial class SYS_BILLEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL valObj = new SYS_BILL();
    int count = 0;
    protected string keyid = "";
    protected string pid = "0";
    protected string title = "";
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

            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, keyid);
                    if (valObj == null) return;


                    txtBILL_ID.Value = Convert.ToString(valObj.BILL_ID);//Convert.ToInt32                

                    txtBILL_NAME.Value = Convert.ToString(valObj.BILL_NAME);//Convert.ToString                

                    //txtBILL_TYPE.Value = Convert.ToString(valObj.BILL_TYPE);//Convert.ToString                

                    txtBILL_SQL.Value = Convert.ToString(valObj.BILL_SQL);//Convert.ToString                

                    //txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                

                    //txtEDITIME.Value = (valObj.EDITIME == DateTime.MinValue) ? "" : valObj.EDITIME.ToString("yyyy-MM-dd");                

                    txtADDER.Value = Convert.ToString(valObj.ADDER);//Convert.ToString                
                    //txtCONN_SOURCE.Value = valObj.CONN_SOURCE;
                    if (!string.IsNullOrEmpty(valObj.CONN_SOURCE))
                    {
                        string[] arr = StringHelper.GetStringArray(valObj.CONN_SOURCE, ',');

                        for (int i = 0; i < arr.Length; i++)
                        {
                            string[] aaa = arr[i].Split('.');
                            string dev = aaa[0];
                            string tb = aaa[1];
                            string hidtb = tb;
                            if (aaa.Length > 2)
                            {
                                hidtb += "." + aaa[2];
                            }
                            litHTML.Text += "<p><span>" + dev + "</span>&nbsp;.&nbsp;<span style='color:blue'>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + dev + "." + hidtb + "' type='hidden'/></p>";
                        }
                    }

                    ViewState["CONN_SOURCE"] = valObj.CONN_SOURCE;
                    txtTABLE_NAME.Value = valObj.TABLE_NAME;
                    ViewState["TABLE_NAME"] = valObj.TABLE_NAME;


                    if (valObj.IS_TABLE_EXISTS == "1")
                    {
                        //txtTAVLE_EXISTS.Disabled = true;
                        txtTABLE_NAME.Disabled = true;
                    }
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
        //try
        //{
        SYS_BILL valObj = new SYS_BILL();
        if (txtBILL_ID.Value != "")
            valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);
        if (txtBILL_NAME.Value != "")
            valObj.BILL_NAME = txtBILL_NAME.Value;
        //if(txtBILL_TYPE.Value !="" )
        //    valObj.BILL_TYPE = Convert.ToString(txtBILL_TYPE.Value);
        if (txtBILL_SQL.Value != "")
            valObj.BILL_SQL = Convert.ToString(txtBILL_SQL.Value);

        valObj.EDITIME = DateTime.Now;


        if (txtADDER.Value != "")
            valObj.ADDER = Convert.ToString(txtADDER.Value);


        if (txtTABLE_NAME.Value != "")
            valObj.TABLE_NAME = txtTABLE_NAME.Value;

        valObj.CONN_SOURCE = Request["selDEVTB"];
        if (!string.IsNullOrEmpty(valObj.CONN_SOURCE) && valObj.CONN_SOURCE.Length > 0)
        {
            if (valObj.CONN_SOURCE.Substring(0, 1) == ",")
            {
                valObj.CONN_SOURCE.Substring(1);
            }
        }
        valObj.P_BILL_ID = Convert.ToInt32(pid);


        valObj.IS_TABLE_EXISTS = "1";


        if (keyid != "")
        {
            valObj.EDITIME = DateTime.Now;
            SYS_BILL_EXD billExd = new SYS_BILL_EXD(valObj);
            count = BLLTable<SYS_BILL>.Factory(conn).Update(valObj, SYS_BILL.Attribute.BILL_ID);// billExd.AD_Update(ViewState["TABLE_NAME"].ToString());
        }
        else
        {
            valObj.STATUS = "1";
            //SYS_BILL_EXD billExd = new SYS_BILL_EXD(valObj);
            //count = billExd.AD_Add();
            count = BLLTable<SYS_BILL>.Factory(conn).Insert(valObj, SYS_BILL.Attribute.BILL_ID);
            keyid = valObj.BILL_ID.ToString();// count.ToString();
            if (count > 0)
            {
                //DataBaseTable tbllext = DataBase.Factory(conn).DataTables[valObj.TABLE_NAME];// new DataBaseTable(_Base.TABLE_NAME, "", dbROG);
                //DataBaseFieldCollection fields = tbllext.DataFields;
                //if (fields != null)
                //{
                //    string keys = "";
                //    for (int i = 0; i < fields.Count; i++)
                //    {

                //        DataBaseField f = fields[i];
                //        if (f.IsKey == true)
                //        {
                //            keys += keys == "" ? f.FieldName : "," + f.FieldName;
                //        }
                //        SYS_BILL_COL col = DataBaseHelper.FieldToCol(f, valObj.BILL_ID);
                //        BLLTable<SYS_BILL_COL>.Factory(conn).Insert(col, SYS_BILL_COL.Attribute.COL_ID);
                //    }
                //    //记录主键到表单
                //    BLLTable<SYS_BILL>.Factory(conn).Update(SYS_BILL.Attribute.BILL_ID, valObj.BILL_ID, SYS_BILL.Attribute.KEYS, keys);
                //}
            }

        }
        int saveSuccessCount = 0;
        if (count > 0)
        {
            #region//相关设备表业务处理
            //新建镜像表，如果已经存在 则不建立。
            //编辑时先记录下原来配置的镜像表字典，如果字典里有的但是新配置里的没有吗，则删除字典里的那个镜像表。
            Dictionary<string, string> dicDelOldDEVS = new Dictionary<string, string>();
            if (ViewState["CONN_SOURCE"] != null)
            {
                string[] arr = StringHelper.GetStringArray(ViewState["CONN_SOURCE"].ToString(), ',');
                if (arr != null)
                {
                    for (int i = 0; i < arr.Length; i++)
                    {
                        string[] aaa = arr[i].Split('.');
                        if (aaa.Length > 2)
                        {
                            dicDelOldDEVS.Add(arr[i], aaa[2]);
                        }
                    }
                }
            }
            if (!string.IsNullOrEmpty(valObj.CONN_SOURCE))
            {
                string[] arr = StringHelper.GetStringArray(valObj.CONN_SOURCE, ',');
                string newSrc = "";
                if (arr != null)
                {
                    //DataBase.Factory(conn).Load(true);
                    for (int i = 0; i < arr.Length; i++)
                    {
                        string[] aaa = arr[i].Split('.');
                        newSrc += "," + arr[i];
                        if (aaa[0] == "AIO")
                        {
                            continue;
                        }
                        if (aaa.Length > 2)
                        {
                            //原来已经存的物理表信息
                            if (dicDelOldDEVS.ContainsKey(arr[i]))
                            {
                                dicDelOldDEVS.Remove(arr[i]);
                            }
                            continue;
                        }
                        string tbname = "ERP_"+aaa[0]+"_" + aaa[1];

                        DataBaseTable addTB = GetAddTable(aaa[0], aaa[1], ref tbname);
                        if (addTB != null)
                        {
                            string msg = "";
                            if (DataBase.Factory(conn).AddTable(addTB, ref msg))
                            {
                                newSrc += "." + tbname;
                                saveSuccessCount++;
                            }
                        }
                        else
                            newSrc += "." + tbname;
                    }
                }
                if (newSrc != "") {
                    newSrc = newSrc.Substring(1);
                }
                BLLTable<SYS_BILL>.Factory(conn).Update(SYS_BILL.Attribute.BILL_ID, keyid, SYS_BILL.Attribute.CONN_SOURCE, newSrc);
            }
            int delSuccessCount = 0;
            if (dicDelOldDEVS.Count > 0)
            {
                string msg = "";
                foreach (KeyValuePair<string, string> ppp in dicDelOldDEVS)
                {
                    delSuccessCount += DataBase.Factory(conn).DeleteTable(ppp.Value, true, ref msg) ? 1 : 0;
                }
            }

            #endregion


            litWarn.Text = "保存物理表成功数:" + saveSuccessCount + (dicDelOldDEVS.Count > 0 ? (",删除物理表成功数" + delSuccessCount) : "");
            if (Request["tree"] != null)
            {
                //Response.Write(keyid);
                StringBuilder sb = new StringBuilder("{");
                sb.Append("id:'");
                sb.Append(keyid).Append("',pid:'").Append("0").Append("',no:").Append(valObj.BILL_ID).Append(",sc:1,name:'");
                if (valObj.P_BILL_ID > 0)
                {
                    sb.Append(valObj.BILL_NAME).Append("',ntype:'bill-mx'}");
                }
                else
                {
                    sb.Append(valObj.BILL_NAME).Append("',ntype:'bill'}");
                }
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
                    //txtBILL_TYPE.Value = "";
                    txtADDER.Value = "";
                    txtTABLE_NAME.Value = "";
                }
            }
        }
        else
        {
            litWarn.Text = "保存失败！";
        }
        //}
        //catch (Exception ex)
        //{
        //    litWarn.Text = ex.Message;
        //}
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="dev"></param>
    /// <param name="devtbname"></param>
    /// <param name="tbname"></param>
    /// <returns></returns>
    private DataBaseTable GetAddTable(string dev, string devtbname, ref string tbname)
    {
        DataBaseTable addTB = null;
        DataBase devDB = DataBase.Factory(BillBase.GetConnByDevKey(dev));
        if (devDB.DataTables.Contains(devtbname))
        {
            addTB = new DataBaseTable(tbname, devDB.DataTables[devtbname]);
        }
        else
            return null;
        if (DataBase.Factory(conn).DataTables.Contains(tbname))
        {
            DataBaseTable tbOld = DataBase.Factory(conn).DataTables[tbname];
            if (addTB != null && tbOld.CheckChange(addTB))
            {
                return null;
            }
            else
            {
                tbname += "_1";
                int tbncount = 1;
                while (DataBase.Factory(conn).DataTables.Contains(tbname))
                {
                    tbncount++;
                    tbname = tbname.Remove(tbname.Length - 2) + "_" + tbncount;
                }
                addTB = new DataBaseTable(tbname, devDB.DataTables[devtbname]);
            }
        }
        return addTB;
    }

}

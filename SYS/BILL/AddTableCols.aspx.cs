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
using AgileFrame.Orm.PersistenceLayer;
using System.Web.UI.HtmlControls;
public partial class SYS_BILL_AddTableCols : AgileFrame.AppInOne.Common.BaseAdminPage
{
    SYS_BILL_COL valObj =new SYS_BILL_COL();
    int count = 0;
    protected string keyid = "";
    protected string title = "";
    protected int billid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        title = "批量添加栏目";
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
            billid = int.Parse(Request["id"]);
        }
        if (ViewState["KEYID"] != null)
        {
            keyid = ViewState["KEYID"].ToString();
        }
        repTables.ViewStateMode = System.Web.UI.ViewStateMode.Disabled;
        if (!IsPostBack)
        {
            ddlDataSource.Items.Clear();
            ddlDataSource.Items.Add(new ListItem("本库", "conn_" + DataBaseType.MsSql2008));
            ddlDataSource.Items.Add(new ListItem("其他设备1", "DEV1_" + DataBaseType.MsSql));
            ddlDataSource.Items.Add(new ListItem("其他设备2", "DEV2_" + DataBaseType.MsSql));
            ddlDataSource.Items.Add(new ListItem("其他设备3", "DEV3_" + DataBaseType.MsSql));
            ddlDataSource.SelectedIndex = 0;
            ddlDataSource_OnSelectedIndexChanged(null, null);
            txtBILL_ID.Value = billid.ToString();
        }
    }

    private void LoadDataBase(bool isRe)
    {
        string key = ddlDataSource.SelectedValue.Substring(0, ddlDataSource.SelectedValue.LastIndexOf('_'));
        DataBaseType dataBaseType = (DataBaseType)Enum.Parse(typeof(DataBaseType), ddlDataSource.SelectedValue.Substring(ddlDataSource.SelectedValue.LastIndexOf('_') + 1));
        DataBase db = DataBase.Factory(BillBase.GetConnByDevKey(key));
        if (db != null)
        {
            if (isRe) db.Load(true);
            repTables.DataSource = db.DataTables;
            repTables.DataBind();
            
        }
    }

    protected void ddlDataSource_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDataBase(false);
    }

    protected void btnbtnRefreshDb_Click(object sender, EventArgs e)
    {
        LoadDataBase(true);
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(hidCheckFields.Value))
        {
            litWarn.Text = "没有选中字段";
            LoadDataBase(false);
            return;
        }
        string[] fieldNames = hidCheckFields.Value.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
        if (fieldNames.Length < 1)
        {
            litWarn.Text = "没有选中字段";
            LoadDataBase(false);
            return;
        }
        string key = ddlDataSource.SelectedValue.Substring(0, ddlDataSource.SelectedValue.LastIndexOf('_'));
        DataBaseType dataBaseType = (DataBaseType)Enum.Parse(typeof(DataBaseType), ddlDataSource.SelectedValue.Substring(ddlDataSource.SelectedValue.LastIndexOf('_') + 1));
        DataBase db = DataBase.Factory(BillBase.GetConnByDevKey(key));
        if (db == null)
        {
            litWarn.Text = "操作失败，无效的设备";
            LoadDataBase(false);
            return;
        }
        int succCount = 0;
        SYS_BILL_COL cccmax = new SYS_BILL_COL();
        cccmax.BILL_ID = billid;
        string sortStr = BLLTable<SYS_BILL_COL>.Max(SYS_BILL_COL.Attribute.SORT_NO, cccmax);
        int sort = 0;
        if (!string.IsNullOrEmpty(sortStr))
        {
            sort = int.Parse(sortStr) + 1;
        }
        SYS_BILL billObj = BLLTable<SYS_BILL>.Factory(conn).GetRowData(SYS_BILL.Attribute.BILL_ID, billid);
        SYS_BILL_CTRL ctrlCond = new SYS_BILL_CTRL();
        ctrlCond.OrderBy(TF_CTRL_TYPE.Attribute.SORT_NO, Order.Asc);
        DataTable dtCtrl = BLLTable<SYS_BILL_CTRL>.SelectForDataTable(new SYS_BILL_CTRL(), ctrlCond);
        DataView dv1 = new DataView();
        dv1.Table = dtCtrl;
        dv1.RowFilter = "P_CTRL_ID='0'";
        dv1.Sort = "SORT_NO asc";
        int ctrlid = 0;
        if (dtCtrl != null && dtCtrl.Rows.Count > 1)
        {
            ctrlid = int.Parse(dv1[0]["CTRL_ID"].ToString());
        }
        StringBuilder treeSb = new StringBuilder();
        foreach (string fieldName in fieldNames)
        {
            if (string.IsNullOrEmpty(fieldName))
                continue;
            string[] tableField = fieldName.Split('.');
            if (tableField.Length != 2)
                continue;
            if (!db.DataTables.Contains(tableField[0]))
                continue;
            DataBaseTable table = db.DataTables[tableField[0]];
            if (!table.DataFields.Contains(tableField[1]))
                continue;
            DataBaseField field = table.DataFields[tableField[1]];
            SYS_BILL_COL valObj = new SYS_BILL_COL();
            if (txtBILL_ID.Value != "")
                valObj.BILL_ID = Convert.ToInt32(txtBILL_ID.Value);

            valObj.COL_NAME = (key == "conn" ? "AIO_SYN" : key) + "_" + table.TableName + "_" + field.FieldName;

            if (BLLTable<SYS_BILL_COL>.Exists(valObj))
                continue;

            #region
            valObj.TABLE_NAME = table.TableName;

            valObj.ISPK = field.IsKeyID ? "1" : "0";

            valObj.COL_NOTE = ddlDataSource.SelectedItem.Text + (string.IsNullOrEmpty(field.Desc.ZhName) ? field.FieldName : field.Desc.ZhName);

            valObj.DATA_TYPE = field.DataType.TypeName.ToString().Replace("_", "");

            valObj.DATA_LEN = field.DataType.DataLen;

            valObj.DATA_ACC = field.DataType.Scale;

            valObj.IS_AUTO = field.IsAutoIncrease ? "1" : "0";

            valObj.SORT_NO = sort++;

            valObj.FK_SHOW = field.FieldName;

            valObj.DISPLAY_NAME = valObj.COL_NOTE;

            valObj.TITLE = valObj.COL_NOTE;

            valObj.DVAL = field.DefaultValue;

            valObj.BILL_ROW_FORMULAR = "";

            valObj.BILL_COL_FORMULAR = "";

            valObj.BILL_ISHEADER = "1";

            valObj.BILL_HERDERWIDTH = 0;

            valObj.FORM_CHECKTYPE = "string";

            valObj.FORM_CTRL_ID = ctrlid;

            valObj.FORM_SHOW = "1";

            valObj.FORM_NEED = "1";

            valObj.FORM_ONEROW = "1";

            valObj.SEARCH_INBILL = "1";

            valObj.SEARCH_TYPE = "string";

            valObj.SEARCH_FORMULAR = "LikeRight";

            if (billObj.TABLE_NAME != valObj.TABLE_NAME && key != "conn" && valObj.ISPK == "1")
            {
                valObj.ISFK = "1";
            }
            else
            {
                valObj.ISFK = "0";
            }
            valObj.FK_NAME = field.FieldName;

            valObj.BILL_AFTREDTL = "0";
            //valObj.TABLE_EXISTS = "1";
            //valObj.COL_SYN_TO = "";
            //valObj.CONN_SOURCE = key == "conn" ? "AIO_SYN" : key;

            valObj.PK_VALCODE = "";
            #endregion

            SYS_BILL_COL_EXD billExd = new SYS_BILL_COL_EXD(valObj);
            count = billExd.Add();
            if (count > 0)
            {
                if (Request["tree"] != null)
                {
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.BILL_ID).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");

                    sb.Append(valObj.COL_NAME + "[" + valObj.COL_NOTE + "]").Append("',ntype:'col'}");
                    treeSb.Append(sb.ToString());
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
                    treeSb.Append(sbData.ToString());
                    #endregion
                }
                succCount++;
            }
        }
        if (succCount > 0)
        {
            AgileFrame.Core.ScriptHelper.ResponseScript(Page, "_FormView();", false);
            litWarn.Text = "成功添加" + succCount + "个栏目";
        }
        else
        {
            litWarn.Text = "栏目添加失败";
        }
        LoadDataBase(false);
    }

    public static string stringFormat(string str, int n)
    {
        ///
        ///格式化字符串长度，超出部分显示省略号,区分汉字跟字母。汉字2个字节，字母数字一个字节
        ///
        string temp = string.Empty;
        if (System.Text.Encoding.Default.GetByteCount(str) <= n)//如果长度比需要的长度n小,返回原字符串
        {
            return str;
        }
        else
        {
            int t = 0;
            char[] q = str.ToCharArray();
            for (int i = 0; i < q.Length && t < n; i++)
            {
                if ((int)q[i] >= 0x4E00 && (int)q[i] <= 0x9FA5)//是否汉字
                {
                    temp += q[i];
                    t += 2;
                }
                else
                {
                    temp += q[i];
                    t++;
                }
            }
            return (temp + "...");
        }
    } 

    protected string GetShowTableInfo(DataBaseTable table)
    {
        if (table == null)
            return "";
        StringBuilder sb = new StringBuilder();
        string tabName = table.TableName + (string.IsNullOrEmpty(table.Desc.ZhName) ? "" : ("(" + table.Desc.ZhName + ")"));
        sb.Append("<div class=\"grp dbtable\"><input id=\"" + ("_" + table.TableName) + "\" onclick=\"tabselallfield(this);\" type=\"checkbox\" value=\"" + table.TableName + "\" title=\"" + tabName + "\" /><label for=\"" + ("_" + table.TableName) + "\" title=\"" + tabName + "\">" + stringFormat(tabName, 30) + "</label><a>展开</a></div>");
        sb.Append("<div style=\"display:none;\">");
        foreach (DataBaseField field in table.DataFields)
        {
            sb.Append("<dl class='fieldcheckboxdl" + (field.IsKeyID ? " keyfield" : "") + "'>");
            sb.Append("<dd>");
            sb.Append("<span>");
            string fidName = GetShowFieldName(field);
            sb.Append("<input id=\"" + (table.TableName + "_" + field.FieldName) + "\" onclick=\"selfield(this);\"  type=\"checkbox\" value=\"" + (table.TableName + "." + field.FieldName) + "\" title=\"" + fidName + "\" /><label for=\"" + (table.TableName + "_" + field.FieldName) + "\" title=\"" + fidName + "\">" + stringFormat(fidName, 40) + "</label>");
            sb.Append("</span>");
            sb.Append("</dd>");
            sb.Append("</dl>");
        }
        sb.Append("</div>");
        return sb.ToString();
    }

    protected string GetShowFieldName(DataBaseField field)
    {
        if (field == null)
            return "";
        return field.FieldName + (string.IsNullOrEmpty(field.Desc.ZhName) ? "" : ("(" + field.Desc.ZhName + ")"));
    }
}

using AgileFrame.Core;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Common;
using AgileFrame.AppInOne.Common;

public partial class test_Default4 : BaseAdminPage
{
    public Dictionary<string, string> tableMap = new Dictionary<string, string>();
    public string currTable = null;
    public string currZhTable = null;
    public int currTableId = 0;
    public string selectedTempName = "";
    public string fieldHtml = "";
    public string html = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        ////id=1612&amp;pid=161&amp;no=1&amp;name=%u8BE6%u7EC6%u5E03%u5C40&amp;sc=0&amp;ntype=TF_DESIGN_DETAIL&amp;level=0111&amp;
       // string id = HttpUtil.GetReqStrValue("id");
        string pid = HttpUtil.GetReqStrValue("pid");
     //   string no = HttpUtil.GetReqStrValue("no");
//        string name = HttpUtil.GetReqStrValue("name");
  //      string sc = HttpUtil.GetReqStrValue("sc");
   //     string ntype = HttpUtil.GetReqStrValue("ntype");
        //DataBase db = DataBase.Factory(conn);
        //foreach (DataBaseTable dt1 in db.DataTables_USER)
        //{
        //    tableMap.Add(dt1.TableName,dt1.ZhName);
        //}
        TF_FORM conf1 = new TF_FORM();
        conf1.FORM_ID = Convert.ToInt32(pid);
        TF_FORM val1 = new TF_FORM();
        val1.TB_ID = 1;
        TF_FORM valObj1 = BLLTable<TF_FORM>.GetRowData(val1, conf1);

        TF_TABLE conf2 = new TF_TABLE();
        conf2.TB_ID = valObj1.TB_ID;
        TF_TABLE val2 = new TF_TABLE();
        val2.TB_NAME = "";
        val2.CH_NAME = "";
        val2.TB_ID = 0;
        TF_TABLE valObj2 = BLLTable<TF_TABLE>.GetRowData(val2, conf2);
        currTable = valObj2.TB_NAME;
        currZhTable = valObj2.CH_NAME;
        currTableId = valObj2.TB_ID;
        V_TF_TEMPLATE_TABLENAME conf = new V_TF_TEMPLATE_TABLENAME();
        conf.Distinct = true;
        conf.USER_ID = Convert.ToInt32(userBase.StaffID);
        List<V_TF_TEMPLATE_TABLENAME> templateList = BLLTable<V_TF_TEMPLATE_TABLENAME>.Select(new V_TF_TEMPLATE_TABLENAME(), conf);
        foreach (V_TF_TEMPLATE_TABLENAME temp in templateList)
        {
            ITableImplement itable = new ITableImplement();
            itable.setConn(conn).setModule(temp.TABLE_NAME);
            if (!tableMap.ContainsKey(temp.TABLE_NAME))
            {
                tableMap.Add(temp.TABLE_NAME, temp.CH_NAME);
            }
           
        }


        TF_CUSTOM_TEMPLATE conf3 = new TF_CUSTOM_TEMPLATE();
        conf3.TABLE_NAME = valObj2.TB_NAME;
        conf3.USER_ID = Convert.ToInt32(userBase.StaffID);
        conf3.TYPE = 0;
        List<TF_CUSTOM_TEMPLATE> templateList2 = BLLTable<TF_CUSTOM_TEMPLATE>.Select(new TF_CUSTOM_TEMPLATE(), conf3);
        html = "<option value='-1'>--无--</option>";
        foreach (TF_CUSTOM_TEMPLATE template in templateList2)
        {
            if (template.STATUS == 1)//被选中
            {
                selectedTempName = template.TEMPLATE_NAME;
                html += "<option value='" + template.ID + "' selected='selected'>" + template.TEMPLATE_NAME + "</option>";
            }
            else
            {
                html += "<option value='" + template.ID + "'>" + template.TEMPLATE_NAME + "</option>";
            }
        }
        ITableImplement itable2 = new ITableImplement();
        itable2.setConn(conn).setModule(valObj2.TB_NAME);
        DataBaseField[] dataBaseFields = itable2.af_GetAvailableDataBaseField();
        fieldHtml = "<ul>";
        foreach (DataBaseField dataBaseField in dataBaseFields)
        {
            TF_TB_FIELD conf4 = new TF_TB_FIELD();
            conf4.FIELD_NAME = dataBaseField.FieldName;
            TF_TB_FIELD val4 = BLLTable<TF_TB_FIELD>.GetRowData(conf4);
            if (val4 != null)
            {
                fieldHtml += "<li><div fieldname='" + dataBaseField.FieldName + "'>" + (string.IsNullOrEmpty(val4.NOTE)? dataBaseField.FieldName : val4.NOTE) + "</div></li>";
            }
            else
            {
                fieldHtml += "<li><div fieldname='" + dataBaseField.FieldName + "'>" + dataBaseField.FieldName + "</div></li>";
            }
        }
        fieldHtml += "</ul>";
     //   Response.Write("{\"html\":\"" + html + "\",\"fieldHtml\":\"" + fieldHtml + "\"}");

    }
}
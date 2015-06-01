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
using AgileFrame.Common;
using AgileFrame.Orm.TemplateEngine;
using AgileFrame.Core.WebSystem;
using System.IO;

public partial class Back : BasePage //BaseAdminPage
{
    ITableImplement valObj = new ITableImplement();
    protected AttributeItem KeyID = null;
    protected List<DataBaseField> fieldList = new List<DataBaseField>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["deleteFile"]==null){
            base.InitModule(ref valObj, ref KeyID, ref fieldList);
        }

        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelID"] != null)
        {
            valObj.SetValue(valObj.KeyID, Request["DelID"]);
            int re = BLLTable<ITableImplement>.Factory(conn).Delete(valObj);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            ITableImplement cond = valObj;
            cond.In(AttributeItem.Factory(cond.DataBaseTable.IDField), Request["DelKeyIDS"]);
            int re = BLLTable<ITableImplement>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            valObj.SetValue(valObj.KeyID, Request["FieldKeyID"]);
            List<AttributeItem> lstCol = valObj.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    valObj.SetValue(lstCol[i], Request["txt" + lstCol[i].FieldName]);
                }
            }
            BLLTable<ITableImplement>.Factory(conn).Update(valObj, valObj.KeyID);
            Response.Write("修改记录信息成功");
        }
        //删除本地文件
        if (Request["deleteFile"] != null)
        {
            //string filepath=WebHelper.GetAppPath() + Request["fileName"];
            string filepath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + Request["fileName"]; ;
            if (File.Exists(filepath)) {
                File.Delete(filepath);
            }
        }
        //分页AJAX请求
        if(Request["paging"]!=null){
               int pageSize = 10; int pageIndex = 1; int count1 = -1;
                
                pageIndex = Convert.ToInt32(HttpUtil.GetReqStrValue("pageIndex"));
                int num = Convert.ToInt32(HttpUtil.GetReqStrValue("num")); ;
                StringBuilder sb = new StringBuilder();
                try
                {
                    //DataBaseField[] flist = valObj.af_GetAvailableDataBaseField();
                    //foreach (DataBaseField f1 in flist)               
                    {
                        //父表的id
                        object id1 = HttpUtil.GetReqStrValue("id1");

                        string tableName1 = "关系表1";
                        if (valObj.DataBaseTable.SubTable_ChaZhao.Count > 0)
                        {
                            // foreach (DataBaseTableRelation dr1 in valObj.DataBaseTable.SubTable_ChaZhao)
                            //{
                            DataBaseTableRelation dr1 = valObj.DataBaseTable.SubTable_ChaZhao[num];
                            DataBaseTable table2 = dr1.DataBaseTable;
                            tableName1 = table2.TableName;
                            DataBaseField IDField = dr1.DataBaseTable.IDField;
                            DataBaseField NameField = dr1.DataBaseTable.NameField;
                            List<Relation> lstRel = new List<Relation>();
                            foreach (DataBaseRelation r1 in dr1.Relations)
                            {
                                lstRel.Add(new Relation(r1));
                            }
                            ITableImplement value2 = new ITableImplement(table2);

                            ITableImplement cond2 = new ITableImplement(table2);
                            cond2.SetValue(AttributeItem.Factory(value2.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.IDField), id1);
                            List<ITableImplement> lstCond = new List<ITableImplement>();
                            lstCond.Add(cond2);

                            List<ITableImplement> lstOther = new List<ITableImplement>();



                            //显示明显表的 父表的信息
                            //value2.setConn(conn).setModule("WEC_QC_CARS");
                            List<ITableImplement> list2 = BLLTable<ITableImplement>.Factory(conn).SelectByPage(value2, lstRel, lstOther, lstCond,
                                pageSize, pageIndex, ref count1);
                            //  BLLTable.SQL_Test.ToString();
                            if (list2.Count > 0)
                            {

                                foreach (ITableImplement tb2 in list2)
                                {
                                    sb.Append("<tr>");
                                    foreach (DataBaseField d2 in tb2.af_GetAvailableDataBaseField())
                                    {
                                        sb.Append("<td>" + GetHtmlList(d2, tb2) + "");
                                    }
                                    sb.Append("</tr>");
                                }
                            }
                        }

                    }
                }
                catch (Exception ex)
                {

                }
                Response.Write(sb.ToString());
            }

        //下载文件
        if(Request["download"]!=null){
            string filename = Request["filename"];
            string fullpath =Request.PhysicalApplicationPath +filename;
            Response.ContentType = "APPLICATION/OCTET-STREAM";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + filename.Substring(filename.LastIndexOf("/") + 1));
            FileStream fs = new FileStream(fullpath,FileMode.Open);
            int len=(int)fs.Length;
            byte[] buf = new byte[len];
            int count;                            
            int sum = 0;

            while ((count = fs.Read(buf, 0, len)) > 0)
            {
              sum += count;  
              Response.OutputStream.Write(buf,0,count);
           }
        }
        Response.End();

    }
    public string GetHtmlList(DataBaseField f1, ITableImplement this1)
    {
        if (!f1.Desc.af_Enable) return "";//是否可用
        if (!f1.Desc.af_Visable) return "";//是否可见
        string html = "";
        string tableName = f1.TableName;
        AttributeItem attr1 = AttributeItem.Factory(f1);
        object value1 = (this1.GetValue(attr1));
        DataBaseTable dt1 = f1.DataBaseTable; //DataBaseField f1;
        //if (AgileFrame.Orm.PersistenceLayer.DAL.Base.RunTime.Factory(this1.ConnectKey).DataBase
        //    .TryGetValueAll(tableName, f1.FieldName, out dt1, out f1))
        {
            try
            {
                DataBaseField id1 = dt1.IDField;
                DataBaseField name1 = dt1.NameField;

                if (f1 == dt1.IDField)
                {
                    //html = "<a href='index.aspx?id=" + this1.GetValue(dt1.FieldID.FieldName) + "'>" + html + "</a>";
                }
                else if (f1 == dt1.NameField)// != null && dt1.NameField.FieldName == f1.FieldName)//本模块name详细链接
                {
                    html = "<a href='../" + dt1.TableName + "/show.aspx?id=" + this1.GetValue(id1) + "' target='_blank'>" + value1 + "</a>";
                }
                else if (isSelect(f1))//枚举量
                {
                    html = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr1, value1);
                }
                else if (isChaZhao(f1))//父表
                {
                    DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                    AttributeItem attr2 = AttributeItem.Factory(f2);
                    html = Convert.ToString(this1.GetValue(attr2));
                }
                else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpImage)
                {
                    html = "<img src ='" + value1 + "' style='height:40px' />";
                }
            }
            catch (Exception ex)
            {
                Cs.Error(ex.ToString());
            }
        }
        if (html == "")
        {
            html = Convert.ToString(value1);
        }
        return html;
    }
    private bool isSelect(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.RadioBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.CheckBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectDrop
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectSingle
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectMultiple)
        {
            return true;
        }
        return false;
    }
    private bool isChaZhao(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationUser
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationFK)//父表
        {
            return true;
        }
        return false;
    }
}
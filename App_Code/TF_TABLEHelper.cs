using System;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Core;
using AgileFrame.Common;
using AgileFrame.Orm.TemplateEngine;
using System.IO;
using AgileFrame.Core.WebSystem;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.DAL.Base;
using AgileFrame.AppInOne.WF;

namespace AgileFrame.Common
{
    public class RelationFactory
    {
        public static Relation TF_TABLE_TF_TABLE = new Relation(TF_TABLE.Attribute.TB_ID, TF_TABLE.Attribute.M_TB_ID);
        public static Relation TF_TABLE_TF_FORM = new Relation(TF_TABLE.Attribute.TB_ID, TF_FORM.Attribute.TB_ID);
        public static Relation TF_TABLE_TF_TB_FIELD = new Relation(TF_TABLE.Attribute.TB_ID, TF_TB_FIELD.Attribute.TB_ID);
        public static Relation TF_TB_FIELD_TF_F_COLUMN = new Relation(TF_TB_FIELD.Attribute.FIELD_ID, TF_F_COLUMN.Attribute.FIELD_ID);
    }
    /// <summary>
    /// 数据库操作类
    /// </summary>
    public class TF_TABLEHelper
    {
        protected string ListItemHtml(ListItem[] listItem)
        {
            StringBuilder sb = new StringBuilder();
            foreach (ListItem item in listItem)
            {
                string selected = "";
                sb.Append(string.Format("<option value='{0}' {1}>{2}</option>", item.Value, selected, item.Text));
            }
            return sb.ToString();
        }
        #region 获取Template 与 HTML
        /// <summary>
        /// 属性对象，值对象。适用于 Lit_Finder, Edit, Show
        /// condObj 双向绑定
        /// Lit_Finder.Text = Lit_Finder.Text.Replace("TF_TABLE.", "");
        /// txtTB_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TABLE.Attribute.TB_TYPE));
        /// </summary>
        public string GetTemplate(string template, ITableImplement valObj)
        {
            try
            {
                BuildByTemplate bt = new BuildByTemplate(BuildType.ForHtmlTemplate);
                bt.ConnectKey = conn;
                string template1 = bt.BuildByStr(template, "bs", Parse(valObj, null), @"c:\123.txt");
                return template1;
            }
            catch (Exception ex)
            {
                File.AppendAllText(Path.Combine(WebHelper.GetAppPath(), "abc.txt"), ex.ToString());
                throw ex;
            }
            return "";
        }
        public string GetTemplate(string template, ITableImplement valObj, ITableImplement condObj)
        {
            try
            {
                BuildByTemplate bt = new BuildByTemplate(BuildType.ForHtmlTemplate);
                bt.ConnectKey = conn;
                string template1 = bt.BuildByStr(template, "bs", Parse(valObj, condObj), @"c:\123.txt");
                return template1;
            }
            catch (Exception ex)
            {
                File.AppendAllText(Path.Combine(WebHelper.GetAppPath(), "abc.txt"), ex.ToString());
                throw ex;
            }
            return "";
        }
        ///////////////////////////////////////////////
        /// <summary>
        /// 属性列表对象。适用于repList_ItemDataBound
        /// </summary>
        public string GetTemplate(string template, List<TF_TABLE> listObj)
        {
            if (listObj.Count == 0)
                return "";
            return GetTemplate(template, listObj[0]);
        }
        public string GetTemplate(string template, List<ITableImplement> listObj)
        {
            if (listObj.Count == 0)
                return "";
            return GetTemplate(template, listObj[0]);
        }
        //////////////////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// 属性列表对象。适用于repList_ItemDataBound
        /// </summary>
        public string GetHTML(string templateList, ITableImplement valObj)
        {
            BuildByTemplate bt = new BuildByTemplate(BuildType.ForHtmlValue);
            bt.ConnectKey = conn;
            string htmlEdit = bt.BuildByStr(templateList, "bs", valObj, @"c:\123.txt");
            return htmlEdit;
        }
        /// <summary>
        /// 属性列表对象。适用于repList_ItemDataBound
        /// </summary>
        public string GetHTML(string templateList, List<ITableImplement> listObj)
        {
            BuildByTemplate bt = new BuildByTemplate(BuildType.ForHtmlValue);
            bt.ConnectKey = conn;
            string htmlList = bt.BuildByStr(templateList, "bs", listObj, @"c:\123.txt");
            return htmlList;
        }
        public string GetHTML(string templateList, List<TF_TABLE> listObj)
        {
            List<ITableImplement> listObj1 = new List<ITableImplement>();
            foreach (TF_TABLE tb in listObj)
                listObj1.Add(tb);
            return GetHTML(templateList, listObj1);
        }
        #endregion 获取string
        
        /// <summary>
        /// 从取值对象中获得属性，从条件对象中获得值
        /// </summary>
        /// <param name="valObj"></param>
        /// <param name="condObj"></param>
        /// <returns></returns>
        public List<DataBaseField> Parse(ITableImplement valObj, ITableImplement condObj)
        {            
            List<DataBaseField> list2 = new List<DataBaseField>();
            List<AttributeItem> list = new List<AttributeItem>();
            list.AddRange(valObj.af_GetAvailableAttributeItem());
            if (list.Count == 0)
                list.AddRange(valObj.af_AttributeItemList);

            string tbName = valObj._TableName.ToLower();
            if (tbName == ITableImplement.defaultTableName.ToLower())
                tbName = list[0].TableName;
            #region 表操作
            DataBaseTable dt1 = null;
            dt1 = Runtime_PersistenceLayer.Factory(conn).DataBase.DataTables[tbName];
            if (dt1 == null)
            {
                ConsoleService.Warn(tbName + " 数据表不存在");
                return new List<DataBaseField>();
            }
            #endregion

            foreach (AttributeItem item in list)
            {
                string fieldName = item.FieldName.ToLower();
                #region 列操作
                DataBaseField f1 = null;
                if (!dt1.DataFields.TryGetValue(fieldName, out f1))
                {
                    ConsoleService.Warn(string.Format("数据表{0},数据字段{1}不存在", tbName, fieldName));
                    continue;
                }
                if (f1.Desc.CtrlType == BaseCtrlType.Text || f1.Desc.CtrlType == BaseCtrlType.HTML
                     || f1.Desc.CtrlType == BaseCtrlType.SmallText)
                    continue;
                if (condObj != null && condObj.IsNotNull()) 
                    f1.Value = condObj.GetString(item);
                #endregion
                list2.Add(f1);
            }
            return list2;
        }
        public List<ITableImplement> Select(List<DataBaseField> list)
        {
            foreach (DataBaseField f1 in list)
            {

            }
            return new List<ITableImplement>();
        }
        /// <summary>
        /// TF_FORM 从配置中获得表单布局
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="cond"></param>
        /// <returns></returns>
        public bool Parse(TF_TABLE cond,
            out ITableImplement valObj, out ITableImplement condObj, out List<Relation> relationList, out List<ITableImplement> otherValueList,
             out List<ITableImplement> condList, ref string msg)
        {
            valObj = new ITableImplement();
            condObj = new ITableImplement();
            //载入关系
            otherValueList = new List<ITableImplement>();
            condList = new List<ITableImplement>();
            relationList = new List<Relation>();

            msg = "条件不存在";
            if (string.IsNullOrEmpty(cond.TB_NAME))
                return false;

            DataBaseTable tb1;
            List<DataBaseField> listf1 = new List<DataBaseField>();
            List<DataBaseTable> listTb1 = new List<DataBaseTable>();


            bool ret = true; tb1 = null;
            //TF_TABLE val = BLLTable<TF_TABLE>.Factory(conn).GetRowData(new TF_TABLE(), cond);

            TF_TB_FIELD val1 = new TF_TB_FIELD();
            TF_F_COLUMN val2 = new TF_F_COLUMN();
            TF_TABLE val3 = new TF_TABLE();

            TF_TB_FIELD cond1 = new TF_TB_FIELD();
            TF_F_COLUMN cond2 = new TF_F_COLUMN();
            TF_FORM cond3 = new TF_FORM();
            List<ITableImplement> otherValueList1 = new List<ITableImplement>();
            List<ITableImplement> condList1 = new List<ITableImplement>();

            otherValueList1.Add(val2); otherValueList1.Add(val3);

            condList1.Add(cond);
            List<Relation> relationList1 = new List<Relation>();
            relationList1.Add(RelationFactory.TF_TABLE_TF_FORM);
            relationList1.Add(RelationFactory.TF_TABLE_TF_TB_FIELD);
            relationList1.Add(RelationFactory.TF_TB_FIELD_TF_F_COLUMN);

            int pageSize = 100;
            int pageIndex = 1;
            int recount = -1;
            string cachekey = null;
            List<TF_TB_FIELD> list1 = BLLTable<TF_TB_FIELD>.Factory(conn).SelectByPage(val1, relationList1, otherValueList1, condList1,
                pageSize, pageIndex, ref recount, out cachekey);

            if (list1.Count == 0)
            {
                DataBaseTable dt1 = null;
                dt1 = Runtime_PersistenceLayer.Factory(conn).DataBase.DataTables[cond.TB_NAME];
                msg = cond.TB_NAME + " 数据表不存在";
                if (dt1 == null)
                {
                    ret = false;
                    ConsoleService.Warn(msg);
                }
                return ret;
            }
            if (list1.Count > 90)
            {
                msg = "条件错误，所配置的字段记录超过90";
                return false;
            }
            //生成布局模版用
            tb1 = new DataBaseTable();
            foreach (TF_TB_FIELD item in list1)
            {
                string tbName = Convert.ToString(item.GetValue(TF_TABLE.Attribute.TB_NAME)).ToLower();
                #region 表操作
                DataBaseTable dt1 = null;
                dt1 = Runtime_PersistenceLayer.Factory(conn).DataBase.DataTables[tbName];
                msg = tbName + " 数据表不存在"; ret = false;
                if (dt1 == null)
                {
                    ConsoleService.Warn(msg);
                    return ret;
                }
                tb1 = dt1;
                listTb1.Add(dt1);
                //是否显示
                object obj1 = null;
                object obj2 = null;
                object obj3 = null;
                if (item.TryGetValue(TF_FORM.Attribute.FORM_ID, out obj1))
                {
                    dt1.IsVisable = true;
                }

                #endregion
                string fieldName = item.FIELD_NAME.ToLower();
                #region 列操作
                DataBaseField f1 = null;
                msg = string.Format("数据表{0},数据字段{1}不存在", tbName, fieldName);
                if (!dt1.DataFields.TryGetValue(fieldName, out f1))
                {
                    ret = false;
                    ConsoleService.Warn(msg);
                    continue;
                }
                //是否显示
                obj1 = null; obj2 = null; obj3 = null;
                if (item.TryGetValue(TF_F_COLUMN.Attribute.COLUMN_ID, out obj1)
                    && item.TryGetValue(TF_F_COLUMN.Attribute.SHOW_NAME, out obj2)
                    && item.TryGetValue(TF_F_COLUMN.Attribute.CTRL_TYPE, out obj3))
                {
                    //f1.IsVisable = true;
                }
                #endregion
                listf1.Add(f1);
            }
            //取值对象
            valObj = ITableImplement.Factory(tb1);
            //其他取值对象
            foreach (DataBaseTable tb2 in listTb1)
            {
                if (tb2.TableName == tb1.TableName) continue;
                otherValueList.Add(ITableImplement.Factory(tb2));

            }
            //关系呢
            return ret;
        }
        /// <summary>
        /// 表id为条件的相关对象 取得所有相关对象 的所有表
        /// </summary>
        /// <param name="conn"></param>
        /// <param name="cond"></param>
        /// <returns></returns>
        public List<TF_TABLE> GetRelationTable(TF_TABLE cond)
        {
            TF_TABLE val1 = new TF_TABLE();
            TF_TABLE val2 = new TF_TABLE();
            List<Relation> relationlist = new List<Relation>();
            relationlist.Add(RelationFactory.TF_TABLE_TF_TABLE);
            List<TF_TABLE> list1 = BLLTable<TF_TABLE>.Factory(conn).Select(val1, RelationFactory.TF_TABLE_TF_TABLE, val2, cond);
            return list1;
        }

        /// <summary>
        /// 创建表
        /// </summary>
        public int AddTableWithDefaultCols(TF_TABLE tbObj,string sourceTable,string sourceConn, ref string errMsg)
        {
            string tbname = tbObj.TB_NAME;
            DataBaseTable tb1 = null;
            if (!DataBase.Factory(conn).TryGetValue(tbname, out tb1))//如果表不存在，则新建表，带默认字段
            {
                DataBaseTable tb2 = null;
                if (tbObj.M_TB_ID > 0)
                {
                    //if (!DataBase.Factory(conn).Master().TryGetValue("GROUP_WF_MX", out tb2))
                    //    return 0;
                    if (!DataBase.Factory(conn).Master().TryGetValue("af_GROUP_WF_MX_2014", out tb2))
                        return 0;
                }
                else
                {
                    //if (!DataBase.Factory(conn).Master().TryGetValue("GROUP_WF", out tb2))
                    //    return 0;
                    if (!DataBase.Factory(conn).Master().TryGetValue("af_GROUP_WF_2014", out tb2))
                        return 0;
                }
                DataBaseTable tb3 = new DataBaseTable(tbname, tb2);
                DataBaseTable tbsource = null;
                if (!string.IsNullOrEmpty(sourceTable) && DataBase.Factory(sourceConn).TryGetValue(sourceTable, out tbsource))
                {
                    foreach (DataBaseField f2 in tbsource.DataFields)
                    {
                        tb3.DataFields.Add(f2);
                    }
                }
                if (DataBase.Factory(conn).AddTable(tb3, ref errMsg))
                    return 1;
                else
                    return 0;

            }
            //else
            //{
            //    SaveToTF_TB_FIELD(tbObj, ref errMsg);
            //}
            return 1;
        }
        public int SaveToTF_TB_FIELD(TF_TABLE tbObj, ref string errMsg)
        {
            return SaveToTF_TB_FIELD(tbObj.TB_NAME, tbObj.TB_ID, ref errMsg);
        }
        /// <summary>
        /// 根据已存在的表，将物理字段，保存入 TF_TB_FIELD 表中
        /// </summary>
        /// <param name="tb1"></param>
        /// <param name="tbObj"></param>
        /// <returns></returns>
        public int SaveToTF_TB_FIELD(string TB_NAME, int TB_ID, ref string errMsg)
        {
            errMsg = "";
            string tbname = TB_NAME;
            DataBaseTable tb1 = null;
            DataBaseTable tb2 = new DataBaseTable();
            DataBaseTable tb3 = new DataBaseTable();
            if (DataBase.Factory(conn).TryGetValue(tbname, out tb1))//如果表不存在，则新建表，带默认字段
            {
                foreach (DataBaseField f2 in tb1.DataFields)
                {
                    DataBase.Factory(conn).Master().TryGetValue("af_GROUP_WF_2014", out tb2);

                    DataBase.Factory(conn).Master().TryGetValue("af_GROUP_WF_MX_2014", out tb3);

                    if (!tb2.DataFields.Contains(f2.FieldName) && !tb3.DataFields.Contains(f2.FieldName))
                    {
                        TF_TB_FIELD f1 = Parse(f2);
                        f1.TB_ID = TB_ID;

                        int count1 = 0;
                        TF_TB_FIELD cond1 = new TF_TB_FIELD();
                        cond1.TB_ID = f1.TB_ID;
                        cond1.FIELD_NAME = f1.FIELD_NAME;
                        //count1 = BLLTable<TF_TB_FIELD>.Factory(conn).SaveOrUpdate(f1, cond1, TF_TB_FIELD.Attribute.FIELD_ID);

                        if (BLLTable<TF_TB_FIELD>.Factory(conn).Exists(cond1))
                        {
                            count1 = BLLTable<TF_TB_FIELD>.Factory(conn).Update(f1, TF_TB_FIELD.Attribute.FIELD_ID);
                        }
                        else
                        {
                            count1 = BLLTable<TF_TB_FIELD>.Factory(conn).Insert(f1, TF_TB_FIELD.Attribute.FIELD_ID);
                        }


                        if (count1 < 1)
                        {
                            Cs.Error("插入 TF_TB_FIELD 失败");
                        }
                    }

                }
                return 1;
            }
            return -1;
        }
        public TF_TB_FIELD Parse(DataBaseField f2)
        {
            int sortInt = 0;
            TF_TB_FIELD f1 = new TF_TB_FIELD();
            f1.FIELD_NAME = f2.FieldName;
            f1.NOTE = f2.Desc.ZhName;
            f1.DEFAULT_VAL = f2.DefaultValue;
            //f1.TB_ID;
            sortInt++;
            f1.SORT_NO = sortInt;
            f1.IS_KEY = (f2.IsKeyID) ? 1 : 0;
            f1.IS_AUTONUM = (f2.IsAutoIncrease) ? 1 : 0;
            f1.IS_NULL = (f2.IsAllowNull) ? 1 : 0;
            f1._CREATED = 1;
            switch (f2.Desc.Switch_CtrlType)
            {
                //case BaseCtrlType.SelectDrop:                    
                default:
                    f1._CTRL_TYPE = f2.Desc.Switch_CtrlType == BaseCtrlType.UnKnown ? BaseCtrlType.InputString.ToString() : f2.Desc.Switch_CtrlType.ToString();
                    //f1._DB_TYPE = f2.DataType.TypeNameString;
                    f1._DB_TYPE = f2.DataType.GetParamSql();//char(8), decaml(8,0)
                    f1.TYPE_CODE = StringHelper.HeadUpper(f2.DataType.NetType);
                    f1.TYPE_ID = 0;
                    break;
            }
            return f1;
        }
        /// <summary>
        /// 编辑表 2 为建表成功，无需改名，1为存在旧表，-1为异常。
        /// </summary>
        public int EditTable(string oldname, TF_TABLE tbObj, ref string errMsg)
        {
            int ret = 0;
            try
            {
                string newname = tbObj.TB_NAME;
                if (oldname == newname)
                    return 2;
                //修改正式表字段名称或类型
                DataBaseTable oldt1 = null;
                DataBaseTable newt1 = null;
                bool oldExist = DataBase.Factory(conn).TryGetValue(oldname, out oldt1);
                errMsg = "被修改的表不存在";
                if (!oldExist)
                    return 0;
                bool newExist = DataBase.Factory(conn).TryGetValue(tbObj.TB_NAME, out newt1);
                errMsg = "新表名已被其他用户使用，请重新命名";
                if (newExist)
                    return 0;
                if (oldt1.ChangeName(newname))
                    return 1;
                else
                    return 0;
            }
            catch (Exception ex)
            {
                errMsg = ex.ToString();
                return -1;
            }
            return ret;
        }
        string conn = "conn";
        public static TF_TABLEHelper Factory(string conn)
        {
            return new TF_TABLEHelper(conn);
        }
        public TF_TABLEHelper(string conn)
        {
            this.conn = conn;
        }
        /// <summary>
        /// 根据字段名，更新或插入字段 到物理表
        /// </summary>
        /// <param name="field"></param>
        /// <param name="oldbame"></param>
        /// <param name="errMsg"></param>
        /// <returns></returns>
        public int SaveOrUpdateField(TF_TB_FIELD field, string oldbame, ref string errMsg)
        {
            int ret = 0;
            if (string.IsNullOrEmpty(oldbame))//插入
            {
                //ret = AddField(field, ref errMsg);
                ret = InsertOrUpdateField(field, oldbame, ref errMsg);
                if (ret <= 0)
                    errMsg = "物理数据库中新增字段失败！" + errMsg;
            }
            else
            {
                ret = InsertOrUpdateField(field, oldbame, ref errMsg);
                if (ret <= 0)
                    errMsg = "物理数据库中编辑字段失败！" + errMsg;
            }
            return ret;
        }
        /// <summary>
        /// 增加列 -废弃
        /// </summary>
        public int AddField(TF_TB_FIELD field, ref string errMsg)
        {
            try
            {
                //TF_TABLE tbObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, field.TB_ID);
                //string tbname = tbObj.TB_NAME;
                //string colname = field.FIELD_NAME;
                //string sqlcoltype = field.DB_TYPE;

                //string msg = null;
                ////修改正式表字段名称或类型
                //DataBaseTable t1 = null;
                //if (DataBase.Factory(conn).TryGetValue(tbname, out t1))
                //{
                //    DataBaseField newf1 = new DataBaseField(colname);
                //    if (field.IS_NULL == 0)
                //        newf1.IsAllowNull = true;
                //    newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);

                //    if (!t1.AddField(newf1, ref msg))
                //    {
                //        errMsg += msg; return 0;
                //    }
                //}

                //tbname = WFOBJECT_BLL.GetWFTempTBName(tbObj); //tbObj.WF_TB_NAME;
                ////修改正式表字段名称或类型
                //t1 = null;
                //if (!string.IsNullOrEmpty(tbname) && DataBase.Factory(conn).TryGetValue(tbname, out t1))
                //{
                //    DataBaseField newf1 = new DataBaseField(colname);
                //    if (field.IS_NULL == 0)
                //        newf1.IsAllowNull = true;
                //    newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);

                //    if (!t1.AddField(newf1, ref msg))
                //    {
                //        errMsg += msg; return 0;
                //    }
                //}
                return 1;
            }
            catch (Exception ex)
            {
                errMsg = ex.ToString();
                return 0;
            }
        }
        /// <summary>
        /// 操作物理表字段，插入或更新
        /// </summary>
        public int InsertOrUpdateField(TF_TB_FIELD field, string oldbame, ref string errMsg)
        {
            try
            {
                if (string.IsNullOrEmpty(oldbame))
                    oldbame = field.FIELD_NAME;
                int tb_id = field.TB_ID;
                int FIELD_ID = field.FIELD_ID;
                if (FIELD_ID != 0)//修改的时候
                {
                    if (tb_id == 0)
                    {
                        errMsg = "物理数据库中新增字段失败！";
                        tb_id = Convert.ToInt32(BLLTable<TF_TB_FIELD>.Factory(conn).GetOneValue(TF_TB_FIELD.Attribute.FIELD_ID,
                            field.FIELD_ID, TF_TB_FIELD.Attribute.TB_ID));
                        field.TB_ID = tb_id;
                    }
                }
                TF_TABLE tbObj = null;
                if (tb_id != 0)//插入的时候
                {
                    errMsg = "物理数据库中编辑字段失败！";
                    tbObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, tb_id);
                }
                string tbname = tbObj.TB_NAME;
                string colname = field.FIELD_NAME;
                string sqlcoltype = field.DB_TYPE;//decimal(10,0)
                string msg = null;

                //修改正式表字段名称或类型
                DataBaseField f1 = null;
                DataBaseTable t1 = null;
                if (DataBase.Factory(conn).TryGetValue(tbname, oldbame.Trim(), out t1, out f1))
                {
                    DataBaseField newf1 = f1.Clone();
                    if (field.IS_NULL == 0)
                        newf1.IsAllowNull = true;
                    newf1.FieldName = field.FIELD_NAME;
                    newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);
                    if (!newf1.Update(f1, true, ref msg))
                    {
                        errMsg += msg; return 0;
                    }
                }
                else//如果没有存在，则新增
                {
                    DataBaseField newf1 = new DataBaseField();
                    if (field.IS_NULL == 0)
                        newf1.IsAllowNull = true;
                    newf1.FieldName = field.FIELD_NAME;
                    newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);
                    if (!t1.AddField(newf1, ref msg))
                    {
                        errMsg += msg; return 0;
                    }
                    if (!DataBase.Factory(conn).TryGetValue(tbname, newf1.FieldName, out t1, out f1))
                    {
                        errMsg += "未存在";
                    }
                }

                #region//流程对应流程的临时表对应的字段信息
                tbname = WFOBJECT_BLL.GetWFTempTBName(tbObj); //tbObj.WF_TB_NAME;
                //修改正式表字段名称或类型
                f1 = null;
                t1 = null;
                //CHG START 为空条件判断有误 jin-shenjian 2013/10/12
                //if (!string.IsNullOrEmpty(tbname) && DataBase.Factory(conn).TryGetValue(tbname, oldbame, out t1, out f1))
                if (!string.IsNullOrEmpty(tbname))
                {
                    if (DataBase.Factory(conn).TryGetValue(tbname, oldbame, out t1, out f1))
                    //CHG END 为空条件判断有误 jin-shenjian 2013/10/12
                    {
                        DataBaseField newf1 = f1.Clone();
                        if (field.IS_NULL == 0)
                            newf1.IsAllowNull = true;
                        newf1.FieldName = field.FIELD_NAME;
                        newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);
                        if (!newf1.Update(f1, true, ref msg))
                        {
                            errMsg += msg; return 0;
                        }
                    }
                    else//如果没有存在，则新增
                    {
                        DataBaseField newf1 = new DataBaseField();
                        if (field.IS_NULL == 0)
                            newf1.IsAllowNull = true;
                        newf1.FieldName = field.FIELD_NAME;
                        newf1.DataType = FieldDataType.FromString(t1.DataBase.DataBaseType, sqlcoltype, true);
                        if (!t1.AddField(newf1, ref msg))
                        {
                            errMsg += msg; return 0;
                        }
                        if (!DataBase.Factory(conn).TryGetValue(tbname, newf1.FieldName, out t1, out f1))
                        {
                            errMsg += "未存在";
                        }
                    }
                }
                #endregion

                return 1;
            }
            catch (Exception ex)
            {
                errMsg = ex.ToString();
                return 0;
            }
        }
        public int DelField(string fieldid, ref string errMsg)
        {
            try
            {
                TF_TB_FIELD field = BLLTable<TF_TB_FIELD>.Factory(conn).GetRowData(TF_TB_FIELD.Attribute.FIELD_ID, fieldid);
                string tbname = BLLTable<TF_TABLE>.Factory(conn).GetOneValue(TF_TABLE.Attribute.TB_ID, field.TB_ID, TF_TABLE.Attribute.TB_NAME);
                
                string msg = null;
                DataBaseField f1 = null;
                DataBaseTable t1 = null;
                if (DataBase.Factory(conn).TryGetValue(tbname, field.FIELD_NAME, out t1, out f1))
                {
                    if (!t1.DeleteField(field.FIELD_NAME, false, ref msg))
                    {
                        errMsg += msg; return 0;
                    }
                }
                return 1;
            }
            catch (Exception ex)
            {
                errMsg = ex.ToString();
                return -1;
            }
        }
        public int DelTable(string tbid, ref string errMsg)
        {
            string tbname = BLLTable<TF_TABLE>.Factory(conn).GetOneValue(TF_TABLE.Attribute.TB_ID, tbid, TF_TABLE.Attribute.TB_NAME);
            try
            {
                string msg = null;
                DataBaseTable t1 = null;
                if (DataBase.Factory(conn).TryGetValue(tbname, out t1))
                {
                    if (!DataBase.Factory(conn).DeleteTable(tbname, false, ref msg))
                    {
                        errMsg += msg; return 0;
                    }
                }
                return 1;
            }
            catch (Exception ex)
            {
                errMsg = ex.ToString();
                return -1;
            }
        }       
    }
}

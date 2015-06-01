using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
using AgileFrame.Common;
using AgileFrame.Core;

public partial class SYS_WF_TBBack : AgileFrame.AppInOne.Common.BaseAdminPage_Ajax  //BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //dics.Add("TF_TABLE", "TF_TABLE-mx");
        if (!IsPostBack)
        {
            ITableTree p_itable1 = new ITableTree();
            p_itable1.val = new TF_TABLE();
            p_itable1.NAME = new AttributeItem("TF_TABLE", "CH_NAME");
            p_itable1.NOTE = new AttributeItem("TF_TABLE", "TB_NAME");
            p_itable1.ID = new AttributeItem("TF_TABLE", "TB_ID");
            p_itable1.M_ID = new AttributeItem("TF_TABLE", "M_TB_ID");
            p_itable1.SORT_NO = new AttributeItem("TF_TABLE", "SORT_NO");

            List<ITableTree> ListTables10 = new List<ITableTree>();
            ITableTree s_itable1 = new ITableTree();
            s_itable1.val = new TF_TB_FIELD();

            s_itable1.NAME = new AttributeItem("TF_TB_FIELD", "NOTE");
            s_itable1.ID = new AttributeItem("TF_TB_FIELD", "FIELD_ID");
            s_itable1.NOTE = new AttributeItem("TF_TB_FIELD", "FIELD_NAME");
            s_itable1.M_ID = new AttributeItem("TF_TB_FIELD", "TB_ID");
            s_itable1.SORT_NO = new AttributeItem("TF_TB_FIELD", "SORT_NO");
            s_itable1.relations.Add(new Relation(TF_TB_FIELD.Attribute.TB_ID, TF_TABLE.Attribute.TB_ID, RelationType.LeftJoin));
            ListTables10.Add(s_itable1);

            setTree(p_itable1, ListTables10);
            //////////////////////////////////////////////
            ITableTree p_itable2 = new ITableTree();
            p_itable2.val = new TF_FORM();
            p_itable2.NAME = new AttributeItem("TF_FORM", "F_NAME");
            p_itable2.ID = new AttributeItem("TF_FORM", "FORM_ID");
            p_itable2.M_ID = new AttributeItem("TF_FORM", "M_FORM_ID");
            //itable20.SORT_NO = new AttributeItem("TF_FORM", "SORT_NO");//没有
            
            List<ITableTree> ListTables20 = new List<ITableTree>();
            ITableTree s_itable2 = new ITableTree();
            s_itable2.val = new TF_F_COLUMN();

            s_itable2.NAME = new AttributeItem("TF_F_COLUMN", "SHOW_NAME");
            s_itable2.ID = new AttributeItem("TF_F_COLUMN", "COLUMN_ID");
            s_itable2.M_ID = new AttributeItem("TF_F_COLUMN", "FORM_ID");
            s_itable2.SORT_NO = new AttributeItem("TF_F_COLUMN", "SORT_NO");
            s_itable2.relations.Add(new Relation(TF_F_COLUMN.Attribute.FORM_ID, TF_FORM.Attribute.FORM_ID, RelationType.LeftJoin));
            ListTables20.Add(s_itable2);

            setTree(p_itable2, ListTables20);
        }

        Response.End();
    }
    private string setNote(object p_note1, string s_note, ITableTree itable0)
    {
        string p_note = Convert.ToString(p_note1);
        string ret = !(string.IsNullOrEmpty(s_note)) ? s_note : p_note;
        //p_note,p_name
        DataBaseTable dt1; DataBaseField df1;
        if (itable0.NAME.TableName == "TF_TABLE")
        {
            if (!string.IsNullOrEmpty(p_note) && !DataBase.Factory(conn).TryGetValue(p_note, out dt1))
            {
                ret = string.Format("表{0},不存在", p_note);
                ConsoleService.Fatal(p_note);
            }
        }
        else if (itable0.NAME.TableName == "TF_TB_FIELD")
        {
            if (!string.IsNullOrEmpty(s_note) && !DataBase.Factory(conn).TryGetValue(p_note, s_note, out dt1, out df1))
            {
                ret = string.Format("字段{0}-{1},不存在", p_note, s_note);
                ConsoleService.Fatal(p_note);
            }
        }
        return ret;
    }
    /// <summary>
    /// //自身为树，可以按照类型进行 树节点外观区别
    /// //子相关对象
    /// </summary>
    /// <param name="p_tableTree"></param>
    /// <param name="itables"></param>
    private void setTree(ITableTree p_tableTree, List<ITableTree> ListTables)
    {
        string p_tableStr = p_tableTree.val.TableName();
        ITableImplement p_table1 = ((ITableImplement)p_tableTree.val.Clone());
        p_table1.LoadAllAttributes(true);

        if (string.IsNullOrEmpty(p_table1.af_OrderByText) && p_tableTree.SORT_NO != null)
            p_table1.OrderBy(p_tableTree.SORT_NO, Order.Asc);

        #region 树 TF_TABLE
        #region//显示子节点 TF_TABLE
        if (Request["getSubNodes"] != null)
        {
            string nodetype = Request["ntype"];
            StringBuilder sb = new StringBuilder("[");
            string id = Request["id"];
            string p_name = null;
            string p_note = null;
            string s_name = null;
            string s_note = null;
            if (nodetype == p_tableStr + "-root")
            {
                #region
                ITableImplement obj = p_tableTree.val;
                if (!obj.GetInitialized(p_tableTree.M_ID))
                    obj.SetValue(p_tableTree.M_ID, 0);
//                p_table1.Top(1000);
                List<ITableImplement> lst = BLLTable<ITableImplement>.Factory(conn).Select(p_table1, obj);
                if (lst.Count != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }                        
                        sb.Append("{id:'").Append(lst[i].GetValue(p_tableTree.ID)).Append("'");
                        sb.Append(",pid:'").Append("0").Append("',no:").Append((p_tableTree.SORT_NO!=null)?lst[i].GetValue(p_tableTree.SORT_NO):"1");
                        p_name = Convert.ToString(lst[i].GetValue(p_tableTree.NAME));
                        if (string.IsNullOrEmpty(p_name))
                        {
                            p_name = p_note;
                            "".ToString();
                        }
                        else if (p_tableTree.NOTE != null)
                        {
                            p_note = Convert.ToString(lst[i].GetValue(p_tableTree.NOTE));
                            p_note = setNote(p_note, "", p_tableTree);
                            sb.Append(",note:'[").Append(p_note).Append("]'");
                        }
                        sb.Append(",name:'").Append(p_name).Append("'");                        
                        sb.Append(",sc:").Append("-1");
                        //CHG START 区分表管理和表单管理 jin-shenjian 2013/10/30
                        //sb.Append(",ntype:'" + p_tableStr + "'}");
                        if (p_tableStr.Equals("TF_FORM"))
                        {
                            //表单管理
                            sb.Append(",ntype:'" + p_tableStr + "_MANAGE'}");
                        }
                        else
                        {
                            //表管理
                            sb.Append(",ntype:'" + p_tableStr + "'}");
                        }
                        //CHG END 区分表管理和表单管理 jin-shenjian 2013/10/30
                    }
                }
                #endregion
            }
            //CHG START 增加树关系管理，布局管理，列表布局菜单 jin-shenjian 2013/10/30
                //表单列表下添加三个管理菜单
            else if (nodetype == p_tableStr + "_MANAGE")
            {
                sb.Append("{id:'").Append(id).Append("'");
                sb.Append(",pid:'").Append(id).Append("',no:").Append("1");
                sb.Append(",name:'").Append("字段管理").Append("'");
                sb.Append(",sc:").Append("-1");
                sb.Append(",ntype:'" + p_tableStr + "'}");
                sb.Append(",");
                sb.Append("{id:'").Append(id).Append("'");
                sb.Append(",pid:'").Append(id).Append("',no:").Append("1");
                sb.Append(",name:'").Append("关系管理").Append("'");
                sb.Append(",sc:").Append("-1");
                sb.Append(",ntype:'TF_TB_RELA'}");
                sb.Append(",");
                sb.Append("{id:'").Append(id).Append("'");
                sb.Append(",pid:'").Append(id).Append("',no:").Append("1");
                sb.Append(",name:'").Append("布局管理").Append("'");
                sb.Append(",sc:").Append("-1");
                sb.Append(",ntype:'TF_FORM_DESIGN'}");
            }
            //布局管理下添加两个子菜单
            else if (nodetype == p_tableStr + "_DESIGN")
            {
                sb.Append("{id:'").Append(id).Append("1'");
                sb.Append(",pid:'").Append(id).Append("',no:").Append("1");
                sb.Append(",name:'").Append("列表布局").Append("'");
                sb.Append(",sc:").Append("0");
                sb.Append(",ntype:'TF_DESIGN_LIST'}");
                sb.Append(",");
                sb.Append("{id:'").Append(id).Append("2'");
                sb.Append(",pid:'").Append(id).Append("',no:").Append("1");
                sb.Append(",name:'").Append("详细布局").Append("'");
                sb.Append(",sc:").Append("0");
                sb.Append(",ntype:'TF_DESIGN_DETAIL'}");
            }
            //ADD END 增加树关系管理，布局管理，列表布局菜单 jin-shenjian 2013/10/30
            else if (nodetype == p_tableStr)//table1type.Contains(nodetype))
            {
                //if (nodetype == "TF_TABLE")//明细表，将不会再有子级的明细表。。。
                {
                    #region
                    ITableImplement objTB = p_tableTree.val;
                    objTB.SetValue(p_tableTree.M_ID, int.Parse(id));
                    //                p_table1.Top(1000);
                    List<ITableImplement> lst = BLLTable<ITableImplement>.Factory(conn).Select(p_table1, objTB);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].GetValue(p_tableTree.ID)).Append("'");
                            sb.Append(",pid:'").Append(id).Append("',no:").Append((p_tableTree.SORT_NO!=null)?lst[i].GetValue(p_tableTree.SORT_NO):"1");
                            p_name = Convert.ToString(lst[i].GetValue(p_tableTree.NAME));
                            if (string.IsNullOrEmpty(p_name))
                            {
                                p_name = p_note;
                                "".ToString();
                            }
                            else if (p_tableTree.NOTE != null)
                            {
                                p_note = Convert.ToString(lst[i].GetValue(p_tableTree.NOTE));
                                p_note = setNote(p_note, "", p_tableTree);
                                sb.Append(",note:'[").Append(p_note).Append("]'");
                            } 
                            sb.Append(",name:'").Append(p_name).Append("'");                            
                            sb.Append(",sc:").Append("1");
                            sb.Append(",ntype:'" + p_tableStr + "'}");//TF_TABLE-mx
                        }
                    }
                    #endregion
                }
                
                #region
                if (ListTables.Count > 0)
                {
                    foreach (ITableTree s_tableTree1 in ListTables)
                    {
                        ITableImplement val1 = ((ITableImplement)s_tableTree1.val.Clone());
                        string table1 = val1.TableName();
                        if (string.IsNullOrEmpty(val1.af_OrderByText) && s_tableTree1.SORT_NO != null)
                            val1.OrderBy(s_tableTree1.SORT_NO, Order.Asc);

                        //                val1.Top(1000);
                        ITableImplement condObj = ((ITableImplement)s_tableTree1.val.Clone());
                        condObj.SetValue(p_tableTree.ID, int.Parse(id));
                        List<ITableImplement> otherValue = new List<ITableImplement>();
                        otherValue.Add(p_table1);
                        List<ITableImplement> condtions = new List<ITableImplement>();
                        condtions.Add(condObj);
                        List<ITableImplement> lst = BLLTable<ITableImplement>.Factory(conn).Select(val1, s_tableTree1.relations,
                            otherValue, condtions);
                        if (lst.Count > 0)
                        {
                            for (int i = 0; i < lst.Count; i++)
                            {                                
                                if (sb.Length > 2)
                                {
                                    sb.Append(",");
                                }
                                ITableImplement table = lst[i];
                                sb.Append("{id:'").Append(table.GetValue(s_tableTree1.ID)).Append("'");
                                sb.Append(",pid:'").Append(table.GetValue(s_tableTree1.M_ID)).Append("',no:")
                                    .Append((s_tableTree1.SORT_NO!=null)?table.GetValue(s_tableTree1.SORT_NO):"1");
                                s_name = Convert.ToString(table.GetValue(s_tableTree1.NAME));
                                sb.Append(",name:'").Append(s_name).Append("'");
                                if (s_tableTree1.NOTE != null)
                                {
                                    s_note = Convert.ToString(table.GetValue(s_tableTree1.NOTE));

                                    if (s_tableTree1.NAME.TableName == "TF_TB_FIELD")
                                        s_note = setNote(table.GetValue("TF_TABLE","TB_NAME"), s_note, s_tableTree1);
                                    
                                    sb.Append(",note:'[").Append(s_note).Append("]'");
                                }
                                sb.Append(",sc:").Append("0");
                                sb.Append(",ntype:'" + table1 + "'}");
                            }
                        }
                    }
                }
                #endregion
            }
            else
            {
                sb = new StringBuilder();
            }
            //sb.Append("{id:'").Append("1");
            //sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
            //sb.Append(",sc:").Append("1");
            //sb.Append(",name:'").Append("aaaaa(aaa)").Append("',ntype:'TF_FORM'}");
            if (sb.Length > 1)
                sb.Append("]");
            Response.Write(sb.ToString());
        }
        #endregion
        #region//删除节点
        if (Request["deleteNode"] != null)
        {
            string str = "";
            string delID = Request["id"];
            string ntype = Request["ntype"];
            //CHG START 删除表单判断变更 jin-shenjian 2013/10/30
            //if (ntype == p_tableStr)//if (ntype == "table" || ntype == "TF_TABLE-mx")
            if (ntype == p_tableStr + "_MANAGE" || ntype == p_tableStr)//if (ntype == "table" || ntype == "TF_TABLE-mx")
            //CHG END 删除表单判断变更 jin-shenjian 2013/10/30
            {
                #region//删除表
                int re = 0;
                string msg = "删除数据对象成功！";// "删除数据库表成功！";

                ITableImplement cccSub = ((ITableImplement)p_tableTree.val.Clone());
                cccSub.SetValue(p_tableTree.M_ID, int.Parse(delID));
                bool isAllowDel = true;
                if (BLLTable<ITableImplement>.Count(cccSub) > 0)
                {
                    isAllowDel = false;
                    msg = "存在明细对象，不能删除此对象";//"存在明细表，不能删除!";
                }
                else //相关子对象，相关子对象如果存在，能否被删除呢。级联删除。
                {
                    if (ListTables.Count > 0)// "存在字段，不能删除此表";
                    {
                        foreach (ITableTree sub_table1 in ListTables)
                        {
                            ITableImplement hadcol = ((ITableImplement)sub_table1.val.Clone());
                            hadcol.SetValue(sub_table1.M_ID, int.Parse(delID));
                            if (BLLTable<ITableImplement>.Exists(hadcol))
                            {
                                msg = "存在相关对象（子对象），不能删除此对象";
                                isAllowDel = false;
                                break;
                            }
                        }
                    }
                }
                if (isAllowDel)
                {
                    //外部条件
                    //TF_FORM useTB = new TF_FORM();
                    //useTB.Where("TB_ID=" + delID + " or TB_IDS like '%," + delID + ",%'");
                    //if (BLLTable<TF_FORM>.Exists(useTB))
                    //{
                    //    msg = "此表已倍表单使用，不能删除";
                    //    goto _no_del;
                    //}

                    re = BLLTable<ITableImplement>.Factory(conn).Delete(p_tableTree.ID, delID);
                    if (re > 0)
                    {
                        //foreach (ITableTree sub_table1 in ListTables)
                        //{
                        //    //???
                        //    if (BLLTable<ITableImplement>.Factory(conn).Delete(sub_table1.M_ID, delID) < 0)
                        //    {
                        //        msg = "删除数据对象成功，但删除子对象信息失败！";
                        //    }
                        //    else
                                msg = "删除数据对象成功！";
                        //}
                    }
                    else
                    {
                        msg = "删除数据对象失败！";
                    }
                    //_no_del:
                }
                #endregion
                str = "{re:" + re + ",msg:'" + msg + "'}";
            }
            else
            {
                if (ListTables.Count > 0)
                {
                    foreach (ITableTree itable1 in ListTables)
                    {
                        if (ntype == itable1.val._TableName)//if (ntype == "field")
                        {
                            int re = 0;
                            string msg = "删除数据对象成功！";
                            #region//删除表字段

                            //ADD START 更新表字段是否使用状态 jin-shenjian 2013/10/28
                            //更新表字段是否使用状态
                            if (ntype.Equals("TF_F_COLUMN"))
                            {
                                TF_F_COLUMN objCond = new TF_F_COLUMN();
                                objCond.COLUMN_ID = Convert.ToInt32(delID);

                                TF_TB_FIELD objVal = new TF_TB_FIELD();
                                //字段未使用
                                objVal.CREATED = 0;

                                int ret2 = BLLTable<TF_TB_FIELD>.Factory(conn).Update(objVal, objCond, new Relation(TF_TB_FIELD.Attribute.FIELD_ID, TF_F_COLUMN.Attribute.FIELD_ID));
                            }
                            //ADD END 更新表字段是否使用状态 jin-shenjian 2013/10/28

                            int ret1 = BLLTable<ITableImplement>.Factory(conn).Delete(itable1.ID, delID);

                            if (ret1 <= 0)
                            {
                                msg = "删除数据对象失败！";
                            }
                            else
                            {
                                msg = "删除数据对象成功！";
                            }
                            #endregion
                            //CHG START 判断是否删除变量选错 jin-shenjian 2013/10/28
                            //str = "{re:" + re + ",msg:'" + msg + "'}";
                            str = "{re:" + ret1 + ",msg:'" + msg + "'}";
                            //CHG START 判断是否删除变量选错 jin-shenjian 2013/10/28
                        }
                    }
                }
            }

            Response.Write(str);
        }
        #endregion
        #endregion 树 TF_TABLE
    }
}


    ///// <summary>
    ///// //自身为树，可以按照类型进行 树节点外观区别
    ///// //子相关对象
    ///// </summary>
    ///// <param name="itable0"></param>
    ///// <param name="itables"></param>
    //private void setTree(ITableImplement itable0, params ITableImplement itables)
    //{
    //    string table1 = itable0.TableName();
    //    #region 树 TF_TABLE
    //    #region//显示子节点 TF_TABLE
    //    if (Request["getSubNodes"] != null)
    //    {
    //        string nodetype = Request["ntype"];
    //        StringBuilder sb = new StringBuilder("[");
    //        string id = Request["id"];
    //        if (nodetype == table1 + "-root")
    //        {
    //            #region
    //            TF_TABLE obj = new TF_TABLE();
    //            TF_TABLE val = new TF_TABLE();
    //            obj.M_TB_ID = 0;
    //            val.OrderBy(TF_TABLE.Attribute.SORT_NO, Order.Asc);
    //            List<TF_TABLE> lst = BLLTable<TF_TABLE>.Factory(conn).Select(val, obj);
    //            if (lst.Count != null)
    //            {
    //                for (int i = 0; i < lst.Count; i++)
    //                {
    //                    if (sb.Length > 2)
    //                    {
    //                        sb.Append(",");
    //                    }
    //                    sb.Append("{id:'").Append(lst[i].TB_ID);
    //                    sb.Append("',pid:'").Append("0").Append("',no:").Append(lst[i].SORT_NO);
    //                    sb.Append(",sc:").Append("-1");
    //                    sb.Append(",name:'").Append(lst[i].CH_NAME).Append("',ntype:'" + table1 + "'}");
    //                }
    //            }
    //            #endregion
    //        }
    //        if (nodetype == table1)//table1type.Contains(nodetype))
    //        {
    //            //if (nodetype == "TF_TABLE")//明细表，将不会再有子级的明细表。。。
    //            {
    //                #region
    //                TF_TABLE objTB = new TF_TABLE();
    //                TF_TABLE valTB = new TF_TABLE();
    //                objTB.M_TB_ID = int.Parse(id);
    //                valTB.OrderBy(TF_TABLE.Attribute.SORT_NO, Order.Asc);
    //                List<TF_TABLE> lstTB = BLLTable<TF_TABLE>.Factory(conn).Select(valTB, objTB);
    //                if (lstTB.Count != null)
    //                {
    //                    for (int i = 0; i < lstTB.Count; i++)
    //                    {
    //                        if (sb.Length > 2)
    //                        {
    //                            sb.Append(",");
    //                        }
    //                        sb.Append("{id:'").Append(lstTB[i].TB_ID);
    //                        sb.Append("',pid:'").Append(id).Append("',no:").Append(lstTB[i].SORT_NO);
    //                        sb.Append(",sc:").Append("1");
    //                        sb.Append(",name:'").Append(lstTB[i].CH_NAME).Append("',ntype:'" + table1 + "'}");//TF_TABLE-mx
    //                    }
    //                }
    //                #endregion
    //            }
    //            #region
    //            TF_TB_FIELD obj = new TF_TB_FIELD();
    //            TF_TB_FIELD val = new TF_TB_FIELD();
    //            obj.TB_ID = int.Parse(id);
    //            val.OrderBy(TF_TB_FIELD.Attribute.SORT_NO, Order.Asc);

    //            List<TF_TB_FIELD> lst = BLLTable<TF_TB_FIELD>.Factory(conn).Select(val, obj);
    //            if (lst.Count > 0)
    //            {
    //                for (int i = 0; i < lst.Count; i++)
    //                {
    //                    if (sb.Length > 2)
    //                    {
    //                        sb.Append(",");
    //                    }
    //                    sb.Append("{id:'").Append(lst[i].FIELD_ID.ToString());
    //                    sb.Append("',pid:'").Append(lst[i].TB_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
    //                    sb.Append(",sc:").Append("0");
    //                    sb.Append(",name:'").Append(lst[i].NOTE).Append("',ntype:'" + table2 + "'}");
    //                }
    //            }
    //            #endregion
    //        }

    //        if (nodetype == "TF_FORM-root")
    //        {
    //            #region
    //            TF_FORM obj = new TF_FORM();
    //            TF_FORM val = new TF_FORM();
    //            obj.M_FORM_ID = 0;
    //            val.OrderBy(TF_FORM.Attribute.FORM_ID, Order.Asc);
    //            List<TF_FORM> lst = BLLTable<TF_FORM>.Factory(conn).Select(val, obj);
    //            if (lst.Count != null)
    //            {
    //                for (int i = 0; i < lst.Count; i++)
    //                {
    //                    if (sb.Length > 2)
    //                    {
    //                        sb.Append(",");
    //                    }
    //                    sb.Append("{id:'").Append(lst[i].FORM_ID);
    //                    sb.Append("',pid:'").Append(lst[i].TB_ID).Append("',no:").Append(lst[i].FORM_ID);
    //                    sb.Append(",sc:").Append("1");
    //                    sb.Append(",name:'").Append(lst[i].F_NAME).Append("',ntype:'TF_FORM'}");
    //                }
    //            }
    //            #endregion
    //        }
    //        if (nodetype == "TF_FORM" || nodetype == "TF_FORM-mx")
    //        {
    //            if (nodetype == "TF_FORM")
    //            {
    //                #region
    //                TF_FORM objForm = new TF_FORM();
    //                TF_FORM valForm = new TF_FORM();
    //                objForm.M_FORM_ID = int.Parse(id);
    //                valForm.OrderBy(TF_FORM.Attribute.FORM_ID, Order.Asc);
    //                List<TF_FORM> lstForm = BLLTable<TF_FORM>.Factory(conn).Select(valForm, objForm);
    //                if (lstForm.Count != null)
    //                {
    //                    for (int i = 0; i < lstForm.Count; i++)
    //                    {
    //                        if (sb.Length > 2)
    //                        {
    //                            sb.Append(",");
    //                        }
    //                        sb.Append("{id:'").Append(lstForm[i].FORM_ID);
    //                        sb.Append("',pid:'").Append(id).Append("',no:").Append(lstForm[i].FORM_ID);
    //                        sb.Append(",sc:").Append("1");
    //                        sb.Append(",name:'").Append(lstForm[i].F_NAME).Append("',ntype:'TF_FORM-mx'}");
    //                    }
    //                }
    //                #endregion
    //            }
    //            #region
    //            TF_F_COLUMN obj = new TF_F_COLUMN();
    //            TF_F_COLUMN val = new TF_F_COLUMN();
    //            //obj.IS_DEFAULT = "0";
    //            obj.FORM_ID = int.Parse(id);
    //            val.OrderBy(TF_F_COLUMN.Attribute.SORT_NO, Order.Asc);
    //            List<TF_F_COLUMN> lst = BLLTable<TF_F_COLUMN>.Factory(conn).Select(val, obj);
    //            if (lst.Count != null)
    //            {
    //                for (int i = 0; i < lst.Count; i++)
    //                {
    //                    if (sb.Length > 2)
    //                    {
    //                        sb.Append(",");
    //                    }
    //                    sb.Append("{id:'").Append(lst[i].COLUMN_ID);
    //                    sb.Append("',pid:'").Append(lst[i].FORM_ID).Append("',no:").Append(lst[i].SORT_NO);
    //                    sb.Append(",sc:").Append("0");
    //                    sb.Append(",name:'").Append(lst[i].SHOW_NAME).Append("',ntype:'TF_F_COLUMN'}");
    //                }
    //            }
    //            #endregion
    //        }
    //        //sb.Append("{id:'").Append("1");
    //        //sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
    //        //sb.Append(",sc:").Append("1");
    //        //sb.Append(",name:'").Append("aaaaa(aaa)").Append("',ntype:'TF_FORM'}");

    //        sb.Append("]");
    //        Response.Write(sb.ToString());
    //    }
    //    #endregion
    //    #region//删除节点
    //    if (Request["deleteNode"] != null)
    //    {
    //        string str = "";
    //        string delID = Request["id"];
    //        string ntype = Request["ntype"];
    //        if (ntype == "TF_TABLE" || ntype == "TF_TABLE-mx")
    //        {
    //            #region//删除表
    //            int re = 0;
    //            string msg = "删除数据库表成功！";
    //            TF_TABLE cccSub = new TF_TABLE();
    //            cccSub.M_TB_ID = int.Parse(delID);
    //            if (BLLTable<TF_TABLE>.Count(cccSub) > 0)
    //            {
    //                msg = "存在明细表，不能删除!";
    //            }
    //            else
    //            {
    //                TF_TB_FIELD hadcol = new TF_TB_FIELD();
    //                hadcol.TB_ID = int.Parse(delID);
    //                if (BLLTable<TF_TB_FIELD>.Exists(hadcol))
    //                {
    //                    msg = "存在字段，不能删除此表";
    //                }
    //                else
    //                {
    //                    TF_FORM useTB = new TF_FORM();
    //                    useTB.Where("TB_ID=" + delID + " or TB_IDS like '%," + delID + ",%'");
    //                    if (BLLTable<TF_FORM>.Exists(useTB))
    //                    {
    //                        msg = "此表已倍表单使用，不能删除";
    //                    }
    //                    else
    //                    {
    //                        re = new AgileFrame.Common.TF_TABLEHelper(conn).DelTable(delID);// ;
    //                        if (re > 0)
    //                        {
    //                            if (BLLTable<TF_TABLE>.Factory(conn).Delete(TF_TABLE.Attribute.TB_ID, delID) <= 0)
    //                            {
    //                                msg = "删除数据库表成功，但删除表结构信息失败！";
    //                            }
    //                        }
    //                        else
    //                        {
    //                            msg = "删除表结构信息失败！";
    //                        }
    //                    }
    //                }
    //            }
    //            #endregion
    //            str = "{re:" + re + ",msg:'" + msg + "'}";
    //        }
    //        else if (ntype == "TF_TB_FIELD")
    //        {
    //            #region//删除表字段
    //            string msg = "删除数据库表字段成功！";
    //            int re = new AgileFrame.Common.TF_TABLEHelper(conn).DelField(delID);// ;
    //            if (re > 0)
    //            {
    //                if (BLLTable<TF_TB_FIELD>.Factory(conn).Delete(TF_TB_FIELD.Attribute.FIELD_ID, delID) <= 0)
    //                {
    //                    msg = "删除数据库表字段成功，但删除字段结构信息失败！";
    //                }
    //            }
    //            else
    //            {
    //                msg = "删除数据库表字段失败！";
    //            }
    //            #endregion
    //            str = "{re:" + re + ",msg:'" + msg + "'}";
    //        }
    //        else if (ntype == "TF_FORM" || ntype == "TF_FORM-mx")
    //        {
    //            #region//删除表单
    //            int re = 0;
    //            string msg = "删除表单成功！";
    //            TF_FORM cccSub = new TF_FORM();
    //            cccSub.M_FORM_ID = int.Parse(delID);
    //            if (BLLTable<TF_FORM>.Count(cccSub) > 0)
    //            {
    //                msg = "存在明细表单，不能删除!";
    //            }
    //            else
    //            {
    //                TF_F_COLUMN ccc = new TF_F_COLUMN();
    //                ccc.FORM_ID = int.Parse(delID);
    //                ccc.IS_DEFAULT = "0";

    //                if (BLLTable<TF_F_COLUMN>.Count(ccc) > 0)
    //                {
    //                    msg = "存在栏目，不能删除!";
    //                }
    //                else
    //                {
    //                    re = BLLTable<TF_FORM>.Factory(conn).Delete(TF_FORM.Attribute.FORM_ID, delID);
    //                    BLLTable<TF_F_COLUMN>.Factory(conn).Delete(TF_F_COLUMN.Attribute.FORM_ID, delID);
    //                    if (re <= 0)
    //                    {
    //                        msg = "删除表单失败！";
    //                    }
    //                }
    //            }
    //            #endregion
    //            str = "{re:" + re + ",msg:'" + msg + "'}";
    //        }
    //        else if (ntype == "TF_F_COLUMN")
    //        {
    //            string msg = "删除表单栏目成功！";

    //            TF_F_COLUMN oldObj = BLLTable<TF_F_COLUMN>.Factory(conn).GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, delID);

    //            int re = BLLTable<TF_F_COLUMN>.Factory(conn).Delete(TF_F_COLUMN.Attribute.COLUMN_ID, delID);

    //            if (re <= 0)
    //            {
    //                msg = "删除表单栏目失败";
    //            }
    //            else
    //            {
    //                if (oldObj != null)
    //                {
    //                    BLLTable<TF_TB_FIELD>.Factory(conn).Update(TF_TB_FIELD.Attribute.FIELD_ID, oldObj.FIELD_ID,
    //                        TF_TB_FIELD.Attribute.CREATED, 0);
    //                }
    //            }

    //            str = "{re:" + re + ",msg:'" + msg + "'}";
    //        }
    //        Response.Write(str);
    //    }
    //    #endregion
    //    #endregion 树 TF_TABLE
    //}
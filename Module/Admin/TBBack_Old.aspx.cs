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

public partial class SYS_WF_TBBack : AgileFrame.AppInOne.Common.BaseAdminPage_Ajax
{

    private string setNote(object p_note1, string s_note, string TableName)
    {
        string p_note = Convert.ToString(p_note1);
        string ret = !(string.IsNullOrEmpty(s_note)) ? s_note : p_note;
        //p_note,p_name
        DataBaseTable dt1; DataBaseField df1;
        if (TableName == "TF_TABLE")
        {
            if (!string.IsNullOrEmpty(p_note) && !DataBase.Factory(conn).TryGetValue(p_note, out dt1))
            {
                ret = string.Format("表{0},不存在", p_note);
                ConsoleService.Fatal(p_note);
            }
        }
        else if (TableName == "TF_TB_FIELD")
        {
            if (!string.IsNullOrEmpty(s_note) && !DataBase.Factory(conn).TryGetValue(p_note, s_note, out dt1, out df1))
            {
                ret = string.Format("字段{0}-{1},不存在", p_note, s_note);
                ConsoleService.Fatal(p_note);
            }
        }
        return ret;
    }
    private Dictionary<string, string> dics = new Dictionary<string, string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        dics.Add("TF_TABLE-root", "TF_TABLE");
        dics.Add("TF_TABLE", "TF_TABLE");
        //dics.Add("TF_TABLE", "TF_TABLE-mx");
        if (!IsPostBack)
        {
            #region////显示子节点
            if (Request["getSubNodes"] != null)
            {
                string nodetype = Request["ntype"];
                StringBuilder sb = new StringBuilder("[");
                string id = Request["id"];
                if (nodetype == "TF_TABLE-root")
                {
                    #region
                    TF_TABLE obj = new TF_TABLE();
                    TF_TABLE val = new TF_TABLE();
                    obj.M_TB_ID = 0;
                    val.OrderBy(TF_TABLE.Attribute.SORT_NO, Order.Asc);
                    List<TF_TABLE> lst = BLLTable<TF_TABLE>.Select(val, obj);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].TB_ID);
                            sb.Append("',pid:'").Append("0").Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append("-1");
                            sb.Append(",name:'").Append(lst[i].CH_NAME).Append("',ntype:'TF_TABLE'}");
                        }
                    }
                    #endregion
                }
                if (nodetype == "TF_TABLE" || nodetype == "TF_TABLE-mx")
                {
                    if (nodetype == "TF_TABLE")//明细表，将不会再有子级的明细表。。。
                    {
                        #region
                        TF_TABLE objTB = new TF_TABLE();
                        TF_TABLE valTB = new TF_TABLE();
                        objTB.M_TB_ID = int.Parse(id);
                        valTB.OrderBy(TF_TABLE.Attribute.SORT_NO, Order.Asc);
                        List<TF_TABLE> lstTB = BLLTable<TF_TABLE>.Select(valTB, objTB);
                        if (lstTB.Count != null)
                        {
                            for (int i = 0; i < lstTB.Count; i++)
                            {
                                if (sb.Length > 2)
                                {
                                    sb.Append(",");
                                }
                                sb.Append("{id:'").Append(lstTB[i].TB_ID);
                                sb.Append("',pid:'").Append(id).Append("',no:").Append(lstTB[i].SORT_NO);
                                sb.Append(",sc:").Append("1");
                                sb.Append(",name:'").Append(lstTB[i].CH_NAME).Append("',ntype:'TF_TABLE-mx'}");
                            }
                        }
                        #endregion
                    }
                    #region
                    TF_TB_FIELD obj = new TF_TB_FIELD();
                    TF_TB_FIELD val = new TF_TB_FIELD();
                    obj.TB_ID = int.Parse(id);
                    val.OrderBy(TF_TB_FIELD.Attribute.SORT_NO, Order.Asc);

                    List<TF_TB_FIELD> lst = BLLTable<TF_TB_FIELD>.Select(val, obj);
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].FIELD_ID.ToString());
                            sb.Append("',pid:'").Append(lst[i].TB_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append("0");
                            sb.Append(",name:'").Append(lst[i].NOTE).Append("',ntype:'TF_F_COLUMN'}");

                        }

                    }
                    #endregion
                }

                if (nodetype == "TF_FORM-root")
                {
                    #region
                    TF_FORM obj = new TF_FORM();
                    TF_FORM val = new TF_FORM();
                    obj.M_FORM_ID = 0;
                    val.OrderBy(TF_FORM.Attribute.FORM_ID, Order.Asc);
                    List<TF_FORM> lst = BLLTable<TF_FORM>.Select(val, obj);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].FORM_ID);
                            sb.Append("',pid:'").Append(lst[i].TB_ID).Append("',no:").Append(lst[i].FORM_ID);
                            sb.Append(",sc:").Append("1");
                            sb.Append(",name:'").Append(lst[i].F_NAME).Append("',ntype:'TF_FORM'}");
                        }
                    }
                    #endregion
                }
                if (nodetype == "TF_FORM" || nodetype == "TF_FORM-mx")
                {
                    if (nodetype == "TF_FORM")
                    {
                        #region
                        TF_FORM objForm = new TF_FORM();
                        TF_FORM valForm = new TF_FORM();
                        objForm.M_FORM_ID = int.Parse(id);
                        valForm.OrderBy(TF_FORM.Attribute.FORM_ID, Order.Asc);
                        List<TF_FORM> lstForm = BLLTable<TF_FORM>.Select(valForm, objForm);
                        if (lstForm.Count != null)
                        {
                            for (int i = 0; i < lstForm.Count; i++)
                            {
                                if (sb.Length > 2)
                                {
                                    sb.Append(",");
                                }
                                sb.Append("{id:'").Append(lstForm[i].FORM_ID);
                                sb.Append("',pid:'").Append(id).Append("',no:").Append(lstForm[i].FORM_ID);
                                sb.Append(",sc:").Append("1");
                                sb.Append(",name:'").Append(lstForm[i].F_NAME).Append("',ntype:'TF_FORM-mx'}");
                            }
                        }
                        #endregion
                    }
                    #region
                    TF_F_COLUMN obj = new TF_F_COLUMN();
                    TF_F_COLUMN val = new TF_F_COLUMN();
                    //obj.IS_DEFAULT = "0";
                    obj.FORM_ID = int.Parse(id);
                    val.OrderBy(TF_F_COLUMN.Attribute.SORT_NO, Order.Asc);
                    List<TF_F_COLUMN> lst = BLLTable<TF_F_COLUMN>.Select(val, obj);
                    if (lst.Count != null)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].COLUMN_ID);
                            sb.Append("',pid:'").Append(lst[i].FORM_ID).Append("',no:").Append(lst[i].SORT_NO);
                            sb.Append(",sc:").Append("0");
                            sb.Append(",name:'").Append(lst[i].SHOW_NAME).Append("',ntype:'TF_F_COLUMN'}");
                        }
                    }
                    #endregion
                }
                //sb.Append("{id:'").Append("1");
                //sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
                //sb.Append(",sc:").Append("1");
                //sb.Append(",name:'").Append("aaaaa(aaa)").Append("',ntype:'TF_FORM'}");

                sb.Append("]");
                Response.Write(sb.ToString());
            }
            #endregion

            #region//删除节点
            if (Request["deleteNode"] != null)
            {
                string str = "";
                string delID=Request["id"];
                string ntype=Request["ntype"];
                if (ntype == "table" || ntype == "TF_TABLE-mx")
                {
                    #region//删除表
                    int re = 0;
                    string msg = "删除数据库表成功！";
                    TF_TABLE cccSub = new TF_TABLE();
                    cccSub.M_TB_ID = int.Parse(delID);
                    if (BLLTable<TF_TABLE>.Count(cccSub) > 0)
                    {
                        msg = "存在明细表，不能删除!";
                    }
                    else
                    {
                        TF_TB_FIELD hadcol = new TF_TB_FIELD();
                        hadcol.TB_ID = int.Parse(delID);
                        if (BLLTable<TF_TB_FIELD>.Exists(hadcol))
                        {
                            msg = "存在字段，不能删除此表";
                        }
                        else
                        {
                            TF_FORM useTB = new TF_FORM();
                            useTB.Where("TB_ID=" + delID + " or TB_IDS like '%," + delID + ",%'");
                            if (BLLTable<TF_FORM>.Exists(useTB))
                            {
                                msg = "此表已被表单使用，不能删除";
                            }
                            else
                            {
                                re = new TF_TABLEHelper(conn).DelTable(delID, ref msg);// ;
                                if (re > 0)
                                {
                                    if (BLLTable<TF_TABLE>.Delete(TF_TABLE.Attribute.TB_ID, delID) <= 0)
                                    {
                                        msg = "删除数据库表成功，但删除表结构信息失败！";
                                    }
                                }
                                else
                                {
                                    msg = "删除表结构信息失败！";
                                }
                            }
                        }
                    }
                    #endregion
                    str = "{re:" + re + ",msg:'" + msg + "'}";
                }
                else if (ntype == "field")
                {
                    #region//删除表字段
                    string msg = "删除数据库表字段成功！";
                    int re = new TF_TABLEHelper(conn).DelField(delID, ref msg);// ;
                    if (re > 0)
                    {
                        if (BLLTable<TF_TB_FIELD>.Delete(TF_TB_FIELD.Attribute.FIELD_ID, delID) <= 0)
                        {
                            msg = "删除数据库表字段成功，但删除字段结构信息失败！";
                        }
                    }
                    else {
                        msg = "删除数据库表字段失败！";
                    }
                    #endregion
                    str = "{re:" + re + ",msg:'" + msg + "'}";
                }
                else if (ntype == "TF_FORM" || ntype == "TF_FORM-mx")
                {
                    #region//删除表单
                    int re = 0;
                    string msg = "删除表单成功！";
                    TF_FORM cccSub = new TF_FORM();
                    cccSub.M_FORM_ID = int.Parse(delID);
                    if (BLLTable<TF_FORM>.Count(cccSub) > 0)
                    {
                        msg = "存在明细表单，不能删除!";
                    }
                    else
                    {
                        TF_F_COLUMN ccc = new TF_F_COLUMN();
                        ccc.FORM_ID = int.Parse(delID);
                        ccc.IS_DEFAULT = "0";
                       
                        if (BLLTable<TF_F_COLUMN>.Count(ccc) > 0)
                        {
                            msg = "存在栏目，不能删除!";
                        }
                        else
                        {
                            re = BLLTable<TF_FORM>.Delete(TF_FORM.Attribute.FORM_ID, delID);
                            BLLTable<TF_F_COLUMN>.Delete(TF_F_COLUMN.Attribute.FORM_ID, delID);
                            if (re <= 0)
                            {
                                msg = "删除表单失败！";
                            }
                        }
                    }
                    #endregion
                    str = "{re:" + re+",msg:'" + msg + "'}";
                }
                else if (ntype == "TF_F_COLUMN")
                {
                    string msg = "删除表单栏目成功！";

                    TF_F_COLUMN oldObj = BLLTable<TF_F_COLUMN>.GetRowData(TF_F_COLUMN.Attribute.COLUMN_ID, delID);

                    int re = BLLTable<TF_F_COLUMN>.Delete(TF_F_COLUMN.Attribute.COLUMN_ID, delID);

                    if (re <= 0)
                    {
                        msg = "删除表单栏目失败";
                    }
                    else {
                        if (oldObj != null)
                        {
                            BLLTable<TF_TB_FIELD>.Update(TF_TB_FIELD.Attribute.FIELD_ID, oldObj.FIELD_ID,
                                TF_TB_FIELD.Attribute.CREATED, 0);
                        }
                    }

                    str = "{re:" + re + ",msg:'" + msg + "'}";
                }
                Response.Write(str);
            }
            #endregion
        }

        Response.End();
    }
}
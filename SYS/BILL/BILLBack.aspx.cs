using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Common;
using AgileFrame.AppInOne.Common;
public partial class SYS_BILLBack : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region////显示子节点
        if (Request["getSubNodes"] != null)
        {
            string nodetype = Request["ntype"];
            StringBuilder sb = new StringBuilder("[");
            string id = Request["id"];
            if (nodetype == "bill-root")
            {
                #region
                SYS_BILL obj = new SYS_BILL();
                SYS_BILL val = new SYS_BILL();
                obj.P_BILL_ID = 0;
                //obj.STATUS = "1";
                bool fromtb = Request["TB"] != null;
                if (Request["TB"] == null)
                {
                    obj.Where("STATUS<>'0'");
                }
               
                val.af_PageBy(SYS_BILL.Attribute.BILL_ID, Order.Asc);
                List<SYS_BILL> lst = BLLTable<SYS_BILL>.Factory(conn).Select(val, obj);
                if (lst.Count != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        sb.Append("{id:'").Append(lst[i].BILL_ID);
                        sb.Append("',pid:'").Append("0").Append("',no:").Append(lst[i].BILL_ID);
                        sb.Append(",sc:").Append("1");
                        sb.Append(",name:'").Append(lst[i].BILL_NAME + (lst[i].STATUS=="11"?"(已删)":"")).Append("',note:''").Append(",ntype:'bill'}");
                    }
                }
                #endregion
            }
            if (nodetype == "bill" || nodetype == "bill-mx")
            {
                if (nodetype == "bill")
                {
                    #region 载入明细表单
                    SYS_BILL objTB = new SYS_BILL();
                    SYS_BILL valTB = new SYS_BILL();
                    objTB.P_BILL_ID = int.Parse(id);
                    valTB.OrderBy(SYS_BILL.Attribute.BILL_ID, Order.Asc);
                    List<SYS_BILL> lstTB = BLLTable<SYS_BILL>.Factory(conn).Select(valTB, objTB);
                    if (lstTB.Count != null)
                    {
                        for (int i = 0; i < lstTB.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lstTB[i].BILL_ID);
                            sb.Append("',pid:'").Append(id).Append("',no:").Append(lstTB[i].BILL_ID);
                            sb.Append(",sc:").Append("1");
                            sb.Append(",name:'").Append(lstTB[i].BILL_NAME).Append("',note:''").Append(",ntype:'bill-mx'}");
                        }
                    }
                    #endregion 
                }
                #region 载入列
                SYS_BILL_COL obj = new SYS_BILL_COL();
                SYS_BILL_COL val = new SYS_BILL_COL();
                obj.BILL_ID = int.Parse(id);
                //obj.Where("COL_NAME not in('MX_ID','BILL_ID')");
                val.af_PageBy(SYS_BILL_COL.Attribute.SORT_NO, Order.Asc);

                List<SYS_BILL_COL> lst = BLLTable<SYS_BILL_COL>.Factory(conn).Select(val, obj);
                if (lst.Count > 0)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        sb.Append("{id:'").Append(lst[i].COL_ID.ToString());
                        sb.Append("',pid:'").Append(lst[i].BILL_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                        sb.Append(",sc:").Append("1");
                        sb.Append(",name:'").Append(lst[i].COL_NAME).Append("',note:'[" + lst[i].COL_NOTE + "]'").Append(",ntype:'col'}");

                    }

                }
                #endregion
            }//选中了表单列
            if (nodetype == "col")
            {

                SYS_BILL_COL_SYN obj = new SYS_BILL_COL_SYN();
                SYS_BILL_COL_SYN val = new SYS_BILL_COL_SYN();
                obj.COL_ID = int.Parse(id);
                //obj.Where("COL_NAME not in('MX_ID','BILL_ID')");
                //val.af_PageBy(SYS_BILL_COL_SYN.Attribute.SORT_NO, Order.Asc);

                List<SYS_BILL_COL_SYN> lst = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).Select(val, obj);
                if (lst.Count > 0)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        sb.Append("{id:'").Append(lst[i].COL_SYNID.ToString());
                        sb.Append("',pid:'").Append(lst[i].COL_ID.ToString()).Append("',no:").Append("0");
                        sb.Append(",sc:").Append("0");
                        sb.Append(",name:'").Append("[" + lst[i].DB_SRC + "].[" + lst[i].TABLE_NAME + "].[" + lst[i].COL_NAME + "]").Append("',note:'[" + lst[i].COL_NOTE + "]'").Append(",ntype:'syncol'}");

                    }

                }
            }
            //sb.Append("{id:'").Append("1");
            //sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
            //sb.Append(",sc:").Append("1");
            //sb.Append(",name:'").Append("aaaaa(aaa)").Append("',ntype:'table'}");

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
            if (ntype == "bill" || ntype == "bill-mx")
            {
                #region//删除表
                SYS_BILL_EXD eee = new SYS_BILL_EXD(int.Parse(delID));
                string msg = "";
                int re = eee.Delete(out msg);

                #endregion
                str = "{re:" + re + ",msg:'" + msg + "'}";
            }
            else if (ntype == "col")
            {
                #region//删除表字段

                string msg = "删除数据库表字段成功！";

                SYS_BILL_EXD bllexd = new SYS_BILL_EXD(int.Parse(Request["pid"]));
                int re = bllexd.DeleteCol(int.Parse(delID));// TF_TABLEHelper.DelField(delID);// ;
                if (re > 0)
                {
                    msg = "删除数据库表字段成功！";
                }
                else
                {
                    msg = "删除数据库表字段失败！";
                }
                #endregion
                str = "{re:" + re + ",msg:'" + msg + "'}";
            }
            else if (ntype == "syncol")
            {
                #region//删除表字段

                string msg = "删除同步字段成功！";
                int re = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).Delete(SYS_BILL_COL_SYN.Attribute.COL_SYNID, delID);
                if (re > 0)
                {
                    msg = "删除同步字段成功！";
                }
                else
                {
                    msg = "删除同步字段失败！";
                }
                #endregion
                str = "{re:" + re + ",msg:'" + msg + "'}";
            }
            Response.Write(str);
        }
        #endregion
         
        #region//导入字段
        if (Request["intbCols"] != null)
        {

            string pid = Request["pid"];
            string id = Request["id"];
            string billid = Request["billid"];
            DataBaseTable tbllext = DataBase.Factory(conn).DataTables[pid];// new DataBaseTable(_Base.TABLE_NAME, "", dbROG);
            DataBaseFieldCollection fields = tbllext.DataFields;
            string keys = "";

            DataBaseField fs = fields[id];
            if (fs.IsKeyID == true)
            {
                keys += keys == "" ? fs.FieldName : "," + fs.FieldName;
            }
            SYS_BILL_COL col = AgileFrame.AppInOne.SYS.SysDataBaseHelper.FieldToCol(fs, int.Parse(billid));
            SYS_BILL_COL ccc = new SYS_BILL_COL();
            ccc.BILL_ID = int.Parse(billid);
            ccc.COL_NAME = fs.FieldName.ToUpper();
            int re = 1;
            SYS_BILL_COL oldCol = BLLTable<SYS_BILL_COL>.Factory(conn).GetRowData(new SYS_BILL_COL(), ccc);
            int colid = 0;
            if (oldCol == null)
            {
                re = BLLTable<SYS_BILL_COL>.Factory(conn).Insert(col, SYS_BILL_COL.Attribute.COL_ID);
                colid = col.COL_ID;
            }
            else {
                colid = oldCol.COL_ID;
            }
            if (re > 0)
            {
                SYS_BILL_COL_SYN valObj = new SYS_BILL_COL_SYN();
                valObj.BILL_ID = Convert.ToInt32(Request["billid"]);

                valObj.COL_NAME = fs.FieldName.ToUpper();

                valObj.TABLE_NAME = Request["tb"];
                valObj.COL_ID = colid;
                valObj.ISPK = fs.IsKeyID == true ? "1" : "0";
                valObj.COL_NOTE = fs.Desc.ZhName;
                valObj.DATA_TYPE = fs.DataType.TypeNameString;
                valObj.DATA_LEN = fs.DataType.DataLen;
                valObj.DATA_ACC = fs.DataType.Scale;
                valObj.IS_AUTO = fs.IsAutoIncrease == true ? "1" : "0";
                valObj.DVAL = fs.DefaultValue;
                valObj.DB_SRC = Request["dev"];
                valObj.PK_VALCODE = "";

                BLLTable<SYS_BILL_COL_SYN>.InsertReturnID(valObj);
            }
            //记录主键到表单
            if (keys != "")
            {
                BLLTable<SYS_BILL>.Factory(conn).Update(SYS_BILL.Attribute.BILL_ID, billid, SYS_BILL.Attribute.KEYS, keys);
            }
            Response.Write("ok");
        }


        #endregion

        #region
        if (Request["addSynCols"] != null)
        {
            string[]aaa=StringHelper.GetStringArray(Request["ids"],',');
            for (int i = 0; i < aaa.Length; i++) {
                string[] bbb = aaa[i].Split('.');
                if (bbb[2] != "col") {
                    continue;
                }
                DataBaseTable tbllext = DataBase.Factory(conn).DataTables[bbb[0]];
                DataBaseField fs = tbllext.DataFields[bbb[1]];

                    SYS_BILL_COL_SYN valObj = new SYS_BILL_COL_SYN();
                    valObj.BILL_ID = Convert.ToInt32(Request["billid"]);
                    valObj.COL_ID = Convert.ToInt32(Request["colid"]);
                    valObj.COL_NAME = fs.FieldName;
                    if (!BLLTable<SYS_BILL_COL_SYN>.Exists(valObj))
                    {
                        valObj.TABLE_NAME = tbllext.TableName;
                        valObj.ISPK = fs.IsKeyID == true ? "1" : "0";
                        valObj.COL_NOTE = fs.Desc.ZhName;
                        valObj.DATA_TYPE = fs.DataType.TypeNameString.Replace("_","") ;
                        valObj.DATA_LEN = fs.DataType.DataLen;
                        valObj.DATA_ACC = fs.DataType.Scale;
                        valObj.IS_AUTO = fs.IsAutoIncrease == true ? "1" : "0";
                        valObj.DVAL = fs.DefaultValue;
                        valObj.DB_SRC = bbb[0];
                        valObj.PK_VALCODE = "";

                        BLLTable<SYS_BILL_COL_SYN>.InsertReturnID(valObj);
                    }

            }
            Response.Write("ok");
        }
        #endregion


        #region//彻底删除表单
        if (Request["clearBill"] != null)
        {
            #region//删除表
            string str = "";
            string delID = Request["id"];
            SYS_BILL_EXD eee = new SYS_BILL_EXD(int.Parse(delID));
            string msg="";
            int re = eee.Delete(out msg);

            #endregion
            str = "{re:" + re + ",msg:'" + msg+"'}";
            Response.Write(str);
        }
        #endregion

        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelBILL_ID"] != null)
        {
            int re = BLLTable<SYS_BILL>.Factory(conn).Delete(SYS_BILL.Attribute.BILL_ID, Request["DelBILL_ID"]);
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
            SYS_BILL cond = new SYS_BILL();
            cond.In(SYS_BILL.Attribute.BILL_ID, Request["DelKeyIDS"]);
            int re = BLLTable<SYS_BILL>.Factory(conn).Delete(cond);
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
            SYS_BILL val = new SYS_BILL();
            val.BILL_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName]))
                {
                    val.SetValue(lstCol[i].FieldName, Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<SYS_BILL>.Factory(conn).Update(val, SYS_BILL.Attribute.BILL_ID);
            Response.Write("修改用户信息成功");

        }
        Response.End();

    }
}
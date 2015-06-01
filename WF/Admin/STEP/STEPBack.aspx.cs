using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core;

using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_STEP_TPLBack : AgileFrame.AppInOne.Common.BaseAdminPage_Ajax  //BasePage
{
    int delStep(string stepid)
    {
        WF_STEP_TPL obj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);

        int re = BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.STEP_ID, stepid);
        if (re > 0)
        {
            WF_CHECKER_TPL cker = new WF_CHECKER_TPL();
            cker.WFID = obj.WFID;
            cker.PROCID = obj.PROCID;
            cker.STEP_ID = obj.STEP_ID;

            BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(cker);

            //WF_STEP_FORM_TPL stepf = new WF_STEP_FORM_TPL();
            //stepf.WFID = obj.WFID;
            //stepf.PROCID = obj.PROCID;
            //stepf.STEP_ID = obj.STEP_ID;

            //BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Delete(stepf);

            WF_STEPATH_TPL stepP = new WF_STEPATH_TPL();
            stepP.WFID = obj.WFID;
            stepP.PROCID = obj.PROCID;
            stepP.STEP_ID = obj.STEP_ID;

            BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(stepP);
            stepP.STEP_ID = obj.STEP_ID;

            BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(stepP);

        }
        return re;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("ddddddd"); Response.End();
        //return;
        if (Request["DelNodeByID"] != null)
        {
            #region//DelNodeByID
            WF_STEPATH_TPL ccc = new WF_STEPATH_TPL();
            ccc.STEP_ID = int.Parse(Request["StepID"]);
            WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, ccc.STEP_ID);
            ccc.WFID = stepObj.WFID;
            ccc.PROCID = stepObj.PROCID;
            ccc.NEXT_ID = int.Parse(Request["DelNodeByID"]);
            int re = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(ccc);
            Response.Write("1");

            #endregion
        }

        //更新入口，出口，跳转节点，
        if (Request["ToStepIDS"] != null)
        {
            string PATH_TYPE = "";
            //更新类型 1：真出口 2：假出口 其他：入口
            if (Request["PATH_TYPE"] != null)
            {
                PATH_TYPE = Convert.ToString(Request["PATH_TYPE"]);
            }

            string[] stepIds = Request["ToStepIDS"].Split(',');

            //删除原来的路径
            string nextstepid = Request["StepID"];
            WF_STEP_TPL nextstepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, nextstepid);
            WF_STEPATH_TPL objdel = new WF_STEPATH_TPL();
            objdel.WFID = nextstepObj.WFID;
            objdel.PROCID = nextstepObj.PROCID;

            //真出口
            if (PATH_TYPE.Equals("1"))
            {
                objdel.STEP_ID = Convert.ToInt32(nextstepid);
                objdel.PATH_TYPE = 1;//普通
                objdel.NODE_TYPE = 2;  //路由
            }
            //假出口
            else if (PATH_TYPE.Equals("3"))
            {
                objdel.STEP_ID = Convert.ToInt32(nextstepid);
                objdel.PATH_TYPE = 3;//返回
                objdel.NODE_TYPE = 2;  //路由
            }
            //入口
            else
            {
                objdel.NEXT_ID = Convert.ToInt32(nextstepid);
                objdel.PATH_TYPE = 1;//普通
                objdel.NODE_TYPE = 1;  //活动
            }

            int re = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(objdel);

            if (re >= 0)
            {
                //添加新的路径
                foreach (string str in stepIds)
                {
                    WF_STEPATH_TPL step = new WF_STEPATH_TPL();
                    step.WFID = nextstepObj.WFID;
                    step.PROCID = nextstepObj.PROCID;

                    //真出口
                    if (PATH_TYPE.Equals("1"))
                    {
                        step.STEP_ID = Convert.ToInt32(nextstepid);
                        step.NEXT_ID = Convert.ToInt32(str);
                        step.NODE_TYPE = 2;
                        step.PATH_TYPE = 1;
                    }
                    //假出口
                    else if (PATH_TYPE.Equals("3"))
                    {
                        step.STEP_ID = Convert.ToInt32(nextstepid);
                        step.NEXT_ID = Convert.ToInt32(str);
                        step.NODE_TYPE = 2;
                        step.PATH_TYPE = 3;
                    }
                    //入口
                    else
                    {
                        step.STEP_ID = Convert.ToInt32(str);
                        step.NEXT_ID = Convert.ToInt32(nextstepid);
                        step.NODE_TYPE = 1;
                        step.PATH_TYPE = 1;
                    }

                    re = BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(step, WF_STEPATH_TPL.Attribute.PATH_ID);
                }
            }
            Response.Write(re.ToString());
        }
        

        if (Request["SetNextID"] != null)
        {
            #region//SetNextID
            string toids = Request["SetNextID"];
            string curids = Request["StepIDS"];
            string[] curArr = StringHelper.GetStringArray(curids, ',');
            WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, curArr[0]);

            if (Request["ReNextID"] != null)
            {
                WF_STEPATH_TPL ccc = new WF_STEPATH_TPL();
                ccc.WFID = stepObj.WFID;
                ccc.PROCID = stepObj.PROCID;
                ccc.In(WF_STEPATH_TPL.Attribute.STEP_ID, curids);

                int re = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(ccc);

            }
            if (!string.IsNullOrEmpty(toids))
            {
                string[] lst = StringHelper.GetStringArray(toids, ',');
                for (int a = 0; a < curArr.Length; a++)
                {
                    for (int i = 0; i < lst.Length; i++)
                    {

                        WF_STEPATH_TPL pathVal = new WF_STEPATH_TPL();
                        pathVal.WFID = stepObj.WFID;
                        pathVal.PROCID = stepObj.PROCID;
                        pathVal.STEP_ID = int.Parse(curArr[a]);
                        pathVal.NEXT_ID = int.Parse(lst[i]);
                        pathVal.PATH_TYPE = int.Parse(WFEnum.PathType.Normal.ToString("d"));
                        if (!BLLTable<WF_STEPATH_TPL>.Exists(pathVal))
                        {
                            pathVal.CONDITION = "";
                            pathVal.FORMULAR = "";
                            BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(pathVal, WF_STEPATH_TPL.Attribute.PATH_ID);

                            WF_STEP_TPL uuu = new WF_STEP_TPL();
                            uuu.WFID = stepObj.WFID;
                            uuu.PROCID = stepObj.PROCID;
                            uuu.STEP_ID = pathVal.NEXT_ID;
                            WF_STEP_TPL vvv = new WF_STEP_TPL();
                            vvv.IS_USE = 1;
                            BLLTable<WF_STEP_TPL>.Factory(conn).Update(vvv, uuu);

                        }

                    }
                }
            }

            //Response.Write(re.ToString());


            #endregion

            Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示

        }

        if (Request["DelStepPath"] != null)
        {
            #region//DelStepPath
            string stepid = Request["DelStepPath"];
            WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);
            WF_STEPATH_TPL ccc = new WF_STEPATH_TPL();
            ccc.WFID = stepObj.WFID;
            ccc.PROCID = stepObj.PROCID;
            //ccc.NEXT_ID = int.Parse(stepid);
            ccc.Where("(NEXT_ID=" + stepid + " or STEP_ID=" + stepid + ")");

            int re = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(ccc);

            WF_STEP_TPL uuu = new WF_STEP_TPL();
            uuu.WFID = stepObj.WFID;
            uuu.PROCID = stepObj.PROCID;
            uuu.STEP_ID = int.Parse(stepid); ;
            //ccc.Where("(NEXT_ID=" + stepid + " or STEP_ID=" + stepid + ")");
            WF_STEP_TPL vvv = new WF_STEP_TPL();
            vvv.IS_USE = 0;
            BLLTable<WF_STEP_TPL>.Factory(conn).Update(vvv, uuu);

            Response.Write(re.ToString());

            #endregion
        }
        #region//在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelByKeyID"] != null)
        {
            int re = delStep(Request["DelByKeyID"]);// BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.STEP_ID, Request["DelSTEP_ID"]);
            if (re > 0)
            {
                Response.Write("{re:1,msg:''}");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("{re:0,msg:''}");
            }
        }
        #endregion

        #region//在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelSTEP_ID"] != null)
        {
            int re = delStep(Request["DelSTEP_ID"]);// BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.STEP_ID, Request["DelSTEP_ID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }
        #endregion

        #region//在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            string[] arr = StringHelper.GetStringArray(Request["DelKeyIDS"], ',');
            int re = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                re += delStep(arr[i]);
            }
            //WF_STEP_TPL cond = new WF_STEP_TPL();
            //cond.In(WF_STEP_TPL.Attribute.STEP_ID, Request["DelKeyIDS"]);
            //int re = BLLTable<WF_STEP_TPL>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }
        #endregion

        #region//验证过程是否配置正确
        if (Request["checkProc"] != null)
        {
            int wfid = int.Parse(Request["WFID"]);
            int procid = int.Parse(Request["PROCID"]);
            if (WFAdmin.IsProcessSetComp(wfid, procid, false))
            {
                Response.Write("过程配置正确！");
            }
            else
            {
                Response.Write("过程配置错误！");
            }
            string msg = null;
            if (!WFAdmin.IsProcessDBSetOK(wfid, procid, out msg))
            {
                Response.Write(msg);
            }
        }

        #endregion

        #region//复制流程
        if (Request["cloneProc"] != null)
        {
            int wfid = int.Parse(Request["WFID"]);
            int procid = int.Parse(Request["PROCID"]);
            string outMsg = "";
            bool isOk = false;
            isOk = WFAdmin.IsProcessDBSetOK(wfid, procid, out outMsg);
            if (isOk == true)
            {
                isOk = WFAdmin.IsProcessSetComp(wfid, procid, false);
                if (isOk == false)
                {
                    outMsg = "过程配置不正确！";
                }
            }

            if (isOk == true)
            {

                int re = WFAdmin.CloneProcess(procid);
                if (re > 0)
                {
                    BLLTable<WF_INFO>.Factory(conn).Update(WF_INFO.Attribute.WFID, wfid, WF_INFO.Attribute.STATUS, 1);
                    Response.Write("ok");
                }
                else
                {
                    Response.Write("执行启动过程失败！");
                }
            }
            else
            {
                Response.Write(outMsg);
            }
        }
        #endregion

        #region//启用流程
        if (Request["applyProc"] != null)
        {
            int wfid = int.Parse(Request["WFID"]);
            int procid = int.Parse(Request["PROCID"]);
            string outMsg = "";
            bool isOk = false;
            isOk = WFAdmin.IsProcessDBSetOK(wfid, procid, out outMsg);
            if (isOk == true)
            {
                isOk = WFAdmin.IsProcessSetComp(wfid, procid, false);
                if (isOk == false)
                {
                    outMsg = "过程配置不正确！";
                }
            }

            if (isOk == true)
            {
                int re = WFAdmin.ApplyProcess(procid);
                if (re > 0)
                {

                    BLLTable<WF_INFO>.Factory(conn).Update(WF_INFO.Attribute.WFID, wfid, WF_INFO.Attribute.STATUS, 1);
                    Response.Write("ok");
                }
                else
                {
                    Response.Write("应用过程失败！");
                }
            }
            else
            {
                Response.Write(outMsg);
            }
        }
        #endregion

        #region//保存数据
        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            WF_STEP_TPL val = new WF_STEP_TPL();
            val.STEP_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName]))
                {
                    val.SetValue(lstCol[i].FieldName, Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_STEP_TPL>.Factory(conn).Update(val, WF_STEP_TPL.Attribute.STEP_ID);
            Response.Write("修改用户信息成功");

        }
        #endregion

        #region////显示子节点
        if (Request["getSubNodes"] != null)
        {
            string nodetype = Request["ntype"];
            StringBuilder sb = new StringBuilder("[");
            string id = Request["id"];
            if (nodetype == "root")
            {
                #region
                WF_PROCESS_TPL obj = new WF_PROCESS_TPL();
                obj.WFID = int.Parse(id);
                WF_PROCESS_TPL val = new WF_PROCESS_TPL();
                val.OrderBy(WF_PROCESS_TPL.Attribute.PROCID, Order.Asc);
                List<WF_PROCESS_TPL> lst = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(val, obj);
                if (lst.Count != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        sb.Append("{id:'").Append(lst[i].PROCID);
                        sb.Append("',pid:'").Append("0").Append("',no:").Append(lst[i].PROCID);
                        sb.Append(",sc:").Append("0");
                        sb.Append(",name:'").Append(lst[i].PROC_NAME).Append("',ntype:'proc'}");
                    }
                }
                #endregion
            }
            if (nodetype == "proc")
            {
                #region
                WF_STEP_TPL obj = new WF_STEP_TPL();
                obj.PROCID = int.Parse(id);
                obj.Where("STEP_TYPE in(1,2)");
                WF_STEP_TPL val = new WF_STEP_TPL();
                val.OrderBy(WF_STEP_TPL.Attribute.SORT_NUM, Order.Asc);
                List<WF_STEP_TPL> lst = BLLTable<WF_STEP_TPL>.Factory(conn).Select(val, obj);
                if (lst.Count != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        string type = "step";
                        if (lst[i].STEP_TYPE.ToString() == WFEnum.StepType.Begin.ToString("d")) {
                            type = "begin";
                        }
                        if (lst[i].STEP_TYPE.ToString() == WFEnum.StepType.End.ToString("d"))
                        {
                            type = "end";
                        }
                        if (lst[i].STEP_TYPE.ToString() == WFEnum.StepType.Roate.ToString("d"))
                        {
                            type = "roate";
                        }
                        sb.Append("{id:'").Append(lst[i].STEP_ID);
                        sb.Append("',pid:'").Append("0").Append("',no:").Append(lst[i].SORT_NUM);
                        sb.Append(",sc:").Append("0");
                        sb.Append(",name:'").Append(lst[i].STEP_NAME).Append("',ntype:'" + type + "'}");
                    }
                }
                #endregion
            }
            sb.Append("]");
            Response.Write(sb.ToString());
        }
        #endregion

        if (Request["deleteNode"] != null)
        {
            #region//deleteNode
            int re = 0;
            string stepid = Request["id"];

            try
            {

                WF_STEP_TPL stepObj = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);

                WF_STEPATH_TPL ccc = new WF_STEPATH_TPL();
                ccc.WFID = stepObj.WFID;
                ccc.PROCID = stepObj.PROCID;
                ccc.Where("(NEXT_ID=" + stepid + " or STEP_ID=" + stepid + ")");

                BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(ccc);


                BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(WF_CHECKER_TPL.Attribute.STEP_ID, stepid);
                BLLTable<WF_STEP_FORM_TPL>.Factory(conn).Delete(WF_STEP_FORM_TPL.Attribute.STEP_ID, stepid);
                BLLTable<WF_STEPVAR_TPL>.Factory(conn).Delete(WF_STEPVAR_TPL.Attribute.STEP_ID, stepid);

                re = BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.STEP_ID, stepid);
            }
            catch
            {
                re = -1;
            }
            if (re > 0)
            {
                Response.Write("{re:1,msg:'删除节点成功！'}");
            }
            else {
                Response.Write("{re:0,msg:'删除节点失败！'}");
            }

            #endregion
        }
        Response.End();
    }
}
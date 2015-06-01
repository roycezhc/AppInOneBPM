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

public partial class WF_Admin_STEP_STEPATH_BACK : AgileFrame.AppInOne.Common.BasePage
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("111");
        //Response.End();
        //return;
        if (Request["addNewToRow"] != null)
        {
            #region//添加新节点节点---a,b和d之间插入节点c：
            //删除连接到节点c的路径[code1]；删除原来 a,b和d之间的路径[code2]；插入a,b和c之间,c和d之间的路径[code3]。
            //
            WF_STEP_TPL valObj = new WF_STEP_TPL();
            try
            {
                int wfid = Convert.ToInt32(Request["WFID"]);
                int procid = Convert.ToInt32(Request["PROCID"]);
                int steptype = 1;
                if (Request["STEP_TYPE"] != null)
                    steptype = Convert.ToInt32(Request["STEP_TYPE"]);

                valObj.WFID = wfid;
                if (Request["STEP_NAME"] != null)
                    valObj.STEP_NAME = Request["STEP_NAME"];
                valObj.PROCID = procid;

                valObj.STEP_TYPE = steptype;

                valObj.NOTE = "";

                valObj.CONDITION = "";
                valObj.FORMULAR = "";
                //新增节点，成功的话，再增加线段。
                int count = BLLTable<WF_STEP_TPL>.Factory(conn).Insert(valObj, WF_STEP_TPL.Attribute.STEP_ID);
                if (count > 0)
                {
                    int stepid = valObj.STEP_ID;

                    #region//code1
                    WF_STEPATH_TPL delOld = new WF_STEPATH_TPL();
                    delOld.WFID = wfid;
                    delOld.PROCID = procid;
                    delOld.PATH_TYPE = 1;
                    delOld.Where("(STEP_ID=" + stepid + " or NEXT_ID=" + stepid + ")");
                    BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(delOld);
                    #endregion

                    string previds = Request["PrevIDS"];
                    string nextids = Request["NextIDS"];
                    if (!string.IsNullOrEmpty(previds) && !string.IsNullOrEmpty(nextids))
                    {
                        string[] arr1 = StringHelper.GetStringArray(previds, ',');
                        string[] arr2 = StringHelper.GetStringArray(nextids, ',');
                        if (arr2 != null && arr1 != null)
                        {
                            if (Request["delOld"] != null)
                            {
                                #region//code2
                                //因为再节点之间插入了新节点，所以要删除 原节点之间的路径
                                WF_STEPATH_TPL delObj = new WF_STEPATH_TPL();
                                delObj.WFID = wfid;
                                delObj.PROCID = procid;
                                delObj.PATH_TYPE = 1;
                                for (int i = 0; i < arr1.Length; i++)
                                {
                                    for (int j = 0; j < arr2.Length; j++)
                                    {
                                        delObj.STEP_ID = int.Parse(arr1[i]);
                                        delObj.NEXT_ID = int.Parse(arr2[j]);

                                        BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(delObj);
                                    }
                                }
                                #endregion//
                            }
                        }
                        #region//code3
                        WF_STEPATH_TPL pathVal = new WF_STEPATH_TPL();
                        pathVal.WFID = wfid;
                        pathVal.PROCID = procid;
                        pathVal.PATH_TYPE = int.Parse(WFEnum.PathType.Normal.ToString("d"));
                        
                        if (arr1 != null)
                        {
                            for (int i = 0; i < arr1.Length; i++)
                            {
                                pathVal.STEP_ID = int.Parse(arr1[i]);
                                string tp = BLLTable<WF_STEP_TPL>.Factory(conn).GetOneValue(WF_STEP_TPL.Attribute.STEP_ID, pathVal.STEP_ID, WF_STEP_TPL.Attribute.STEP_TYPE);
                                if (!string.IsNullOrEmpty(tp)) {
                                    pathVal.NODE_TYPE = int.Parse(tp);
                                }
                                pathVal.NEXT_ID = stepid;
                                if (!BLLTable<WF_STEPATH_TPL>.Exists(pathVal))
                                {
                                    pathVal.CONDITION = "";
                                    pathVal.FORMULAR = "";
                                    count += BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(pathVal, WF_STEPATH_TPL.Attribute.PATH_ID);
                                }
                            }
                        }

                        if (arr2 != null)
                        {
                            for (int i = 0; i < arr2.Length; i++)
                            {
                                pathVal.NODE_TYPE = steptype;
                                pathVal.STEP_ID = stepid;
                                pathVal.NEXT_ID = int.Parse(arr2[i]);
                                if (!BLLTable<WF_STEPATH_TPL>.Exists(pathVal))
                                {
                                    pathVal.CONDITION = "";
                                    pathVal.FORMULAR = "";
                                    count += BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(pathVal, WF_STEPATH_TPL.Attribute.PATH_ID);
                                }
                            }
                        }

                        #endregion
                    }

                    Response.Write(stepid.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }
        if (Request["UpdateStepName"] != null)//更新节点名
        {
            #region//添加节点
            try
            {
                int count = BLLTable<WF_STEP_TPL>.Factory(conn).Update(WF_STEP_TPL.Attribute.STEP_ID, Request["STEP_ID"], WF_STEP_TPL.Attribute.STEP_NAME, Request["STEP_NAME"]);
                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }

        /*
         * c节点移到a,b和d之间：
         * 删除原来连接到节点c的路径[code1]；
         * 如果移动c导致a,b和c之间增加了一个步骤行，既没有移动到d所在的行，则要删除原来a,b和d之间的路径[code2]。
         * 插入a,b和c之间,c和d之间的路径[code3]。
         */
        if (Request["UpdateStepPath"] != null)//更新线段
        {
            #region//更新节点之间的路径
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            try
            {
                int count = 0;
                int wfid = Convert.ToInt32(Request["WFID"]);
                int procid = Convert.ToInt32(Request["PROCID"]);
                int stepid = Convert.ToInt32(Request["STEP_ID"]);

                valObj.PATH_TYPE = int.Parse(WFEnum.PathType.Normal.ToString("d")); ;

                string previds = Request["PrevIDS"];
                string nextids = Request["NextIDS"];

                valObj.WFID = wfid;
                valObj.PROCID = procid;
                string[] arr1 = StringHelper.GetStringArray(previds, ',');
                string[] arr2 = StringHelper.GetStringArray(nextids, ',');

                if (stepid > 0)
                {
                    #region//code1
                    WF_STEPATH_TPL delOld = new WF_STEPATH_TPL();
                    delOld.WFID = wfid;
                    delOld.PROCID = procid;
                    delOld.PATH_TYPE = int.Parse(WFEnum.PathType.Normal.ToString("d")); ;
                    delOld.Where("(STEP_ID=" + stepid + " or NEXT_ID=" + stepid + ")");
                    BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(delOld);
                    #endregion

                    if (Request["delOld"] != null)
                    {

                        if (arr1 != null && arr2 != null)
                        {
                            #region//code2
                            WF_STEPATH_TPL delObj = new WF_STEPATH_TPL();
                            delObj.WFID = wfid;
                            delObj.PROCID = procid;
                            delObj.PATH_TYPE = int.Parse(WFEnum.PathType.Normal.ToString("d")); ;
                            for (int i = 0; i < arr1.Length; i++)
                            {
                                for (int j = 0; j < arr2.Length; j++)
                                {
                                    delObj.STEP_ID = int.Parse(arr1[i]);
                                    delObj.NEXT_ID = int.Parse(arr2[j]);

                                    BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(delObj);
                                }
                            }
                            #endregion//
                        }
                    }
                    #region//code3
                    if (arr1 != null)
                    {
                        for (int i = 0; i < arr1.Length; i++)
                        {
                            valObj.STEP_ID = int.Parse(arr1[i]);
                            string tp = BLLTable<WF_STEP_TPL>.Factory(conn).GetOneValue(WF_STEP_TPL.Attribute.STEP_ID, valObj.STEP_ID, WF_STEP_TPL.Attribute.STEP_TYPE);
                            if (!string.IsNullOrEmpty(tp))
                            {
                                valObj.NODE_TYPE = int.Parse(tp);
                            }
                            valObj.NEXT_ID = stepid;
                            if (!BLLTable<WF_STEPATH_TPL>.Exists(valObj))
                            {
                                valObj.CONDITION = "";
                                valObj.FORMULAR = "";
                                count += BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(valObj, WF_STEPATH_TPL.Attribute.PATH_ID);
                            }
                        }
                    }

                    if (arr2 != null)
                    {
                        for (int i = 0; i < arr2.Length; i++)
                        {
                            valObj.STEP_ID = stepid;
                            string tp = BLLTable<WF_STEP_TPL>.Factory(conn).GetOneValue(WF_STEP_TPL.Attribute.STEP_ID, valObj.STEP_ID, WF_STEP_TPL.Attribute.STEP_TYPE);
                            if (!string.IsNullOrEmpty(tp))
                            {
                                valObj.NODE_TYPE = int.Parse(tp);
                            }
                            valObj.NEXT_ID = int.Parse(arr2[i]);
                            if (!BLLTable<WF_STEPATH_TPL>.Exists(valObj))
                            {
                                valObj.CONDITION = "";
                                valObj.FORMULAR = "";
                                count += BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(valObj, WF_STEPATH_TPL.Attribute.PATH_ID);
                            }
                        }
                    }

                    #endregion
                }

                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }
        //添加返回路径
        if (Request["AddBackLine"] != null)
        {
            #region//添加返回路径
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            try
            {
                int count = 0;
                valObj.WFID = Convert.ToInt32(Request["WFID"]);
                valObj.PROCID = Convert.ToInt32(Request["PROCID"]);
                valObj.PATH_TYPE = int.Parse(WFEnum.PathType.BackTo.ToString("d"));

                valObj.NEXT_ID = Convert.ToInt32(Request["NEXT_ID"]);
                valObj.STEP_ID = Convert.ToInt32(Request["STEP_ID"]);
                string tp = BLLTable<WF_STEP_TPL>.Factory(conn).GetOneValue(WF_STEP_TPL.Attribute.STEP_ID, valObj.STEP_ID, WF_STEP_TPL.Attribute.STEP_TYPE);
                if (!string.IsNullOrEmpty(tp))
                {
                    valObj.NODE_TYPE = int.Parse(tp);
                }
                valObj.CONDITION = "";
                valObj.FORMULAR = "";
                count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(valObj, WF_STEPATH_TPL.Attribute.PATH_ID);

                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }

        if (Request["GetBackNextIDS"] != null)
        {
            #region//添加返回路径
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            try
            {

                valObj.WFID = Convert.ToInt32(Request["WFID"]);
                valObj.PROCID = Convert.ToInt32(Request["PROCID"]);
                valObj.PATH_TYPE = int.Parse(WFEnum.PathType.BackTo.ToString("d")); ;

                valObj.STEP_ID = Convert.ToInt32(Request["STEP_ID"]);

                WF_STEPATH_TPL vvv = new WF_STEPATH_TPL();
                vvv.NEXT_ID = 0;
                List<WF_STEPATH_TPL> lst = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(vvv, valObj);

                //WF_STEPATH_TPL ooo = BLLTable<WF_STEPATH_TPL>.Factory(conn).GetRowData(new WF_STEPATH_TPL(WF_STEPATH_TPL.Attribute.NEXT_ID), valObj);

                if (lst != null)
                {
                    string str = "";
                    for (int i = 0; i < lst.Count; i++)
                    {
                        str += "," + lst[i].NEXT_ID;
                    }
                    Response.Write(str);
                }
                else
                {
                    //Response.Write("0");
                }
            }
            catch
            {
                //Response.Write("-1");
            }
            #endregion

        }
        if (Request["delLine"] != null)
        {
            #region//删除指定类型的路径
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            try
            {
                int count = 0;
                valObj.WFID = Convert.ToInt32(Request["WFID"]);
                valObj.PROCID = Convert.ToInt32(Request["PROCID"]);
                valObj.PATH_TYPE = Convert.ToInt32(Request["PATH_TYPE"]);

                valObj.NEXT_ID = Convert.ToInt32(Request["NEXT_ID"]);
                valObj.STEP_ID = Convert.ToInt32(Request["STEP_ID"]);

                count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(valObj);

                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }
        if (Request["delStep"] != null)
        {
            #region//删除节点
            WF_STEP_TPL valObj = new WF_STEP_TPL();
            try
            {
                int count = WFAdmin.delStep(Convert.ToInt32(Request["STEP_ID"]));

                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }
        if (Request["delStepInPath"] != null)
        {
            #region//图形界面里删除节点
            /*
             * 删除a,b和d之间的节点c:
             * 删除原来连接到节点c的路径[code1]；
             * 如果c没有兄弟节点，参数PrevIDS和NextIDS不会为空，则插入a,b和d之间的路径[code2]。
             */
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            try
            {
                int count = 0;
                int wfid = Convert.ToInt32(Request["WFID"]);
                int procid = Convert.ToInt32(Request["PROCID"]);
                int stepid = Convert.ToInt32(Request["STEP_ID"]);
                
                #region//code1
                WF_STEPATH_TPL delOld = new WF_STEPATH_TPL();
                delOld.WFID = wfid;
                delOld.PROCID = procid;
                delOld.PATH_TYPE = 1;
                delOld.Where("(STEP_ID=" + stepid + " or NEXT_ID=" + stepid + ")");
                count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(delOld);
                #endregion

                string previds = Request["PrevIDS"];
                string nextids = Request["NextIDS"];
                if (!string.IsNullOrEmpty(previds) && !string.IsNullOrEmpty(nextids))
                {
                    valObj.WFID = wfid;
                    valObj.PROCID = procid;
                    string[] arr1 = StringHelper.GetStringArray(previds, ',');
                    string[] arr2 = StringHelper.GetStringArray(nextids, ',');

                    #region//code2

                    if (arr1 != null && arr2 != null)
                    {
                        for (int i = 0; i < arr1.Length; i++)
                        {
                            for (int j = 0; j < arr2.Length; j++)
                            {
                                valObj.STEP_ID = int.Parse(arr1[i]);
                                string tp = BLLTable<WF_STEP_TPL>.Factory(conn).GetOneValue(WF_STEP_TPL.Attribute.STEP_ID, valObj.STEP_ID, WF_STEP_TPL.Attribute.STEP_TYPE);
                                if (!string.IsNullOrEmpty(tp))
                                {
                                    valObj.NODE_TYPE = int.Parse(tp);
                                }
                                valObj.NEXT_ID = int.Parse(arr2[j]);
                                valObj.PATH_TYPE = 1;
                                if (!BLLTable<WF_STEPATH_TPL>.Exists(valObj))
                                {
                                    valObj.CONDITION = "";
                                    valObj.FORMULAR = "";
                                    count += BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(valObj, WF_STEPATH_TPL.Attribute.PATH_ID);
                                }
                            }
                        }
                    }

                    #endregion
                }

                if (count > 0)
                {
                    Response.Write(count.ToString());
                }
                else
                {
                    Response.Write("0");
                }
            }
            catch
            {
                Response.Write("-1");
            }
            #endregion

        }
        Response.End();
    }
}
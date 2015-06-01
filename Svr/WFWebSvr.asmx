<%@ WebService Language="C#" Class="WFWebSvr" %>
using System.Collections.Generic;
using System;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Xml.Linq;
using AgileFrame.AppInOne.WF;

/// <summary>
/// WorkFlowService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
// [System.Web.Script.Services.ScriptService]
public class WFWebSvr : AgileFrame.AppInOne.Common.BaseWebService
{

    [WebMethod]
    public void stringoperate(string str)
    {
        string ss = str;
    }
    [WebMethod]
    public string HelloWorld(string WFID, string PROCID)
    {
        return "Hello World";
    }

 //   [WebMethod]
 //   public string GetWorkFlowList()
 //   {
 //       // return "";
 //       string xml = "";
 //       WorkFlowDataContext dataContext = new WorkFlowDataContext();
 //       {

 //           try
 //           {

 //               XDocument doc = new XDocument(
 //new XElement("WorkFlows", from p in dataContext.WorkFlow_Processes
 //                          select (new XElement("WorkFlow",
 //                                  new XAttribute("Name", string.IsNullOrEmpty(p.WorkFlowName) ? p.WorkFlowID : p.WorkFlowName),
 //                                  new XAttribute("ID", p.WorkFlowID)))));
 //               xml = doc.ToString();

 //           }
 //           catch (Exception e)
 //           {
 //               xml = "";
 //           }
 //       }

 //       return xml;
 //   }


    ///// <summary>
    ///// 获取工作流xml描述
    ///// </summary>
    ///// <param name="workflowID">流程ID</param>
    ///// <returns></returns>
    //[WebMethod]
    //public string GetWorkFlowXML(string workflowID)
    //{
    //    string xml = "";
    //    WorkFlowDataContext dataContext = new WorkFlowDataContext();
    //    {

    //        try
    //        {

    //            WorkFlow_Process process = dataContext.WorkFlow_Processes.Single(p => p.WorkFlowID == workflowID);

    //            if (process != null)
    //                xml = process.WorkFlowXML;
    //        }
    //        catch (Exception e)
    //        {
    //            xml = "";
    //        }
    //    }

    //    return xml;
    //}
//    void deleteExistsWorkFlow(string workflowID)
//    {
//        string deleteSql = @"delete from WorkFlow_Rule 
//where BeginActivityID in(select ActivityID from WorkFlow_Activity where workflowID='{0}')
//or EndActivityID in (select ActivityID from WorkFlow_Activity where workflowID='{0}');
//delete from WorkFlow_Activity where workflowID='{0}';
//delete from WorkFlow_Process where workflowID='{0}';";
//        WorkFlowDataContext dataContext = new WorkFlowDataContext();
//        {
//            deleteSql = string.Format(deleteSql, workflowID);
//            dataContext.ExecuteCommand(deleteSql, workflowID);
//            dataContext.SubmitChanges();
//        }

//    }
    ///// <summary>
    ///// 更新流程xml
    ///// </summary>
    ///// <param name="workFlowXml">流程xml描述</param>
    //[WebMethod]
    //public void UpdateWorkFlowXML(string workFlowXml)
    //{

    //    WorkFlowDataContext dataContext = new WorkFlowDataContext();
    //    {
    //        WorkFlow_Process process = new WorkFlow_Process();

    //        Byte[] b = System.Text.UTF8Encoding.UTF8.GetBytes(workFlowXml);
    //        XElement xele = XElement.Load(System.Xml.XmlReader.Create(new MemoryStream(b)));

    //        process.WorkFlowName = xele.Attribute(XName.Get("Name")).Value;
    //        process.WorkFlowID = xele.Attribute(XName.Get("UniqueID")).Value;
    //        process.WorkFlowXML = workFlowXml;
    //        deleteExistsWorkFlow(process.WorkFlowID);
    //        var partNos = from item in xele.Descendants("Activity") select item;
    //        foreach (XElement node in partNos)
    //        {

    //            WorkFlow_Activity activity = new WorkFlow_Activity();
    //            process.WorkFlow_Activities.Add(activity);
    //            activity.ActivityID = node.Attribute(XName.Get("UniqueID")).Value;
    //            activity.ActivityName = node.Attribute(XName.Get("ActivityName")).Value;
    //            activity.ActivityType = node.Attribute(XName.Get("Type")).Value;
    //        }

    //        dataContext.WorkFlow_Processes.InsertOnSubmit(process);
    //        partNos = from item in xele.Descendants("Rule") select item;
    //        WorkFlow_Rule rule = null;
    //        foreach (XElement node in partNos)
    //        {
    //            rule = new WorkFlow_Rule();
    //            rule.BeginActivityID = node.Attribute(XName.Get("BeginActivityUniqueID")).Value;
    //            rule.Condition = node.Attribute(XName.Get("RuleCondition")).Value;
    //            rule.EndActivityID = node.Attribute(XName.Get("EndActivityUniqueID")).Value;
    //            rule.RuleID = node.Attribute(XName.Get("UniqueID")).Value;
    //            rule.RuleName = node.Attribute(XName.Get("RuleName")).Value;
    //            rule.RuleType = node.Attribute(XName.Get("LineType")).Value;
    //            dataContext.WorkFlow_Rules.InsertOnSubmit(rule);

    //        }
    //        dataContext.SubmitChanges();
    //    }


    //}
    [WebMethod]
    /// <summary>
    /// 根据流程ID查询活动节点
    /// </summary>
    /// <param name="ID">流程编号</param>
    /// <returns>XML代码</returns>
    public string FindActivity(string WFID, string PROCID)
    {
        string str = "";
        WF_STEP_TPL ConWfStep = new WF_STEP_TPL();
        ConWfStep.WFID = Convert.ToInt32(WFID);
        ConWfStep.PROCID = Convert.ToInt32(PROCID);
        try
        {
            List<WF_STEP_TPL> list = BLLTable<WF_STEP_TPL>.Factory(conn).Select(new WF_STEP_TPL(), ConWfStep);
            foreach (WF_STEP_TPL WfStep in list)
            {
                str += @"<Activity  UniqueID=""" + WfStep.UNIQUEID + @""" ActivityID="""" ActivityName=""" + WfStep.STEP_NAME + @""" 
Type=""" + WfStep.NODE_TYPE + @""" SubFlow="""" PositionX=""" + WfStep.POSTION_X + @""" PositionY=""" + WfStep.POSTION_Y + @""" 
RepeatDirection=""None"" ZIndex=""" + WfStep.Z_INDEX + @"""></Activity>";
            }
        }
        catch { }
        return str;
    }
    [WebMethod]
    /// <summary>
    /// 根据规则的UNIQUEID查询规则
    /// </summary>
    /// <param name="ID">流程编号</param>
    /// <returns>XML代码</returns>
    public string FindRule(string WFID, string PROCID)
    {
        string str = "";
        WF_STEPATH_TPL ConPath = new WF_STEPATH_TPL();
        ConPath.WFID = Convert.ToInt32(WFID);
        ConPath.PROCID = Convert.ToInt32(PROCID);
        try
        {
            List<WF_STEPATH_TPL> list = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(new WF_STEPATH_TPL(), ConPath);
            foreach (WF_STEPATH_TPL Path in list)
            {
                str += @"<Rule  UniqueID=""" + Path.UNIQUEID + @""" RuleID=""" + Path.UNIQUEID + @""" RuleName=""" + Path.RULENAME + @""" 
LineType=""" + Path.LINE_TYPE + @""" RuleCondition="""" BeginActivityUniqueID=""" + Path.BEGINACTIVITYUNIQUEID + @""" 
EndActivityUniqueID=""" + Path.ENDACTIVITYUNIQUEID + @""" BeginActivityID="""" EndActivityID="""" ";
                WF_STEP_TPL ConWfStep = new WF_STEP_TPL();
                ConWfStep.UNIQUEID = Path.BEGINACTIVITYUNIQUEID;//根据起始节点UNIQUEID查询起始节点坐标，作为规则的起始坐标
                WF_STEP_TPL step = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.UNIQUEID, ConWfStep.UNIQUEID);
                ConWfStep.UNIQUEID = Path.ENDACTIVITYUNIQUEID;//根据终端节点UNIQUEID查询终端节点坐标，作为规则的终端坐标
                WF_STEP_TPL StepEnd = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.UNIQUEID, ConWfStep.UNIQUEID);
                if (step != null && StepEnd != null)
                {
                    str += @"BeginPointX=""" + step.POSTION_X + @""" BeginPointY=""" + step.POSTION_Y + @"""
EndPointX=""" + StepEnd.POSTION_X + @""" EndPointY=""" + StepEnd.POSTION_Y + @""" TurnPoint1X=""" + Path.TURNPOINT1X + @""" 
TurnPoint1Y=""" + Path.TURNPOINT1Y + @""" TurnPoint2X=""" + Path.TURNPOINT2X + @""" TurnPoint2Y=""" + Path.TURNPOINT2Y + @""" TurnPoint3X=""" + Path.TURNPOINT3X + @""" 
 TurnPoint3Y=""" + Path.TURNPOINT3Y + @""" ZIndex=""" + Path.Z_INDEX + @"""></Rule>";
                }
                else
                {
                    str += @"BeginPointX="""" BeginPointY=""""EndPointX="""" EndPointY="""" TurnPoint1X=""0"" 
TurnPoint1Y=""0"" TurnPoint2X=""0"" TurnPoint2Y=""0""  TurnPoint3X=""0"" TurnPoint3Y=""0"" ZIndex=""""></Rule>";
                }
                //else
                //{
                //    return null;
                //}
            }
        }
        catch { }
        return str;
    }
    [WebMethod]
    /// <summary>
    /// 根据流程编号，构建工作流程XML代码
    /// </summary>
    /// <param name="ID">流程编号</param>
    /// <returns>工作流程图的XML代码</returns>
    public string CreatXML(string WFID, string PROCID)
    {
        string XML = @"<?xml version=""1.0"" encoding=""utf-8"" standalone=""yes"" ?>";
        WF_INFO WorkFlow = new WF_INFO();
        WorkFlow.WFID = Convert.ToInt32(WFID);//根据流程ID查询工作流程信息，添加到流程图中
        WF_INFO Work = new WF_INFO();
        Work.WFID = Convert.ToInt32(WFID);
        Work.WFCNAME = "2";
        //WF_INFO Work = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, WorkFlow.WFID);
        XML += @"<WorkFlow UniqueID=""" + Work.WFID + @""" ID="""" Name=""" + Work.WFCNAME + @""" Description="""" Width=""1000"" Height=""600""><Activitys>";
        XML += FindActivity(WFID, PROCID);//根据流程ID查询活动节点，并将活动节点组装到XML代码中返回
        XML += @"</Activitys><Rules>";
        XML += FindRule(WFID, PROCID);//根据流程ID查询规则节点，并将规则节点组装到XML代码中返回
        XML += @"</Rules><Labels></Labels></WorkFlow>";
        return XML;//将组装后的XML代码返回前台
    }
    [WebMethod]
    /// <summary>
    /// 根据流程ID存储各个活动节点
    /// </summary>
    /// <param name="WFID">流程ID</param>
    /// <param name="PROCID">所属过程ID</param>
    /// <param name="ActivityInfo">活动节点信息，组装信息依次为UniqueID,ActivityName,Type,PositionX,PositionY,ZIndex,</param>
    /// /// <param name="message">结果信息</param>
    public string InsertActivity(string WFID, string PROCID, string ActivityInfo, string message)
    {
        string[] info = ActivityInfo.Split(',');
        string ErrorMessage = "";//错误信息
        string MessageInsert = "";//插入操作信息
        string MessageUpdate = "";//更新操作信息
        if (info.Length == 0)
            return null;//没有信息需要保存
        else
        {
            try
            {
                //插入前删除所有相关信息
                WF_STEP_TPL DelCon = new WF_STEP_TPL();
                DelCon.WFID = Convert.ToInt32(WFID);
                List<WF_STEP_TPL> listFind = BLLTable<WF_STEP_TPL>.Factory(conn).Select(WF_STEP_TPL.Attribute.WFID, DelCon.WFID);
                if (listFind.Count > 0)
                {
                    int countdel = BLLTable<WF_STEP_TPL>.Factory(conn).Delete(DelCon);
                    if (countdel < 1)
                        return null;
                }
                WF_STEP_TPL valObj = new WF_STEP_TPL();
                WF_STEP_TPL ConObj = new WF_STEP_TPL();
                ConObj.OrderBy(WF_STEP_TPL.Attribute.STEP_ID, Order.Desc);
                List<WF_STEP_TPL> list = BLLTable<WF_STEP_TPL>.Factory(conn).Select(valObj, ConObj);//获取WF_STEP_TPL表中的记录数量
                int num = 0;
                if (list.Count > 0)
                    num = list[0].STEP_ID;//获取最大的STEP_ID值，然后将STEP_ID值一次增加，作为新数据的STEP_ID值。
                for (int i = 0; i < info.Length / 6; i++)
                {
                    WF_STEP_TPL ValObj = new WF_STEP_TPL();
                    ValObj.WFID = Convert.ToInt32(WFID);//流程ID
                    ValObj.PROCID = Convert.ToInt32(PROCID);//所属过程ID
                    ValObj.UNIQUEID = info[i * 6 + 0];//活动随机编码
                    //根据流程ID和活动随机编码来判断活动是否存在，通过这两个信息就可以确定一个活动
                    List<WF_STEP_TPL> TaList = BLLTable<WF_STEP_TPL>.Factory(conn).Select(new WF_STEP_TPL(), ValObj);//判断数据库中是否存在该活动
                    ValObj.NODE_TYPE = info[i * 6 + 2];//活动类型
                    ValObj.STEP_NAME = info[i * 6 + 1];//活动名称
                    ValObj.POSTION_X = info[i * 6 + 3];//活动X坐标
                    ValObj.POSTION_Y = info[i * 6 + 4];//活动Y坐标
                    ValObj.Z_INDEX = info[i * 6 + 5];//活动Z坐标
                    if (TaList.Count < 1)
                    {
                        ValObj.STEP_ID = num + 1;//活动ID
                        num++;//活动ID为依次增长的
                        int count = BLLTable<WF_STEP_TPL>.Factory(conn).Insert(ValObj);//保存操作
                        if (count > 0)
                            MessageInsert = "活动保存完成！";
                        else
                            ErrorMessage += ValObj.STEP_NAME + "存储操作失败，请重新保存！";//如果操作失败，则需重新保存
                    }
                    else
                    {
                        ValObj.STEP_ID = TaList[0].STEP_ID;//相同的记录只可能有一条。
                        int count = BLLTable<WF_STEP_TPL>.Factory(conn).Update(ValObj, WF_STEP_TPL.Attribute.STEP_ID);//更新数据要根据STEP_ID，只有这个信息是惟一的。
                        if (count > 0)
                            MessageUpdate = "更新操作成功！";
                        else
                            ErrorMessage += ValObj.STEP_NAME + "更新操作失败，请重新操作！";
                    }
                }
            }
            catch { }
        }
        message = MessageInsert + MessageUpdate + ErrorMessage;
        return message;
    }
    [WebMethod]
    /// <summary>
    /// 根据流程ID保存规则信息
    /// </summary>
    /// <param name="ID">流程ID</param>
    /// <param name="PROCID">所属过程ID</param>
    /// <param name="RuleInfo">规则信息依次为UniqueID,RuleName,LineType,BeginActivityUniqueID,EndActivityUniqueID,turnPoint1X,turnPoint2Y,turnPoint2X,turnPoint2Y,turnPoint3X,turnPoint3Y,ZIndex</param>
    /// <param name="message">由于修改代码，此处的返回信息已经没有实际意义，可删去</param>
    public string InsertRule(string WFID, string PROCID, string RuleInfo, string message)
    {
        string[] info = RuleInfo.Split(',');
        string ErrorMessage = "";//错误信息
        string MessageInsert = "";//插入操作信息
        string MessageUpdate = "";//更新操作信息
        if (info.Length == 0)
            return null;//没有信息需要保存
        else
        {

            //插入前删除所有相关信息
            WF_STEPATH_TPL DelCon = new WF_STEPATH_TPL();
            DelCon.WFID = Convert.ToInt32(WFID);
            List<WF_STEPATH_TPL> listFind = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(WF_STEPATH_TPL.Attribute.WFID, DelCon.WFID);
            if (listFind.Count > 0)
            {
                int countdel = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(DelCon);
                if (countdel < 1)
                    return null;
            }
            WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
            WF_STEPATH_TPL ConObj = new WF_STEPATH_TPL();
            ConObj.OrderBy(WF_STEPATH_TPL.Attribute.PATH_ID, Order.Desc);
            List<WF_STEPATH_TPL> list = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(valObj, ConObj);
            int num = 0;
            if (list.Count > 0)
                num = list[0].PATH_ID;//PATH_ID的值是依次增加的，所以每次插入数据时要获取最大值，然后最大值加一为即将插入的数据的PATH_ID值。
            for (int i = 0; i < info.Length / 12; i++)
            {
                WF_STEPATH_TPL ConPath = new WF_STEPATH_TPL();
                WF_STEPATH_TPL ValPath = new WF_STEPATH_TPL();
                ConPath.WFID = Convert.ToInt32(WFID);//流程ID
                ConPath.PROCID = Convert.ToInt32(PROCID);//所属过程ID
                ConPath.UNIQUEID = info[i * 12 + 0];//随机编码
                ConPath.BEGINACTIVITYUNIQUEID = info[i * 12 + 3];//开始节点UNIQUEID
                ConPath.ENDACTIVITYUNIQUEID = info[i * 12 + 4];//结束节点UNIQUEID
                List<WF_STEPATH_TPL> PathList = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(ValPath, ConPath);
                //查询是STEPID（开始节点的ID）和NEXTID（结束节点的ID）的值。
                WF_STEP_TPL STEPIDCon = new WF_STEP_TPL();
                STEPIDCon.UNIQUEID = info[i * 12 + 3];
                WF_STEP_TPL STEPIDVal = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.UNIQUEID, STEPIDCon.UNIQUEID);
                ConPath.STEP_ID = string.IsNullOrEmpty(Convert.ToString(STEPIDVal.STEP_ID)) ? 0 : STEPIDVal.STEP_ID;//如果STEP_ID的值为空或不存在，STEP_ID设为0。

                WF_STEP_TPL NEXTIDCon = new WF_STEP_TPL();
                NEXTIDCon.UNIQUEID = info[i * 12 + 4];
                WF_STEP_TPL NEXTIDVal = BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.UNIQUEID, NEXTIDCon.UNIQUEID);
                ConPath.NEXT_ID = string.IsNullOrEmpty(Convert.ToString(NEXTIDVal.STEP_ID)) ? 0 : NEXTIDVal.STEP_ID;//如果STEP_ID的值为空或不存在，NEXT_ID的值设为0。

                ConPath.RULENAME = info[i * 12 + 1];//规则名称
                ConPath.LINE_TYPE = info[i * 12 + 2];//类型
                ConPath.TURNPOINT1X = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 5]) ? "0" : info[i * 12 + 5]);//第一个拐点的X轴坐标
                ConPath.TURNPOINT1Y = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 6]) ? "0" : info[i * 12 + 6]);//第一个拐点的Y轴坐标
                ConPath.TURNPOINT2X = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 7]) ? "0" : info[i * 12 + 7]);//第二个拐点的X轴坐标
                ConPath.TURNPOINT2Y = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 8]) ? "0" : info[i * 12 + 8]);//第二个拐点的Y轴坐标
                ConPath.TURNPOINT3X = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 9]) ? "0" : info[i * 12 + 9]);//第三个拐点的X轴坐标
                ConPath.TURNPOINT3Y = Convert.ToDouble(string.IsNullOrEmpty(info[i * 12 + 10]) ? "0" : info[i * 12 + 10]);//第三个拐点的Y轴坐标
                ConPath.Z_INDEX = info[i * 12 + 11];//Z轴坐标
                if (PathList.Count < 1)//当该记录不存在时
                {
                    ConPath.PATH_ID = num + 1;//规则ID
                    num++;//规则ID增加一
                    int count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(ConPath);//保存操作
                    if (count > 0)
                        MessageInsert = "规则保存成功！";
                    else
                        ErrorMessage += ConPath.RULENAME + "规则保存失败，请重新保存.";
                }
                else
                {
                    ConPath.PATH_ID = PathList[0].PATH_ID;//相同的记录只可能有一条
                    int count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(ConPath, WF_STEPATH_TPL.Attribute.PATH_ID);//更新数据要根据PATH_ID，只有这个信息是惟一的。
                    if (count > 0)
                    {
                        MessageUpdate = "规则更新成功！";
                    }
                    else
                    {
                        ErrorMessage += ConPath.RULENAME + "规则更新失败，请重新保存！";
                    }
                }
            }

        }
        message = MessageInsert + MessageUpdate + ErrorMessage;
        return message;
    }
}
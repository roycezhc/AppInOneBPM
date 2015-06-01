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
using AgileFrame.AppInOne.CMS;
using System.Web.Script.Serialization;

public partial class WF_Admin_STEP_STEPATH_BACKNEW : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strRet = "";
            //获取操作类型
            switch (Common.GetReqStrValue("module"))
            {
                //添加新节点
                case "addStep":
                    strRet = addStep();
                    //strRet = "699";
                    break;
                //删除节点
                case "delStep":
                    strRet = delStep();
                    //strRet = "699";
                    break;
                //添加连线
                case "addConnect":
                    strRet = addConnect();
                    break;
                //保存流程
                case "saveStep":
                    strRet = saveStep();
                    break;
                //删除连线
                case "delConnect":
                    strRet = delConnect();
                    break;
                default:
                    strRet = "";
                    break;
            }

            Response.Write(strRet);
            Response.End();
        }
    }
    #region 保存流程
    /// <summary>
    /// 保存流程
    /// </summary>
    /// <returns></returns>
    private string saveStep()
    {
        List<WF_STEP_TPL> list = new JavaScriptSerializer().Deserialize<List<WF_STEP_TPL>>(Common.GetReqStrValue("jsonData"));
        string strRet = "";
        try
        {
            foreach (WF_STEP_TPL valObj in list)
            {
                //更新
                int count = BLLTable<WF_STEP_TPL>.Factory(conn).Update(valObj, WF_STEP_TPL.Attribute.STEP_ID);
                if (count > 0)
                {
                    strRet = count.ToString();
                }
                else
                {
                    strRet = "0";
                }
            }
            return strRet;
        }

        catch
        {
            return "-1";
        }


    }
    #endregion

    #region 添加新节点
    /// <summary>
    /// 添加新节点
    /// </summary>
    /// <returns></returns>
    private string addStep()
    {
        string strRet = "";
        WF_STEP_TPL valObj = new WF_STEP_TPL();
        try
        {
            valObj.WFID = Common.GetReqIntValue("WFID");
            valObj.STEP_NAME = Common.GetReqStrValue("STEP_NAME");
            valObj.PROCID = Common.GetReqIntValue("PROCID");
            valObj.STEP_TYPE = Common.GetReqIntValue("STEP_TYPE");
            valObj.BLOCKX = Common.GetReqIntValue("left");
            valObj.BLOCKY = Common.GetReqIntValue("top");
            //新增节点
            int count = BLLTable<WF_STEP_TPL>.Factory(conn).Insert(valObj, WF_STEP_TPL.Attribute.STEP_ID);
            if (count > 0)
            {
                strRet = valObj.STEP_ID.ToString();
            }
            else
            {
                strRet = "0";
            }
            return strRet;
        }

        catch
        {
            return "-1";
        }


    }
    #endregion

    #region 添加连线
    /// <summary>
    /// 添加连线
    /// </summary>
    /// <returns></returns>
    private string addConnect()
    {
        string strRet = "0";
        WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
        try
        {
            valObj.WFID = Common.GetReqIntValue("WFID");
            valObj.STEP_ID = Common.GetReqIntValue("SourceId");
            valObj.PROCID = Common.GetReqIntValue("PROCID");
            valObj.NEXT_ID = Common.GetReqIntValue("TargetId");
            valObj.SOURCE_ANCHOR = Common.GetReqStrValue("SourceAnchor");
            valObj.TARGET_ANCHOR = Common.GetReqStrValue("TargetAnchor");
            valObj.NODE_TYPE = Common.GetReqIntValue("nodeType");
            valObj.PATH_TYPE = 1;

            if (!BLLTable<WF_STEPATH_TPL>.Factory(conn).Exists(valObj))
            {
                //新增节点
                int count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Insert(valObj, WF_STEPATH_TPL.Attribute.PATH_ID);
                if (count > 0)
                {
                    strRet = valObj.STEP_ID.ToString();
                }
                else
                {
                    strRet = "0";
                }
            }
            return strRet;
        }

        catch
        {
            return "-1";
        }


    }
    #endregion

    #region 删除连线
    /// <summary>
    /// 删除连线
    /// </summary>
    /// <returns></returns>
    private string delConnect()
    {
        WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
        try
        {
            valObj.WFID = Common.GetReqIntValue("WFID");
            valObj.STEP_ID = Common.GetReqIntValue("SourceId");
            valObj.PROCID = Common.GetReqIntValue("PROCID");
            valObj.NEXT_ID = Common.GetReqIntValue("TargetId");

            int count = BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(valObj);

            if (count > 0)
            {
                return count.ToString();
            }
            else
            {
                return "0";
            }
        }
        catch
        {
            return "-1";
        }

    }
    #endregion

    #region 删除节点
    /// <summary>
    /// 删除节点
    /// </summary>
    /// <returns></returns>
    private string delStep()
    {
        WF_STEP_TPL valObj = new WF_STEP_TPL();
        try
        {
            int count = WFAdmin.delStep(Common.GetReqIntValue("STEP_ID"));

            if (count > 0)
            {
                return count.ToString();
            }
            else
            {
                return "0";
            }
        }
        catch
        {
            return "-1";
        }

    }
    #endregion
}
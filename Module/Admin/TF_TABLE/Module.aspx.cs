using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_Admin_TF_TABLE_Module : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //布局
        Dictionary<string, string> moduleTagDic = new Dictionary<string, string>();
        moduleTagDic.Add("default", "TF_TABLEManage.aspx");
        string moduleUrl = "TF_TABLEManage.aspx";
        string ModuleType = "TF_TABLE";//配置库类型
        string ModuleTbName = "TF_TABLE"; //配置库对应的模块名        
        
        #region 输入参数：此布局模型参数
        if (Request["moduleUrlTag"] != null)
        {
            string moduleUrlTag = Convert.ToString(Request["moduleUrlTag"]);
            if (!string.IsNullOrEmpty(moduleUrlTag))
            {
                if (moduleTagDic.ContainsKey(moduleUrlTag))
                    moduleUrl = moduleTagDic[moduleUrlTag];
                else
                    moduleUrl = moduleUrlTag;
            }
        }

        //模块
        if (Request["moduleName"] != null)
        {
            ModuleTbName = Convert.ToString(Request["moduleName"]);
        }        
        if (Request["ModuleType"] != null)
        {
            ModuleType = Convert.ToString(Request["ModuleType"]);
        }
        try
        {
            Server.Transfer(moduleUrl + "?moduleName=" + ModuleTbName + "&ModuleType=" + ModuleType);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        #endregion
    }
}
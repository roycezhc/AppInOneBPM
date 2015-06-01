using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core;

public partial class _sys : AgileFrame.AppInOne.Common.BasePage
{
    protected string errStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        AgileFrame.Core.ConsoleService.Error("系统监控台测试记录，打印出来表示正常");
        
        errStr = EntityFactory.CheckEntityAndDB();
        errStr = errStr.Replace("|||", "<br>");

        //测试用例：使用测试库对流程工作进行测试。
        //BLLTable<SYS_USER>.Factory("testConn").Select();

    }
}

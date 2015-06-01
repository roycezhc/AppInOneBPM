using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;

public partial class Err : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void Page_Error(object sender, EventArgs e)
    {
        #region 异常处理
        Exception objErr1 = Server.GetLastError();
        if (objErr1 != null)
        {
            Exception objErr = objErr1.GetBaseException();
            if (objErr != null)
                HandleError(objErr);
            else
                HandleError(objErr1);
        }
        // 清空最后的错误
        Server.ClearError();

        #endregion 异常处理
    }
}
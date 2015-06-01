using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class WEC_CS_DEFAULTRESPONSEAJAX : BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string modelid = HttpUtil.GetReqStrValue("modelid");
        WEC_CS_MSGMODEL conf = new WEC_CS_MSGMODEL();
        conf.ID  = Convert.ToDecimal(modelid);
        WEC_CS_MSGMODEL model= BLLTable<WEC_CS_MSGMODEL>.GetRowData(new WEC_CS_MSGMODEL(),conf);
        if (model == null)
        {
            Response.Write("");
        }
        else
        {
            Response.Write(model.MODELCONTENT);
        }
    }

}
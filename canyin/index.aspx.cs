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
using AgileFrame.Core.WebSystem;
using System.IO;
using System.Text;
public partial class canyin_index : System.Web.UI.Page
{
    public List<WEC_CY_STOREMANAGER> list = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        list = BLLTable<WEC_CY_STOREMANAGER>.Factory("conn_canyin").Select(new WEC_CY_STOREMANAGER(),new WEC_CY_STOREMANAGER());
    }
}
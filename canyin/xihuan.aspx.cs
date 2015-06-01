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
public partial class xihuan : System.Web.UI.Page
{
    public int num = 0;
    public int userid = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        num = CYUtil.getItemCount();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class canyin_dingdandetail : System.Web.UI.Page
{
    public int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        num = CYUtil.getItemCount();
    }
}
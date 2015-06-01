using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
public partial class SYS_WF_FORM_FormDesign : AgileFrame.AppInOne.Common.BasePage
{
    protected int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
       // string "".ToLower
        if (!IsPostBack)
        { 
        //litFiedls
            if (!string.IsNullOrEmpty(Request["id"]))
            {
                id = Convert.ToInt32(Convert.ToString(Request["id"]).Substring(0, Convert.ToString(Request["id"]).Length - 2));
            }

            if (id > 0)
            {
                txtHTML.Value = BLLTable<TF_FORM>.GetOneValue(TF_FORM.Attribute.FORM_ID, id, TF_FORM.Attribute.HTML);
            }

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["id"]))
        {
            id = Convert.ToInt32(Convert.ToString(Request["id"]).Substring(0, Convert.ToString(Request["id"]).Length - 2));
        }
        //de
        TF_FORM obj = new TF_FORM();
        obj.FORM_ID = id;
        obj.HTML = txtHTML.Value;

        int intRet = -1;

        if (id > 0)
        {
            intRet = BLLTable<TF_FORM>.Update(obj, TF_FORM.Attribute.FORM_ID);
        }
    }
}
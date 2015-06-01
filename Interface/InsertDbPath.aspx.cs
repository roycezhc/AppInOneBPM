using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class Interface_InsertDbPath : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<HR_DEPT> lst = BLLTable<HR_DEPT>.Select();
        foreach (HR_DEPT obj in lst)
        {

            string path = "";
            string pname = "";

            getPath(obj.DEPT_ID, ref  path, ref  pname);

            if (!string.IsNullOrEmpty(path))
                obj.PATH = path.Substring(0, path.Length - 1);
            if (!string.IsNullOrEmpty(pname))
                obj.PNAME = pname.Substring(0, pname.Length - 1);
            int ret = BLLTable<HR_DEPT>.Update(obj, HR_DEPT.Attribute.DEPT_ID);

        }

        Response.Write("更新成功！");
        Response.End();

    }

    public void getPath(string id, ref string path, ref string pname)
    {
        HR_DEPT cond = new HR_DEPT();
        cond.DEPT_ID = id;

        HR_DEPT obj = BLLTable<HR_DEPT>.GetRowData(cond);

        if (obj != null)
        {
            path = obj.DEPT_ID + "," + path;
            pname = obj.DEPT_NAME + "/" + pname;
            getPath(obj.P_DEPT_ID, ref  path, ref  pname);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.AppInOne.Common;

public partial class WECAdmin_WebSite_Model_wec_column : BaseAdminPage
{
    protected string key = "";
    protected int value = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            key = Request.Form["key"];
            value = Convert.ToInt32(Request.Form["value"]);
              
            int type =-1;

            switch (key)
            {
                case "home":
                    type = 0;
                    break;
                case "channel":
                    type = 1;
                    break;
                case "list":
                    type = 2;
                    break;
                case "detail":
                    type = 3;
                    break;
                case "menu":
                    type = 4;
                    break;
            }

            updateDate(type,value) ;


        }
        catch (Exception ex)
        { 
            throw(ex);
        }
      
    }
    private int updateDate(int type, int intId)
    {
        int intret = -1;

        using (Transaction t = new Transaction("conn"))
        {
            try
            {
                V_WEC_MODEL_SET cond = new V_WEC_MODEL_SET();
                cond.TYPE = type;
                cond.A_ID = Convert.ToInt32(userBase2.Curraid);
                V_WEC_MODEL_SET obj = BLLTable<V_WEC_MODEL_SET>.Factory(t).GetRowData(cond);

                if (obj != null)
                {
                    //删除原来的模版
                    intret = BLLTable<WEC_MODEL_SET>.Factory(t).Delete(Convert.ToInt32(obj.ID));
                }

                //添加新的模版
                WEC_MODEL_SET valObj = new WEC_MODEL_SET();
                valObj.M_ID = intId;
                valObj.A_ID = Convert.ToInt32(userBase2.Curraid);
                intret = BLLTable<WEC_MODEL_SET>.Factory(t).Insert(valObj, WEC_MODEL_SET.Attribute.ID);

                t.Commit();
            }
            catch
            {
                t.RollBack();
                return intret;
            }
        }
        return intret;
    }
}
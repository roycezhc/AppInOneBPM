using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.Orm.PersistenceLayer.DBUtility;

public partial class WECAdmin_WebSite_Model_WEC_CUSTOM_MODELSet : BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WEC_CUSTOM_MODEL objCond = new WEC_CUSTOM_MODEL();
            objCond.TYPE = 0;

            txtHome.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, objCond));

            objCond = new WEC_CUSTOM_MODEL();
            objCond.TYPE = 1;

            txtChannel.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, objCond));

            objCond = new WEC_CUSTOM_MODEL();
            objCond.TYPE = 2;

            txtList.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, objCond));

            objCond = new WEC_CUSTOM_MODEL();
            objCond.TYPE = 3;

            txtDetail.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, objCond));

            objCond = new WEC_CUSTOM_MODEL();
            objCond.TYPE = 4;

            txtMenu.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, objCond));
            try
            {
                V_WEC_CUSTOM_MODEL_SET objvCond = new V_WEC_CUSTOM_MODEL_SET();
                objvCond.A_ID = Convert.ToInt32(userBase2.Curraid);

                List<V_WEC_CUSTOM_MODEL_SET> lst = BLLTable<V_WEC_CUSTOM_MODEL_SET>.Select(new V_WEC_CUSTOM_MODEL_SET(), objvCond);
                foreach (V_WEC_CUSTOM_MODEL_SET objval in lst)
                {
                    if (objval.TYPE == 0)
                    {
                        txtHome.Value = Convert.ToString(objval.M_ID);
                    }
                    else if (objval.TYPE == 1)
                    {
                        txtChannel.Value = Convert.ToString(objval.M_ID);
                    }
                    else if (objval.TYPE == 2)
                    {
                        txtList.Value = Convert.ToString(objval.M_ID);
                    }
                    else if (objval.TYPE == 3)
                    {
                        txtDetail.Value = Convert.ToString(objval.M_ID);
                    }
                    else if (objval.TYPE == 4)
                    {
                        txtMenu.Value = Convert.ToString(objval.M_ID);
                    }
                }

            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        updateDate(0, Convert.ToInt32(txtHome.Value));

        updateDate(1, Convert.ToInt32(txtChannel.Value));

        updateDate(2, Convert.ToInt32(txtList.Value));

        updateDate(3, Convert.ToInt32(txtDetail.Value));

        updateDate(4, Convert.ToInt32(txtMenu.Value));
    }

    private int updateDate(int type, int intId)
    {
        int intret = -1;

        using (Transaction t = new Transaction("conn"))
        {
            try
            {
                V_WEC_CUSTOM_MODEL_SET cond = new V_WEC_CUSTOM_MODEL_SET();
                cond.TYPE = type;
                cond.A_ID = Convert.ToInt32(userBase2.Curraid);
                V_WEC_CUSTOM_MODEL_SET obj = BLLTable<V_WEC_CUSTOM_MODEL_SET>.Factory(t).GetRowData(cond);

                if (obj != null)
                {
                    //删除原来的模版
                    intret = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(t).Delete(Convert.ToInt32(obj.ID));
                }

                //添加新的模版
                WEC_CUSTOM_MODEL_SET valObj = new WEC_CUSTOM_MODEL_SET();
                valObj.M_ID = intId;
                valObj.A_ID = Convert.ToInt32(userBase2.Curraid);
                intret = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(t).Insert(valObj, WEC_CUSTOM_MODEL_SET.Attribute.ID);

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
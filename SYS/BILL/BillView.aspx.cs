using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SYS_BILL_BillView : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SYS_BILL_EXD bill = new SYS_BILL_EXD(int.Parse(Request["BillID"]));
        SYS_BILL_BLL billExd = new SYS_BILL_BLL(int.Parse(Request["BillID"]));
        litView.Text = billExd.HtmlEditForm();

        hidAppPath.Value = WebHelper.GetAppPath();

        List<SYS_BILL_COL> cols = bill.GetColList();
        Dictionary<string, int> tbkeynum = new Dictionary<string, int>();
        if (cols != null)
        {
            for (int i = 0; i < cols.Count; i++)
            {
                if (!tbkeynum.ContainsKey(cols[i].TABLE_NAME))
                {
                    tbkeynum.Add(cols[i].TABLE_NAME, 0);
                }
                if (cols[i].ISPK == "1")
                {
                    tbkeynum[cols[i].TABLE_NAME] += 1;
                }
            }
        }

        //foreach (KeyValuePair<string, int> key in tbkeynum) {
        //    //Response.Write(key.Key);
        //    if (key.Value == 0)
        //    {
        //        if (key.Key != bill.Base.TABLE_NAME)
        //        {
        //            litWarn.Text += "主表单里未配置外部关联表" + key.Key + "的主键，无法与外部表信息同步。";
        //        }
        //        else {
        //            litWarn.Text += key.Key + "未配置主键。";
        //        }

        //    }
        //    else if (key.Value > 1)
        //    {
        //        if (key.Key != bill.Base.TABLE_NAME)
        //        {
        //            litWarn.Text += "主表单里配置了多个外部关联表"+key.Key + "的主键，可能导致信息同步异常。";
        //        }
        //    }
        //}

        litList.Text = billExd.HtmlList(null);
    }
}
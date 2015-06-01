using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Text;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class Admin_WebSite_SiteColumn_SiteColumnBack : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //显示子节点
        if (Request["ShowSubNodes"] != null)
        {
            #region
            string pid = Request["id"];
            WEC_CUSTOM_COLUMN obj = new WEC_CUSTOM_COLUMN();
            WEC_CUSTOM_COLUMN objval = new WEC_CUSTOM_COLUMN();
            obj.PID = pid;
            obj.AID = Convert.ToInt32(userBase2.Curraid);
            objval.OrderBy(WEC_CUSTOM_COLUMN.Attribute.SORT_ID, Order.Asc);

            List<WEC_CUSTOM_COLUMN> lst = BLLTable<WEC_CUSTOM_COLUMN>.Select(objval, obj);
            if (lst.Count > 0)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < lst.Count; i++)
                {
                    if (i > 0)
                    {
                        sb.Append(",");
                    }
                    obj = new WEC_CUSTOM_COLUMN();
                    obj.PID = lst[i].ID;
                    obj.AID = Convert.ToInt32(userBase2.Curraid);
                    int subcount = BLLTable<WEC_CUSTOM_COLUMN>.Factory(conn).Select(new WEC_CUSTOM_COLUMN(), obj).Count;
                    sb.Append("{rid:'").Append(lst[i].PID).Append("',id:'").Append(lst[i].ID.ToString());
                    sb.Append("',pid:'").Append(lst[i].PID.ToString()).Append("',no:").Append(lst[i].SORT_ID);
                    sb.Append(",sc:").Append(subcount);
                    sb.Append(",name:'").Append(lst[i].COLUMN_NAME).Append("'}");

                }
                sb.Append("]");
                Response.Write(sb.ToString());
            }



            #endregion
        }
        //删除群组
        if (Request["DelNodeID"] != null)
        {
            string keyid = Request["id"];


            int re = BLLTable<WEC_CUSTOM_COLUMN>.Delete(WEC_CUSTOM_COLUMN.Attribute.ID, keyid);
            if (re > 0)
            {

            }
            Response.Write(re.ToString());

        }
        if (Request["DelID"] != null)
        {
            string keyid = Request["DelID"];
            CMS_SiteChannel ccc = new CMS_SiteChannel();
            ccc.ChnlID = BLLTable<CMS_SiteChannel>.GetOneValue(CMS_SiteChannel.Attribute.ChnlID, keyid, CMS_SiteChannel.Attribute.ParentID);
            int re = BLLTable<CMS_SiteChannel>.Delete(CMS_SiteChannel.Attribute.ChnlID, keyid);
            if (re > 0)
            {

                BLLTable<CMS_SiteChannel>.UpdateAuto(ccc, CMS_SiteChannel.Attribute.SubCount, -1);
            }
            Response.Redirect(preUrl);
        }
        //修改序号
        if (Request["UpdateSort"] != null)
        {
            string chgid1 = Request["chgid1"];
            string chgsort1 = Request["chgsort1"].ToString();
            string chgid2 = Request["chgid2"];
            string chgsort2 = Request["chgsort2"].ToString();
            try
            {
                //CMS_SiteChannel ccc = new CMS_SiteChannel();
                //ccc.ChnlID = chgid1;
                BLLTable<CMS_SiteChannel>.Update(CMS_SiteChannel.Attribute.ChnlID, chgid1, CMS_SiteChannel.Attribute.SortNum, chgsort1);
                //ccc.ChnlID = chgid2;
                BLLTable<CMS_SiteChannel>.Update(CMS_SiteChannel.Attribute.ChnlID, chgid2, CMS_SiteChannel.Attribute.SortNum, chgsort2);
                Response.Write("1");
            }
            catch
            {
                Response.Write("修改序号失败！");
            }

        }

        Response.End();
    }
}
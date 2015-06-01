using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.Model;

public partial class WECAdmin_ReCall_WEC_ACTIVITY_dazhuanpan : System.Web.UI.Page
{
    public WEC_USER_ACTIVITY_DETAIL detail;
    public bool isGet;
    public string sn_code;
    public string info;
    public string open_id;
    public string a_id;
    public string phone;
    public int type;
    public WEC_ACTIVITY activity;
    protected void Page_Load(object sender, EventArgs e)
    {
        open_id = HttpUtil.GetReqStrValue("open_id");
        a_id = HttpUtil.GetReqStrValue("a_id");
        WEC_ACTIVITY conf3 = new WEC_ACTIVITY();
        conf3.ID = Convert.ToDecimal(a_id);
        activity = BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(),conf3);
        WEC_USER_ACTIVITY_DETAIL conf = new WEC_USER_ACTIVITY_DETAIL();
        conf.USER_ID = open_id;
        conf.A_ID = Convert.ToDecimal(a_id);
        detail = BLLTable<WEC_USER_ACTIVITY_DETAIL>.GetRowData(new WEC_USER_ACTIVITY_DETAIL(), conf);
        if (detail == null)
        {
            detail = new WEC_USER_ACTIVITY_DETAIL();
            detail.USER_ID = open_id;
            detail.A_ID = Convert.ToDecimal(a_id);
            detail.ISGET = 0;
            detail.ALL_PLAY = 0;
            detail.DAY_PLAY = 0;
            BLLTable<WEC_USER_ACTIVITY_DETAIL>.Insert(detail, WEC_USER_ACTIVITY_DETAIL.Attribute.ID);
        }
        else
        {
            if (detail.ISGET == 0)
            {
                isGet = false;

            }
            else
            {
                isGet = true;
                WEC_ACTIVITY_SNCODE conf2 = new WEC_ACTIVITY_SNCODE();
                conf2.SN_CODE = detail.SN_CODE;
                WEC_ACTIVITY_SNCODE sncode = BLLTable<WEC_ACTIVITY_SNCODE>.GetRowData(new WEC_ACTIVITY_SNCODE(), conf2);
                sn_code = sncode.SN_CODE;
                info = sncode.AWARD_NAME;
                phone = sncode.PHONE;
                type = sncode.AWARD_TYPE;

            }

        }

    }
    public void lottery()
    {

        WEC_ACTIVITY conf = new WEC_ACTIVITY();
        conf.ID = Convert.ToDecimal(a_id);
        WEC_ACTIVITY activity = BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(), conf);
        int zjl = activity.PROBABILITY;
        if (isGet)
        {

        }
        else
        {
            if (zjl >= 10000)
            {
                isGet = true;
                WEC_ACTIVITY_SNCODE conf2 = new WEC_ACTIVITY_SNCODE();
                conf2.A_ID = conf.ID;
                conf2.STATUS = 0;
                List<WEC_ACTIVITY_SNCODE> list = BLLTable<WEC_ACTIVITY_SNCODE>.Select(new WEC_ACTIVITY_SNCODE(), conf2);

                if (list.Count == 0)
                {
                    isGet = false;
                    return;
                }
                Random r = new Random();
                int s_id = r.Next(list.Count);
                sn_code = list[s_id].SN_CODE;
                info = list[s_id].AWARD_NAME;
                phone = list[s_id].PHONE;
                type = list[s_id].AWARD_TYPE;
                list[s_id].STATUS = 1;
                list[s_id].WX_CODE = open_id;
                list[s_id].ZJ_TIME = DateTime.Now;
                
                BLLTable<WEC_ACTIVITY_SNCODE>.Update(list[s_id], WEC_ACTIVITY_SNCODE.Attribute.ID);
                detail.ISGET = 1;
                detail.SN_CODE = sn_code;

                BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail, WEC_USER_ACTIVITY_DETAIL.Attribute.ID);
            }
            else
            {
                bool[] bo = new bool[10000];
                for (int i = 0; i < zjl; i++)
                {
                    bo[i] = true;
                }
                Random r = new Random();
                int j = r.Next(10000);
                if (bo[j])
                {

                    isGet = true;
                    WEC_ACTIVITY_SNCODE conf2 = new WEC_ACTIVITY_SNCODE();
                    conf2.A_ID = conf.ID;
                    conf2.STATUS = 0;
                    List<WEC_ACTIVITY_SNCODE> list = BLLTable<WEC_ACTIVITY_SNCODE>.Select(new WEC_ACTIVITY_SNCODE(), conf2);

                    if (list.Count == 0)
                    {
                        isGet = false;
                        return;
                    }
                    int s_id = r.Next(list.Count);
                    sn_code = list[s_id].SN_CODE;
                    info = list[s_id].AWARD_NAME;
                    phone = list[s_id].PHONE;
                    type=list[s_id].AWARD_TYPE;
                    list[s_id].STATUS = 1;
                    list[s_id].WX_CODE = open_id;
                    list[s_id].ZJ_TIME = DateTime.Now;
                    BLLTable<WEC_ACTIVITY_SNCODE>.Update(list[s_id], WEC_ACTIVITY_SNCODE.Attribute.ID);
                    detail.ISGET = 1;
                    detail.SN_CODE = sn_code;

                    BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail, WEC_USER_ACTIVITY_DETAIL.Attribute.ID);

                }

            }
        }
    }
}
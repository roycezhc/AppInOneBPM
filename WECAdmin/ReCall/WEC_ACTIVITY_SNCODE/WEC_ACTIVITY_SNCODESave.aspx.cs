using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WEC_ACTIVITY_SNCODEBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string a_id = HttpUtil.GetReqStrValue("a_id");
        string code = HttpUtil.GetReqStrValue("code");
        string open_id = HttpUtil.GetReqStrValue("open_id");
        string tel = HttpUtil.GetReqStrValue("tel");
        string kind = HttpUtil.GetReqStrValue("kind");

        if("1".Equals(kind)){//ßÉßÉ¿¨
            WEC_ACTIVITY_SNCODE conf = new WEC_ACTIVITY_SNCODE();
            conf.SN_CODE = code;
            conf.A_ID=Convert.ToDecimal(a_id);
            WEC_ACTIVITY_SNCODE sncode=BLLTable<WEC_ACTIVITY_SNCODE>.GetRowData(new WEC_ACTIVITY_SNCODE(),conf);
            sncode.PHONE = tel;
            sncode.SY_TIME = DateTime.Now;
            sncode.STATUS = 1;
            sncode.WX_CODE = open_id;
            BLLTable<WEC_ACTIVITY_SNCODE>.Update(sncode,WEC_ACTIVITY_SNCODE.Attribute.ID);

            WEC_USER_ACTIVITY_DETAIL conf2 = new WEC_USER_ACTIVITY_DETAIL();
            conf2.A_ID = Convert.ToDecimal(a_id);
            conf2.USER_ID = open_id;
            WEC_USER_ACTIVITY_DETAIL detail=BLLTable<WEC_USER_ACTIVITY_DETAIL>.GetRowData(new WEC_USER_ACTIVITY_DETAIL(),conf2);
            detail.ISGET = 1;
            BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail,WEC_USER_ACTIVITY_DETAIL.Attribute.ID);

            Response.Write(" ");
        }
        else if ("2".Equals(kind))//´ó×ªÅÌ
        {

            string sn_code="";
            string info="";
            string phone="";
            int type = 0;
            WEC_USER_ACTIVITY_DETAIL conf3=new WEC_USER_ACTIVITY_DETAIL();
            conf3.A_ID=Convert.ToDecimal(a_id);
            conf3.USER_ID=open_id;
            WEC_USER_ACTIVITY_DETAIL detail=BLLTable<WEC_USER_ACTIVITY_DETAIL>.GetRowData(new WEC_USER_ACTIVITY_DETAIL(),conf3);
            WEC_ACTIVITY conf = new WEC_ACTIVITY();
            conf.ID = Convert.ToDecimal(a_id);
            WEC_ACTIVITY activity = BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(), conf);
            int zjl = activity.PROBABILITY;
          
                if (zjl >= 10000)
                {
                   
                    WEC_ACTIVITY_SNCODE conf2 = new WEC_ACTIVITY_SNCODE();
                    conf2.A_ID = conf.ID;
                    conf2.STATUS = 0;
                    List<WEC_ACTIVITY_SNCODE> list = BLLTable<WEC_ACTIVITY_SNCODE>.Select(new WEC_ACTIVITY_SNCODE(), conf2);

                    if (list.Count == 0)
                    {
                     
                        return;
                    }
                    Random r = new Random();
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

                        detail.ISGET = 1;
                        WEC_ACTIVITY_SNCODE conf2 = new WEC_ACTIVITY_SNCODE();
                        conf2.A_ID = conf.ID;
                        conf2.STATUS = 0;
                        List<WEC_ACTIVITY_SNCODE> list = BLLTable<WEC_ACTIVITY_SNCODE>.Select(new WEC_ACTIVITY_SNCODE(), conf2);

                        if (list.Count == 0)
                        {
                           detail.ISGET = 0;
                            return;
                        }
                        int s_id = r.Next(list.Count);
                        sn_code = list[s_id].SN_CODE;
                        info = list[s_id].AWARD_NAME;
                        phone = list[s_id].PHONE;
                        list[s_id].STATUS = 1;
                        list[s_id].WX_CODE = open_id;
                        list[s_id].ZJ_TIME = DateTime.Now;
                        BLLTable<WEC_ACTIVITY_SNCODE>.Update(list[s_id], WEC_ACTIVITY_SNCODE.Attribute.ID);
                        detail.ISGET = 1;
                        detail.SN_CODE = sn_code;    

                    }
                   
                }
                detail.ALL_PLAY += 1;
                BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail, WEC_USER_ACTIVITY_DETAIL.Attribute.ID);
                if (detail.ISGET == 1)
                {
                    Response.Write("{\"name\":\"getsn\",\"msg\":\"¹§Ï²ÖÐ½±\",\"sn\":\"" + sn_code + "\",\"prizetype\":" + type + ",\"success\":true,\"allplay\":" + detail.ALL_PLAY + "}");
                }
                else {
                    Response.Write("{\"name\":\"invalid\",\"allplay\":" + detail.ALL_PLAY + "}");
                }

            }else if("21".Equals(kind)){
                WEC_ACTIVITY_SNCODE conf = new WEC_ACTIVITY_SNCODE();
                conf.SN_CODE = code;
                conf.A_ID = Convert.ToDecimal(a_id);
                WEC_ACTIVITY_SNCODE sncode = BLLTable<WEC_ACTIVITY_SNCODE>.GetRowData(new WEC_ACTIVITY_SNCODE(), conf);
                sncode.PHONE = tel;
                sncode.SY_TIME = DateTime.Now;
                sncode.STATUS = 1;
                sncode.WX_CODE = open_id;
                BLLTable<WEC_ACTIVITY_SNCODE>.Update(sncode, WEC_ACTIVITY_SNCODE.Attribute.ID);

                WEC_USER_ACTIVITY_DETAIL conf2 = new WEC_USER_ACTIVITY_DETAIL();
                conf2.A_ID = Convert.ToDecimal(a_id);
                conf2.USER_ID = open_id;
                WEC_USER_ACTIVITY_DETAIL detail = BLLTable<WEC_USER_ACTIVITY_DETAIL>.GetRowData(new WEC_USER_ACTIVITY_DETAIL(), conf2);
                detail.ISGET = 1;
                BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail, WEC_USER_ACTIVITY_DETAIL.Attribute.ID);

                Response.Write(" ");
            }

        }
    
}
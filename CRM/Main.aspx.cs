using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.Common;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

using AgileFrame.AppInOne.Common;
using AgileFrame.Core.WebSystem;//.WebCtrls;

public partial class CRM_Main : AgileFrame.AppInOne.Common.BaseAdminPage
{
    /// <summary>
    /// 上一次运行投入公海时间，全局变量
    /// </summary>
    public static DateTime LastOutPutCustToHighSeas = DateTime.MinValue;

    public string m_SName = "";
    public string m_userId = "";
    public string m_SID = "";
    public int toDayConCount = 0;
    public int expiredCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //执行投入公海操作，每天第一个用户登录的时候执行
        if (LastOutPutCustToHighSeas.Date != DateTime.Now.Date)
        {
            OutPutCustToHighSeas();//执行投入公海操作
            LastOutPutCustToHighSeas = DateTime.Now;
        }
        m_SName = userBase.RealName;
        m_userId = "" + userBase.UserID;
        HR_STAFF js = userBase.GetStaff();
        m_SID = js.STAFF_ID.ToString();
        V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscdToDayCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        vcrmscdToDayCon.STAFF_ID = js.STAFF_ID;
        vcrmscdToDayCon.Where("{0} <> {1} And {2} Between '{3}' And '{4}'", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.Date.ToString(), DateTime.Now.Date.AddDays(1).AddSeconds(-1).ToString());
        V_CRM_STAFF_CUSTOMER_NOTCONTACT valToDayCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        valToDayCon.STAFF_ID = 0;
        toDayConCount = BLLTable<V_CRM_STAFF_CUSTOMER_NOTCONTACT>.Factory(conn).Select(valToDayCon, vcrmscdToDayCon).Count;

        V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscdExpiredCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        vcrmscdExpiredCon.STAFF_ID = js.STAFF_ID;
        vcrmscdExpiredCon.Where("{0} between '{1}' And '{2}' And {3} <> {4}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.Date.AddDays(-57).ToString(), DateTime.Now.Date.AddSeconds(-1).ToString(), V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        //vcrmscdExpiredCon.Where("{0} < '{1}' And {2} <> {3}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.ToString(), V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        V_CRM_STAFF_CUSTOMER_NOTCONTACT valExpiredCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        valExpiredCon.STAFF_ID = 0;
        expiredCount = BLLTable<V_CRM_STAFF_CUSTOMER_NOTCONTACT>.Factory(conn).Select(valExpiredCon, vcrmscdExpiredCon).Count;

        if (userBase.UserType.ToString() != EnumInfo.SYS_UserType.Admin.ToString("d"))
        {
            sysMange.Visible = false;
        }
    }

    /// <summary>
    /// 将过期客户投入公海
    /// </summary>
    public void OutPutCustToHighSeas()
    {
        int count = 0;
        CRM_STAFF_CUSTOMER_CONTACTRECORDS cSelVal = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        cSelVal._SID = "";
        cSelVal._Cus_ID = 0;
        CRM_STAFF_CUSTOMER_CONTACTRECORDS ccon = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        ccon.Where("{0} is null and {1} < '{2}'",CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime, CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.NextContactTime.FieldName, DateTime.Now.Date.AddDays(-60));
        List<CRM_STAFF_CUSTOMER_CONTACTRECORDS> csccList = BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Select(cSelVal, ccon);
        if (csccList.Count < 1)
            return;
        CRM_STAFF_CUSTOMER_CONTACTRECORDS cval = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        cval._ContactTime = DateTime.Now;
        cval._ContactRecords = "过期联系人，系统自动丢入公海！";
        count += BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Update(cval, ccon);//更新未联系为已联系

        List<string> sidList = new List<string>();
        List<int> cusidList = new List<int>();
        foreach (CRM_STAFF_CUSTOMER_CONTACTRECORDS cscc in csccList)
        {
            if (!sidList.Contains(cscc.SID))
                sidList.Add(cscc.SID);
            if (!cusidList.Contains(cscc.Cus_ID))
                cusidList.Add(cscc.Cus_ID);
        }

        string[] sidArr = sidList.ToArray();
        int[] cusidArr = cusidList.ToArray();

        CRM_STAFF_CUSTOMER con = new CRM_STAFF_CUSTOMER();//删除员工与客户关联
        con.In(CRM_STAFF_CUSTOMER.Attribute.SID, sidArr);
        con.In(CRM_STAFF_CUSTOMER.Attribute.Cus_ID, cusidArr);
        count += BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Delete(con);

        CRM_CUSTOMER ccCon = new CRM_CUSTOMER();
        ccCon.In(CRM_CUSTOMER.Attribute.Cus_Id, cusidArr);
        CRM_CUSTOMER ccVal = new CRM_CUSTOMER();
        ccVal._LoadHighSeasTime = DateTime.Now;
        count += BLLTable<CRM_CUSTOMER>.Factory(conn).Update(ccVal, ccCon);//更新加入公海时间
    }
}
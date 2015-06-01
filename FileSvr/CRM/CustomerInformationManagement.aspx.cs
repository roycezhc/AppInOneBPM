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

public partial class CRM_CustomerInformationManagement : AgileFrame.AppInOne.Common.BaseAdminPage
{
    private string previousUrl = "";
    /// <summary>
    /// 上一个URL
    /// </summary>
    public string PreviousUrlUrl
    {
        get { return previousUrl; }
        set { previousUrl = value; }
    }

    public string styleDisplayNone = "";
    public string spanColor = "";
    /// <summary>
    /// 列表行数计数
    /// </summary>
    public int trCount = 0;
    public string SID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        lit_ContractedCusCount.Text = "0";
        lit_ExpiredUnConCusCount.Text = "0";
        lit_todayConCusCount.Text = "0";
        lit_WillInHighSeasCusCount.Text = "0";
        List<string> SIDList = new List<string>();
        //aspPager.PageSize = 20;
        HR_STAFF js = userBase.GetStaff();
        SIDList.Add(js.STAFF_ID.ToString());
        if (HttpContext.Current != null && HttpContext.Current.Request != null && HttpContext.Current.Request.UrlReferrer != null && !string.IsNullOrEmpty(HttpContext.Current.Request.UrlReferrer.OriginalString))
        {
            PreviousUrlUrl = HttpContext.Current.Request.UrlReferrer.OriginalString;
        }

        SID = userBase.UserID + "";
        ddl_CusStatus.Items.AddRange(FormHelper.GetListItem(AgileFrame.Orm.PersistenceLayer.Model.CRM_STAFF_CUSTOMER.Attribute.CustStatus));
        if (ddl_CusStatus.Items.Count > 0)
        {
            ddl_CusStatus.Items[0].Text = "全部状态"; 
            ddl_CusStatus.Items[0].Value = "0";
        }
        if (userBase.UserType.ToString() == EnumInfo.SYS_UserType.Admin.ToString("d"))//wcp?
        {
            ddl_CusStatus.Visible = true;
            V_CMR_STAF csVal = new V_CMR_STAF();
            csVal.STAFF_ID = 0;
            csVal._SNAME = "";
            csVal.DEPT_NAME = "";
            csVal.USER_ID = 0;
            V_CMR_STAF csCon = new V_CMR_STAF();
            csCon.DEPT_ID = js.DEPT_ID;
            List<V_CMR_STAF> csList = BLLTable<V_CMR_STAF>.Factory(conn).Select(csVal,csCon);
            if (csList.Count > 0)
            {
                ddl_CusStatus.SelectedIndex = 0;
                ddl_CusToStf.Items.Add(new ListItem("全部" + csList[0].DEPT_NAME + "员工", "0"));
                ddl_CusToStf.Items.Add(new ListItem("自己", js.STAFF_ID.ToString()));
                foreach (V_CMR_STAF cs in csList)
                {
                    if (cs.USER_ID == userBase.UserID)
                    {
                        continue;
                    }
                    else
                    {
                        ddl_CusToStf.Items.Add(new ListItem(cs.SNAME, cs.STAFF_ID.ToString()));
                        SIDList.Add(cs.STAFF_ID.ToString());
                    }
                }
                ddl_CusToStf.SelectedIndex = 0;
            }
        }
        else
        {
            ddl_CusStatus.Visible = true;
            ddl_CusToStf.Items.Add(new ListItem(userBase.RealName, userBase.UserID.ToString()));
            ddl_CusToStf.SelectedIndex = 0;
        }

        string[] SIDArr = SIDList.ToArray();
        V_CRM_STAFF_CUSTOMER vcrmscCon = new V_CRM_STAFF_CUSTOMER();
        vcrmscCon.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
        vcrmscCon.OrderBy(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, Order.Asc);
        BindData(vcrmscCon, 1, aspAllCusPager);

        V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscdToDayCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        vcrmscdToDayCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
        vcrmscdToDayCon.Where("{0} <> {1} And {2} Between '{3}' And '{4}'", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.Date.ToString(), DateTime.Now.Date.AddDays(1).AddSeconds(-1).ToString());
        vcrmscdToDayCon.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        //vcrmscdToDayCon.Where("{0} <> {1}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        BindData(vcrmscdToDayCon, 1, aspToDayMustConPager);

        V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscdExpiredCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        vcrmscdExpiredCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
        vcrmscdExpiredCon.Where("{0} between '{1}' And '{2}' And {3} <> {4}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.Date.AddDays(-57).ToString(), DateTime.Now.Date.AddSeconds(-1).ToString(), V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        vcrmscdExpiredCon.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        BindData(vcrmscdExpiredCon, 1, aspExpiredPager);

        V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscdWillInHighSeasCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        vcrmscdWillInHighSeasCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
        vcrmscdWillInHighSeasCon.Where("{0} between '{1}' And '{2}' And {3} <> {4}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.Date.AddDays(-60).ToString(), DateTime.Now.Date.AddDays(-57).AddSeconds(-1).ToString(), V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        vcrmscdWillInHighSeasCon.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        BindData(vcrmscdWillInHighSeasCon, 1, aspWillInHighSeasPager);

        V_CRM_STAFF_CUSTOMER vcrmscContractedCon = new V_CRM_STAFF_CUSTOMER();
        vcrmscContractedCon.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
        vcrmscContractedCon._CustStatus = 5;
        vcrmscContractedCon.OrderBy(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, Order.Asc);
        BindData(vcrmscContractedCon, 1, aspContractedPager);
        this.DataBind();
    }

    private void BindData(ITableImplement con, int pageCur, AspNetPager asppager)
    {
        int recount = -1;
        asppager.PageSize = 20;
        switch (asppager.ID)
        {
            case "aspAllCusPager":
            case "aspContractedPager":
                V_CRM_STAFF_CUSTOMER vcrmscCon = con as V_CRM_STAFF_CUSTOMER;
                if (vcrmscCon == null)
                    return;
                if (asppager.ID == "aspAllCusPager")
                    hidAllCus.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER>(vcrmscCon);
                else
                    hidContracted.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER>(vcrmscCon);
                vcrmscCon.af_PageBy(V_CRM_STAFF_CUSTOMER.Attribute.Cus_ID, Order.Desc);
                V_CRM_STAFF_CUSTOMER valsc = new V_CRM_STAFF_CUSTOMER();
                valsc._SID = "";
                valsc.Cus_ID = 0;
                valsc.CompanyName = "";
                valsc.ShopName = "";
                valsc.Cus_Name = "";
                valsc.CustQQ = "";
                valsc.WangWangId = "";
                valsc.LastContactTime = DateTime.MinValue;
                valsc.SNAME = "";
                valsc.CustStatus = 0;
                List<V_CRM_STAFF_CUSTOMER> vcrmscList = BLLTable<V_CRM_STAFF_CUSTOMER>.Factory(conn).SelectByPage(valsc, vcrmscCon, asppager.PageSize, pageCur, ref recount);
                if (vcrmscList.Count > 0)
                {
                    FormHelper.Bind(Page, vcrmscList[0].DicAttrValues);
                    //BindToFindSelect(listObj[0].DicAttrValues);
                }
                if (asppager.ID == "aspAllCusPager")
                {
                    repAllCusList.DataSource = vcrmscList;
                    repAllCusList.DataBind();
                }
                else
                {
                    lit_ContractedCusCount.Text = recount.ToString();
                    repContractedList.DataSource = vcrmscList;
                    repContractedList.DataBind();
                }
                asppager.RecordCount = recount;
                break;
            case "aspToDayMustConPager":
            case "aspExpiredPager":
            case "aspWillInHighSeasPager":
                V_CRM_STAFF_CUSTOMER_NOTCONTACT vcrmscnCon = con as V_CRM_STAFF_CUSTOMER_NOTCONTACT;
                if (vcrmscnCon == null)
                    return;
                if (asppager.ID == "aspToDayMustConPager")
                    hidToDayMustCon.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(vcrmscnCon);
                else if (asppager.ID == "aspExpiredPager")
                    hidExpired.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(vcrmscnCon);
                else
                    hidWillInHighSeas.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(vcrmscnCon);
                vcrmscnCon.af_PageBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.Cus_ID, Order.Desc);
                V_CRM_STAFF_CUSTOMER_NOTCONTACT valscn = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
                valscn.STAFF_ID = 0;
                valscn.Cus_ID = 0;
                valscn.CompanyName = "";
                valscn.ShopName = "";
                valscn.Cus_Name = "";
                valscn.CustQQ = "";
                valscn.WangWangId = "";
                valscn.LastContactTime = DateTime.MinValue;
                valscn.NextContactTime = DateTime.MinValue;
                valscn.SNAME = "";
                valscn.CustStatus = 0;
                List<V_CRM_STAFF_CUSTOMER_NOTCONTACT> vcrmscnList = BLLTable<V_CRM_STAFF_CUSTOMER_NOTCONTACT>.Factory(conn).SelectByPage(valscn, vcrmscnCon, asppager.PageSize, pageCur, ref recount);
                if (vcrmscnList.Count > 0)
                {
                    FormHelper.Bind(Page, vcrmscnList[0].DicAttrValues);
                    //BindToFindSelect(listObj[0].DicAttrValues);
                }
                if (asppager.ID == "aspToDayMustConPager")
                {
                    lit_todayConCusCount.Text = recount.ToString();
                    repToDayMustConList.DataSource = vcrmscnList;
                    repToDayMustConList.DataBind();
                }
                else if (asppager.ID == "aspExpiredPager")
                {
                    lit_ExpiredUnConCusCount.Text = recount.ToString();
                    repExpiredList.DataSource = vcrmscnList;
                    repExpiredList.DataBind();
                }
                else
                {
                    lit_WillInHighSeasCusCount.Text = recount.ToString();
                    repWillInHighSeasList.DataSource = vcrmscnList;
                    repWillInHighSeasList.DataBind();
                }
                asppager.RecordCount = recount;
                break;
            default:
                break;
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        AspNetPager asppage = sender as AspNetPager;
        if (asppage == null)
            return;
        switch (asppage.ID)
        {
            case "aspAllCusPager":
                V_CRM_STAFF_CUSTOMER conAllCus = new V_CRM_STAFF_CUSTOMER();
                if (string.IsNullOrEmpty(hidAllCus.Value))
                {
                    conAllCus = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER>(hidAllCus.Value);
                }
                BindData(conAllCus, asppage.CurrentPageIndex, asppage);
                break;
            case "aspToDayMustConPager":
                V_CRM_STAFF_CUSTOMER_NOTCONTACT conToDayMustCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
                if (string.IsNullOrEmpty(hidToDayMustCon.Value))
                {
                    conToDayMustCon = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(hidToDayMustCon.Value);
                }
                BindData(conToDayMustCon, asppage.CurrentPageIndex, asppage);
                break;
            case "aspExpiredPager":
                V_CRM_STAFF_CUSTOMER_NOTCONTACT conExpired = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
                if (string.IsNullOrEmpty(hidExpired.Value))
                {
                    conExpired = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(hidExpired.Value);
                }
                BindData(conExpired, asppage.CurrentPageIndex, asppage);
                break;
            case "aspWillInHighSeasPager":
                V_CRM_STAFF_CUSTOMER_NOTCONTACT conWillInHighSeas = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
                if (string.IsNullOrEmpty(hidWillInHighSeas.Value))
                {
                    conExpired = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER_NOTCONTACT>(hidWillInHighSeas.Value);
                }
                BindData(conWillInHighSeas, asppage.CurrentPageIndex, asppage);
                break;
            case "aspContractedPager":
                V_CRM_STAFF_CUSTOMER conContracted = new V_CRM_STAFF_CUSTOMER();
                if (string.IsNullOrEmpty(hidContracted.Value))
                {
                    conContracted = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER>(hidContracted.Value);
                }
                BindData(conContracted, asppage.CurrentPageIndex, asppage);
                break;
            default:
                break;
        }
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            //PageHelper.Error(Page, ex);
        }
    }

    protected void ddl_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        btnSearch_Click(sender, e);
        //V_CRM_STAFF_CUSTOMER conAllCus = new V_CRM_STAFF_CUSTOMER();
        //V_CRM_STAFF_CUSTOMER_NOTCONTACT conToDayMustCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        //conToDayMustCon.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date, DateTime.Now.Date.AddDays(1).AddSeconds(-1)));
        //conToDayMustCon.Where("{0} <> {1}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        //V_CRM_STAFF_CUSTOMER_NOTCONTACT conExpired = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        //conExpired.Where("{0} < '{1}' And {2} <> {3}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime.FieldName, DateTime.Now.ToString(), V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        //V_CRM_STAFF_CUSTOMER conContracted = new V_CRM_STAFF_CUSTOMER();
        //if (ddl_CusStatus.SelectedItem.Value == "0")
        //{
        //    conAllCus.In(V_CRM_STAFF_CUSTOMER.Attribute.CustStatus, new int[] { 1, 2, 3, 4});
        //    conToDayMustCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus, new int[] { 1, 2, 3, 4});
        //    conExpired.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus, new int[] { 1, 2, 3, 4});
        //    conContracted.In(V_CRM_STAFF_CUSTOMER.Attribute.CustStatus, new int[] {5 });
        //}
        //else
        //{
        //    conAllCus._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
        //    conToDayMustCon._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
        //    conExpired._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
        //    conContracted._CustStatus = 5;//已签约客户
        //}
        //if (ddl_CusToStf.SelectedItem.Value == "0")
        //{
        //    conAllCus.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
        //    conToDayMustCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.SID, SIDArr);
        //    conExpired.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.SID, SIDArr);
        //    conContracted.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
        //}
        //else
        //{
        //    conAllCus._SID = ddl_CusToStf.SelectedItem.Value;
        //    conToDayMustCon._SID = ddl_CusToStf.SelectedItem.Value;
        //    conExpired._SID = ddl_CusToStf.SelectedItem.Value;
        //    conContracted._SID = ddl_CusToStf.SelectedItem.Value;
        //}
        //BindData(conAllCus, 1, aspAllCusPager);
        //BindData(conToDayMustCon, 1, aspToDayMustConPager);
        //BindData(conExpired, 1, aspExpiredPager);
        //BindData(conContracted, 1, aspContractedPager);
    }

    protected void btnDistribution_Click(object sender, EventArgs e)
    {

    }
    protected void btnAddNewCus_Click(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        V_CRM_STAFF_CUSTOMER conAllCus = new V_CRM_STAFF_CUSTOMER();
        conAllCus.OrderBy(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, Order.Asc);
        V_CRM_STAFF_CUSTOMER_NOTCONTACT conToDayMustCon = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        conToDayMustCon.Where("{0} <> {1}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        conToDayMustCon.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        V_CRM_STAFF_CUSTOMER_NOTCONTACT conWillInHighSeas = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        conWillInHighSeas.Where("{0} <> {1}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        conWillInHighSeas.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        V_CRM_STAFF_CUSTOMER_NOTCONTACT conExpired = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        conExpired.Where("{0} <> {1}", V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus.FieldName, "5");
        conExpired.OrderBy(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, Order.Asc);
        V_CRM_STAFF_CUSTOMER conContracted = new V_CRM_STAFF_CUSTOMER();
        conContracted.OrderBy(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, Order.Asc);
        if (ddl_CusStatus.SelectedItem.Value == "0")
        {
            conAllCus.In(V_CRM_STAFF_CUSTOMER.Attribute.CustStatus, new int[] { 1, 2, 3, 4 });
            conToDayMustCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus, new int[] { 1, 2, 3, 4 });
            conExpired.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus, new int[] { 1, 2, 3, 4 });
            conWillInHighSeas.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustStatus, new int[] { 1, 2, 3, 4 });
            conContracted.In(V_CRM_STAFF_CUSTOMER.Attribute.CustStatus, new int[] { 5 });
        }
        else
        {
            conAllCus._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
            conToDayMustCon._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
            conExpired._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
            conWillInHighSeas._CustStatus = Convert.ToInt32(ddl_CusStatus.SelectedItem.Value);
            conContracted._CustStatus = 5;//已签约客户
        }
        if (ddl_CusToStf.SelectedItem.Value == "0")
        {
            string[] SIDArr = new string[ddl_CusToStf.Items.Count - 1];
            int index = 0;
            foreach (ListItem li in ddl_CusToStf.Items)
            {
                if (li.Value != "0")
                {
                    SIDArr[index] = li.Value;
                    index++;
                }
            }
            conAllCus.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
            conToDayMustCon.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
            conExpired.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
            conWillInHighSeas.In(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.STAFF_ID, SIDArr);
            conContracted.In(V_CRM_STAFF_CUSTOMER.Attribute.SID, SIDArr);
        }
        else
        {
            conAllCus._SID = ddl_CusToStf.SelectedItem.Value;
            conToDayMustCon.STAFF_ID = decimal.Parse(ddl_CusToStf.SelectedItem.Value);
            conExpired.STAFF_ID = decimal.Parse(ddl_CusToStf.SelectedItem.Value);
            conWillInHighSeas.STAFF_ID = decimal.Parse(ddl_CusToStf.SelectedItem.Value);
            conContracted._SID = ddl_CusToStf.SelectedItem.Value;
        }

        if (!string.IsNullOrEmpty(txt_ComName.Value))
        {
            conAllCus.Like(V_CRM_STAFF_CUSTOMER.Attribute.CompanyName, txt_ComName.Value);
            conToDayMustCon.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CompanyName, txt_ComName.Value);
            conExpired.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CompanyName, txt_ComName.Value);
            conWillInHighSeas.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CompanyName, txt_ComName.Value);
            conContracted.Like(V_CRM_STAFF_CUSTOMER.Attribute.CompanyName, txt_ComName.Value);
        }

        if (!string.IsNullOrEmpty(txt_ShopName.Value))
        {
            conAllCus.Like(V_CRM_STAFF_CUSTOMER.Attribute.ShopName, txt_ShopName.Value);
            conToDayMustCon.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.ShopName, txt_ShopName.Value);
            conExpired.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.ShopName, txt_ShopName.Value);
            conWillInHighSeas.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.ShopName, txt_ShopName.Value);
            conContracted.Like(V_CRM_STAFF_CUSTOMER.Attribute.ShopName, txt_ShopName.Value);
        }

        if (!string.IsNullOrEmpty(txt_QQ.Value))
        {
            conAllCus.Like(V_CRM_STAFF_CUSTOMER.Attribute.CustQQ, txt_QQ.Value);
            conToDayMustCon.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustQQ, txt_QQ.Value);
            conExpired.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustQQ, txt_QQ.Value);
            conWillInHighSeas.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.CustQQ, txt_QQ.Value);
            conContracted.Like(V_CRM_STAFF_CUSTOMER.Attribute.CustQQ, txt_QQ.Value);
        }

        if (!string.IsNullOrEmpty(txt_WW.Value))
        {
            conAllCus.Like(V_CRM_STAFF_CUSTOMER.Attribute.WangWangId, txt_WW.Value);
            conToDayMustCon.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.WangWangId, txt_WW.Value);
            conExpired.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.WangWangId, txt_WW.Value);
            conWillInHighSeas.Like(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.WangWangId, txt_WW.Value);
            conContracted.Like(V_CRM_STAFF_CUSTOMER.Attribute.WangWangId, txt_WW.Value);
        }

        if (string.IsNullOrEmpty(time_Staf.Value) && string.IsNullOrEmpty(time_End.Value))
        {
            conToDayMustCon.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date, DateTime.Now.Date.Date.AddDays(1).AddSeconds(-1)));
            conExpired.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date.Date.AddDays(-57), DateTime.Now.Date.AddSeconds(-1)));
            //conWillInHighSeas.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date.AddSeconds(-60), DateTime.Now.Date.AddSeconds(-58)));
        }
        else if (!string.IsNullOrEmpty(time_Staf.Value) && string.IsNullOrEmpty(time_End.Value))
        {
            //conAllCus.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.MaxValue));
            conToDayMustCon.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date > DateTime.Parse(time_Staf.Value) ? DateTime.Now.Date : DateTime.Parse(time_Staf.Value), DateTime.Now.Date.AddDays(1).AddSeconds(-1)));
            conExpired.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.Now.Date.AddSeconds(-1)));
            //conWillInHighSeas.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date.AddSeconds(-60), DateTime.Now.Date.AddSeconds(-58)));
            //conContracted.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.MaxValue));
        }
        else if (string.IsNullOrEmpty(time_Staf.Value) && !string.IsNullOrEmpty(time_End.Value))
        {
            //conAllCus.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.MinValue, DateTime.Parse(time_End.Value)));
            conToDayMustCon.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date, DateTime.Now.Date.Date.AddDays(1).AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddDays(1).AddSeconds(-1)));
            conExpired.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date.AddDays(-57), DateTime.Now.Date.AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddSeconds(-1)));
            //conWillInHighSeas.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(new DateTime(1900, 1, 1), DateTime.Now.Date.AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddSeconds(-1)));
            //conContracted.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.MinValue, DateTime.Parse(time_End.Value)));
        }
        else if (!string.IsNullOrEmpty(time_Staf.Value) && !string.IsNullOrEmpty(time_End.Value))
        {
            //conAllCus.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.Parse(time_End.Value)));
            conToDayMustCon.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date > DateTime.Parse(time_Staf.Value) ? DateTime.Now.Date : DateTime.Parse(time_Staf.Value), DateTime.Now.Date.AddDays(1).AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddDays(1).AddSeconds(-1)));
            conExpired.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.Now.Date.AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddSeconds(-1)));
            //conWillInHighSeas.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.Now.Date.AddSeconds(-1) > DateTime.Parse(time_End.Value) ? DateTime.Parse(time_End.Value) : DateTime.Now.Date.AddSeconds(-1)));
            //conContracted.Where(V_CRM_STAFF_CUSTOMER.Attribute.LastContactTime, new Between(DateTime.Parse(time_Staf.Value), DateTime.Parse(time_End.Value)));
        }

        conWillInHighSeas.Where(V_CRM_STAFF_CUSTOMER_NOTCONTACT.Attribute.NextContactTime, new Between(DateTime.Now.Date.AddDays(-60), DateTime.Now.Date.AddDays(-57).AddSeconds(-1)));

        BindData(conAllCus, 1, aspAllCusPager);
        BindData(conToDayMustCon, 1, aspToDayMustConPager);
        BindData(conExpired, 1, aspExpiredPager);
        BindData(conWillInHighSeas, 1, aspWillInHighSeasPager);
        BindData(conContracted, 1, aspContractedPager);
    }
}
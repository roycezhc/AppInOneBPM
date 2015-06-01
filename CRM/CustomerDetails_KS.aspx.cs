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


public partial class CRM_CustomerDetails_KS : AgileFrame.AppInOne.Common.BasePage
{
    private string cusName = "";

    /// <summary>
    ///  客户名称
    /// </summary>
    public string CusName
    {
        get { return cusName; }
        set { cusName = value; }
    }

    private int cusId = 0;
    private string stfId = "";

    private string previousUrl = "";

    /// <summary>
    /// 上一个URL
    /// </summary>
    public string PreviousUrlUrl
    {
        get { return previousUrl; }
        set { previousUrl = value; }
    }
    public string showEditStr = "";
    public string showEditEnd = "";
    protected V_CRM_STAFF_CUSTOMER_CONTACTRECORDS bindCon = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        aspPager.PageSize = 10;
        if (HttpContext.Current != null && HttpContext.Current.Request != null && HttpContext.Current.Request.UrlReferrer != null && !string.IsNullOrEmpty(HttpContext.Current.Request.UrlReferrer.OriginalString))
        {
            PreviousUrlUrl = HttpContext.Current.Request.UrlReferrer.OriginalString;
        }
        //if (Request["CusId"] == null || !int.TryParse(Request["CusId"].ToString(),out cusId))
        //{
        //    return;
        //}

        //if (Request["stfId"] == null || string.IsNullOrEmpty(Request["stfId"].ToString()))
        //{
        //    return;
        //}
        //stfId = Request["stfId"].ToString();
        V_CRM_STAFF_CUSTOMER_NOTCONTACT m_Customer = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        V_CRM_STAFF_CUSTOMER_NOTCONTACT con = new V_CRM_STAFF_CUSTOMER_NOTCONTACT();
        con.Cus_ID= 5;
        con.STAFF_ID = 1;//chx??
        List<V_CRM_STAFF_CUSTOMER_NOTCONTACT> cusList = BLLTable<V_CRM_STAFF_CUSTOMER_NOTCONTACT>.Factory(conn).Select(new V_CRM_STAFF_CUSTOMER_NOTCONTACT(), con);
        if (cusList.Count > 0)//未签约
        {
            m_Customer = cusList[0];
            Cus_Status.Items.AddRange(FormHelper.GetListItem(AgileFrame.Orm.PersistenceLayer.Model.CRM_STAFF_CUSTOMER.Attribute.CustStatus));
            Cus_Status.SelectedIndex = m_Customer.CustStatus;
            txt_cus_id.Value = m_Customer._Cus_ID.ToString();
            txt_s_id.Value = m_Customer.STAFF_ID.ToString();
            txt_s_name.Value = m_Customer._SNAME;
            NextContactTime.Value = DateTime.Now.Date.AddDays(1).ToShortDateString();
            txt_lastContactTime.Value = "";
            txt_lastnextContactTime.Value = m_Customer._NextContactTime.ToString();
            txt_ContactDetailID.Value = m_Customer.ID.ToString();
            txt_cus_status.Value = m_Customer._CustStatus.ToString();

            page_CompanyAddress.Value = m_Customer.CompanyAddress;
            page_CompanyName.Value = m_Customer.CompanyName;
            page_ShopName.Value = m_Customer.ShopName;
            page_ShopNameURL.Value = m_Customer._ShopNameURL;
            page_WangWangId.Value = m_Customer._WangWangId;
            page_CustQQ.Value = m_Customer._CustQQ;
            page_Phone.Value = m_Customer.CUS_PHONE;
            page_Email.Value = m_Customer.CUS_EMAIL;
            page_Cus_Name.Value = m_Customer.Cus_Name;

            lit_CompanyAddress.Text = m_Customer.CompanyAddress;
            lit_CompanyName.Text = m_Customer.CompanyName;
            lit_ShopName.Text = m_Customer.ShopName;
            lit_ShopNameURL.Text = m_Customer._ShopNameURL;
            lit_WangWangId.Text = m_Customer._WangWangId;
            lit_CustQQ.Text = m_Customer._CustQQ;
            lit_Phone.Text = m_Customer.CUS_PHONE;
            lit_Email.Text = m_Customer.CUS_EMAIL;
            lit_Cus_Name.Text = m_Customer.Cus_Name;
        }
        else //已签约
        {
            showEditStr = "<div style=\"display:none\">";
            showEditEnd = "</div>";
            Cus_Status.Enabled = false;
            btnClientToHighSeas.Visible = false;

            V_CRM_STAFF_CUSTOMER_CONTACTRECORDS m_CustomerC = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();
            V_CRM_STAFF_CUSTOMER_CONTACTRECORDS conc = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();
            conc.Cus_ID = 5;
            conc.SID = "10001";
            conc.Top(1);
            List<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS> cusstaccList = BLLTable<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Select(new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS(), conc);

            if (cusstaccList.Count > 0)
            {
                m_CustomerC = cusstaccList[0];
                Cus_Status.Items.AddRange(FormHelper.GetListItem(AgileFrame.Orm.PersistenceLayer.Model.CRM_STAFF_CUSTOMER.Attribute.CustStatus));
                Cus_Status.SelectedIndex = m_CustomerC.CustStatus;
                txt_cus_id.Value = m_CustomerC._Cus_ID.ToString();
                txt_s_id.Value = m_CustomerC._SID;
                txt_s_name.Value = m_CustomerC._SNAME;
                NextContactTime.Value = DateTime.Now.Date.AddDays(1).ToShortDateString();
                txt_cus_status.Value = m_CustomerC._CustStatus.ToString();

                page_CompanyAddress.Value = m_CustomerC.CompanyAddress;
                page_CompanyName.Value = m_CustomerC.CompanyName;
                page_ShopName.Value = m_CustomerC.ShopName;
                page_ShopNameURL.Value = m_CustomerC._ShopNameURL;
                page_WangWangId.Value = m_CustomerC._WangWangId;
                page_CustQQ.Value = m_CustomerC._CustQQ;
                page_Phone.Value = m_CustomerC.CUS_PHONE;
                page_Email.Value = m_CustomerC.CUS_EMAIL;
                page_Cus_Name.Value = m_CustomerC.Cus_Name;

                lit_CompanyAddress.Text = m_CustomerC.CompanyAddress;
                lit_CompanyName.Text = m_CustomerC.CompanyName;
                lit_ShopName.Text = m_CustomerC.ShopName;
                lit_ShopNameURL.Text = m_CustomerC._ShopNameURL;
                lit_WangWangId.Text = m_CustomerC._WangWangId;
                lit_CustQQ.Text = m_CustomerC._CustQQ;
                lit_Phone.Text = m_CustomerC.CUS_PHONE;
                lit_Email.Text = m_CustomerC.CUS_EMAIL;
                lit_Cus_Name.Text = m_CustomerC.Cus_Name;
            }
        }

        bindCon = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        bindCon._Cus_ID = con.Cus_ID;
        bindCon.Where("{0} is not null", V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName);
        bindCon.OrderBy(V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime, Order.Desc);
        //hidCondition.Value = string.Format("3|af_where` And [{0}].[{1}]`{2} And [{3}].[{4}] is not null|af_pageby`[{5}].[{6}] |af_pagebyorder`0",
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.Cus_ID.TableName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.Cus_ID.FieldName,
        //                     bindCon._Cus_ID,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.TableName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.TableName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName
        //                     );
        //wcp zlg? 转换成json
        hidCondition.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>(bindCon);
        BindData(bindCon, 1);
    }

    protected void btnCusDetailUpDown_Click(object sender, EventArgs e)
    {
        CRM_CUST c_cust = new CRM_CUST();
        c_cust.Cus_ID = Convert.ToInt32(txt_cus_id.Value);
        c_cust.Email = page_Email.Value;
        c_cust.Phone = page_Phone.Value;
        c_cust._Cus_Name = page_Cus_Name.Value;
        BLLTable<CRM_CUST>.Factory(conn).Update(c_cust, CRM_CUST.Attribute.Cus_ID);

        CRM_CUSTOMER c_customer = new CRM_CUSTOMER();
        c_customer.Cus_Id = Convert.ToInt32(txt_cus_id.Value);
        c_customer.CompanyAddress = page_CompanyAddress.Value;
        c_customer.CompanyName = page_CompanyName.Value;
        c_customer.ShopName = page_ShopName.Value;
        c_customer.ShopNameURL = page_ShopNameURL.Value;
        c_customer.WangWangId = page_WangWangId.Value;
        c_customer.CustQQ = page_CustQQ.Value;
        BLLTable<CRM_CUSTOMER>.Factory(conn).Update(c_customer, CRM_CUSTOMER.Attribute.Cus_Id);

        lit_CompanyAddress.Text = page_CompanyAddress.Value;
        lit_CompanyName.Text = page_CompanyName.Value;
        lit_ShopName.Text = page_ShopName.Value;
        lit_ShopNameURL.Text = page_ShopNameURL.Value;
        lit_WangWangId.Text = page_WangWangId.Value;
        lit_CustQQ.Text = page_CustQQ.Value;
        lit_Phone.Text = page_Phone.Value;
        lit_Email.Text = page_Email.Value;
        lit_Cus_Name.Text = page_Cus_Name.Value;
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        if (Cus_Status.SelectedIndex == 0)
        {
            lit_Info.Text = "<a style=\"color:Red;\">请选择客户状态！</a>";
            return;
        }
        if (string.IsNullOrEmpty(ContactRecords.Value))
        {
            lit_Info.Text = "<a style=\"color:Red;\">请输入联系记录！</a>";
            return;
        }
        DateTime _nextContactTime = DateTime.MinValue;
        if (!DateTime.TryParse(NextContactTime.Value, out _nextContactTime))
        {
            lit_Info.Text = "<a style=\"color:Red;\">请输入下次联系时间！</a>";
            return;
        }
        if (_nextContactTime.AddDays(1).AddSeconds(-1) <= DateTime.Now)
        {
            lit_Info.Text = "<a style=\"color:Red;\">请输入一个等于或晚于今天的下次联系时间！</a>";
            return;
        }
        DateTime dt = DateTime.MinValue;
        CRM_STAFF_CUSTOMER_CONTACTRECORDS crm_sta_cc = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        crm_sta_cc._Cus_ID = Convert.ToInt32(txt_cus_id.Value);
        crm_sta_cc._SID = txt_s_id.Value;
        crm_sta_cc._CustStatus = Cus_Status.SelectedIndex;
        crm_sta_cc._NextContactTime = _nextContactTime;
        txt_cus_status.Value = crm_sta_cc._CustStatus.ToString();
        try
        {
            int count = BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(crm_sta_cc);
            if (count < 1)
            {
                lit_Info.Text = "<a style=\"color:Red;\">提交失败！存在重复的记录！</a>";
                return;
            }
            //ContactDetailID.Value

            crm_sta_cc.ID = decimal.Parse(txt_ContactDetailID.Value);
            crm_sta_cc._ContactRecords = ContactRecords.Value;
            crm_sta_cc._ContactTime = DateTime.Now;
            dt = DateTime.MinValue;
            DateTime.TryParse(txt_lastnextContactTime.Value, out dt);
            crm_sta_cc._NextContactTime = dt;
            count = 0;
            count = BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Update(crm_sta_cc, CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.SID, CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.Cus_ID, CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.NextContactTime, CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ID);
            if (count < 1)
            {
                lit_Info.Text = "<a style=\"color:Red;\">提交失败！</a>";
                return;
            }
        }
        catch
        {
            lit_Info.Text = "<a style=\"color:Red;\">提交失败！存在重复的记录！</a>";
            return;
        }
        CRM_STAFF_CUSTOMER crm_sta_c = new CRM_STAFF_CUSTOMER();
        crm_sta_c._Cus_ID = Convert.ToInt32(txt_cus_id.Value);
        crm_sta_c._SID = txt_s_id.Value;
        crm_sta_c._CustStatus = Cus_Status.SelectedIndex;
        dt = DateTime.MinValue;
        DateTime.TryParse(txt_lastContactTime.Value, out dt);
        crm_sta_c._LastContactTime = dt;
        try
        {
            BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Update(crm_sta_c, CRM_STAFF_CUSTOMER.Attribute.Cus_ID, CRM_STAFF_CUSTOMER.Attribute.SID);
        }
        catch
        {
            lit_Info.Text = "<a style=\"color:Red;\">提交失败！</a>";
            return;
        }

        CRM_STAFF_CUSTOMER_CONTACTRECORDS csccval = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        csccval.ID = 0;
        CRM_STAFF_CUSTOMER_CONTACTRECORDS cscccon = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        csccval.Top(1);
        csccval.SID = crm_sta_c._SID;
        csccval.Cus_ID = crm_sta_c.Cus_ID;
        csccval.OrderBy(CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ID, Order.Desc);
        CRM_STAFF_CUSTOMER_CONTACTRECORDS cscc = BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).GetRowData(csccval, cscccon);
        if (cscc!= null)
            txt_ContactDetailID.Value = cscc.ID.ToString();
        txt_lastContactTime.Value = crm_sta_cc._ContactTime.ToString();
        txt_lastnextContactTime.Value = _nextContactTime.ToString();
        lit_Info.Text = "<a style=\"color:Green;\">提交成功！</a>";
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

    protected void BindData(V_CRM_STAFF_CUSTOMER_CONTACTRECORDS con, int curPage)
    {
        //hidCondition.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>(con);
        int recount = -1;
        V_CRM_STAFF_CUSTOMER_CONTACTRECORDS val = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        val._SNAME = "";
        val.ContactTime = DateTime.MinValue;
        val.ContactRecords = "";

        if (con.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            con.af_PageBy(V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ID, Order.Desc);
        List<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS> listObj = BLLTable<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).SelectByPage(val, con, aspPager.PageSize, curPage, ref recount);
        if (listObj.Count > 0)
        {
            FormHelper.Bind(Page, listObj[0].DicAttrValues);
            //BindToFindSelect(listObj[0].DicAttrValues);
            txt_lastContactTime.Value = string.IsNullOrEmpty(txt_lastContactTime.Value) ? listObj[0].ContactTime.ToString() : txt_lastContactTime.Value;
        }
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
        //hidCondition.Value = con.ToJson(200);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        //wcp zlg?
        bindCon = new V_CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        bindCon._Cus_ID = Convert.ToInt32(txt_cus_id.Value);
        DateTime sdt = DateTime.MinValue;
        DateTime edt = DateTime.MaxValue;
        //string wherebetween = "1=1";
        if (DateTime.TryParse(startTime.Value, out sdt) && DateTime.TryParse(endTime.Value, out edt))
        {
            bindCon.Where("{0} is not null and {1} between '{2}' and '{3}'",
            V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName,
            V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName,
            sdt.Date.ToString(),
            edt.Date.AddDays(1).AddSeconds(-1).ToString()
            );
            //wherebetween = string.Format("[{0}].[{1}] between '{2}' and '{3}'", 
            //               V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.TableName,
            //               V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName,
            //               sdt.Date.ToString(),
            //               edt.Date.AddDays(1).AddSeconds(-1).ToString()
            //               );
        }
        else
        {

            bindCon.Where("{0} is not null",V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName);
            //wherebetween = string.Format("[{0}].[{1}] is not null", V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.TableName, V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName);
        }
        bindCon.OrderBy(V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime, Order.Desc);
        //hidCondition.Value = string.Format("3|af_where` And [{0}].[{1}]`{2} And {3}|af_pageby`[{4}].[{5}] |af_pagebyorder`0",
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.Cus_ID.TableName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.Cus_ID.FieldName,
        //                     bindCon._Cus_ID,
        //                     wherebetween,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.TableName,
        //                     V_CRM_STAFF_CUSTOMER_CONTACTRECORDS.Attribute.ContactTime.FieldName
        //                     );
        //wcp zlg? 转换成json
        hidCondition.Value = JsonServiceBase.ToJson<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>(bindCon);
        BindData(bindCon, 1);
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            //wcp zlg? 转换回来时转换错了，造成翻页时绑定数据报错。
            bindCon = JsonServiceBase.FromJson<V_CRM_STAFF_CUSTOMER_CONTACTRECORDS>(hidCondition.Value);
        }
        //ContactRecords.Value = hidCondition.Value;
        BindData(bindCon, aspPager.CurrentPageIndex);
    }
    protected void btnClientToHighSeas_Click(object sender, EventArgs e)
    {
        CRM_STAFF_CUSTOMER con = new CRM_STAFF_CUSTOMER();
        con._Cus_ID = Convert.ToInt32(txt_cus_id.Value);
        con._SID = txt_s_id.Value;
        int count = BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Delete(con);
        CRM_STAFF_CUSTOMER_CONTACTRECORDS ccon = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        ccon.ID = Convert.ToDecimal(txt_ContactDetailID.Value);
        count += BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Delete(ccon);
        if (count > 1)
        {
            //丢入公海成功
        }
        else
        {
            //丢入公海失败
            return;
        }

        showEditStr = "<div style=\"display:none\">";
        showEditEnd = "</div>";
        Cus_Status.Enabled = false;
        Cus_Status.SelectedIndex = Convert.ToInt32(txt_cus_status.Value);
        btnClientToHighSeas.Visible = false;
        //UpdatePanel3.UpdateMode = UpdatePanelUpdateMode.Always;
        //UpdatePanel3.Update();
    }
}
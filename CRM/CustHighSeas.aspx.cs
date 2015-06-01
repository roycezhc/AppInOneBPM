using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.Common;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

using AgileFrame.Core.WebSystem;//.WebCtrls;
using AgileFrame.AppInOne.Common;

public partial class CRM_CustHighSeas : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string SID = "";
    public string cusIdAndCompanyName = "*|*9527*|*";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        aspPager.PageSize = 20;
        HR_STAFF js = userBase.GetStaff();
        SID = js.STAFF_ID.ToString();
        if (userBase.UserType.ToString() == EnumInfo.SYS_UserType.Admin.ToString("d"))//wcp?
        {
            V_CMR_STAF csVal = new V_CMR_STAF();
            csVal.STAFF_ID = 0;
            csVal._SNAME = "";
            csVal._DEPT_ID = "";
            csVal.USER_ID = 0;
            V_CMR_STAF csCon = new V_CMR_STAF();
            csCon.DEPT_ID = js.DEPT_ID;
            List<V_CMR_STAF> csList = BLLTable<V_CMR_STAF>.Factory(conn).Select(csVal, csCon);
            if (csList.Count > 0)
            {
                ddl_Staf.Items.Add(new ListItem("自己", js.STAFF_ID.ToString()));
                foreach (V_CMR_STAF cs in csList)
                {
                    if (cs.USER_ID == userBase.UserID)
                    {
                        continue;
                    }
                    else
                    {
                        ddl_Staf.Items.Add(new ListItem(cs.SNAME, cs.STAFF_ID.ToString()));
                    }
                }
                ddl_Staf.SelectedIndex = 0;
            }
        }
        else
        {
            ddl_Staf.Visible = true;
            ddl_Staf.Items.Add(new ListItem("自己", SID));
            ddl_Staf.SelectedIndex = 0;
        }

        BindData(new V_CUSTHIGHSEAS(), 1);
    }

    protected void BindData(V_CUSTHIGHSEAS con, int curPage)
    {
        hidHighSeas.Value = JsonServiceBase.ToJson<V_CUSTHIGHSEAS>(con);
        con.af_PageBy(V_CUSTHIGHSEAS.Attribute.Cus_ID, Order.Desc);
        int recount = -1;
        V_CUSTHIGHSEAS val = new V_CUSTHIGHSEAS();
        val.Cus_ID = 0;
        val.CompanyName = "";
        val.ShopName = "";
        val.Cus_Name = "";
        val.CustQQ = "";
        val.WangWangId = "";
        val.Phone = "";
        val.MobPhone = "";
        val._LoadHighSeasTime = DateTime.MinValue;
        List<V_CUSTHIGHSEAS> listObj = BLLTable<V_CUSTHIGHSEAS>.Factory(conn).SelectByPage(val, con, aspPager.PageSize, curPage, ref recount);
        if (listObj.Count > 0)
        {
            FormHelper.Bind(Page, listObj[0].DicAttrValues);
        }
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.CurrentPageIndex = curPage;
        aspPager.RecordCount = recount;
        //hidCondition.Value = con.ToJson(200);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        V_CUSTHIGHSEAS con = new V_CUSTHIGHSEAS();
        if (!string.IsNullOrEmpty(txt_ComName.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.CompanyName, txt_ComName.Value);
        if (!string.IsNullOrEmpty(txt_ShopName.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.ShopName, txt_ShopName.Value);
        if (!string.IsNullOrEmpty(txt_MobPhone.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.MobPhone, txt_MobPhone.Value);
        if (!string.IsNullOrEmpty(txt_Phone.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.Phone, txt_Phone.Value);
        if (!string.IsNullOrEmpty(txt_QQ.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.CustQQ, txt_QQ.Value);
        if (!string.IsNullOrEmpty(txt_WW.Value))
            con.Like(V_CUSTHIGHSEAS.Attribute.WangWangId, txt_WW.Value);
        if (!string.IsNullOrEmpty(time_Staf.Value) && string.IsNullOrEmpty(time_End.Value))
        {
            con.Where("{0} > '{1}'",V_CUSTHIGHSEAS.Attribute.LoadHighSeasTime.FieldName, time_Staf.Value);
        }
        else if (string.IsNullOrEmpty(time_Staf.Value) && !string.IsNullOrEmpty(time_End.Value))
        {
            con.Where("{0} < '{1}'", V_CUSTHIGHSEAS.Attribute.LoadHighSeasTime.FieldName, time_End.Value);
        }
        else if (!string.IsNullOrEmpty(time_Staf.Value) && !string.IsNullOrEmpty(time_End.Value))
        {
            con.Where("{0} Between '{1}' And '{2}'", V_CUSTHIGHSEAS.Attribute.LoadHighSeasTime.FieldName, time_Staf.Value, time_End.Value);
        }
        BindData(con, 1);
    }
    protected void btnDistribution_Click(object sender, EventArgs e)
    {
        lit_CustInfo.Visible = false;
        lit_CustInfo.Text = "";
        int count = 0;
        CRM_STAFF_CUSTOMER cscVal = new CRM_STAFF_CUSTOMER();
        cscVal._Cus_ID = 0;
        CRM_STAFF_CUSTOMER cscCon = new CRM_STAFF_CUSTOMER();
        cscCon._SID = ddl_Staf.SelectedItem.Value;
        List<CRM_STAFF_CUSTOMER> cscList = BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Select(cscVal, cscCon);
        if (cscList.Count >= 500)
        {
            lit_CustInfo.Visible = true;
            lit_CustInfo.Text = "<a style=\"color:red\">改员工客户数达到上限500个,不能再分配！</a>";
            return;
        }
        string msg = "";
        foreach (Control c in repList.Controls)
        {
            if (cscList.Count + count >= 500)
                break;
            RepeaterItem ri = c as RepeaterItem;
            
            foreach (Control cc in c.Controls)
            {
                if (cc.GetType() == typeof(HtmlInputCheckBox))
                {
                    HtmlInputCheckBox hc = cc as HtmlInputCheckBox;
                    if (hc.Checked)
                    {
                        string[] cus = hc.Value.Split(new string[]{"*|*9527*|*"},StringSplitOptions.None);
                        if(cus.Length<2)
                            break;
                        CRM_STAFF_CUSTOMER_CONTACTRECORDS csccCon = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
                        csccCon._Cus_ID = Convert.ToInt32(cus[0]);
                        csccCon._SID = ddl_Staf.SelectedItem.Value;
                        if (BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Exists(csccCon))
                        {
                            msg += ddl_Staf.SelectedItem.Text == "自己" ? "你" : ddl_Staf.SelectedItem.Text;
                            msg += "曾经拥有过客户" + cus[1] + ",不能分配\n";
                            break;
                        }
                        CRM_STAFF_CUSTOMER csc = new CRM_STAFF_CUSTOMER();
                        csc.SID = ddl_Staf.SelectedItem.Value;
                        csc.Cus_ID = Convert.ToInt32(cus[0]);
                        csc.CustStatus = 1;
                        BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Insert(csc);

                        CRM_STAFF_CUSTOMER_CONTACTRECORDS cscc = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
                        cscc.SID = csc.SID;
                        cscc.Cus_ID = csc.Cus_ID;
                        cscc.NextContactTime = DateTime.Now.AddDays(1);
                        cscc.CustStatus = 1;
                        BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(cscc);
                        count++;
                        c.Controls.Remove(c);
                        break;
                    }
                }
            }
        }
        lit_CustInfo.Visible = true;
        lit_CustInfo.Text = "<a style=\"color:green\">成功分配：" + count + "个客户到" + ddl_Staf.SelectedItem.Text + "</a>";
        if (!string.IsNullOrEmpty(msg))
            ScriptHelper.Alert(Page, msg);
        V_CUSTHIGHSEAS con = new V_CUSTHIGHSEAS();
        if (hidHighSeas.Value != "")
        {
            //wcp zlg? 转换回来时转换错了，造成翻页时绑定数据报错。
            con = JsonServiceBase.FromJson<V_CUSTHIGHSEAS>(hidHighSeas.Value);
        }
        //ContactRecords.Value = hidCondition.Value;
        BindData(con, aspPager.CurrentPageIndex);
    }
    protected void btnAddNewCus_Click(object sender, EventArgs e)
    {

    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        V_CUSTHIGHSEAS con = new V_CUSTHIGHSEAS();
        if (hidHighSeas.Value != "")
        {
            //wcp zlg? 转换回来时转换错了，造成翻页时绑定数据报错。
            con = JsonServiceBase.FromJson<V_CUSTHIGHSEAS>(hidHighSeas.Value);
        }
        //ContactRecords.Value = hidCondition.Value;
        BindData(con, aspPager.CurrentPageIndex);
    }
    //protected void btnSub_Click(object sender, EventArgs e)
    //{
    //    CRM_CUSTOMER c_customer = new CRM_CUSTOMER();
    //    if (!string.IsNullOrEmpty(txt_addComAddress.Value))
    //        c_customer.CompanyAddress = txt_addComAddress.Value;
    //    c_customer._CustSex = txt_addCustSexMan.Checked ? 1 : 0;
    //    if (!string.IsNullOrEmpty(txt_addShopName.Value))
    //        c_customer._ShopName = txt_addShopName.Value;
    //    if (!string.IsNullOrEmpty(txt_addShopUrl.Value))
    //        c_customer._ShopNameURL = txt_addShopUrl.Value;
    //    if (!string.IsNullOrEmpty(txt_addWangWangId.Value))
    //        c_customer._WangWangId = txt_addWangWangId.Value;
    //    if (!string.IsNullOrEmpty(txt_addComName.Value))
    //        c_customer._CompanyName = txt_addComName.Value;
    //    c_customer._LastEditors = hid_SID.Value;
    //    int count = BLLTable<CRM_CUSTOMER>.Factory(conn).Insert(c_customer);
    //    if (count < 1)//插入不成功
    //        return;
    //    c_customer.OrderBy(CRM_CUSTOMER.Attribute.Cus_Id,Order.Desc);
    //    c_customer.Top(1);
    //    CRM_CUSTOMER c_customerval = new CRM_CUSTOMER();
    //    c_customerval.Cus_Id = 0;
    //    List<CRM_CUSTOMER> c_customercusid = BLLTable<CRM_CUSTOMER>.Factory(conn).Select(c_customerval, c_customer);
    //    if (c_customercusid.Count < 1)//插入不成功？
    //        return;

    //    CRM_CUST c_cust = new CRM_CUST();
    //    c_cust._Cus_ID = c_customercusid[0].Cus_Id;
    //    if (!string.IsNullOrEmpty(txt_addCustName.Value))
    //        c_cust._Cus_Name = txt_addCustName.Value;
    //    if (!string.IsNullOrEmpty(txt_addEmail.Value))
    //        c_cust._Email = txt_addEmail.Value;
    //    if (!string.IsNullOrEmpty(txt_addMobPhone.Value))
    //        c_cust._MobPhone = txt_addMobPhone.Value;
    //    if (!string.IsNullOrEmpty(txt_addPhone.Value))
    //        c_cust._Phone = txt_addPhone.Value;
    //    if (!string.IsNullOrEmpty(txt_addQQ.Value))
    //        c_cust._QQ = txt_addQQ.Value;
    //    if (!string.IsNullOrEmpty(txt_addComName.Value))
    //        c_cust._ContactName = txt_addComName.Value;
    //    c_cust._AddTime = DateTime.Now;
    //    c_cust._EditTime = DateTime.Now;
    //    count += BLLTable<CRM_CUST>.Factory(conn).Insert(c_cust);
    //    if (count < 2)//插入不成功
    //        return;

    //    if (string.IsNullOrEmpty(hid_SID.Value))
    //        return;
    //    DateTime lastConTime = DateTime.MinValue;
    //    if (!string.IsNullOrEmpty(txt_addConDailts.Value))
    //    {
    //        CRM_STAFF_CUSTOMER_CONTACTRECORDS c_scc = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
    //        c_scc._Cus_ID = c_customercusid[0].Cus_Id;
    //        c_scc._SID = hid_SID.Value;
    //        c_scc._NextContactTime = DateTime.Now;
    //        c_scc._ContactTime = DateTime.Now;
    //        lastConTime = c_scc._ContactTime;
    //        c_scc._ContactRecords = txt_addConDailts.Value;
    //        c_scc._CustStatus = ddl_CusStatus.SelectedIndex;
    //        BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(c_scc);
    //    }
    //    CRM_STAFF_CUSTOMER_CONTACTRECORDS c_sccNext = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
    //    c_sccNext._Cus_ID = c_customercusid[0].Cus_Id;
    //    c_sccNext._SID = hid_SID.Value;
    //    c_sccNext._NextContactTime = DateTime.Now.AddDays(1);
    //    c_sccNext._CustStatus = ddl_CusStatus.SelectedIndex;
    //    count += BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(c_sccNext);
    //    if (count < 3)//插入不成功
    //        return;

    //    CRM_STAFF_CUSTOMER c_sc = new CRM_STAFF_CUSTOMER();
    //    c_sc._Cus_ID = c_customercusid[0].Cus_Id;
    //    c_sc._SID = hid_SID.Value;
    //    c_sc._CustStatus = ddl_CusStatus.SelectedIndex;
    //    if (lastConTime != DateTime.MinValue)
    //        c_sc._LastContactTime = lastConTime;
    //    count += BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Insert(c_sc);
    //    if (count < 4)//插入不成功
    //        return;
    //}

    //protected void btnAddShop_Click(object sender, EventArgs e)
    //{
    //    Button b = sender as Button;
    //    if (b == null)
    //        return;
    //    //string cstr1 = "<dl><dt>网店名称：</dt><dd><input id=\"txt_addShopName\" runat=\"server\" type=\"text\" /></dd></dl>";
    //    //string cstr2 = "<dl><dt>网店地址：</dt><dd><input id=\"txt_addShopUrl\" runat=\"server\" type=\"text\" /></dd></dl>";
    //    Control cShopName = new HtmlGenericControl("dl");
    //    HtmlGenericControl html = new HtmlGenericControl("dt");
    //    html.InnerText = "网店名称";
    //    cShopName.Controls.Add(html);
    //    html = new HtmlGenericControl("dd");
    //    cShopName.Controls.Add(html);
    //    HtmlInputText input = new HtmlInputText("text");
    //    input.ID = "txt_ShopName" + hid_ShopCount.Value;
    //    cShopName.Controls[1].Controls.Add(input);

    //    Control cShopUrl = new HtmlGenericControl("dl");
    //    html = new HtmlGenericControl("dt");
    //    html.InnerText = "网店地址";
    //    cShopUrl.Controls.Add(html);
    //    html = new HtmlGenericControl("dd");
    //    cShopUrl.Controls.Add(html);
    //    input = new HtmlInputText("text");
    //    input.ID = "txt_ShopUrl" + hid_ShopCount.Value;
    //    cShopUrl.Controls[1].Controls.Add(input);

    //    b.Parent.Controls.AddAt(8, cShopUrl);
    //    b.Parent.Controls.AddAt(8, cShopName);

    //    int count = 1;
    //    int.TryParse(hid_ShopCount.Value, out count);
    //    hid_ShopCount.Value = (count++).ToString();
    //}
}
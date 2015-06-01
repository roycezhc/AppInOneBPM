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

using System.Web.UI.HtmlControls;
using AgileFrame.AppInOne.Common;

public partial class CRM_AddNewCust : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string SID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        HR_STAFF js = userBase.GetStaff();
        hid_SID.Value = js.STAFF_ID.ToString();
        ddl_CusStatus.Items.AddRange(FormHelper.GetListItem(AgileFrame.Orm.PersistenceLayer.Model.CRM_STAFF_CUSTOMER.Attribute.CustStatus));
        txt_addCustSexMan.Checked = true;
        btnAddShop.Visible = false;
    }

    protected bool CheckTheSame()
    {
        if (string.IsNullOrEmpty(txt_addMobPhone.Value) && string.IsNullOrEmpty(txt_addPhone.Value) && string.IsNullOrEmpty(txt_addQQ.Value) && string.IsNullOrEmpty(txt_addEmail.Value))
        {
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">联系方式至少要填一项！</a>";
            lit_AddInfo.Visible = true;
            return true;
        }
        CRM_CUSTOMER cctomer = new CRM_CUSTOMER();
        CRM_CUST cct = new CRM_CUST();
        string cctomerLike = " 1<>1 ";
        string cctLike = " 1<>1 ";
        if (!string.IsNullOrEmpty(txt_addWangWangId.Value))
        {
            cctomerLike += " or " + CRM_CUSTOMER.Attribute.WangWangId.FieldName + " like '" + txt_addWangWangId.Value.Trim().Replace(" ", "") + "'";
        }
        if (!string.IsNullOrEmpty(txt_addShopUrl.Value))
        {
            txt_addShopUrl.Value = txt_addShopUrl.Value.Trim().Replace(" ", "").ToLower();
            if (!txt_addShopUrl.Value.Contains(".com"))
            {
                lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">网店地址错误！</a>";
                lit_AddInfo.Visible = true;
                return true;
            }
            int end = txt_addShopUrl.Value.IndexOf(".com") + 4;
            if (txt_addShopUrl.Value.Contains("://"))
            {
                int start = txt_addShopUrl.Value.IndexOf("://");
                if (end - start <= 0)
                {
                    lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">网店地址错误！</a>";
                    lit_AddInfo.Visible = true;
                    return true;
                }
                string url = txt_addShopUrl.Value.Substring(start, end - start);
                cctomerLike += " or " + CRM_CUSTOMER.Attribute.ShopNameURL.FieldName + " like '%" + url + "%'";
                //cctomerLike += CRM_CUSTOMER.Attribute.ShopNameURL.FieldName + " like 'http://" + txt_addShopUrl.Value.Trim().Replace(" ", "") + "%' or ";
            }
            else
            {
                string url = txt_addShopUrl.Value.Substring(0, end);
                cctomerLike += " or " + CRM_CUSTOMER.Attribute.ShopNameURL.FieldName + " like '" + url + "%'";
                //cctomerLike += CRM_CUSTOMER.Attribute.ShopNameURL.FieldName + " like 'http://" + txt_addShopUrl.Value.Trim().Replace(" ", "") + "%' or ";
            }
        }
        if (!string.IsNullOrEmpty(txt_addComName.Value))
        {
            cctomerLike += " or " + CRM_CUSTOMER.Attribute.CompanyName.FieldName + " like '" + txt_addComName.Value.Trim().Replace(" ", "") + "'";
        }
        cctomer.Where(cctomerLike);

        if (!string.IsNullOrEmpty(txt_addQQ.Value))
        {
            cctLike += " or " + CRM_CUST.Attribute.QQ.FieldName + " like '" + txt_addQQ.Value.Trim().Replace(" ", "") + "'";
        }
        if (!string.IsNullOrEmpty(txt_addPhone.Value))
        {
            cctLike += " or " + CRM_CUST.Attribute.Phone.FieldName + " like '" + txt_addPhone.Value.Trim().Replace(" ", "") + "'";
        }
        if (!string.IsNullOrEmpty(txt_addMobPhone.Value))
        {
            cctLike += " or " + CRM_CUST.Attribute.MobPhone.FieldName + " like '" + txt_addMobPhone.Value.Trim().Replace(" ", "") + "'";
        }
        if (!string.IsNullOrEmpty(txt_addEmail.Value))
        {
            cctLike += " or " + CRM_CUST.Attribute.Email.FieldName + " like '" + txt_addEmail.Value.Trim().Replace(" ", "") + "'";
        }
        cct.Where(cctLike);

        if (BLLTable<CRM_CUSTOMER>.Exists(cctomer) || BLLTable<CRM_CUST>.Exists(cct))
        {
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！系统中存在该用户！</a>";
            lit_AddInfo.Visible = true;
            return true;
        }
        return false;
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        lit_AddInfo.Text = "";
        lit_AddInfo.Visible = false;
        CRM_STAFF_CUSTOMER cscVal = new CRM_STAFF_CUSTOMER();
        cscVal._Cus_ID = 0;
        CRM_STAFF_CUSTOMER cscCon = new CRM_STAFF_CUSTOMER();
        cscCon._SID = hid_SID.Value;
        List<CRM_STAFF_CUSTOMER> cscList = BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Select(cscVal, cscCon);
        if (cscList.Count >= 500)
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！客户数达到上限500个。</a>";
            return;
        }

        if (CheckTheSame())
        {
            return;
        }
        
        CRM_CUSTOMER c_customer = new CRM_CUSTOMER();
        if (!string.IsNullOrEmpty(txt_addComAddress.Value))
            c_customer.CompanyAddress = txt_addComAddress.Value.Trim().Replace(" ", "");
        c_customer._CustSex = txt_addCustSexMan.Checked ? 1 : 0;
        if (!string.IsNullOrEmpty(txt_addShopName.Value))
            c_customer._ShopName = txt_addShopName.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addShopUrl.Value))
            c_customer._ShopNameURL = txt_addShopUrl.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addWangWangId.Value))
            c_customer._WangWangId = txt_addWangWangId.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addComName.Value))
            c_customer._CompanyName = txt_addComName.Value.Trim().Replace(" ", "");
        else
            c_customer._CompanyName = txt_addShopName.Value.Trim().Replace(" ", "");
        c_customer._LastEditors = hid_SID.Value;
        int count = BLLTable<CRM_CUSTOMER>.Factory(conn).Insert(c_customer);
        if (count < 1)//插入不成功
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！</a>";
            return;
        }
        c_customer.OrderBy(CRM_CUSTOMER.Attribute.Cus_Id, Order.Desc);
        c_customer.Top(1);
        CRM_CUSTOMER c_customerval = new CRM_CUSTOMER();
        c_customerval.Cus_Id = 0;
        List<CRM_CUSTOMER> c_customercusid = BLLTable<CRM_CUSTOMER>.Factory(conn).Select(c_customerval, c_customer);
        if (c_customercusid.Count < 1)//插入不成功？
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！</a>";
            return;
        }

        CRM_CUST c_cust = new CRM_CUST();
        c_cust._Cus_ID = c_customercusid[0].Cus_Id;
        if (!string.IsNullOrEmpty(txt_addCustName.Value))
            c_cust._Cus_Name = txt_addCustName.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addEmail.Value))
            c_cust._Email = txt_addEmail.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addMobPhone.Value))
            c_cust._MobPhone = txt_addMobPhone.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addPhone.Value))
            c_cust._Phone = txt_addPhone.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addQQ.Value))
            c_cust._QQ = txt_addQQ.Value.Trim().Replace(" ", "");
        if (!string.IsNullOrEmpty(txt_addCustName.Value))
            c_cust._ContactName = txt_addCustName.Value.Trim().Replace(" ", "");
        c_cust._AddTime = DateTime.Now;
        c_cust._EditTime = DateTime.Now;
        count += BLLTable<CRM_CUST>.Factory(conn).Insert(c_cust);
        if (count < 2)//插入不成功
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！</a>";
            return;
        }

        if (string.IsNullOrEmpty(hid_SID.Value))
            return;
        DateTime lastConTime = DateTime.MinValue;
        if (!string.IsNullOrEmpty(txt_addConDailts.Value))
        {
            CRM_STAFF_CUSTOMER_CONTACTRECORDS c_scc = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
            c_scc._Cus_ID = c_customercusid[0].Cus_Id;
            c_scc._SID = hid_SID.Value;
            c_scc._NextContactTime = DateTime.Now;
            c_scc._ContactTime = DateTime.Now;
            lastConTime = c_scc._ContactTime;
            c_scc._ContactRecords = txt_addConDailts.Value;
            c_scc._CustStatus = ddl_CusStatus.SelectedIndex;
            BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(c_scc);
        }
        CRM_STAFF_CUSTOMER_CONTACTRECORDS c_sccNext = new CRM_STAFF_CUSTOMER_CONTACTRECORDS();
        c_sccNext._Cus_ID = c_customercusid[0].Cus_Id;
        c_sccNext._SID = hid_SID.Value;
        c_sccNext._NextContactTime = DateTime.Now.AddDays(1);
        c_sccNext._CustStatus = ddl_CusStatus.SelectedIndex;
        count += BLLTable<CRM_STAFF_CUSTOMER_CONTACTRECORDS>.Factory(conn).Insert(c_sccNext);
        if (count < 3)//插入不成功
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！</a>";
            return;
        }

        CRM_STAFF_CUSTOMER c_sc = new CRM_STAFF_CUSTOMER();
        c_sc._Cus_ID = c_customercusid[0].Cus_Id;
        c_sc._SID = hid_SID.Value;
        c_sc._CustStatus = ddl_CusStatus.SelectedIndex;
        if (lastConTime != DateTime.MinValue)
            c_sc._LastContactTime = lastConTime;
        count += BLLTable<CRM_STAFF_CUSTOMER>.Factory(conn).Insert(c_sc);
        if (count < 4)//插入不成功
        {
            lit_AddInfo.Visible = true;
            lit_AddInfo.Text = "<a style=\"color:red; font-size:12px;\">添加失败！</a>";
            return;
        }
        lit_AddInfo.Visible = true;
        lit_AddInfo.Text = "<a style=\"color:green; font-size:12px;\">添加成功！</a>";
        ClearForm();
    }

    public void ClearForm()
    {
        txt_addComAddress.Value = "";
        txt_addComName.Value = "";
        txt_addConDailts.Value = "";
        txt_addCustName.Value = "";
        txt_addCustSexMan.Checked = true;
        txt_addCustSexWoman.Checked = false;
        txt_addEmail.Value = "";
        txt_addMobPhone.Value = "";
        txt_addPhone.Value = "";
        txt_addQQ.Value = "";
        txt_addShopName.Value = "";
        txt_addShopUrl.Value = "";
        txt_addWangWangId.Value = "";
    }

    protected void btnAddShop_Click(object sender, EventArgs e)
    {
        Button b = sender as Button;
        if (b == null)
            return;
        //string cstr1 = "<dl><dt>网店名称：</dt><dd><input id=\"txt_addShopName\" runat=\"server\" type=\"text\" /></dd></dl>";
        //string cstr2 = "<dl><dt>网店地址：</dt><dd><input id=\"txt_addShopUrl\" runat=\"server\" type=\"text\" /></dd></dl>";
        Control cShopName = new HtmlGenericControl("dl");
        HtmlGenericControl html = new HtmlGenericControl("dt");
        html.InnerText = "网店名称";
        cShopName.Controls.Add(html);
        html = new HtmlGenericControl("dd");
        cShopName.Controls.Add(html);
        HtmlInputText input = new HtmlInputText("text");
        input.ID = "txt_ShopName" + hid_ShopCount.Value;
        cShopName.Controls[1].Controls.Add(input);

        Control cShopUrl = new HtmlGenericControl("dl");
        html = new HtmlGenericControl("dt");
        html.InnerText = "网店地址";
        cShopUrl.Controls.Add(html);
        html = new HtmlGenericControl("dd");
        cShopUrl.Controls.Add(html);
        input = new HtmlInputText("text");
        input.ID = "txt_ShopUrl" + hid_ShopCount.Value;
        cShopUrl.Controls[1].Controls.Add(input);

        b.Parent.Controls.AddAt(8, cShopUrl);
        b.Parent.Controls.AddAt(8, cShopName);

        int count = 1;
        int.TryParse(hid_ShopCount.Value, out count);
        hid_ShopCount.Value = (count++).ToString();
    }
}
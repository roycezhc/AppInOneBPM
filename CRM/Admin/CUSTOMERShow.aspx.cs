using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class CRM_CUSTOMERShow : AgileFrame.AppInOne.Common.BasePage
{
    CRM_CUSTOMER valObj=new CRM_CUSTOMER();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Cus_Id"]))
                {

                    valObj = BLLTable<CRM_CUSTOMER>.Factory(conn).GetRowData(CRM_CUSTOMER.Attribute.Cus_Id, Request["Cus_Id"]);
                    if(valObj==null) return ;
                    
                    
                    txtCompanyName.Text = Convert.ToString(valObj.CompanyName);//Convert.ToString
                    
                    
                    txtCompanyAddress.Text = Convert.ToString(valObj.CompanyAddress);//Convert.ToString
                    
                    
                    txtShopName.Text = Convert.ToString(valObj.ShopName);//Convert.ToString
                    
                    
                    txtShopNameURL.Text = Convert.ToString(valObj.ShopNameURL);//Convert.ToString
                    
                    
                    txtCustSex.Text = Convert.ToString(valObj.CustSex);//Convert.ToInt32
                    
                    
                    txtBirthday.Text = (valObj.Birthday == DateTime.MinValue) ? "" : valObj.Birthday.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtWangWangId.Text = Convert.ToString(valObj.WangWangId);//Convert.ToString
                    
                    
                    txtCustQQ.Text = Convert.ToString(valObj.CustQQ);//Convert.ToString
                    
                    
                    txtLastEditors.Text = Convert.ToString(valObj.LastEditors);//Convert.ToString
                    
                    
                    txtLoadHighSeasTime.Text = (valObj.LoadHighSeasTime == DateTime.MinValue) ? "" : valObj.LoadHighSeasTime.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtCus_Id.Text = Convert.ToString(valObj.Cus_Id);//Convert.ToInt32

                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["ajax"] != null)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文
                //Response.ContentType = "html/text";

                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divC.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
        }
    }

}

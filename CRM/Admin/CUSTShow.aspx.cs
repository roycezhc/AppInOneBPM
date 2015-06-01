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

public partial class CRM_CUSTShow : AgileFrame.AppInOne.Common.BasePage
{
    CRM_CUST valObj=new CRM_CUST();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Cus_ID"]))
                {

                    valObj = BLLTable<CRM_CUST>.Factory(conn).GetRowData(CRM_CUST.Attribute.Cus_ID, Request["Cus_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtCus_ID.Text = Convert.ToString(valObj.Cus_ID);//Convert.ToInt32
                    
                    
                    txtCus_Name.Text = Convert.ToString(valObj.Cus_Name);//Convert.ToString
                    
                    
                    txtJob.Text = Convert.ToString(valObj.Job);//Convert.ToString
                    
                    
                    txtRelationTxt.Text = Convert.ToString(valObj.RelationTxt);//Convert.ToString
                    
                    
                    txtRecorder.Text = Convert.ToString(valObj.Recorder);//Convert.ToString
                    
                    
                    txtMobPhone.Text = Convert.ToString(valObj.MobPhone);//Convert.ToString
                    
                    
                    txtPhone.Text = Convert.ToString(valObj.Phone);//Convert.ToString
                    
                    
                    txtContactName.Text = Convert.ToString(valObj.ContactName);//Convert.ToString
                    
                    
                    txtShopName.Text = Convert.ToString(valObj.ShopName);//Convert.ToString
                    
                    
                    txtShopAddr.Text = Convert.ToString(valObj.ShopAddr);//Convert.ToString
                    
                    
                    txtQQ.Text = Convert.ToString(valObj.QQ);//Convert.ToString
                    
                    
                    txtWW.Text = Convert.ToString(valObj.WW);//Convert.ToString
                    
                    
                    txtEmail.Text = Convert.ToString(valObj.Email);//Convert.ToString
                    
                    
                    txtAddress.Text = Convert.ToString(valObj.Address);//Convert.ToString
                    
                    
                    txtTrade.Text = Convert.ToString(valObj.Trade);//Convert.ToString
                    
                    
                    txtType.Text = Convert.ToString(valObj.Type);//Convert.ToInt32
                    
                    
                    txtState.Text=valObj.State.ToString();
                    
                    
                    txtIsSign.Text=valObj.IsSign.ToString();
                    
                    
                    txtAddTime.Text = (valObj.AddTime == DateTime.MinValue) ? "" : valObj.AddTime.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtEditTime.Text = (valObj.EditTime == DateTime.MinValue) ? "" : valObj.EditTime.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtPATH.Text = Convert.ToString(valObj.PATH);//Convert.ToString
                    
                    
                    txtPNAME.Text = Convert.ToString(valObj.PNAME);//Convert.ToString

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

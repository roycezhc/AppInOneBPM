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

public partial class HR_CHKWKDIVKEYVALUEShow2 : AgileFrame.AppInOne.Common.BasePage
{
    HR_CHKWKDIVKEYVALUE valObj=new HR_CHKWKDIVKEYVALUE();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["OtherKeyFieldName"]))
                {

                    valObj = BLLTable<HR_CHKWKDIVKEYVALUE>.Factory(conn).GetRowData(HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName, Request["OtherKeyFieldName"]);
                    if(valObj==null) return ;
                    
                    
                    txtGroupId.Text = Convert.ToString(valObj.GroupId);//Convert.ToInt32
                    
                    
                    txtDeviceID.Text = Convert.ToString(valObj.DeviceID);//Convert.ToString
                    
                    
                    txtAIOTableName.Text = Convert.ToString(valObj.AIOTableName);//Convert.ToString
                    
                    
                    txtAIOKeyFieldName.Text = Convert.ToString(valObj.AIOKeyFieldName);//Convert.ToString
                    
                    
                    txtOtherKeyFieldName.Text = Convert.ToString(valObj.OtherKeyFieldName);//Convert.ToString
                    
                    
                    txtAIOKeyValue.Text = Convert.ToString(valObj.AIOKeyValue);//Convert.ToString
                    
                    
                    txtOtherKeyValue.Text = Convert.ToString(valObj.OtherKeyValue);//Convert.ToString

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

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
using AgileFrame.AppInOne.Common;

public partial class Ec_fieldShow : BaseAdminPage
{
    Ec_field valObj=new Ec_field();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Fieldid"]))
                {

                    valObj = BLLTable<Ec_field>.Factory(conn).GetRowData(Ec_field.Attribute.Fieldid, Request["Fieldid"]);
                    if(valObj==null) return ;
                    
                    
                    txtFieldid.Text = Convert.ToString(valObj.Fieldid);//Convert.ToInt32
                    
                    
                    txtTabid.Text = Convert.ToString(valObj.Tabid);//Convert.ToInt32
                    
                    
                    txtColumnname.Text = Convert.ToString(valObj.Columnname);//Convert.ToString
                    
                    
                    txtTablename.Text = Convert.ToString(valObj.Tablename);//Convert.ToString
                    
                    
                    txtGeneratedtype.Text = Convert.ToString(valObj.Generatedtype);//Convert.ToInt32
                    
                    
                    txtUitype.Text=valObj.Uitype.ToString();
                    
                    
                    txtFieldname.Text = Convert.ToString(valObj.Fieldname);//Convert.ToString
                    
                    
                    txtFieldlabel.Text = Convert.ToString(valObj.Fieldlabel);//Convert.ToString
                    
                    
                    txtReadonly.Text=valObj.Readonly.ToString();
                    
                    
                    txtPresence.Text=valObj.Presence.ToString();
                    
                    
                    txtSelected.Text=valObj.Selected.ToString();
                    
                    
                    txtMaximumlength.Text = Convert.ToString(valObj.Maximumlength);//Convert.ToInt32
                    
                    
                    txtSequence.Text = Convert.ToString(valObj.Sequence);//Convert.ToInt32
                    
                    
                    txtBlock.Text = Convert.ToString(valObj.Block);//Convert.ToInt32
                    
                    
                    txtDisplaytype.Text=valObj.Displaytype.ToString();
                    
                    
                    txtTypeofdata.Text = Convert.ToString(valObj.Typeofdata);//Convert.ToString
                    
                    
                    txtQuickcreate.Text=valObj.Quickcreate.ToString();
                    
                    
                    txtQuickcreatesequence.Text = Convert.ToString(valObj.Quickcreatesequence);//Convert.ToInt32
                    
                    
                    txtInfo_type.Text=valObj.Info_type.ToString();
                    
                    
                    txtCtrlType.Text=valObj.CtrlType.ToString();

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

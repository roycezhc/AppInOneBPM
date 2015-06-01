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

public partial class WEC_A_VOTEShow : BaseAdminPage
{
    protected WEC_A_VOTE valObj = new WEC_A_VOTE();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["ID"]))
                {

                    valObj = BLLTable<WEC_A_VOTE>.Factory(conn).GetRowData(WEC_A_VOTE.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtADDTIME.Text = Convert.ToString(valObj.ADDTIME);//Convert.ToDateTime
                    
                    
                    txtKEYWORD.Text = Convert.ToString(valObj.KEYWORD);//Convert.ToString
                    
                    
                    txtTITLE.Text = Convert.ToString(valObj.TITLE);//Convert.ToString
                    
                    
                    txtPICURL.Text = Convert.ToString(valObj.PICURL);//Convert.ToString
                    
                    
                    txtINSTRUCTION.Text = Convert.ToString(valObj.INSTRUCTION);//Convert.ToString
                    
                    
                    txtPIC_SHOW.Text=valObj.PIC_SHOW.ToString();
                    
                    
                    txtIS_RADIO.Text=valObj.IS_RADIO.ToString();
                    
                    
                    txtSELECT_NUM.Text = Convert.ToString(valObj.SELECT_NUM);//Convert.ToInt32
                    
                    
                    txtTIME.Text = Convert.ToString(valObj.TIME);//Convert.ToString
                    
                    
                    txtRESULT.Text = Convert.ToString(valObj.RESULT);//Convert.ToInt32
                    
                    
                    txtSHARE.Text=valObj.SHARE.ToString();
                    
                    
                    txtKIND.Text=valObj.KIND.ToString();

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

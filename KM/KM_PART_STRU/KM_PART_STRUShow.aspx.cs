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

public partial class KM_PART_STRUShow : AgileFrame.AppInOne.Common.BasePage
{
    KM_PART_STRU valObj=new KM_PART_STRU();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["PART_ID"]))
                {

                    valObj = BLLTable<KM_PART_STRU>.Factory(conn).GetRowData(KM_PART_STRU.Attribute.PART_ID, Request["PART_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtPART_ID.Text = Convert.ToString(valObj.PART_ID);//Convert.ToString
                    
                    
                    txtPART_NAME.Text = Convert.ToString(valObj.PART_NAME);//Convert.ToString
                    
                    
                    txtK_PART_ID.Text = Convert.ToString(valObj.K_PART_ID);//Convert.ToString
                    
                    
                    txtPART_CONTENT.Text = Convert.ToString(valObj.PART_CONTENT);//Convert.ToString
                    
                    
                    txtPART_CLASS_ID.Text = Convert.ToString(valObj.PART_CLASS_ID);//Convert.ToString
                    
                    
                    txtPART_EA_SIGN.Text = Convert.ToString(valObj.PART_EA_SIGN);//Convert.ToString
                    
                    
                    txtPART_AUTHOR.Text = Convert.ToString(valObj.PART_AUTHOR);//Convert.ToString
                    
                    
                    txtPART_IS_READ.Text = Convert.ToString(valObj.PART_IS_READ);//Convert.ToString
                    
                    
                    txtSORT_NO.Text = Convert.ToString(valObj.SORT_NO);//Convert.ToDecimal
                    
                    
                    txtIDPATH.Text = Convert.ToString(valObj.IDPATH);//Convert.ToString
                    
                    
                    txtKNAME.Text = Convert.ToString(valObj.KNAME);//Convert.ToString
                    
                    
                    txtSNAME.Text = Convert.ToString(valObj.SNAME);//Convert.ToString
                    
                    
                    txtRNAME.Text = Convert.ToString(valObj.RNAME);//Convert.ToString
                    
                    
                    txtSUB_NUM.Text = Convert.ToString(valObj.SUB_NUM);//Convert.ToDecimal
                    
                    
                    txtSUBOBJECT_NUM.Text = Convert.ToString(valObj.SUBOBJECT_NUM);//Convert.ToDecimal
                    
                    
                    txtUSE_FLAG.Text = Convert.ToString(valObj.USE_FLAG);//Convert.ToString
                    
                    
                    txtEXP1.Text = Convert.ToString(valObj.EXP1);//Convert.ToString
                    
                    
                    txtEXP2.Text = Convert.ToString(valObj.EXP2);//Convert.ToString
                    
                    
                    txtEXP3.Text = Convert.ToString(valObj.EXP3);//Convert.ToString
                    
                    
                    txtEXP4.Text = Convert.ToString(valObj.EXP4);//Convert.ToString

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

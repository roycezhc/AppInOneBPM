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

public partial class Ec_relatedlistsShow : BaseAdminPage
{
    Ec_relatedlists valObj=new Ec_relatedlists();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["Relation_id"]))
                {

                    valObj = BLLTable<Ec_relatedlists>.Factory(conn).GetRowData(Ec_relatedlists.Attribute.Relation_id, Request["Relation_id"]);
                    if(valObj==null) return ;
                    
                    
                    txtRelation_id.Text = Convert.ToString(valObj.Relation_id);//Convert.ToInt32
                    
                    
                    txtTabid.Text = Convert.ToString(valObj.Tabid);//Convert.ToInt32
                    
                    
                    txtRelated_tabid.Text = Convert.ToString(valObj.Related_tabid);//Convert.ToInt32
                    
                    
                    txtName.Text = Convert.ToString(valObj.Name);//Convert.ToString
                    
                    
                    txtSequence.Text = Convert.ToString(valObj.Sequence);//Convert.ToInt32
                    
                    
                    txtLabel.Text = Convert.ToString(valObj.Label);//Convert.ToString
                    
                    
                    txtPresence.Text = Convert.ToString(valObj.Presence);//Convert.ToInt32
                    
                    
                    txtTabTableName.Text = Convert.ToString(valObj.TabTableName);//Convert.ToString
                    
                    
                    txtColumnName_PK.Text = Convert.ToString(valObj.ColumnName_PK);//Convert.ToString
                    
                    
                    txtColumnName_FK.Text = Convert.ToString(valObj.ColumnName_FK);//Convert.ToString
                    
                    
                    txtRelated_tabTableName.Text = Convert.ToString(valObj.Related_tabTableName);//Convert.ToString

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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Text;
using System.Collections.Specialized;

public partial class TEMPLATE_CRM_WJ_Controlpanel_SettingsAjax : BasePage_wj
{
    protected string[] url1;
    protected StringBuilder mainvalue=new StringBuilder();
     protected string conn = System.Configuration.ConfigurationSettings.AppSettings["conncr"];
    string trhead;
    string trbody;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request["file"]) && Request["file"].Length > 0)
            {
                string[] dic1 = Request.Form.AllKeys;
                List<string> listArr = new List<string>();
                NameValueCollection dic2 = Request.Form;//Request.Params;
                foreach (string key1 in dic2)
                {
                    if (key1.Equals(null) || key1.StartsWith("_user"))
                        break;
                    listArr.Add(dic2[key1]);
                    Request.Url.ToString();
                }
                string url = @"Ctrl\" + dic2["file"] + ".aspx?";//dic2["file"] + ".aspx?";
                for (int i = 0; i < listArr.Count; i++)
                {
                    url += dic1[i] + "=" + listArr[i] + "&";
                }
                url = url.Remove(url.Length - 1);                
                Server.Transfer(url, true);//+url地址  
            } 

        }
        catch (Exception ex)
        {
            //throw (ex);
        }
    }
    private void GetData()//获取传过来的变量
    {
        try
        {
            string url = Request.RawUrl;
            if (url.Contains('?'))
            {
                url1 = url.Split(new char[1] { '?' });
                url1 = url1[1].Split(new char[2] { '=', '&' });
            }
            else
            {
                url1 = url.Split(new char[2] { '=', '&' });
            }
        }
        catch (Exception ex)
        {
            //throw(ex.Message());
            url1 = null;
        }
    }
    protected void creatdata()
    {
        mainvalue.Append("<table width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\" class=\"small\"><tbody><tr>");
        mainvalue.Append("<td width=\"50%\" class=\"dataLabel\" nowrap=\"nowrap\" align=\"right\"><b>显示区域标题</b></td><td width=\"50%\" align=\"left\"><input type=\"text\" size=\"20\" name=\"label\" value=\"\" class=\"txtBox\"></td></tr>"); 
		mainvalue.Append("<tr><td class=\"dataLabel\" nowrap=\"nowrap\" align=\"right\"><b>显示顺序</b></td><td align=\"left\"><input type=\"text\" size=\"20\" name=\"order\" value=\"\" class=\"txtBox\"></td></tr></tbody></table><table border=\"0\" cellspacing=\"0\" cellpadding=\"5\" width=\"100%\"><tbody><tr><td align=\"center\"><button class=\"pure-button pure-button-success\" title=\"保存\"><i class=\"icon-ok\"></i> 保存</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class=\"pure-button pure-button-cancel\" title=\"关闭\" onclick=\"CloseLockDiv('createblock');return false;\"><i class=\"icon-off\"></i> 关闭</button>&nbsp;</td></tr></tbody></table>");			
    }
    protected void customblocklist()
    {
        Ec_blocks val = new Ec_blocks();
        val.Tabid = Convert.ToInt32(Request["fld_module"]);
        val.OrderBy(Ec_blocks.Attribute.Sequence);
        List<Ec_blocks> list = BLLTable<Ec_blocks>.Factory(conn).Select(new Ec_blocks(), val);
        mainvalue.Append("<table class=\"crm-table\" width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\"><tbody><tr height=\"28px\" class=\"windLayerHead\"><td width=\"5%\">#</td><td width=\"20%\">显示区域</td><td width=\"20%\">显示顺序</td><td width=\"20%\">工具</td></tr>");
        int i = 0;
        foreach (Ec_blocks ec in list)
        {
            i = i + 1;
            mainvalue.Append("<tr>");
            mainvalue.Append(string.Format("<td nowrap=\"\">{0}&nbsp;</td>", i));
            mainvalue.Append(string.Format("<td nowrap=\"\">{0}&nbsp;</td><td nowrap=\"\">{1}&nbsp;</td></td><td nowrap=\"\">", ec.Blocklabel, ec.Sequence));
            mainvalue.Append(string.Format("<i class=\"icon-edit pure-icon-bu crm-bu-style\" style=\"width:50px;height:50px;cursor:pointer;font-size:14px;\" onclick=\"getCreateCustomBlockForm('{0}','{1}','{2}','{3}','{4}')\"></i>", ec.Blockid, ec.Blockid, ec.Tabid, ec.Blocklabel, ec.Sequence));//(customModule,blockid,tabid,label,order)
            mainvalue.Append(string.Format("<i class=\"icon-trash pure-icon-bu crm-bu-style\" style=\"width:50px;height:50px;cursor:pointer;font-size:14px;\" onclick=\"deleteCustomBlock({0},'{0}', '', '');\"></i>", ec.Blockid));
            mainvalue.Append("&nbsp;</td></tr>");
        }
        mainvalue.Append("</tbody></table>");
    }
}
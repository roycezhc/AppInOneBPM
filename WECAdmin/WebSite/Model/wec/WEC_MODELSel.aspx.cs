using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using System.Text;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using System.Text.RegularExpressions;

public partial class WEC_MODELSel : BaseAdminPage
{
    protected StringBuilder mainvalue = new StringBuilder();
    protected string ordervalue = "",appPath="";
    protected int aid = 0;
    protected int intret = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            appPath = WebHelper.GetAppPath();
            aid = Convert.ToInt32(userBase2.Curraid);
            string url = Request.Url.ToString();
            string preUrl = WebHelper.GetAppPath();
            // string strsql = "select distinct TYPE from dbo.WEC_MODEL ";
            WEC_MODEL ww = new WEC_MODEL();
            ww.Distinct = true;
            ww.TYPE = 0;
            List<WEC_MODEL> list = BLLTable<WEC_MODEL>.Select(ww);
            string path = "";
            foreach (WEC_MODEL wl in list)
            {
                WEC_MODEL wm = new WEC_MODEL();
                wm.TYPE = wl.TYPE;
                List<WEC_MODEL> listwl = BLLTable<WEC_MODEL>.Select(new WEC_MODEL(), wm);
                path = RemoveNumber(listwl[0].PATH);

                if (listwl.Count != 0)
                {
                    if (!wl.TYPE.Equals(0))
                    {
                        ordervalue = string.Format("{0}<li><a href=\"#{1}\"  data-toggle=\"tab\" >{2}模板风格</a></li>", ordervalue, path, RemoveNumber(listwl[0].NAME));
                        mainvalue.Append("<div class=\"tab-pane fade \" id=\"");
                        mainvalue.Append(path);
                        mainvalue.Append("\"><ul class=\"cateradio \">");
                    }
                    else
                    {
                        ordervalue = string.Format("{0}<li class=\"active\"><a href=\"#{1}\"  data-toggle=\"tab\" >{2}模板风格</a></li>", ordervalue, path, RemoveNumber(listwl[0].NAME));
                        mainvalue.Append("<div class=\"tab-pane fade active in\" id=\"");
                        mainvalue.Append(path);
                        mainvalue.Append("\"><ul class=\"cateradio unstyled\">");
                    }
                    //加载现有模板
                    int selId = banddata(wl.TYPE);
                    foreach (WEC_MODEL wml in listwl)
                    {

                        if (selId == wml.ID)
                        {
                            mainvalue.Append("<li class=\"active\" style=\"margin-left: 70px;\"> <label style=\"text-align: left;\"> <img style=\"margin-left: -70px;\" src=\"");
                            mainvalue.Append(string.Format(@"{0}{1}", preUrl, wml.PIC_URL).Replace ("//","/"));
                            mainvalue.Append("\" alt=\"");
                            mainvalue.Append(wml.NAME);
                            mainvalue.Append("\" title=\"");
                            mainvalue.Append(wml.NAME);
                            mainvalue.Append(string.Format("\"><input type=\"radio\" name=\"{0}\" value=\"{1}\" checked=\"checked\">", path, wml.ID));
                        }
                        else
                        {
                            mainvalue.Append("<li style=\"margin-left: 70px;\"> <label style=\"text-align: left;\"> <img style=\"margin-left: -70px;\" src=\"");
                            mainvalue.Append(string.Format(@"{0}{1}", preUrl, wml.PIC_URL).Replace("//", "/"));
                            mainvalue.Append("\" alt=\"");
                            mainvalue.Append(wml.NAME);
                            mainvalue.Append("\" title=\"");
                            mainvalue.Append(wml.NAME);
                            mainvalue.Append(string.Format("\"><input type=\"radio\" name=\"{0}\" value=\"{1}\">", path, wml.ID));
                        }
                        mainvalue.Append(string.Format("<span style=\"font-weight: bold;\">{0}</span></label></li> ", wml.NAME));
                    }
                    mainvalue.Append("</ul></div>");

                }
            }
        }
        catch (Exception ex)
        {
            throw (ex);
        }
    }
    public static string RemoveNumber(string key)
    {
        return System.Text.RegularExpressions.Regex.Replace(key, @"\d", "");
    }
    private int banddata(int type)
    {


        using (Transaction t = new Transaction("conn"))
        {
            try
            {
                V_WEC_MODEL_SET cond = new V_WEC_MODEL_SET();
                cond.TYPE = type;
                cond.A_ID = Convert.ToInt32(userBase2.Curraid);
                V_WEC_MODEL_SET obj = BLLTable<V_WEC_MODEL_SET>.Factory(t).GetRowData(cond);

                if (obj != null)
                {
                    //string regex = @"\d+";
                    //Match mstr = Regex.Match(obj.NAME, regex);
                    //intret = Convert.ToInt32(mstr.Value);
                    t.Commit();
                    return Convert.ToInt32(obj.M_ID);
                }
                else
                    return 0;

            }
            catch
            {
                t.RollBack();
                return -1;
            }


        }
    }
}
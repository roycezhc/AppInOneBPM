using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class UCtrl_wucSelDepts : AgileFrame.AppInOne.Common.BaseUserControl
{
    protected string selMore = "";
    string _dirPre = "";
    public string dirPre
    {
        set { _dirPre = value; }
        get { return _dirPre; }
    }
    
    string getDirPre()
    {
        string str = "";
        int rootDepth = Request.Url.Segments.Length - 2;
        if (Request.ApplicationPath.Length > 1)
        {
            rootDepth -= 1;
        }
        for (int i = 0; i < rootDepth; i++)
        {
            str += "../";
        }
        return str;
    }

    public bool isSelMore
    {
        set
        {
            if (value == true)
            {
                selMore = "&sel=1";
            }
            else
            {
                selMore = "";
            }
        }
        get
        {
            if (selMore != "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    public string GetSelDptIDS()
    {
        return hidDptIDS.Value;
    }

    public void SetSelDpts(string dptids)
    {
        hidDptIDS.Value = dptids;
        litEmps.Text = DeptHelper.ShowSelDptHTML(dptids, false);
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            dirPre = getDirPre();

            ClientScriptManager sm =Page.ClientScript;
            if(!sm.IsClientScriptIncludeRegistered("selDpt")){
                sm.RegisterClientScriptInclude("selDpt", dirPre + "UCtrl/js/SelDpt.js");
            }
        }
    }
}
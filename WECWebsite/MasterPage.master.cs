using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class WECWebsite_Home_MasterPage : System.Web.UI.MasterPage
{
    public string preUrl = "";
    public static int aid;

    protected void Page_Load(object sender, EventArgs e)
    {
        string pagename = Page.Request.Url.PathAndQuery;
        preUrl = WebHelper.GetAppPath();
        aid = Common.GetReqIntValue("aid") ;//== 0 ? 1 : Common.GetReqIntValue("aid");
        string id = Common.GetReqStrValue("id");// == "" ? "01" : Common.GetReqStrValue("id");
        string path = "";
        V_WEC_MODEL_SET cond = new V_WEC_MODEL_SET();
        cond.A_ID = aid;
        List<V_WEC_MODEL_SET> list = BLLTable<V_WEC_MODEL_SET>.Select(new V_WEC_MODEL_SET(), cond);

        if (list.Count == 0)
        {
            cond = new V_WEC_MODEL_SET();
            cond.A_ID = -1;
            list = BLLTable<V_WEC_MODEL_SET>.Select(new V_WEC_MODEL_SET(), cond);

        }

        if (list.Count != 0)
        {
            List<V_WEC_MODEL_SET> listhome = new List<V_WEC_MODEL_SET>();
            listhome = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 0; });
            if (listhome.Count == 0) return;
           //配置用户控件(list 和menu 都是模板可配置，先找自己的模板，找不到，套用默认模板)
            if (pagename.ToUpper().Contains("/CHANNEL.ASPX"))
            {
                List<V_WEC_MODEL_SET> listmenu = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 4; });//menu;
                if (listmenu.Count == 0) return;
                path = listmenu[0].PATH;
                PageBase.AddAscx(this, "MenuPanel", path + ".ascx", "Menu", "~/WECWebsite/Menu/" + path + ".ascx", "cphMenu");

                WEC_COLUMN condwn = new WEC_COLUMN();
                condwn.ID = id;
                WEC_COLUMN valwc = BLLTable<WEC_COLUMN>.GetRowData(WEC_COLUMN.Attribute.ID, id);
                if (valwc != null)
                {
                    WEC_MODEL condwl = new WEC_MODEL();
                    condwl.ID = valwc.MODEL_ID;
                    condwl.TYPE = 5;
                    WEC_MODEL valwl = BLLTable<WEC_MODEL>.GetRowData(condwl);

                    if (valwl != null)
                    {
                        path = valwl.PATH;//"List5";//
                        PageBase.AddAscx(this, "BodyPanel", path + ".ascSSx", "Channel", "~/WECWebsite/Channel/" + path + ".ascx", "cphBody");
                    }
                    else
                    {
                        List<V_WEC_MODEL_SET> listlist = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 1; });//list;
                        if (listlist.Count == 0) return;
                        path = listlist[0].PATH;// "List5"; //
                        PageBase.AddAscx(this, "BodyPanel", path + ".ascSSx", "Channel", "~/WECWebsite/Channel/" + path + ".ascx", "cphBody");
                    }

                }
                //path = listhome[0].PATH;//"channel2";//
                //PageBase.AddAscx(this, "BodyPanel", path + ".ascSSx", "Channel", "~/WECWebsite/Channel/" + path + ".ascx", "cphBody");
            }
            else
            {
                if (pagename.ToUpper().Contains("/HOME.ASPX"))
                {
                    path = listhome[0].PATH;// "home6";//
                    PageBase.AddAscx(this, "BodyPanel", path + ".ascx", "Home", "~/WECWebsite/Home/" + path + ".ascx", "cphBody");
                }
                if (pagename.ToUpper().Contains("/LIST.ASPX"))
                {
                    List<V_WEC_MODEL_SET> listmenu = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 4; });//menu;
                    if (listmenu.Count == 0) return;
                    path = listmenu[0].PATH;
                    PageBase.AddAscx(this, "MenuPanel", path + ".ascx", "Menu", "~/WECWebsite/Menu/" + path + ".ascx", "cphMenu");


                    WEC_COLUMN condwn = new WEC_COLUMN();
                    condwn.ID = id;
                    WEC_COLUMN valwc = BLLTable<WEC_COLUMN>.GetRowData(WEC_COLUMN.Attribute.ID, id);
                    if (valwc != null)
                    {
                        WEC_MODEL condwl = new WEC_MODEL();
                        condwl.ID = valwc.MODEL_ID;
                        condwl.TYPE = 2;
                        WEC_MODEL valwl = BLLTable<WEC_MODEL>.GetRowData(condwl);
                        
                        if (valwl != null)
                        {
                            path = valwl.PATH;
                            PageBase.AddAscx(this, "BodyPanel", path + ".ascx", "List", "~/WECWebsite/List/" + path + ".ascx", "cphBody");
                        }
                        else
                        {
                            List<V_WEC_MODEL_SET> listlist = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 2; });//list;
                            if (listlist.Count == 0) return;
                            path = listlist[0].PATH;
                            PageBase.AddAscx(this, "BodyPanel", path + ".ascx", "List", "~/WECWebsite/List/" + path + ".ascx", "cphBody");
                        }

                    }

                }
                else if (pagename.ToUpper().Contains("/DETAIL.ASPX"))
                {
                    List<V_WEC_MODEL_SET> listmenu = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 4; });//menu;
                    if (listmenu.Count == 0) return;
                    path = listmenu[0].PATH;
                    PageBase.AddAscx(this, "MenuPanel", path + ".ascx", "Menu", "~/WECWebsite/Menu/" + path + ".ascx", "cphMenu");

                    WEC_Article condwn = new WEC_Article();
                    condwn.ID =Convert.ToDecimal(id);
                    WEC_Article valwc = BLLTable<WEC_Article>.GetRowData(condwn);
                    if (valwc != null)
                    {
                        WEC_MODEL condwl = new WEC_MODEL();
                        condwl.ID = valwc.MODEL_ID;
                        condwl.TYPE = 3;
                        WEC_MODEL valwl = BLLTable<WEC_MODEL>.GetRowData(condwl);
                        if (valwl != null)
                        {
                            path = valwl.PATH;//"Detail3";//
                            PageBase.AddAscx(this, "BodyPanel", path + ".ascx", "Detail", "~/WECWebsite/Detail/" + path + ".ascx", "cphBody");
                        }
                        else
                        {
                            List<V_WEC_MODEL_SET> listDetail = list.FindAll(delegate(V_WEC_MODEL_SET c1) { return c1.TYPE == 3; });//detail;
                            if (listDetail.Count == 0) return;
                            path = listDetail[0].PATH;//"Detail3";//
                            PageBase.AddAscx(this, "BodyPanel", path + ".ascx", "Detail", "~/WECWebsite/Detail/" + path + ".ascx", "cphBody");
                        }

                    }


                }
            }
              
            #region

            //if (pagename.ToUpper().Contains("/HOME.ASPX"))
            //{
            //    cond.A_ID = aid;
            //    cond.TYPE = 0;

            //    V_WEC_MODEL_SET val = BLLTable<V_WEC_MODEL_SET>.GetRowData(cond);

            //    if (val != null)
            //    {
            //        PageBase.AddAscx(this, "BodyPanel", val.PATH + ".ascx", "Home", "~/WECWebsite/Home/" + val.PATH + ".ascx", "cphBody");
            //    }
            //}
            //else if (pagename.ToUpper().Contains("/LIST.ASPX"))
            //{
            //    cond = new V_WEC_MODEL_SET();
            //    cond.A_ID = aid;
            //    cond.TYPE = 4;
            //    V_WEC_MODEL_SET val = BLLTable<V_WEC_MODEL_SET>.GetRowData(cond);
            //    if (val != null)
            //    {
            //        PageBase.AddAscx(this, "MenuPanel", val.PATH + ".ascx", "Menu", "~/WECWebsite/Menu/" + val.PATH + ".ascx", "cphMenu");
            //    }

            //    string cid = Common.GetReqStrValue("id");



            //    cond = new V_WEC_MODEL_SET();
            //    cond.A_ID = aid;
            //    cond.TYPE = 2;
            //    val = BLLTable<V_WEC_MODEL_SET>.GetRowData(cond);
            //    if (val != null)
            //    {
            //        PageBase.AddAscx(this, "BodyPanel", val.PATH + ".ascx", "List", "~/WECWebsite/List/" + val.PATH + ".ascx", "cphBody");
            //    }

            //}
            //else if (pagename.ToUpper().Contains("/DETAIL.ASPX"))
            //{
            //    cond = new V_WEC_MODEL_SET();
            //    cond.A_ID = aid;
            //    cond.TYPE = 4;
            //    V_WEC_MODEL_SET val = BLLTable<V_WEC_MODEL_SET>.GetRowData(cond);
            //    if (val != null)
            //    {
            //        PageBase.AddAscx(this, "MenuPanel", val.PATH + ".ascx", "Menu", "~/WECWebsite/Menu/" + val.PATH + ".ascx", "cphMenu");
            //    }

            //    cond = new V_WEC_MODEL_SET();
            //    cond.A_ID = aid;
            //    cond.TYPE = 3;
            //    val = BLLTable<V_WEC_MODEL_SET>.GetRowData(cond);
            //    if (val != null)
            //    {
            //        PageBase.AddAscx(this, "BodyPanel", val.PATH + ".ascx", "Detail", "~/WECWebsite/Detail/" + val.PATH + ".ascx", "cphBody");
            //    }

            //}
            #endregion
        }
       

    }
    
}

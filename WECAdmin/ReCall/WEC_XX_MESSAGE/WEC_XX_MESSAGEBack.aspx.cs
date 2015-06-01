using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WEC_XX_MESSAGEBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string openid=HttpUtil.GetReqStrValue("openid");
        string lastid = HttpUtil.GetReqStrValue("lastid");
        V_R_MESSAGE conf = new V_R_MESSAGE();
        conf.OPENID = openid;
        if (lastid.Equals("")) { return; };
        conf.af_WhereSQL = " AND ID>" + lastid;
        List<V_R_MESSAGE> lists = BLLTable<V_R_MESSAGE>.Select(new V_R_MESSAGE(), conf);
       
        string response="";
        string res_lastid = "";
        foreach (V_R_MESSAGE msg in lists)
        {
            res_lastid = Convert.ToString(msg.ID);
            if (msg.R_CONTENT != null && !msg.Equals(""))
            {
                if(msg.TYPE==2)
                {
                     response += "<div class='res left'>" + msg.ADDTIME + "<br/>" + msg.S_CONTENT + "</div><br/>";
                }
                else if(msg.TYPE==3)
                {
                    response += "<div class='res left'>" + msg.ADDTIME + "<br/>" + "<img class='img' src='"+msg.S_CONTENT+"'/>" + "</div><br/>";
                }
                response += "<div class='res right'>" + msg.HF_ADDTIME + "<br/>" + msg.R_CONTENT + "</div><br/>";
            }
            else
            {
                    if (msg.TYPE == 2)
                    {
                        response += "<div class='res left'>" + msg.ADDTIME + "<br/>" + msg.S_CONTENT + "</div><br/>";
                    }
                    else if (msg.TYPE == 3)
                    {
                        response += "<div class='res left'>" + msg.ADDTIME + "<br/>" + "<img class='img' src='" + msg.S_CONTENT + "'/>" + "</div><br/>";
                    }
            }
        }
        if (res_lastid.Equals("")) {
            res_lastid = lastid;
        }
        //response = HttpUtility.UrlEncode(response);
        Response.Write("{\"last_id\":\""+res_lastid+"\",\"response\":\""+response+"\"}");
        
        //Response.Write("{openid:"+openid+",lastid:"+lastid+"}");
        
    }
}
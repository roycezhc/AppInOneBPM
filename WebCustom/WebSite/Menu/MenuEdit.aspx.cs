
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
using System.Data;
using System.Net;
using System.IO;
using System.Net.Json;
using System.Web.Script.Serialization;




public partial class WECAdmin_WebSite_Menu_MenuEdit : BaseAdminPage
{
    WEC_CUSTOM_MENU valObj = new WEC_CUSTOM_MENU();
    int count = 0;
    string keyid = "", pid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            if (Request["toEdit"] != null)
            {
                keyid = Request["id"];
            }
            else
            {
                //增加
                title = "增设部门";
                pid = Request["id"];
            }
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            WEC_REQUEST cond = new WEC_REQUEST();
            cond.AID = Convert.ToInt32(userBase2.Curraid);
            cond.af_WhereSQL = " and kind<>'-1'";
            txtMENU_KEY.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST.Attribute.TID, WEC_REQUEST.Attribute.TID, WEC_REQUEST.Attribute.KEYWORD, null, cond));                         
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MENU.Attribute.STATUS));
            txtMENU_TYPE.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MENU.Attribute.MENU_TYPE));
            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";

            try
            {

                if (keyid != "")
                {
                    valObj = BLLTable<WEC_CUSTOM_MENU>.GetRowData(WEC_CUSTOM_MENU.Attribute.ID, keyid);
                    if (valObj == null) return;


                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToString                

                    txtSORT_ID.Value = Convert.ToString(valObj.SORT_ID);//Convert.ToDecimal                

                    txtMENU_TYPE.Value = Convert.ToString(valObj.MENU_TYPE);//Convert.ToString

                    txtMENU_KEY.Value = Convert.ToString(valObj.MENU_KEY);//Convert.ToString 

                    txtURL.Value = Convert.ToString(valObj.URL);//Convert.ToString 

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtPID.Value = Convert.ToString(valObj.PID);//Convert.ToString                

                    txtMENU_NAME.Value = Convert.ToString(valObj.MENU_NAME);//Convert.ToString                

                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal

                    txtMENU_KEY.Value = Convert.ToString(valObj.MENU_KEY);//Convert.ToString                

                    txtMENU_TYPE.Value = Convert.ToString(valObj.MENU_TYPE);//Convert.ToString
                }
                else
                {
                    txtID.Value = GetNewMenuID(pid);
                    txtPID.Value = pid;
                    txtAID.Value = Convert.ToString(userBase2.Curraid);
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            WEC_CUSTOM_MENU valObj = new WEC_CUSTOM_MENU();


            if (txtID.Value != "")
                valObj.ID = Convert.ToString(txtID.Value);


            if (txtSORT_ID.Value != "")
                valObj.SORT_ID = Convert.ToDecimal(txtSORT_ID.Value);

            valObj.URL = Convert.ToString(txtURL.Value);

            if (txtSTATUS.Value != "")
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);


            if (txtPID.Value != "")
                valObj.PID = Convert.ToString(txtPID.Value);


            if (txtMENU_NAME.Value != "")
                valObj.MENU_NAME = Convert.ToString(txtMENU_NAME.Value);


            if (txtAID.Value != "")
                valObj.AID = Convert.ToDecimal(txtAID.Value);


            if (txtMENU_KEY.Value != "")
                valObj.MENU_KEY = Convert.ToString(txtMENU_KEY.Value);


            if (txtMENU_TYPE.Value != "")
                valObj.MENU_TYPE = Convert.ToString(txtMENU_TYPE.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToString(keyid);
                count = BLLTable<WEC_CUSTOM_MENU>.Update(valObj, WEC_CUSTOM_MENU.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_CUSTOM_MENU>.Insert(valObj);
                keyid = valObj.ID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else
                {
                    ViewState["sbData"] += "," + sbData.ToString();
                }

                btnSubmit_Click(null,null);

                Button btn = (Button)sender;
                if (btn.ID.IndexOf("_btnSave") != -1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "parent.reShowSubNodes();location.href='/OK.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "parent.reShowSubNodes();location.href='/OK.aspx';", true);
                    }
                }
                //else
                //{


                //    txtID.Value ="";


                //    txtSORT_ID.Value ="";


                //    txtURL.Value ="";


                //    txtSTATUS.Value ="";


                //    txtPID.Value ="";


                //    txtMENU_NAME.Value ="";


                //    txtAID.Value ="";
                //}
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string accesstoken = WeiXinUtil.Factory(this).getAccessToken();//HttpUtil.getAccessToken("wx69c300b3e390be5b", "3c06a3f6eb8a562b278583dff8b9da1c");
        string str = HttpUtil.HtmlFromUrl("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + accesstoken, "POST",userBase2.Curraid);

        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "console.log(" + str + ");", true);
    }

    public static string GetNewMenuID(string parentid)
    {
        if (parentid == "")
        {
            parentid = "0";
        }
        string code = "0";
        WEC_CUSTOM_MENU objCond = new WEC_CUSTOM_MENU();
        objCond.PID = parentid;
        object ooo = BLLTable<WEC_CUSTOM_MENU>.Max(WEC_CUSTOM_MENU.Attribute.ID, objCond);//010203
        string mcode = ooo == null ? "" : ooo.ToString();//010203
        if (mcode == null || mcode == "")
        {
            if (parentid == "0")
            {
                code = parentid + "1";
            }
            else
            {
                code = parentid + "01";
            }
        }
        else
        {

            string lasttwo = mcode.Substring(mcode.Length - 2);
            int ltwo = Convert.ToInt32(lasttwo, 16) + 1;
            string newlasttwo = Convert.ToString(ltwo, 16);
            if (newlasttwo.Length < 2)
            {
                newlasttwo = "0" + newlasttwo;
            }
            else if (newlasttwo.Length > 2)//编号后两位达到上限FF,只能遍历是否有空位
            {
                string prefore = mcode.Substring(0, mcode.Length - 2);
                objCond.OrderBy(WEC_CUSTOM_MENU.Attribute.ID, Order.Asc);

                DataTable dt = BLLTable<WEC_CUSTOM_MENU>.SelectForDataTable(new WEC_CUSTOM_MENU(), objCond);
                DataView dv = new DataView();
                dv.Table = dt;
                string aaa = "";
                newlasttwo = "";
                for (int i = 1; i <= 255; i++)
                {
                    aaa = Convert.ToString(i, 16);
                    if (aaa.Length < 2)
                    {
                        aaa = "0" + aaa;
                    }
                    dv.RowFilter = "DEPT_ID='" + prefore + aaa + "'";
                    if (dv.Count <= 0)//找到空位
                    {
                        newlasttwo = aaa;
                        break;
                    }
                }
            }
            if (newlasttwo != "")//号码没有用完
            {
                code = mcode.Substring(0, mcode.Length - 2) + newlasttwo;
            }
        }
        return code;
    }
  
}




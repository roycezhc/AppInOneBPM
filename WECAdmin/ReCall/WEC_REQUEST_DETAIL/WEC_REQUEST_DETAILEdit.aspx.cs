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
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;

public partial class WEC_REQUEST_DETAILEdit : BaseAdminPage
{

    WEC_REQUEST_DETAIL valObj =new WEC_REQUEST_DETAIL();
    int count = 0;
    public string keyid = "", tid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
        }
        if (!string.IsNullOrEmpty(Request["tid"]))
        {
            tid = Request["tid"];
        }
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {

            //WEC_REQUEST_DETAIL val = new WEC_REQUEST_DETAIL();
            //List<AttributeItem> lstCol = val.af_AttributeItemList;
            //foreach (AttributeItem aa in lstCol)
            //{
            //   string a = aa.ZhName ;
            //   BaseCtrlType b = aa.CtrlType();
            //   int c = aa.GetBlock();
            //}

            WEC_Article cond = new WEC_Article();
            cond.AID = Convert.ToInt32(userBase2.Curraid);
            selArticle.Items.AddRange(FormHelper.GetListItem(WEC_Article.Attribute.ID, WEC_Article.Attribute.ID, WEC_Article.Attribute.TITLE, null, cond));

            WEC_COLUMN condC = new WEC_COLUMN();
            condC.AID = Convert.ToInt32(userBase2.Curraid);
            condC.PID = "0";
            selColumn.Items.AddRange(FormHelper.GetListItem(WEC_COLUMN.Attribute.ID, WEC_COLUMN.Attribute.ID, WEC_COLUMN.Attribute.COLUMN_NAME, null, condC));

            WEC_ACTIVITY condA = new WEC_ACTIVITY();
            condA.AID = Convert.ToInt32(userBase2.Curraid);
            selActivity.Items.AddRange(FormHelper.GetListItem(WEC_ACTIVITY.Attribute.ID, WEC_ACTIVITY.Attribute.ID, WEC_ACTIVITY.Attribute.NAME, null, condA));
                               
            txtTYPE_ID.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST_DETAIL.Attribute.TYPE_ID));                          
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST_DETAIL.Attribute.STATUS));                                 
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_REQUEST_DETAIL>.GetRowData(WEC_REQUEST_DETAIL.Attribute.ID, keyid);
                    if (valObj == null) return;


                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                

                    txtTID.Value = Convert.ToString(valObj.TID);//Convert.ToDecimal                

                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                

                    txtUrl.Value = Convert.ToString(valObj.URL);

                    txtSORT_ID.Value = Convert.ToString(valObj.SORT_ID);//Convert.ToDecimal     

                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToDecimal     

                    txtPICURL.Src = valObj.PICURL;

                    txtTYPE_ID.Value = valObj.TYPE_ID.ToString();

                    if (txtTYPE_ID.Value.Equals("0"))
                    {
                        txtAddress.Value = Convert.ToString(valObj.TYPE_VALUE);
                    }
                    else if (txtTYPE_ID.Value.Equals("2"))
                    {
                        selColumn.Value = Convert.ToString(valObj.TYPE_VALUE);
                    }
                    else if (txtTYPE_ID.Value.Equals("3"))
                    {
                        selArticle.Value = Convert.ToString(valObj.TYPE_VALUE);
                    }
                    else if (txtTYPE_ID.Value.Equals("4"))
                    {
                        selActivity.Value = Convert.ToString(valObj.TYPE_VALUE);
                    }

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");

                    txtDESCRIPTION.Value = Convert.ToString(valObj.DESCRIPTION);
                }
                else
                {
                    txtTID.Value = tid;//Convert.ToDecimal    
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
            //string fileName = ModuleHelper.UploadFilePic(fileUp, WebHelper.GetAppPath() + "UploadFiles/Request/" + userBase.UserID + "/", true, false);

            ////没有上传图片
            //if (string.IsNullOrEmpty(fileName))
            //{
            //    //是默认图片
            //    if (imgBanner.Src.Equals(WebHelper.GetAppPath() + "Lib/Preview_Plug/yulan.png"))
            //    {
            //        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "alert('请选择图片')", true);
            //        return;
            //    }
            //    //为上次上传图片
            //    else
            //    {
            //        fileName = imgBanner.Src;
            //    }
            //}
            ////上传图片
            //else
            //{
            //    fileName = WebHelper.GetAppPath() + "UploadFiles/Request/" + userBase.UserID + "/" + fileName;
            //}

            WEC_REQUEST_DETAIL valObj = new WEC_REQUEST_DETAIL();


            if (txtID.Value != "")
                valObj.ID = Convert.ToDecimal(txtID.Value);


            if (txtTID.Value != "")
                valObj.TID = Convert.ToDecimal(txtTID.Value);


            if (txtTITLE.Value != "")
                valObj.TITLE = Convert.ToString(txtTITLE.Value);


            if (txtSORT_ID.Value != "")
                valObj.SORT_ID = Convert.ToDecimal(txtSORT_ID.Value);

            if (txtNOTE.Value != "")
                valObj.NOTE  = Convert.ToString(txtNOTE.Value);

            valObj.PICURL = hidPICURL.Value;

            valObj.TYPE_ID = Convert.ToString(txtTYPE_ID.Value);

            if (txtTYPE_ID.Value.Equals("0"))
            {
                valObj.TYPE_VALUE = Convert.ToString(txtAddress.Value);
                valObj.URL = Convert.ToString(txtAddress.Value);
            }
            else if (txtTYPE_ID.Value.Equals("1"))
            {
                valObj.URL = WebHelper.GetAppUrl() + "WECWebsite/home.aspx?aid=" + userBase2.Curraid;
            }
            else if (txtTYPE_ID.Value.Equals("2"))
            {
                valObj.TYPE_VALUE = Convert.ToString(selColumn.Value);
                valObj.URL = WebHelper.GetAppUrl() + "WECWebsite/list.aspx?aid=" + userBase2.Curraid + "&id=" + selColumn.Value;
            }
            else if (txtTYPE_ID.Value.Equals("3"))
            {
                valObj.TYPE_VALUE = Convert.ToString(selArticle.Value);
                valObj.URL = WebHelper.GetAppUrl() + "WECWebsite/detail.aspx?aid=" + userBase2.Curraid + "&id=" + selArticle.Value;
            }
            else if (txtTYPE_ID.Value.Equals("4"))
            {
                valObj.TYPE_VALUE = Convert.ToString(selActivity.Value);
                //valObj.URL = WebHelper.GetAppPath() + "WECWebsite/detail.aspx?aid=" + userBase2.Curraid + "&id=" + selArticle.Value;
            }

            if (txtSTATUS.Value != "")
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);


            if (txtADDTIME.Value != "")
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);

            if (txtDESCRIPTION.Value != "")
                valObj.DESCRIPTION = Convert.ToString(txtDESCRIPTION.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_REQUEST_DETAIL>.Update(valObj, WEC_REQUEST_DETAIL.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_REQUEST_DETAIL>.Insert(valObj, WEC_REQUEST_DETAIL.Attribute.ID);
                keyid = valObj.ID.ToString();

            }

            if (txtTYPE_ID.Value.Equals(""))
            {
                WEC_REQUEST_DETAIL valObj1 = new WEC_REQUEST_DETAIL();
                valObj1.ID = valObj.ID;
                valObj1.URL = WebHelper.GetAppUrl() + "WECWebsite/detail/default.aspx?aid=" + userBase2.Curraid + "&id=" + valObj1.ID;
                count = BLLTable<WEC_REQUEST_DETAIL>.Update(valObj1, WEC_REQUEST_DETAIL.Attribute.ID);
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
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK") != -1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {


                    txtID.Value = "";


                    txtTID.Value = "";


                    txtTITLE.Value = "";


                    txtSORT_ID.Value = "";


                    txtTYPE_ID.Value = "";


                    txtSTATUS.Value = "";


                    txtADDTIME.Value = "";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

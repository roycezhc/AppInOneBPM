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
using AgileFrame.AppInOne.WF;
public partial class WF_INFOEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    WF_INFO valObj =new WF_INFO();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "编辑";
        this.Title = title;
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            keyid = Request["WFID"];
        }
        if (!IsPostBack)
        {
        
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.STATUS));             
            txtUSE_LIMIT.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.USE_LIMIT));

            this.txtWFCID.Disabled = true;
            this.txtWFCID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {

                    valObj = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, keyid);
                    if (valObj == null) return;

                    //TF_FORM formobj = BLLTable<TF_FORM>.Factory(conn).GetRowData(TF_FORM.Attribute.FORM_ID, valObj.FORM_ID);
                    //if (formobj != null)
                    //{
                    //    //txtFORM_ID.Value = formobj.F_NAME;
                    //    //hidFORM_ID.Value = formobj.FORM_ID.ToString();
                    //    //btnSel.Visible = false;

                    //    //TF_TABLE tbobj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, formobj.TB_ID);
                    //    //if (tbobj != null)
                    //    //{
                    //    if (string.IsNullOrEmpty(valObj.FORM_TB))
                    //    {
                    //        litWarn.Text = "流程临时表未创建！";
                    //        li_NewWFTB.Visible = true;
                    //        btnOK.Enabled = false;
                    //    }
                    //    //}
                    //}
                    txtWFCID.Value = Convert.ToString(valObj.WFID);//Convert.ToInt32                

                    txtWFCNAME.Value = Convert.ToString(valObj.WFCNAME);//Convert.ToString                

                    txtSTATUS.Value = valObj.STATUS.ToString();

                    txtUSE_LIMIT.Value = valObj.USE_LIMIT.ToString();

                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString


                    WF_TYPE tpObj = BLLTable<WF_TYPE>.Factory(conn).GetRowData(WF_TYPE.Attribute.TYPE_ID, valObj.TYPE_ID);
                    if (tpObj != null)
                    {
                        txtTYPE_ID.Value = tpObj.TYPE_NAME;
                        hidTYPE_ID.Value = tpObj.TYPE_ID.ToString();

                       
                    }
                   
                    //txtFORM_ID.Disabled = true;
                }
                else {
                    if (txtSTATUS.Items.Count > 1) {
                        txtSTATUS.SelectedIndex = 1;
                    }
                    if (txtUSE_LIMIT.Items.Count > 1)
                    {
                        txtUSE_LIMIT.SelectedIndex = 1;//AgileFrame.Core.
                    }
                    dlStatus.Visible = false;
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnNewWFTB_Click(object sender, EventArgs e)
    {

        int re = 1;// WFCOMMON_DAL.CreateWFTByForm(int.Parse(txtWFCID.Value), int.Parse(hidFORM_ID.Value));
          if (re > 0) {
              litWarn.Text = "创建临时表成功！";
              li_NewWFTB.Visible = false;

              btnOK.Enabled = true;
          }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //if (hidFORM_ID.Value.Trim() == "")
        //{
        //    litWarn.Text = "请选择对应的表单"; //AgileFrame.Core.ScriptHelper.Alert(Page, "请选择对应的表单！");
        //    return;
        //}
        //else {
        //    TF_F_COLUMN ccc = new TF_F_COLUMN();
        //    ccc.FORM_ID = int.Parse(hidFORM_ID.Value);
        //    if (BLLTable<TF_F_COLUMN>.Count(ccc) <= 0)
        //    {
        //        litWarn.Text = "您选择的表单还未配置栏目字段！请先配置栏目。"; //AgileFrame.Core.ScriptHelper.Alert(Page, "请选择对应的表单！");
        //        return;
        //    }
        //}
        try
        {
            WF_INFO valObj = new WF_INFO();
            
            
            if(txtWFCID.Value !="" )
                valObj.WFID = Convert.ToInt32(txtWFCID.Value);
            
            
            if(txtWFCNAME.Value !="" )
                valObj.WFCNAME = Convert.ToString(txtWFCNAME.Value);

            if(txtUSE_LIMIT.Value !="" )
                valObj.USE_LIMIT = Convert.ToString(txtUSE_LIMIT.Value);
            

            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);

            valObj.FORM_ID = 0;// int.Parse(hidFORM_ID.Value);

            valObj.EDITIME = DateTime.Now;
            valObj.TYPE_ID = 1;
            if (!string.IsNullOrEmpty(hidTYPE_ID.Value))
            {
                valObj.TYPE_ID = int.Parse(hidTYPE_ID.Value);
            }
            if (keyid != "")
            {
                if (txtSTATUS.Value != "")
                    valObj.STATUS = Convert.ToString(txtSTATUS.Value);
                valObj.WFID = Convert.ToInt32(keyid);
                count = BLLTable<WF_INFO>.Factory(conn).Update(valObj, WF_INFO.Attribute.WFID);
                keyid = valObj.WFID.ToString();


                //更改流程表单关系表状态
                WF_WFOBJECT objwf = new WF_WFOBJECT();
                if (txtSTATUS.Value != "")
                    objwf.STATUS = Convert.ToInt32(txtSTATUS.Value);
                objwf.WFID_SRC = valObj.WFID;

                int intRet = BLLTable<WF_WFOBJECT>.Factory(conn).Update(objwf, WF_WFOBJECT.Attribute.WFID_SRC);
               
            }
            else
            {
                valObj.FILE_TB = "";
                valObj.FILE_TBDETAIL = "";
                valObj.FORM_TB = "";
                valObj.FORM_TBDETAIL = "";

                valObj.STATUS = "0";
                valObj.ADDTIME = DateTime.Now;


                count = BLLTable<WF_INFO>.Factory(conn).Insert(valObj, WF_INFO.Attribute.WFID);
                keyid = valObj.WFID.ToString();

                if (count > 0)
                {
                    WF_PROCESS_TPL procObj = new WF_PROCESS_TPL();
                    procObj.WFID = valObj.WFID;
                    procObj.PROC_NAME = valObj.WFCNAME + "默认过程";
                    procObj.STATUS = "1";// Convert.ToString(txtSTATUS.Value);
                    procObj.CONDITION = "";
                    procObj.FORMULAR = "";
                    procObj.NOTE = "";
                    procObj.EDITIME = DateTime.Now;
                    procObj.PROCID = Convert.ToInt32(keyid);
                    procObj.GUID = "P" + DateTime.Now.ToString("yyyyMMddHHmmss");
                    procObj.ADDTIME = DateTime.Now;
                    count = BLLTable<WF_PROCESS_TPL>.Factory(conn).Insert(procObj, WF_PROCESS_TPL.Attribute.PROCID);

                    //WFCOMMON_DAL.CreateWFTByForm(valObj.WFID, valObj.FORM_ID);//创建流程相关表，修改流程基本信息中与数据表相关的字段

                }
            }
            if (count > 0)
            {

                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK") != -1)
                {

                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.location.reload();}window.close();", true);
                }
                else
                {

                    txtWFCNAME.Value = "";

                    txtSTATUS.Value = "";

                    txtUSE_LIMIT.Value = "";

                    txtNOTE.Value = "";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}

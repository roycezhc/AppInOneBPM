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

public partial class WEC_HELPEREdit : BaseAdminPage
{
    WEC_HELPER valObj =new WEC_HELPER();
    int count = 0;
    string keyid = "";
    protected string title = "";
    string pid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

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
        if (!string.IsNullOrEmpty(Request["record"]))
        {
            keyid = Request["record"];
        }
        if (!IsPostBack)
        {
                                      
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_HELPER.Attribute.STATUS));                                 
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtID.Value = GetNewMenuID(pid);
            this.txtPID.Value = pid;
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_HELPER>.Factory(conn).GetRowData(WEC_HELPER.Attribute.ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToString                
                    
                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtHELPCONTEN.Value = Convert.ToString(valObj.HELPCONTEN);//Convert.ToString                
                    
                    txtKEYVALUE.Value = Convert.ToString(valObj.KEYVALUE);//Convert.ToString                
                    
                    txtPID.Value = Convert.ToString(valObj.PID);//Convert.ToString                
                    
                    txtSORT_ID.Value = Convert.ToString(valObj.SORT_ID);//Convert.ToInt32
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
            WEC_HELPER valObj = new WEC_HELPER();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToString(txtID.Value);
            
            
            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtHELPCONTEN.Value !="" )
                valObj.HELPCONTEN = Convert.ToString(txtHELPCONTEN.Value);
            
            
            if(txtKEYVALUE.Value !="" )
                valObj.KEYVALUE = Convert.ToString(txtKEYVALUE.Value);


            if (txtPID.Value != "")
                valObj.PID = Convert.ToString(txtPID.Value);
            
            
            if(txtSORT_ID.Value !="" )
                valObj.SORT_ID = Convert.ToInt32(txtSORT_ID.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToString(keyid);
                count = BLLTable<WEC_HELPER>.Factory(conn).Update(valObj, WEC_HELPER.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_HELPER>.Factory(conn).Insert(valObj);
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
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
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


                    txtID.Value = GetNewMenuID(pid);
                    
                    
                    txtTITLE.Value ="";
                    
                    
                    txtSTATUS.Value ="";


                    txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");
                    
                    
                    txtHELPCONTEN.Value ="";
                    
                    
                    txtKEYVALUE.Value ="";
                    
                    
                    txtPID.Value =pid;
                    
                    
                    txtSORT_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    public static string GetNewMenuID(string parentid)
    {
        if (parentid == "")
        {
            parentid = "0";
        }
        string code = "0";
        WEC_HELPER objCond = new WEC_HELPER();
        objCond.PID = parentid;
        object ooo = BLLTable<WEC_HELPER>.Max(WEC_HELPER.Attribute.ID, objCond);//010203
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
                objCond.OrderBy(WEC_HELPER.Attribute.ID, Order.Asc);

                DataTable dt = BLLTable<WEC_HELPER>.SelectForDataTable(new WEC_HELPER(), objCond);
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

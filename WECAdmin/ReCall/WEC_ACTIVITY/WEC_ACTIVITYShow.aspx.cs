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

public partial class WEC_ACTIVITYShow : System.Web.UI.Page
{
    WEC_ACTIVITY valObj=new WEC_ACTIVITY();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["ID"]))
                {

                    valObj = BLLTable<WEC_ACTIVITY>.GetRowData(WEC_ACTIVITY.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtKEYWORD.Text = Convert.ToString(valObj.KEYWORD);//Convert.ToString
                    
                    
                    txtINSTRUCTION.Text = Convert.ToString(valObj.INSTRUCTION);//Convert.ToString
                    
                    
                    txtTIME.Text = Convert.ToString(valObj.TIME);//Convert.ToString
                    
                    
                    txtSTART_PICURL.Text = Convert.ToString(valObj.START_PICURL);//Convert.ToString
                    
                    
                    txtWIN_PICURL.Text = Convert.ToString(valObj.WIN_PICURL);//Convert.ToString
                    
                    
                    txtOUT_PICURL.Text = Convert.ToString(valObj.OUT_PICURL);//Convert.ToString
                    
                    
                    txtEND_THEME.Text = Convert.ToString(valObj.END_THEME);//Convert.ToString
                    
                    
                    txtEND_PICURL.Text = Convert.ToString(valObj.END_PICURL);//Convert.ToString
                    
                    
                    txtTYPE_ONE.Text = Convert.ToString(valObj.TYPE_ONE);//Convert.ToString
                    
                    
                    txtPIC_ONE.Text = Convert.ToString(valObj.PIC_ONE);//Convert.ToString
                    
                    
                    txtNAME_ONE.Text = Convert.ToString(valObj.NAME_ONE);//Convert.ToString
                    
                    
                    txtNUM_ONE.Text = Convert.ToString(valObj.NUM_ONE);//Convert.ToInt32
                    
                    
                    txtTYPE_TWO.Text = Convert.ToString(valObj.TYPE_TWO);//Convert.ToString
                    
                    
                    txtPIC_TWO.Text = Convert.ToString(valObj.PIC_TWO);//Convert.ToString
                    
                    
                    txtNAME_TWO.Text = Convert.ToString(valObj.NAME_TWO);//Convert.ToString
                    
                    
                    txtNUM_TWO.Text = Convert.ToString(valObj.NUM_TWO);//Convert.ToInt32
                    
                    
                    txtTYPE_THREE.Text = Convert.ToString(valObj.TYPE_THREE);//Convert.ToString
                    
                    
                    txtPIC_THREE.Text = Convert.ToString(valObj.PIC_THREE);//Convert.ToString
                    
                    
                    txtNAME_THREE.Text = Convert.ToString(valObj.NAME_THREE);//Convert.ToString
                    
                    
                    txtNUM_THREE.Text = Convert.ToString(valObj.NUM_THREE);//Convert.ToInt32
                    
                    
                    txtTYPE_FOUR.Text = Convert.ToString(valObj.TYPE_FOUR);//Convert.ToString
                    
                    
                    txtPIC_FOUR.Text = Convert.ToString(valObj.PIC_FOUR);//Convert.ToString
                    
                    
                    txtNAME_FOUR.Text = Convert.ToString(valObj.NAME_FOUR);//Convert.ToString
                    
                    
                    txtNUM_FOUR.Text = Convert.ToString(valObj.NUM_FOUR);//Convert.ToInt32
                    
                    
                    txtTYPE_FIVE.Text = Convert.ToString(valObj.TYPE_FIVE);//Convert.ToString
                    
                    
                    txtPIC_FIVE.Text = Convert.ToString(valObj.PIC_FIVE);//Convert.ToString
                    
                    
                    txtNAME_FIVE.Text = Convert.ToString(valObj.NAME_FIVE);//Convert.ToString
                    
                    
                    txtNUM_FIVE.Text = Convert.ToString(valObj.NUM_FIVE);//Convert.ToInt32
                    
                    
                    txtTYPE_SIX.Text = Convert.ToString(valObj.TYPE_SIX);//Convert.ToString
                    
                    
                    txtPIC_SIX.Text = Convert.ToString(valObj.PIC_SIX);//Convert.ToString
                    
                    
                    txtNAME_SIX.Text = Convert.ToString(valObj.NAME_SIX);//Convert.ToString
                    
                    
                    txtNUM_SIX.Text = Convert.ToString(valObj.NUM_SIX);//Convert.ToInt32
                    
                    
                    txtCONFIRM_PWD.Text = Convert.ToString(valObj.CONFIRM_PWD);//Convert.ToString
                    
                    
                    txtSN_RENAME.Text = Convert.ToString(valObj.SN_RENAME);//Convert.ToString
                    
                    
                    txtTEL_RENAME.Text = Convert.ToString(valObj.TEL_RENAME);//Convert.ToString
                    
                    
                    txtSHOW_NUM.Text = Convert.ToString(valObj.SHOW_NUM);//Convert.ToInt32
                    
                    
                    txtSN_CODE.Text = Convert.ToString(valObj.SN_CODE);//Convert.ToInt32
                    
                    
                    txtNAME.Text = Convert.ToString(valObj.NAME);//Convert.ToString
                    
                    
                    txtCONTENT.Text = Convert.ToString(valObj.CONTENT);//Convert.ToString
                    
                    
                    txtINFO.Text = Convert.ToString(valObj.INFO);//Convert.ToString
                    
                    
                    txtUSE_INSTRUCTION.Text = Convert.ToString(valObj.USE_INSTRUCTION);//Convert.ToString
                    
                    
                    txtEND_INSTRUCTION.Text = Convert.ToString(valObj.END_INSTRUCTION);//Convert.ToString
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");
                    
                    
                    txtFOR_PEOPLE.Text = Convert.ToString(valObj.FOR_PEOPLE);//Convert.ToInt32
                    
                    
                    txtPROBABILITY.Text = Convert.ToString(valObj.PROBABILITY);//Convert.ToString
                    
                    
                    txtNUMBER_TIMES.Text = Convert.ToString(valObj.NUMBER_TIMES);//Convert.ToInt32
                    
                    
                    txtMOST_NUM_TIMES.Text = Convert.ToString(valObj.MOST_NUM_TIMES);//Convert.ToInt32
                    
                    
                    txtKIND.Text=valObj.KIND.ToString();
                    
                    
                    txtINFORMATION.Text = Convert.ToString(valObj.INFORMATION);//Convert.ToString
                    
                    
                    txtWIN_INFO.Text = Convert.ToString(valObj.WIN_INFO);//Convert.ToString
                    
                    
                    txtNO_WIN_INFO.Text = Convert.ToString(valObj.NO_WIN_INFO);//Convert.ToString
                    
                    
                    txtSHOW_WIN_USRE.Text = Convert.ToString(valObj.SHOW_WIN_USRE);//Convert.ToInt32
                    
                    
                    txtPLAY_AUDIO.Text = Convert.ToString(valObj.PLAY_AUDIO);//Convert.ToInt32
                    
                    
                    txtMP3_URL.Text = Convert.ToString(valObj.MP3_URL);//Convert.ToString
                    
                    
                    txtRULES.Text = Convert.ToString(valObj.RULES);//Convert.ToString
                    
                    
                    txtSYSTEM_SCORE.Text = Convert.ToString(valObj.SYSTEM_SCORE);//Convert.ToInt32
                    
                    
                    txtCUSTOM_SCORE.Text = Convert.ToString(valObj.CUSTOM_SCORE);//Convert.ToInt32

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

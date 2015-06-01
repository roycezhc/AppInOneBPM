using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class SystemManage_PermissionPwd_PowerBtnUp : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["UpPageCols"] != null)
        {
            string[] cols = StringHelperExd.GetStringArray(Request["UpPageCols"], ',');
            string[] names = StringHelperExd.GetStringArray(Microsoft.JScript.GlobalObject.unescape(Request["colnames"]), ',');
            string pageurl = Request["PageUrl"];//hr/manage.aspx?dptid=1


            if (!string.IsNullOrEmpty(pageurl))
            {
                SYS_MODULE mdl = new ModuleHelper(conn).GetModuleByPageUrl(pageurl.ToLower());
                if (mdl != null)
                {
                    pageurl = mdl.PAGE_URL;
                    List<SYS_PAGE_TBFIND_COLS> lst = BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Select(SYS_PAGE_TBFIND_COLS.Attribute.PAGE_URL, pageurl);
                    Dictionary<string, string> dic = new Dictionary<string, string>();
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (!dic.ContainsKey(lst[i].COL_NAME))
                            {
                                dic.Add(lst[i].COL_NAME, lst[i].TB_SHOW + "," + lst[i].FIND_SHOW);
                            }
                        }
                    }
                    BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Delete(SYS_PAGE_TBFIND_COLS.Attribute.PAGE_URL, pageurl);

                    SYS_PAGE_TBFIND_COLS valObj = new SYS_PAGE_TBFIND_COLS();
                    int colNameNullCount = 0;
                    for (int i = 0; i < cols.Length; i++)
                    {
                        valObj.PAGE_URL = pageurl;
                        valObj.FOR_TYPE = 0;//
                        valObj.COL_NAME = cols[i].Replace("[", "").Replace("]", "");
                        valObj.SHOW_NAME = names[i];
                        if (string.IsNullOrEmpty(valObj.COL_NAME.Trim()))
                        {
                            colNameNullCount++;
                            continue;
                        }
                        else if (string.IsNullOrEmpty(valObj.SHOW_NAME.Trim()))
                        {
                            colNameNullCount++;
                            continue;
                        }
                        valObj.TB_SHOW = 1;//
                        valObj.FIND_SHOW = 1;//
                        if (dic.ContainsKey(cols[i]))
                        {
                            string[] aaa = dic[cols[i]].Split(',');
                            valObj.TB_SHOW = decimal.Parse(aaa[0]);//
                            valObj.FIND_SHOW = decimal.Parse(aaa[1]);//
                        }
                        BLLTable<SYS_PAGE_TBFIND_COLS>.Factory(conn).Insert(valObj, SYS_PAGE_TBFIND_COLS.Attribute.P_COLID);
                    }
                    Response.Write("上传成功！" + (colNameNullCount > 0 ? ("发现列名为空字段：" + colNameNullCount + "个！") : ""));
                }
                else {
                    Response.Write("获取不到对应模块！");
                }
                
            }
            else {
                Response.Write("缺少页面参数值！");
            }
           
        }
        else
        {
            string btnType = Request["btnType"];
            string dicCode = Request["dicCode"];
            string btnName = Request["btnName"];
            string pageDir = Request["pageDir"].ToLower();//hr/manage.aspx?dptid=1
            SYS_MODULE mdl = new ModuleHelper(conn).GetModuleByPageUrl(pageDir);
            if (mdl != null)
            {
                pageDir = mdl.PAGE_URL;
                SYS_MDLPOWER_DIC valObj = new SYS_MDLPOWER_DIC();
                SYS_MDLPOWER_DIC condDic = new SYS_MDLPOWER_DIC();
                condDic.PAGE_URL = pageDir;
                condDic.DIC_NAME = btnName;
                condDic.DIC_CODE = dicCode;

                valObj.PAGE_URL = pageDir;
                valObj.DIC_NAME = btnName;
                valObj.CTRL_TYPE = btnType;
                valObj.DIC_CODE = dicCode;
                valObj.DEAL_TYPE = EnumInfo.OprCtrlDealType.Disabled.ToString("d");
                int re = 0;
                if (BLLTable<SYS_MDLPOWER_DIC>.Exists(condDic))
                {
                    re = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Update(valObj, condDic);
                }
                else
                {
                    re = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Insert(valObj, SYS_MDLPOWER_DIC.Attribute.DIC_ID);
                }

                Response.Write(re.ToString());
            }
            else {
                Response.Write("0");
            }
        }
        Response.End();

    }
}
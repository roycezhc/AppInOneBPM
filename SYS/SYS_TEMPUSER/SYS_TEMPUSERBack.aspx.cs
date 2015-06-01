using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.Core;
using System.Text;
using System.Net;
using System.IO;

public partial class SYS_TEMPUSERBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在列表里点击删除按钮，通过AJAX执行这里的后台代码，删除一条记录
        if (Request["DelID"] != null)
        {
            int re = BLLTable<SYS_TEMPUSER>.Delete(SYS_TEMPUSER.Attribute.ID, Request["DelID"]);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在列表顶部点击删除按钮，通过AJAX执行这里的后台代码，删除多条记录
        if (Request["DelKeyIDS"] != null)
        {
            SYS_TEMPUSER cond = new SYS_TEMPUSER();
            cond.In(SYS_TEMPUSER.Attribute.ID, Request["DelKeyIDS"]);
            int re = BLLTable<SYS_TEMPUSER>.Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//可以输出数字 大于0 表示操作成功，也可以直接输出 字符串，客户端将弹出此字符串信息作为提示
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        //在用户详细信息查看编辑页面，点保存时，通过AJAX执行这里的后台代码，实现部门字段的更新
        if (Request["saveInfo"] != null)
        {
            SYS_TEMPUSER val = new SYS_TEMPUSER();
            val.ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName]))
                {
                    val.SetValue(lstCol[i].FieldName, Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<SYS_TEMPUSER>.Update(val, SYS_TEMPUSER.Attribute.ID);
            Response.Write("修改用户信息成功");

        }

        if (!IsPostBack)
        {
            string strRet = "";
            //获取操作类型
            switch (Common.GetReqStrValue("action"))
            {
                //获取验证码
                case "GetCheckNum":
                    strRet = GetCheckNum();
                    break;
                //获取验证码
                case "Add":
                    strRet = InsertUser();
                    break;
                default:
                    strRet = "";
                    break;
            }

            Response.Write(strRet);
        }



        Response.End();
    }
    private string InsertUser()
    {
        string loginname = Common.GetReqStrValue("loginname");
        string pwd = Common.GetReqStrValue("pwd");
        string name = Common.GetReqStrValue("name");
        string coname = Common.GetReqStrValue("coname");
        string phone = Common.GetReqStrValue("phone");
        int checknum = Common.GetReqIntValue("checknum");
        string email = Common.GetReqStrValue("email");


        if (Common.GetReqStrValue("hidFlag").Equals("0"))
        {
            SYS_CHECKNUM condobj = new SYS_CHECKNUM();
            condobj.CHECKNUM = checknum;
            condobj.PHONE = phone;
            if (!BLLTable<SYS_CHECKNUM>.Exists(condobj))
            {
                return "-1";
            }
        }

        SYS_TEMPUSER objval = new SYS_TEMPUSER();
        objval.NAME = loginname;
        SYS_USER objvalUser = new SYS_USER();
        objvalUser.USER_NAME = loginname;
        if (BLLTable<SYS_TEMPUSER>.Exists(objval) || BLLTable<SYS_USER>.Exists(objvalUser))
        {
            return "-2";
        }

       //事务处理
        using (Transaction t = new Transaction("conn"))
        {
            objvalUser = new SYS_USER();
            objvalUser.USER_NAME = loginname;
            objvalUser.PASS = StringHelperExd.StringToMD5(pwd);
            objvalUser.USER_TYPE = "4";
            objvalUser.REAL_NAME = name;
            objvalUser.STAFF_ID = 21;

            int intRet = BLLTable<SYS_USER>.Factory(t).Insert(objvalUser, SYS_USER.Attribute.USER_ID);
            if (intRet == -1)
            {
                t.RollBack();
            }

            string sql = "  insert into SYS_USER_MDLPOWER_DIC select " + objvalUser.USER_ID + ",PAGE_URL,DIC_ID from SYS_USER_MDLPOWER_DIC where user_id =1";

            intRet = BLLTable<SYS_USER>.Factory(t).ExecSQL(sql, System.Data.CommandType.Text);
            if (intRet == -1)
            {
                t.RollBack();
            }

            objval = new SYS_TEMPUSER();
            objval.LOGINNAME = loginname;
            objval.PWD = pwd;
            objval.NAME = name;
            objval.CONAME = coname;
            objval.PHONE = phone;
            objval.IP = GetIP();
            objval.USER_ID = objvalUser.USER_ID;
            objval.EMAIL = email;

            intRet = BLLTable<SYS_TEMPUSER>.Factory(t).Insert(objval, SYS_TEMPUSER.Attribute.ID);
            if (intRet == -1)
            {
                t.RollBack();
            }

            intRet = BLLTable<SYS_CHECKNUM>.Factory(t).Delete(SYS_CHECKNUM.Attribute.PHONE, phone);
            if (intRet == -1)
            {
                t.RollBack();
            }

            t.Commit();
        }

        return "0";
    }
    public static string GetIP()
    {
        string result = "";
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }

        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.UserHostAddress != null)
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
        }
        return result;
    }

    private string GetCheckNum()
    {
        string tel = Common.GetReqStrValue("Mobile");
        bool boolLoop = true;
        int checkNum = 0;
        DateTime dat = DateTime.Now;

        //判断是否重复获取
        SYS_CHECKNUM objval = new SYS_CHECKNUM();
        SYS_CHECKNUM condobj = new SYS_CHECKNUM();
        condobj.PHONE = tel;
        condobj.Where(" datediff(s,ADDTIME , '" + dat + "')<=60");

        List<SYS_CHECKNUM> lst = BLLTable<SYS_CHECKNUM>.Select(objval, condobj);

        if (lst.Count > 0)
        {
            return Convert.ToString(60 - Convert.ToInt32((dat - lst[0].ADDTIME).TotalSeconds) + 1);
        }

        //删除记录
        int intRet = BLLTable<SYS_CHECKNUM>.Delete(SYS_CHECKNUM.Attribute.PHONE, tel);

        //获取验证码
        if (intRet != -1)
        {
            while (boolLoop)
            {
                checkNum = new Random().Next(1000, 10000);
                condobj = new SYS_CHECKNUM();
                condobj.CHECKNUM = checkNum;
                if (!BLLTable<SYS_CHECKNUM>.Exists(condobj))
                {
                    boolLoop = false;
                }
            }
        }

        //事务处理
        using (Transaction t = new Transaction("conn"))
        {
            try
            {
                //插入记录
                objval = new SYS_CHECKNUM();
                objval.CHECKNUM = checkNum;
                objval.PHONE = tel;

                intRet = BLLTable<SYS_CHECKNUM>.Factory(t).Insert(objval, SYS_CHECKNUM.Attribute.Id);

                if (intRet > 0)
                {
                    //下发验证码
                    string result = PostHtmlFromUrl("http://183.247.151.178:2090/appinone/Interface/SendSMS.aspx", "tel=" + tel + "&msg=" + checkNum + "是您的短信验证码，请在30分钟内验证。[AppInOne专业管理软件 平台短信]");

                    if (result.Equals("0"))
                    {
                        t.Commit();
                    }
                    else
                    {
                        t.RollBack();
                        return result;
                    }
                }

            }
            catch (Exception ex)
            {
                return "-101";
            }
        }

        return "-100";

    }

    /// <summary>
    /// 接受请求的网站是UTF-8编码，Http Post请求参数也需要用UTF-8编码
    /// HttpUtility.UrlEncode(merId, myEncoding)
    /// </summary>
    /// <param name="url">访问地址，不带参数</param>
    /// <param name="para">参数字符串</param>
    /// <returns></returns>
    public static string PostHtmlFromUrl(string url, string postData)
    {
        String sResult = "";
        try
        {
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = encoding.GetBytes(postData);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded;charset=UTF-8";
            request.ContentLength = postData.Length;
            Stream stream = request.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string content = reader.ReadToEnd();
            return content;

        }
        catch (Exception e)
        {
            sResult = "-101";
            return sResult;

        }
    }
}
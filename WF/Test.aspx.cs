using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Web.Script.Serialization;
public interface IAccount
{
    decimal Balance { get; }
    string Name { get; }
}
public delegate TSummary Action<TInput, TSummary>(TInput t, TSummary u);
public class Account : IAccount
{
    decimal _Balance = 0;
    string _Name = "";
    public decimal Balance
    {
        get {
            return _Balance;
        }
    }
    public string Name
    {
        get
        {
            return _Name;
        }
    }
    public Account(string name, decimal balance)
    {
        _Name = name;
        _Balance = balance;
    }

    public static decimal Accumulate<TAccount>(IEnumerable<TAccount> cols) where TAccount : IAccount
    {
        decimal sum =0;
        foreach (TAccount a in cols)
        {
            sum += a.Balance;
        }
        return sum;
    }

    public static TSummary Accumulate<TInput, TSummary>(IEnumerable<TInput> cols, Action<TInput, TSummary> action)
    {
        TSummary sum = default(TSummary);
        foreach (TInput a in cols)
        {
            sum = action(a, sum);
        }
        return sum;
    }
}

public partial class WF_Test : AgileFrame.AppInOne.Common.BasePage
{
    //public delegate TSummary Action<TInput, TSummary>(TInput t, TSummary u);

    //public static TSummary Accumulate<TInput, TSummary>(IEnumerable<TInput> cols, Action<TInput, TSummary> action)
    //{
    //    TSummary sum = default(TSummary);
    //    foreach (TInput input in cols)
    //    {
    //        sum = action(input, sum);
    //    }
    //    return sum;
    //}

    static decimal AccountAdder(Account a, decimal d)
    {
        return a.Balance + d;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //string data = "{\"content\":\"jsjsksalsmf\",\"toId\":\"56031\",\"fromId\":\"54117\",\"deviceId\":\"android-dummy\"}";
        //JavaScriptSerializer s=new JavaScriptSerializer();
        //Dictionary<string, string> d = s.Deserialize<Dictionary<string, string>>(data);
        if (!IsPostBack)
        {
            //List<Account> acounts = new List<Account>();
            //acounts.Add(new Account("aaa", 111));
            //acounts.Add(new Account("bbb", 222));
            //acounts.Add(new Account("ccc", 333));
            //decimal amount = Account.Accumulate<Account>(acounts);
            //Response.Write(amount+"<br/>");

            //decimal amount1 = Account.Accumulate<Account, decimal>(acounts, delegate(Account a, decimal d)
            //{
            //    return a.Balance + d;
            //});
            //Response.Write(amount1 + "<br/>");


            //decimal amount2 = Account.Accumulate<Account, decimal>(acounts, (a, b) => a.Balance + b);
            //Response.Write(amount2 + "<br/>");

            //decimal amount3 = Account.Accumulate<Account, decimal>(acounts, AccountAdder);
            //Response.Write(amount3 + "<br/>");


            //WF_INFO cond = new WF_INFO();
            //cond.STATUS = "1";
            //List<WF_INFO> lst = BLLTable<WF_INFO>.Factory(conn).Select(new WF_INFO(), cond);
            //for (int i = 0; i < lst.Count; i++)
            //{
            //    //litWFS.Text += "<li><a href='" + WebHelper.GetAppPath() + "WF/FORMList.aspx?WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "list'}\">" + lst[i].WFCNAME + "管理</a></li>";
            //    //litNewWF.Text += "<li><a href='" + WebHelper.GetAppPath() + "WF/Edit.aspx?WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "new'}\">" + lst[i].WFCNAME + "</a></li>";

            //    LitMyWF.Text += "<li><a href='" + WebHelper.GetAppPath() + "WF/FORMList.aspx?mine=1&WFID=" + lst[i].WFID + "' data=\"{key:'wf" + lst[i].WFID + "mylist'}\">" + lst[i].WFCNAME + "</a></li>";
            //}
            //SYS_USER vvv = new SYS_USER();
            //vvv.af_PageBy(SYS_USER.Attribute.SNAME, Order.Asc);
            //Repeater1.DataSource = BLLTable<SYS_USER>.Factory(conn).Select(vvv, new SYS_USER());
            //Repeater1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fff = HttpContext.Current.Request["tr_1_PJSC"];
        if (fff == null)
        {
            Response.Write("null");
        }
        else {
            Response.Write("kkk");
        }
        if (HttpContext.Current.Request["ttt"] == null)
        {
            Response.Write("ttt-null");
        }
    }
}
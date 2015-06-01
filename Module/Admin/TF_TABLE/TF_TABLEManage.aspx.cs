using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.TemplateEngine;
using AgileFrame.Common;
using System.Text;
using AgileFrame.Orm.PersistenceLayer.DAL.Base;
public partial class TF_TABLEManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("TF_TABLEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("TF_TABLEManage.aspx", path);
    }
    protected string pid = "0";

    //取值对象
    ITableImplement valObj = new ITableImplement();
    ITableImplement condObj = new ITableImplement();
    List<ITableImplement> listObj = new List<ITableImplement>();
    
    /// <summary>
    /// 以下是定制模块的时候
    /// </summary>
    List<DataBaseField> listf1; List<DataBaseTable> listd1; string msg = null;

    List<ITableImplement> otherValueList = new List<ITableImplement>();
    List<ITableImplement> condList = new List<ITableImplement>();
    List<Relation> relationList = new List<Relation>();
    AttributeItem pageKey = TF_TABLE.Attribute.TB_ID;
    Order order = Order.Desc;

    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(int curPage)
    {
        #region//数据权限条件

        #endregion

        //condObj.PID = decimal.Parse(pid);
        string cachekey = null;

        if (!condList.Contains(condObj))
            condList.Add(condObj);
        int pageSize = aspPager.PageSize;
        int pageIndex = curPage;
        valObj.OrderBy(pageKey, order);

        listObj = BLLTable<ITableImplement>.Factory(conn).SelectByPage(valObj, relationList, otherValueList, condList, pageSize, pageIndex, ref recount, out cachekey);

        //repList.DataSource = listObj;
        //repList.DataBind();
        //repList_ItemDataBound(Lit_RepList, listObj);
        aspPager.RecordCount = recount;
        TagBinding();
    }
    private bool isModule = false;
    protected string initValue = "";
    
    private List<Literal> GetTagList()
    {
        List<Literal> lits = new List<Literal>();
        lits.Add(Lit_Finder); lits.Add(Lit_ListHeader); lits.Add(Lit_RepList);
        //lits.Add(Lit_ListChk);
        return lits;
    }
    #region 模版生成
    private void TagBinding()
    {
        List<Literal> lits = GetTagList();
        TagBinding(this, lits, valObj, condObj, listObj);
    }
    /// <summary>
    /// 生成标签模版 + 生成值
    /// </summary>
    protected void TagBinding(Page page, List<Literal> lits, ITableImplement valObj, ITableImplement condObj, List<ITableImplement> listObj)
    {
        //isModule = true;
        Content c1 = (Content)(page.FindControl("Content2"));
        Literal Lit_Finder = (Literal)(page.FindControl("Lit_Finder"));
        foreach (Literal lit in lits)
        {
            if (lit == null)
                continue;
            if (lit.ID == "Lit_Finder")
            {
                string old1 = lit.Text;
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetTemplate(old1, valObj, condObj);
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetHTML(lit.Text, condObj);
            }
            else if (lit.ID == "Lit_ListHeader")
            {
                string old1 = lit.Text;
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetTemplate(old1, valObj);
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetHTML(lit.Text, valObj);
            }
            else if (lit.ID == "Lit_RepList")
            {
                string old1 = lit.Text;
                if (listObj.Count > 0)
                {
                    lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetTemplate(old1, listObj[0]);
                    lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetHTML(lit.Text, listObj);
                }
                else
                    lit.Text = "";
            }
            else
            {
                string old1 = lit.Text;
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetTemplate(old1, valObj);
                lit.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetHTML(lit.Text, valObj);
            }
        }
    }
    #endregion 模版生成

    protected void SetControl(string controlName, string value)
    {
        initValue += "$('#name').val('value');".Replace("name", controlName).Replace("value", value);
    }
    private void SetRequest(ITableImplement condRequest)
    {
        foreach (AttributeItem attr in condRequest.af_AttributeItemList)
        {
            if (!string.IsNullOrEmpty(Request[attr.FieldCtrlName]))
                condRequest.SetValue(attr, Request[attr.FieldCtrlName]);
            else if (!string.IsNullOrEmpty(Request[attr.FieldName]))
                condRequest.SetValue(attr, Request[attr.FieldName]);
        }        
    }
    private void SetRequest(List<ITableImplement> condRequests)
    {
        foreach (ITableImplement condRequest in condRequests)
        {
            SetRequest(condRequests);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            #region 输入参数：数据模型、采用此布局模型展示
            if (Request["ModuleType"] != null)
            {
                string ModuleType = "";
                if (Request["ModuleType"] != null)
                {
                    ModuleType = Convert.ToString(Request["ModuleType"]);
                }
                //是模块，则设置 取值、条件对象 等。
                if (ModuleType == "TF_TABLE")
                {
                    msg = "未制定表名";
                    string ModuleTbName = Convert.ToString(Request["moduleName"]);
                    if (string.IsNullOrEmpty(ModuleTbName))
                    {
                        Response.Write(msg);
                        Response.End();
                    }
                    TF_TABLE condObj1 = new TF_TABLE();
                    condObj1.TB_NAME = ModuleTbName;
                    SetRequest(condObj1);

                    bool ret1 = AgileFrame.Common.TF_TABLEHelper.Factory(conn).Parse(condObj1, out valObj, out condObj, out relationList,
                        out otherValueList, out  condList, ref msg);//获取数据域(不是显示域)
                    msg = "制定模块的数据模型未存在，请安装此模块";
                    if (!ret1)
                    {
                        Response.Write(msg);
                        Response.End();
                    }
                    //设置条件对象
                    SetRequest(condObj);
                    SetRequest(condList);
                }
            }
            else
            {
                valObj = new ITableImplementHelper(conn).Factory("TF_TABLE");
                condObj = new ITableImplementHelper(conn).Factory("TF_TABLE"); //(ITableImplement)valObj.Clone();//
            }
            #endregion
            title = valObj._ZhName + "管理";
            Page.Title = title;
            if (Request["PID"] != null)
            {
                pid = Request["PID"];
            }
            if (Request["submit"] != null)
            {

            }
            if (!IsPostBack)
            {
                #region//默认属性初始化
                aspPager.CurrentPageIndex = 1;
                aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//.WebCtrls
                //txtPageSize.Value = "2";
                aspPager.PageSize = 30;
                //if (pid == "" || pid == "0")
                //{
                //    a_top.Visible = false;
                //}
                #endregion
                #region//条件
                BindCondition();
                #endregion
                #region//数据初始化
                //txtTB_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TABLE.Attribute.TB_TYPE));
                #endregion

                BindList(1);
            }
            //Lit_ToolLeftButton;
        }
        catch (Exception ex)
        {
            HandleError(ex);
        }
    }
    private bool MyIsPostBack
    {
        get
        {
            if (ViewState["IsPagePostBack"] != null)
            {
                ViewState["IsPagePostBack"] = Convert.ToInt32(ViewState["IsPagePostBack"]) + 1;
            }
            else
            {
                ViewState["IsPagePostBack"] = 0;
            }

            if (Convert.ToInt32(ViewState["IsPagePostBack"]) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
             condObj = JsonServiceBase.FromJson<ITableImplement>(hidCondition.Value);
             condObj._TableName = valObj._TableName;
        }
        BindList(aspPager.CurrentPageIndex);
    }
    private void BindCondition()
    {
        //aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (!string.IsNullOrEmpty(Request["txtPageSize"]))
            aspPager.PageSize = Convert.ToInt32(Request["txtPageSize"]);

        SetRequest(condObj);        
        hidCondition.Value = condObj.ToJson(20);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        BindCondition();        
        BindList(1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        //aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (!string.IsNullOrEmpty(Request["txtPageSize"]))
            aspPager.PageSize = Convert.ToInt32(Request["txtPageSize"]);

        aspPager_PageChanged(null, null);
    }
    protected void repList_ItemDataBound(Literal sender, List<TF_TABLE> listObj)
    {
        //sender.Text = new AgileFrame.Common.TF_TABLEHelper(conn).GetHTML(conn, sender.Text, listObj);
    }
}
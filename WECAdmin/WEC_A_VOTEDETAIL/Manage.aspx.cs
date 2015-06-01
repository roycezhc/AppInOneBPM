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
using System.Text;
using AgileFrame.Common;
using System.IO;
using AgileFrame.Core.WebSystem;

public partial class Manage : BasePage
{
    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Manage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("Manage.aspx", path);
    }
    //搜索配置
    protected ITableImplement finderObj = new ITableImplement();
    //取值视图配置
    protected ITableImplement valObj = new ITableImplement();
    //条件视图配置
    protected ITableImplement condObj = new ITableImplement();
    //编辑配置
    protected ITableImplement valObjEdit = new ITableImplement();
    //列表页
    protected List<ITableImplement> listObj = new List<ITableImplement>();
    protected AttributeItem KeyID = null;
    protected List<DataBaseField> fieldList = new List<DataBaseField>();
    #region 模板集finder
    //zlg：txt字段不能进行like搜索
    string Finder = @"<!--Switch-->
                    <!--Case InputString-->
                       <input name='{字段控件名}' id='{字段控件名}' type='text' value='{字段值}' ck='{len:{字段标签长度},type:{字段js类型枚举}}' />
                    <!--Case SmallText-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' value='{字段值}' />
                    <!--Case Text-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' value='{字段值}' />
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <select name='{字段控件名}' id='{字段控件名}'>
                        {字段值}
                    </select>
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser--><!--Case SelectMultiple-->
                    <input name='{字段控件名}' id='{字段控件名}' type='hidden'  value='{字段值}' />
                    <input name='{字段控件名}_NAME' id='{字段控件名}_NAME' value='{字段显示值}' onclick='sel(this,""{首字母大写关联表名}"");' class='selshowinput' readonly='readonly' style='width:70%;float:left;' type='text' />
                    <input class='sel' type='button' onclick='sel(this,""{首字母大写关联表名}"");' value='' style='float:left;' />    
                    <!--Case CheckBoxList--><!--Case CheckBoxMultiList-->
                    <input name='{字段控件名}' id='{字段控件名}' type='checkbox' value='{字段值}' class='ckb' />
                    <!--Case RadioBoxList-->
                    <input name='{字段控件名}' id='{字段控件名}' type='radio' value='{字段值}' class='ckb' />
                    <!--Case InputDateTime-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' readonly='readonly' onclick='setday(this)' value='{字段值}' />
                    <!--Case InputDate-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' readonly='readonly' onclick='setday(this)' value='{字段值}' />
                    <!--Case FileUpUpDoc-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' value='{字段值}' />
                    <!--Case InputPassWord--> 
                    <input name='{字段控件名}' id='{字段控件名}' type='password' value='{字段值}'>
                <!--EndSwitch-->";

    #endregion 模板集
    /// <summary>
    /// 查找html
    /// </summary>
    /// <returns></returns>
    protected string getFinder()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            foreach (DataBaseField f1 in fieldList)
            {
                f1.Value = null;
                bool isNull1 = finderObj.IsNotNull();
                bool isInit1 = false;
                //条件对象有赋值
                if (isNull1)
                {
                    AttributeItem attr1 = new AttributeItem(f1);
                    isInit1 = finderObj.GetInitialized(attr1);
                    if (isInit1)
                        f1.Value = Convert.ToString(finderObj.GetValue(attr1));                    
                }
                if (f1.ZhName == "多选数量")
                    "".ToString();
                string attrHtml = Finder;
                //jinsj 
                foreach (string table1 in f1.Desc.OutSource_ChaZhao.Keys)
                {
                    string selModuleUrl = null;
                    if (f1.Desc.Switch_CtrlType == BaseCtrlType.SelectMultiple)
                        selModuleUrl = "Sels.aspx?moduleName=" + table1 + "&r=" + DateTime.Now.Ticks;
                    else
                        selModuleUrl = "Sel.aspx?moduleName=" + table1 + "&r=" + DateTime.Now.Ticks;
                    attrHtml = attrHtml.Replace("{首字母大写关联表名}", selModuleUrl);
                }
                BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                b1.ParseForSwitch标签(ref attrHtml, f1);
                if (isChaZhao(f1))
                {
                    attrHtml = attrHtml.Replace("{字段显示值}", Convert.ToString(finderObj.GetValue(f1.TableName, f1.Desc.FieldCtrlName + "_NAME")));
                }

                sb.Append("<dl><dt>").Append(f1.Desc.ZhName).Append("：</dt><!--").Append(f1.FieldName)
                    .Append("--><dd><span>");
                sb.Append(attrHtml);
                sb.Append("</span></dd></dl>");
            }
        }
        catch (Exception ex)
        {
            Cs.Error("34" + ex.ToString());
        }
        return sb.ToString();
    }
   
    protected string pid = "0";

    int recount = -1;//查询总记录数
    protected string title = "";
    
    private void BindList(int curPage)
    {
        #region//数据权限条件

        #endregion

        //配置范围权限
        SetConditionByRequest(condObj);
        
        List<Relation> relations = new List<Relation>();
        if (!string.IsNullOrEmpty(ModuleName))
        {
            //测试用
            List<ITableImplement> otherValueList; List<Relation> relationList;
            valObj.GetModule(out otherValueList, out relationList);

            listObj = BLLTable<ITableImplement>.Factory(conn).SelectByPage(valObj, relations, null,
        condObj, aspPager.PageSize, curPage, ref recount);
            BLLTable.SQL_Test.ToString();
        }

        aspPager.RecordCount = recount;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //base.Page_Init(sender, e);
        //初始化模块加载参数
        base.InitModule(ref valObj, ref KeyID, ref fieldList);

        if (!string.IsNullOrEmpty(ModuleName))
        {
            condObj.af_PageBy(KeyID, Order.Desc);
            finderObj._TableName = valObj._TableName;
        }

        title = valObj._ZhName + "管理";
        Page.Title = title;

        if (!IsPostBack)
        {
            //从数据库获取配置的取值对象和条件对象，作为视图。jinsj
            Ec_View cond1 = new Ec_View();
            cond1.ModuleName = valObj._TableName;
            Ec_View v1 = BLLTable<Ec_View>.GetRowData(cond1);
            if (v1 != null && v1.IsNotNull())
            {
                if (v1.ValueJsonString != "")
                {
                    valObj = JsonServiceBase.FromJson<ITableImplement>(v1.ValueJsonString);
                }
                if (v1.ConditionJsonString != "")
                {
                    condObj = JsonServiceBase.FromJson<ITableImplement>(v1.ConditionJsonString);
                }
                string viewName = v1.ViewName;
            }
            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            #endregion
            #region//数据初始化

            #endregion
            
            BindList(1);
        }
        if (hidCondition.Value != "")
        {
            //condObj111 = JsonServiceBase.FromJson<ITableImplement>(hidCondition.Value);
        }
        if (hidFind.Value != "")
        {
            finderObj = JsonServiceBase.FromJson<ITableImplement>(hidFind.Value);
        }
        if (hidVal.Value != "")
        {
            //valObj111 = JsonServiceBase.FromJson<ITableImplement>(hidVal.Value);
        }
        if (valObj.IsNull())
        {
            //valObj111.LoadAllAttributes(true);
        }
    }

    #region 获取表格中的值
    /// <summary>
    /// 获取list页的数据源  
    /// 支持主模块的链接
    /// 支持枚举量
    /// 支持时间格式
    /// </summary>
    /// <param name="f1"></param>
    /// <returns></returns>
    public string GetHtmlList(DataBaseField f1, ITableImplement this1)
    {
        string html = "";
        try
        {
            DataBaseTable dt1 = f1.DataBaseTable;
            if (f1 != dt1.IDField && f1 != dt1.NameField)
            {
                if (!f1.Desc.af_Enable) return "";//是否可用
                if (!f1.Desc.af_Visable) return "";//是否可见
            }
            AttributeItem attr1 = AttributeItem.Factory(f1);
            object value1 = (this1.GetValue(attr1));
            
             //DataBaseField f1;
            DataBaseField id1 = dt1.IDField;
            DataBaseField name1 = dt1.NameField;

            if (f1 == dt1.IDField)//编号字段
            {
                //html = "<a href='index.aspx?id=" + this1.GetValue(dt1.FieldID.FieldName) + "'>" + html + "</a>";
            }
            else if (f1 == dt1.NameField)// != null && dt1.NameField.FieldName == f1.FieldName)//本模块name详细链接
            {
                string showUrl = "../" + f1.TableName + "/show.aspx";
                if (!Exist(showUrl))
                {
                    showUrl = "show.aspx";
                }
                html = "<a href='" + showUrl + "?id=" + this1.GetValue(id1) + "&moduleName=" + f1.TableName
                    + "' target='_blank'>" + value1 + "</a>";
            }
            else if (isSelect(f1))//枚举量
            {
                string str=Convert.ToString(value1);
               
                if (str.Contains(",")) {
                    //多选
                    string[] strs = str.Split(',');
                    List<object> valueList = new List<object>(strs);
                    List<object> nameList = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr1, valueList);
                    StringBuilder sb = new StringBuilder();
                    foreach(object s in nameList){
                        String ss=Convert.ToString(s);
                        sb.Append(ss+",");
                    }
                    html = sb.ToString();
                    html=html.Substring(0,html.LastIndexOf(","));
                }
                else {
                    //单选
                    html = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr1, value1);
                }
                
            }
            else if (isChaZhao(f1))//父表
            {
                DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                AttributeItem attr2 = AttributeItem.Factory(f2);
                html = Convert.ToString(this1.GetValue(attr2));

                //为关联的表的name设置链接
                string showUrl = "../" + f1.TableName + "/show.aspx";
                if (!Exist(showUrl))
                {
                    showUrl = "show.aspx";
                }
                html = "<a href='" + showUrl + "?id=" + this1.GetValue(id1) + "&moduleName=" + f1.TableName
                    + "' target='_blank'>" + html + "</a>";
            }
            else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpImage)
            {
                html = "<img src ='" + value1 + "' style='height:40px' />";
            }
            else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpUpDoc)
            {//
                if(!value1.Equals(" ")){
                    string val = Convert.ToString(value1);
                    string[] strs = val.Split(';');
                    for (int i = 0; i < strs.Length - 1; i++)
                    {
                        string[] ss=strs[i].Split(',');
                        string title = ss[0];
                        string url=ss[1];
                       
                        html += "<span>" + title + "&nbsp;<a href='Back.aspx?moduleName="+ModuleName+"&download=true&filename="+url+"'>下载</a></span>";
                    }
                }
            }
            if (html == "")
            {
                html = Convert.ToString(value1);
            }
        }
        catch (Exception ex)
        {
            Cs.Error(ex.ToString());
        }
        return html;//.TrimEnd('\n').TrimEnd('\r').Trim();
    }
    private static Dictionary<string, bool> urlExistFile = new Dictionary<string, bool>();
    private bool Exist(string showUrl)
    {
        bool isExist;
        if (urlExistFile.TryGetValue(showUrl, out isExist))
        {
            string file1 = Request.MapPath(showUrl);
            //file1 = Server.MapPath(showUrl);
            isExist = System.IO.File.Exists(file1);
            urlExistFile.Add(showUrl, isExist);
        }
        return isExist;
    }
    private bool isSelect(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.RadioBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.CheckBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectDrop
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectSingle
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectMultiple)
        {
            return true;
        }
        return false;
    }
    private bool isChaZhao(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationUser
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationFK)//父表
        {
            return true;
        }
        return false;
    }
    #endregion 获取表格中的值

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        SaveState();
        BindList(aspPager.CurrentPageIndex);
    }
    //
    protected bool TryGetRequest(string fieldName, out string fieldValue)
    {
        fieldValue = Request[fieldName];
        //if (!string.IsNullOrEmpty(fieldValue))
        {
            return true;
        }
        return false;
    }
    protected bool TryGetRequest(DataBaseField f1, out string fieldValue)
    {
        if (TryGetRequest(f1.Desc.FieldCtrlName, out fieldValue))
        {
            if (f1.Desc.CtrlType == BaseCtrlType.SelectDrop &&
                (fieldValue == "-1" || fieldValue == ""))
                return false;

            if ((f1.Desc.CtrlType == BaseCtrlType.InputDate || f1.Desc.CtrlType == BaseCtrlType.InputDateTime) &&
                (fieldValue == "0001-01-01" || fieldValue == "1900-01-01"))
                return false;
            return true;
        }
        else if (TryGetRequest(f1.Desc.FieldName, out fieldValue))
        {
            return true;
        }
        return false;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        SaveState();
        BindList(1);
    }
    private void SaveState()
    {
        #region 获取条件
        finderObj = new ITableImplement();
        foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
        {
            string fieldValue = null;
            AttributeItem attr1 = null;
            try
            {
                if (isChaZhao(f1))
                {
                    if (TryGetRequest(f1.Desc.FieldCtrlName + "_NAME", out fieldValue))
                    {
                        attr1 = new AttributeItem(f1.TableName, f1.Desc.FieldCtrlName + "_NAME");
                        finderObj.SetValue(attr1, fieldValue);
                    }
                }
                if (TryGetRequest(f1, out fieldValue))
                {
                    attr1 = new AttributeItem(f1);
                    finderObj.SetValue(attr1, fieldValue);
                    if (!string.IsNullOrEmpty(fieldValue))
                        condObj.Like(attr1, fieldValue);
                }
            }
            catch (Exception ex)
            {
                Cs.Error(ex.ToString());
                litWarn.Text = ex.Message + ":" + attr1.LongName + "=" + fieldValue;
            }
        }

        //hidVal.Value = valObj111.ToJson(20);
        //hidCondition.Value = condObj111.ToJson(20);
        hidFind.Value = finderObj.ToJson(20);

        //if (hidCondition.Value != "")
        //{
        //    condObj111 = JsonServiceBase.FromJson<ITableImplement>(hidCondition.Value);
        //}
        #endregion
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        SaveState();
        BindList(aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}
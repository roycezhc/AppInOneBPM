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
using AgileFrame.Core.WebSystem;
using System.IO;
using System.Text;
using AgileFrame.Orm.TemplateEngine;
using AgileFrame.Common;

public partial class WEC_REQUESTManage : BaseAdminPage
{
    #region 模板集
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
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' value='{字段值}' />
                        <input class='sel' onclick='sel(""{首字母大写关联表名}"");' value='{字段值}' type='button' />
                        <!--增加该脚本到 /Lib/JScript/Seljs.js,增加该页 /SelectObj/Sel/{首字母大写关联表名}_Sel.aspx-->
                    <!--Case CheckBoxList-->
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
            foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
            {
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
                string attrHtml = Finder;
                BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                b1.ParseForSwitch标签(ref attrHtml, f1);
                if (isNull1 && isInit1)
                    f1.Value = "";
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
    protected string getFinderBtn()
    {
        return "";
    }
    protected string getRepeateTitle()
    {
        return "";
    }
    protected string getRepeateHtml()
    {
        return "";
    }

    protected string showLeftLinks(string path, string pname, int rowIndex)
    {
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
        return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("WEC_REQUESTManage.aspx", path);
    }
    public string pid = "0", kind = "0";
    #region 模板方法
    protected ITableImplement getValObj()
    {
        return valObj;
    }
    protected ITableImplement getCondObj()
    {
        return condObj;
    }
    protected List<ITableImplement> getListObj()
    {
        List<ITableImplement> list1 = new List<ITableImplement>();        
        {
            foreach (WEC_REQUEST itable in listObj)
            {
                list1.Add(itable);
            }
        }
        return list1;
    }
    #endregion 模板方法
    /// <summary>
    /// 取值对象
    /// </summary>
    protected WEC_REQUEST valObj = new WEC_REQUEST();
    protected WEC_REQUEST condObj = new WEC_REQUEST();
    //搜索对象
    protected WEC_REQUEST finderObj = new WEC_REQUEST();
    protected List<WEC_REQUEST> listObj = new List<WEC_REQUEST>();
    List<Relation> relations = new List<Relation>();
    int recount = -1;//查询总记录数
    protected string title = "";
    private void BindList(WEC_REQUEST condObj, int curPage)
    {
        if (!string.IsNullOrEmpty(kind))
        {
            condObj.KIND = Convert.ToInt32(kind);
        }

        if (!string.IsNullOrEmpty(userBase2.Curraid)) condObj.AID = Convert.ToInt32(userBase2.Curraid);

        if (condObj.af_PageByAttributeItem == null)//如果不存在用户定义的分页排序属性，则用主键属性排序
            condObj.af_PageBy(WEC_REQUEST.Attribute.TID, Order.Desc);

        #region//数据权限条件

        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WEC_REQUEST>.Factory(conn).SelectByPage(((WEC_REQUEST)getValObj()), relations, null,
            getCondObj(), aspPager.PageSize, curPage, ref recount);
        //repList.DataSource = listObj;
        //repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        valObj._TableName = ModuleName;//实体类
        condObj._TableName = ModuleName;

        #region//默认隐藏的列
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//暂时加此代码，以后框架更新将不需要
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "管理";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["kind"] != null)
        {
            kind = Request["kind"];
        }
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
                    valObj = JsonServiceBase.FromJson<WEC_REQUEST>(v1.ValueJsonString);
                }
                if (v1.ConditionJsonString != "")
                {
                    condObj = JsonServiceBase.FromJson<WEC_REQUEST>(v1.ConditionJsonString);
                }
                string viewName = v1.ViewName;
            }

            #region//默认属性初始化
            aspPager.CurrentPageIndex = 1;
            //aspPager.ShowInputBox = AgileFrame.Core.WebSystem.WebCtrls.ShowInputBox.Auto;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion

            BindList(condObj, 1);
        }

        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
        }
        if (hidFind.Value != "")
        {
            finderObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidFind.Value);
        }
        if (hidVal.Value != "")
        {
            valObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidVal.Value);
        }
        if (valObj.IsNull())
        {
            valObj.LoadAllAttributes(true);
        }
    }


    /// <summary>
    /// 获取list页的数据源  
    /// 支持主模块的链接
    /// 支持枚举量
    /// 支持时间格式
    /// </summary>
    /// <param name="attr"></param>
    /// <returns></returns>
    public string GetHtmlList(AttributeItem attr, WEC_REQUEST this1)
    {
        attr.IsEnable();
        string html = null;
        object value1 = (this1.GetValue(attr));
        DataBaseTable dt1; DataBaseField f1;
        if (AgileFrame.Orm.PersistenceLayer.DAL.Base.RunTime.Factory(this1.ConnectKey).DataBase.TryGetValueAll(attr.TableName, attr.FieldName,
            out dt1, out f1))
        {
            if (dt1.IDField != null && dt1.IDField.FieldName == attr.FieldName)
            {
                //html = "<a href='index.aspx?id=" + this1.GetValue(dt1.FieldID.FieldName) + "'>" + html + "</a>";
            }
            else if (dt1.NameField != null && dt1.NameField.FieldName == attr.FieldName)
            {
                html = "<a href='?id=" + this1.GetValue(dt1.IDField.FieldName) + "'>" + value1 + "</a>";
            }
            else if (f1.Desc.CtrlType == BaseCtrlType.SelectDrop
                || f1.Desc.CtrlType == BaseCtrlType.SelectSingle
                || f1.Desc.CtrlType == BaseCtrlType.SelectMultiple)//枚举量
            {
                html = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr, value1);
            }
            else if (f1.Desc.CtrlType == BaseCtrlType.Select_RelationUser
                || f1.Desc.CtrlType == BaseCtrlType.Select_RelationFK)//父表
            {
                //f1.(attr, value1);
            }
        }
        if (html == null)
            html = Convert.ToString(value1);
        return html;
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected bool TryGetRequest(string fieldName, out string fieldValue)
    {
        fieldValue = Request[fieldName]; ;
        if (!string.IsNullOrEmpty(fieldValue))
        {
            return true;
        }
        return false;
    }
    protected bool TryGetRequest(DataBaseField attr, out string fieldValue)
    {
        if (TryGetRequest(attr.Desc.FieldCtrlName, out fieldValue))
        {
            if (attr.Desc.CtrlType == BaseCtrlType.SelectDrop &&
                (fieldValue == "-1" || fieldValue == ""))
                return false;

            if ((attr.Desc.CtrlType == BaseCtrlType.InputDate||attr.Desc.CtrlType == BaseCtrlType.InputDateTime) &&
                (fieldValue == "0001-01-01" || fieldValue == "1900-01-01"))
                return false;
            return true;
        }
        else if (TryGetRequest(attr.Desc.FieldName, out fieldValue))
        {
            return true;
        }
        return false;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new WEC_REQUEST();
        finderObj = new WEC_REQUEST();
        foreach (DataBaseField attr in valObj.af_GetAvailableDataBaseField())
        {
            string fieldValue;
            if (TryGetRequest(attr, out fieldValue))
            {
                AttributeItem attr1 = new AttributeItem(attr);
                condObj.Like(attr1, fieldValue);
                finderObj.SetValue(attr1, fieldValue);
            }
        }

        hidVal.Value = valObj.ToJson(20);
        hidCondition.Value = condObj.ToJson(20);
        hidFind.Value = finderObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected string findString()
    {
        condObj = new WEC_REQUEST();
        finderObj = new WEC_REQUEST();
        foreach (DataBaseField attr in valObj.af_GetAvailableDataBaseField())
        {
            string fieldValue;
            if (TryGetRequest(attr, out fieldValue))
            {
                AttributeItem attr1 = new AttributeItem(attr);
                condObj.Like(attr1, fieldValue);
                finderObj.SetValue(attr1, fieldValue);
            }
        }

        hidVal.Value = valObj.ToJson(20);
        hidCondition.Value = condObj.ToJson(20);
        hidFind.Value = finderObj.ToJson(20);

        return finderObj.ToJson(20);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
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
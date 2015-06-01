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
using AgileFrame.Common;
using AgileFrame.Orm.TemplateEngine;

public partial class Show : BasePage //BaseAdminPage
{
    ITableImplement valObj = new ITableImplement();
    ITableImplement resultObj = new ITableImplement();
    protected string title = "";
    #region 模板集
    string Input = @"<!--Switch-->
                    <!--Case InputString--><!--文字-->
                    {字段值}
                    <!--Case SmallText-->
                    {字段值}
                    <!--Case Text-->
                    {字段值}
                    <!--Case HTML-->
                    {字段值}
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    {字段值}
                    <!--Case Select_RelationUser-->
                    {字段显示值}
                    <!--Case SelectMultiple-->
                    <!--Case CheckBoxList-->
                    {字段值}
                    <!--Case RadioBoxList--> 
                    {字段值}
                    <!--Case InputDateTime-->
                    {字段值}
                    <!--Case InputDate-->
                    {字段值}
                    <!--Case FileUpUpDoc-->
                    {字段值}
                    <!--Case InputPassWord--> 
                    {字段值}
                    <!--Case FileUpImage-->              
					
                <!--EndSwitch-->";
    //<img src='{字段值}' style='max-height:100px;vertical-align: middle;'>

    #endregion 模板集

    int pageSize=10; int pageIndex=1; int count1=-1;
    /// <summary>
    /// 相关子表
    /// </summary>
    /// <returns></returns>
    protected string getSubForm()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            //DataBaseField[] flist = valObj.af_GetAvailableDataBaseField();
            //foreach (DataBaseField f1 in flist)               
            {
                //父表的id
                object id1 = resultObj.GetValue(valObj.DataBaseTable.IDField);

                string tableName1 = "关系表1";
                if (valObj.DataBaseTable.SubTable_ChaZhao.Count > 0)
                {
                    int count2 = 0;//计数
                    foreach (DataBaseTableRelation dr1 in valObj.DataBaseTable.SubTable_ChaZhao)
                    {
                        
                        DataBaseTable table2 = dr1.DataBaseTable;
                        tableName1 = table2.TableName;
                        DataBaseField IDField = dr1.DataBaseTable.IDField;
                        DataBaseField NameField = dr1.DataBaseTable.NameField;
                        List<Relation> lstRel = new List<Relation>();
                        foreach (DataBaseRelation r1 in dr1.Relations)
                        {
                            lstRel.Add(new Relation(r1));
                        }
                        ITableImplement value2 = new ITableImplement(table2);

                        ITableImplement cond2 = new ITableImplement(table2);
                        cond2.SetValue(AttributeItem.Factory(value2.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.IDField), id1);
                        List<ITableImplement> lstCond = new List<ITableImplement>();
                        lstCond.Add(cond2);

                        List<ITableImplement> lstOther = new List<ITableImplement>();

                        count1 = -1;

                        //显示明显表的 父表的信息
                        //value2.setConn(conn).setModule("WEC_QC_CARS");
                        List<ITableImplement> list2 = BLLTable<ITableImplement>.Factory(conn).SelectByPage(value2, lstRel, lstOther, lstCond,
                            pageSize, pageIndex,ref count1);
                        int num = count1 / pageSize;
                        if (list2.Count > 0)
                        {
                            sb.Append("<script type=\"text/javascript\">");
                            sb.Append("$(function () {");
                            sb.Append("$(\"#tbl" + tableName1 + "Title\").click(function () {");
                            sb.Append("$(\"#tbl" + tableName1 + "\").toggleClass(\"hide\");");
                            sb.Append("$(\"#tbl" + tableName1 + "Img\").toggleClass(\"showUp\");");
                            sb.Append("});");
                            //sb.Append("$(\"ul >li >a[name="+count2+"]\").click(function () {" +
                            //    "alert($(this).attr(\"rel\"))" +
                            //    "});");

                          //  sb.Append("$(\"ul >li >a[name=" + count2 + "]\").click(function () {" +
                          //     //"$(\"ul >li >a[name=" + count2 + "]\").parent().removeClass(\"active\");"+
                          //     //"$(this).parent().addClass(\"active\");"+
                              
                          //     "var str = $(this).attr(\"rel\");" +
                          //     "var strs = str.split(\".\");" +
                          //     "var content=$(this).html();"+
                          //    // "alert(content==\"下一页\");" +
                          //     "if(content==\"下一页\"){"+
                          //     "if((parseInt(strs[1])+1)<="+(num+1)+"){"+
                          //        "var nextStr=strs[0]+\".\"+(parseInt(strs[1])+1);"+
                          //        "var prevStr=strs[0]+\".\"+(parseInt(strs[1])-1);" +
                          //       "$(this).attr(\"rel\",nextStr);"+
                          //       "$(this).parent().siblings().find(\"a\").attr(\"rel\",prevStr);" +
                          //       "$(this).parent().siblings().removeClass(\"disabled\");" +
                          //      "}else{"+
                          //          "var nextStr=strs[0]+\".\"+(parseInt(strs[1])+1);" +
                          //          "var prevStr=strs[0]+\".\"+(parseInt(strs[1])-1);" +
                          //          "$(this).attr(\"rel\",nextStr);" +
                          //           "$(this).parent().siblings().find(\"a\").attr(\"rel\",prevStr);" +
                          //          "$(this).parent().siblings().removeClass(\"disabled\");" +
                          //           "$(this).parent().addClass(\"disabled\");"+
                          //      "}"+
                          //     " }else{"+
                          //       "if((parseInt(strs[1])-1)>=1){"+
                          //           "var nextStr=strs[0]+\".\"+(parseInt(strs[1])+1);" +
                          //          "var prevStr=strs[0]+\".\"+(parseInt(strs[1])-1);"+
                          //          "$(this).attr(\"rel\",prevStr);"+
                          //         "$(this).parent().siblings().find(\"a\").attr(\"rel\",nextStr);" +
                          //          "$(this).parent().siblings().removeClass(\"disabled\");" +
                          //          "}else{"+
                          //           "var nextStr=strs[0]+\".\"+(parseInt(strs[1])+1);" +
                          //           "var prevStr=strs[0]+\".\"+(parseInt(strs[1])-1);" +
                          //           "$(this).attr(\"rel\",prevStr);" +
                          //           "$(this).parent().siblings().find(\"a\").attr(\"rel\",nextStr);" +
                          //          "$(this).parent().siblings().removeClass(\"disabled\");" +
                          //          "$(this).parent().addClass(\"disabled\");"+
                          //           "}"+
                          //      "}"+
                          //     "$.ajax({" +
                          //       "url:\"Back.aspx\"," +
                          //       "type:\"post\"," +
                          //       "data:{\"ModuleName\":\"" + ModuleName + "\",\"pageIndex\":strs[1],\"num\":strs[0],\"id1\":"+id1+",\"paging\":\"true\"}," +
                          //       "dataType:\"text\"," +
                          //       "success: function (data) {" +
                          //           "$(\"tbody[rel=\" + strs[0] + \"]\").html(data);" +
                                     
                          //       "}," +
                          //       "error: function (data) {" +
                          //           "alert(data);" +
                          //       "}" +
                          //   "});" +
                          //"});");

                            sb.Append(" var options = {"+
                                        "currentPage: 1,"+
                                        "totalPages: "+(count1/10+1)+","+
                                        "numberOfPages:5,"+
                                        "onPageChanged:function(event){"+
                                          // "alert($(event.currentTarget).find(\"ul li.active a\").html());" +
                                             "$.ajax({" +
                                               "url:\"Back.aspx\"," +
                                               "type:\"post\"," +
                                               "data:{\"ModuleName\":\"" + ModuleName + "\",\"pageIndex\":$(event.currentTarget).find(\"ul li.active a\").html(),\"num\":" + count2 + ",\"id1\":" + id1 + ",\"paging\":\"true\"}," +
                                               "dataType:\"text\"," +
                                               "success: function (data) {" +
                                                   "$(\"tbody[rel="+count2+"]\").html(data);" +

                                         "}," +
                                               "error: function (data) {" +
                                                   "alert(data);" +
                                               "}" +
                                           "});" +
                                        "}" +
                                    "};"+
                                    "$('#page"+count2+"').bootstrapPaginator(options);");
                            sb.Append("});");
                            sb.Append("</script>");
                            sb.Append("<div id='tbl" + tableName1 + "Title' class='showTitle'><span >" + value2._ZhName + "信息</span><span id='tbl" + tableName1 + "Img' class='showImg'></span></div>");

                            sb.Append("<div id='tbl" + tableName1 + "' class=\"tblist\">");
                            sb.Append("<table cellpadding=\"0\" cellspacing=\"0\" id=\"tbList\" class=\"table table-hover\">");
                            sb.Append("<thead>");
                            sb.Append("<tr keyname=\"ID\">");
                            foreach (DataBaseField d2 in value2.af_GetAvailableDataBaseField())
                            {
                                sb.Append("<td data=\"{colname:'" + d2.LongAttributeName + "',show:1}\">" + d2.ZhName + "</td>");
                            }
                            sb.Append("</tr>");
                            sb.Append("</thead>");
                            sb.Append("<tbody rel=\""+count2+"\">");
                            foreach (ITableImplement tb2 in list2)
                            {
                                sb.Append("<tr>");
                                foreach (DataBaseField d2 in tb2.af_GetAvailableDataBaseField())
                                {
                                    sb.Append("<td>" + GetHtmlList(d2, tb2) + "");
                                }
                                sb.Append("</tr>");
                            }
                            sb.Append("</tbody>");
                            sb.Append("</table>");
                            
                            //sb.Append("<div class=\"container\"><div><ul  class=\"pager\">");
                            
                            ////for (int i = 0; i <= num;i++ )
                            ////{
                            ////    if (pageIndex == i + 1)
                            ////    {
                            ////        sb.Append("<li class=\"active\"><a href=\"javascript:;\" name=\""+count2+"\" rel="+count2+"."+(i+1)+">" + (i + 1) + "</a></li>");
                            ////    }
                            ////    else 
                            ////    {
                            ////        sb.Append("<li><a href=\"javascript:;\" name=\""+count2+"\" rel=" + count2 + "." + (i + 1) + ">" + (i + 1) + "</a></li>");
                            ////    }
                            ////}
                            //sb.Append("<li class=\"disabled\"><a href=\"javascript:;\" name=\"" + count2 + "\" rel=" + count2 + "." + 1 + ">上一页</a></li>");
                           
                            //if (num==0)
                            //{
                            //    sb.Append("<li class=\"disabled\"><a href=\"javascript:;\" name=\"" + count2 + "\" rel=" + count2 + "." + 2 + ">下一页</a></li>");
                            //}else{
                              
                            //    sb.Append("<li><a href=\"javascript:;\" name=\"" + count2 + "\" rel=" + count2 + "." + 2 + ">下一页</a></li>");
                            //}
                            //sb.Append("</ul></div></div>");
                            sb.Append("<div id=\"page"+count2+"\"></div>");
                            sb.Append("</div>");
                            count2++;
                        }
                    
                    }
                }
                else if (valObj.DataBaseTable.SubTable_ExtField.Count > 0)
                {
                    DataBaseField IDField = valObj.DataBaseTable.SubTable_ChaZhao[0].DataBaseTable.IDField;
                }
                else if (valObj.DataBaseTable.SubTable_Many2Many.Count > 0)
                {
                    DataBaseField IDField = valObj.DataBaseTable.SubTable_ChaZhao[0].DataBaseTable.IDField;
                }
                else if (valObj.DataBaseTable.SubTable_MingXi.Count > 0)
                {
                    DataBaseField IDField = valObj.DataBaseTable.SubTable_ChaZhao[0].DataBaseTable.IDField;
                }
                else if (valObj.DataBaseTable.SubTable_MyTree.Count > 0)
                {
                    DataBaseField IDField = valObj.DataBaseTable.SubTable_ChaZhao[0].DataBaseTable.IDField;
                }
                else if (valObj.DataBaseTable.SubTable_Tree.Count > 0)
                {
                    DataBaseField IDField = valObj.DataBaseTable.SubTable_ChaZhao[0].DataBaseTable.IDField;
                }
            }
        }
        catch (Exception ex)
        {

        }
        return sb.ToString();
    }
    /// <summary>
    /// 输入html
    /// </summary>
    /// <returns></returns>
    protected string getInput()
    {
        StringBuilder sb = new StringBuilder();
        string strChazhaoID = "";
        try
        {
            DataBaseField[] flist = valObj.af_GetAvailableDataBaseField();
            foreach (DataBaseField f1 in flist)
            {
                string block = "基础信息";
                block = f1.Desc.af_BlockName;
                string blockid = f1.Desc.af_BlockID;

                if (f1.TableName != resultObj._TableName)//说明不是本表字段
                {
                    block = f1.TableName;//布局名，就是 关联表的父表 表名

                    if (resultObj.IsOnlyForModuleIDName == true)
                    {
                        break;
                    }
                    else { 



                    
                    }

                }

                f1.Value = Convert.ToString(resultObj.GetValue(f1));

                string attrHtml = Input;

                BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                b1.ParseForSwitch标签(ref attrHtml, f1);

                if (isChaZhao(f1))
                {
                    DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                    string html = Convert.ToString(resultObj.GetValue(f2));
                    attrHtml = attrHtml.Replace("{字段显示值}", html);
                    strChazhaoID = f1.Value;
                }

                else if (isSelect(f1))//枚举量
                {
                    AttributeItem attr2 = AttributeItem.Factory(f1);
                    string html = BaseFormHelper.Factory(resultObj.ConnectKey).GetOptionText(attr2, f1.Value);
                    attrHtml = html;
                }
                else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpImage)
                {
                    attrHtml = "<img style='height:19px;top:5px;postion:relative;' src ='" + f1.Value + "' style='height:40px' />";
                }



                sb.Append("<dl class=\"dl-horizontal\"><dt><span>").Append(f1.Desc.ZhName).Append("</span></dt><!--").Append(f1.FieldName)
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
    protected AttributeItem KeyID = null;
    protected List<DataBaseField> fieldList = new List<DataBaseField>();
    protected void Page_Load(object sender, EventArgs e)
    {
      
        //base.Page_Init(sender, e);
        //初始化模块加载参数
        base.InitModule(ref valObj, ref KeyID, ref fieldList);

        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                resultObj.IsOnlyForModuleIDName = false;
                valObj.IsOnlyForModuleIDName = false;
                if (!string.IsNullOrEmpty(Request["ID"]))
                {
                    AttributeItem id1 = AttributeItem.Factory(valObj.DataBaseTable.IDField);
                    ITableImplement cond1 = new ITableImplement(); cond1.SetValue(id1, Request["ID"]);
                    resultObj = BLLTable<ITableImplement>.Factory(conn).GetRowData(valObj, cond1);
                  
                    if (resultObj == null)
                    {
                        ScriptHelper.Alert(this, "记录不存在");
                        ScriptHelper.CloseMe(this); 
                        return;
                    }
                    BLLTable.SQL_Test.ToArray();
                    object obj1 = resultObj.GetValue(WEC_A_VOTE.Attribute.TITLE);

                }
            }
            catch (Exception ex)
            {
                //litWarn.Text = ex.Message;
            }
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
        if (!f1.Desc.af_Enable) return "";//是否可用
        if (!f1.Desc.af_Visable) return "";//是否可见
        string html = "";
        string tableName = f1.TableName;
        AttributeItem attr1 = AttributeItem.Factory(f1);
        object value1 = (this1.GetValue(attr1));
        DataBaseTable dt1 = f1.DataBaseTable; //DataBaseField f1;

        try
        {
            DataBaseField id1 = dt1.IDField;
            DataBaseField name1 = dt1.NameField;

            if (f1 == dt1.IDField)
            {
                //html = "<a href='index.aspx?id=" + this1.GetValue(dt1.FieldID.FieldName) + "'>" + html + "</a>";
            }
            else if (f1 == dt1.NameField)// != null && dt1.NameField.FieldName == f1.FieldName)//本模块name详细链接
            {
                string showUrl = "../" + dt1.TableName + "/show.aspx";
                if (!Exist(showUrl))
                {
                    showUrl = "show.aspx";
                }
                html = "<a href='" + showUrl + "?id=" + this1.GetValue(id1) + "&moduleName=" + tableName
                    + "' target='_blank'>" + value1 + "</a>";
            }
            else if (isSelect(f1))//枚举量
            {
                html = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr1, value1);
            }
            else if (isChaZhao(f1))//父表
            {
                DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                AttributeItem attr2 = AttributeItem.Factory(f2);
                html = Convert.ToString(this1.GetValue(attr2));
            }
            else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpImage)
            {
                html = "<img src ='" + value1 + "' style='height:40px' />";
            }
        }
        catch (Exception ex)
        {
            Cs.Error(ex.ToString());
        }
        if (html == "")
        {
            html = Convert.ToString(value1);
        }
        return html;
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
}

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

public partial class Edit : BaseAdminPage
{
    #region 模板集input
    //zlg：多出,min:0,max:{字段标签长度},need:{字段是否必须}}
    string Input = @"<!--Switch-->
                    <!--Case InputString--><!--文字-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{type:{字段js类型枚举},need:{字段是否必须}}' value='{字段值}' />
                    <!--Case SmallText-->
                    <textarea name='{字段控件名}' id='{字段控件名}' class='smalltextarea' cols='1' rows='1' style='height:20px;width:300px;overflow:hidden;' 
                            ck='{need:{字段是否必须},len:{字段标签长度},type:{字段js类型枚举}}' value='{字段值}'>{字段值}</textarea>
                    <!--Case Text-->
                    <script type='text/javascript'>
                        $(function () {
                            var kindEditor = new creatKindEditor('#{字段控件名}');
                        });
                    </script>  
                    <input name='{字段控件名}' id='{字段控件名}' type='text' rel='text'  style='width:668px;height:230px;' ck='{len:{字段标签长度},type:{字段js类型枚举}}' value='{字段值}' />
                    <!--Case HTML-->
                    <FCKV2:FCKeditor name='{字段控件名}' ID='{字段控件名}'  Height='250' Width='400' ToolbarSet='Basic'  value='{字段值}' />
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <script type='text/javascript'>
                         $(function(){
                            $('#{字段控件名}').multiselect({
                                noneSelectedText: '未选择',
                                checkAllText: '全选',
                                uncheckAllText: '全不选',
                                selectedList:4
                            });
                        });
                    </script>
                    <select name='{字段控件名}' id='{字段控件名}'   ck='{need:{字段是否必须},len:{字段标签长度},type:{字段js类型枚举}}'>
                            {字段值}
                    </select>
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser--><!--Case SelectMultiple-->
                    <input name='{字段控件名}' id='{字段控件名}' type='hidden'   value='{字段值}' />
                    <input name='{字段控件名}_NAME' id='{字段控件名}_NAME' onclick='sel(this,""{首字母大写关联表名}"");' class='selshowinput' value='{字段显示值}' readonly='readonly' style='width:70%;float:left;'  type='text' />
                    <input class='sel' type='button' onclick='sel(this,""{首字母大写关联表名}"");' value='' style='float:left;' />                    
                    <!--Case CheckBoxList-->
                        {字段值}
                    <!--Case CheckBoxMultiList-->
                        {字段值}
                    <!--Case InputDateTime-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' readonly='readonly' onclick='setday(this)'  value='{字段值}'   ck='{need:{字段是否必须},len:{字段标签长度},type:3}' />
                    <!--Case InputDate-->
                    <input name='{字段控件名}' id='{字段控件名}' type='text' readonly='readonly' onclick='setday(this)'  value='{字段值}'   ck='{need:{字段是否必须},len:{字段标签长度},type:3}'/>
                  

                    <!--Case InputPassWord--> 
                    <input name='{字段控件名}' id='{字段控件名}' type='password' value='{字段值}'   ck='{need:{字段是否必须},len:{字段标签长度},type:{字段js类型枚举}}' />
                    <!--Case FileUpImage-->              
                    <script type='text/javascript'>
                        $(function () {
                            var smImage = new creatSmImage('#btn{字段控件名}', '#{字段控件名}', '#hid{字段控件名}');
                        });
                    </script>
                    <div class='controls'>
					    <img name='{字段控件名}' id='{字段控件名}' src='{字段值}'   style='max-height:100px;vertical-align: middle;'>
                        <span class='insertimage'><a id='btn{字段控件名}'>选择图文封面</a></span>  建议大小(宽720高400)
                        <input type='hidden' name='{字段控件名}' id='hid{字段控件名}'  value='{字段值}'  />
                    </div>

                    <!--Case InputNumber-->  
                    <input name='{字段控件名}' id='{字段控件名}' type='text' onKeypress='return (/[\d.]/.test(String.fromCharCode(event.keyCode)))' style='ime-mode:Disabled' value='{字段值}'>
                    <!--Case InputMobile-->
                     <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{need:{字段是否必须},type:6}' value='{字段值}'/>

                    <!--Case InputEmail-->  
                     <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{need:{字段是否必须},type:4}' value='{字段值}'/>

                     <!--Case InputQQ-->  
                     <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{need:{字段是否必须},type:10}' value='{字段值}'/>

                      <!--Case InputWangWang-->                
                     <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{need:{字段是否必须},type:11}'value='{字段值}' />

                    <!--Case InputHttp-->                
                     <input name='{字段控件名}' id='{字段控件名}' type='text' ck='{need:{字段是否必须},type:12}' value='{字段值}'/>
               
                     <!--Case FileUpUpDoc-->              
                    <script type='text/javascript'>
                        $(function () {
                            var file = new creatFileUpload('#btn{字段控件名}', '#hid{字段控件名}');
                        });
                         
                    </script>
                    <div class='controls'> 
                        <div id='files' style='margin-bottom:10px;'></div>
                        <span class='insertimage'><a id='btn{字段控件名}'>选择文件</a></span>  
                        <input type='hidden' name='{字段控件名}' id='hid{字段控件名}'  value='{字段值}'  />
                    </div>
               <!--EndSwitch-->";


    #endregion 模板集
    /// <summary>
    /// 输入html
    /// </summary>
    /// <returns></returns>
    protected string getInput()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            foreach (DataBaseField f1 in fieldList)
            {
                if (f1.TableName.ToLower() == valObj._TableName.ToLower())//本表字段
                {
                    AttributeItem attr1 = new AttributeItem(f1);
                    f1.Value = Convert.ToString(resultObj.GetValue(attr1));

                    if (f1.ZhName == "多选数量")
                        "".ToString();
                    if (f1.ZhName == "关键词")
                        "".ToString();

                    string attrHtml = Input;
                    
                    BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                    b1.ParseForSwitch标签(ref attrHtml, f1);

                    if (isChaZhao(f1))
                    {
                        DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                        AttributeItem attr11 = AttributeItem.Factory(f2);
                        string html = Convert.ToString(resultObj.GetValue(attr11));
                        attrHtml = attrHtml.Replace("{字段显示值}", html);
                    }
                    else if(f1.Desc.CtrlType==BaseCtrlType.SelectDrop){
                        string[] strs = null;
                        if (f1.Value.Contains(","))
                        {
                            strs = f1.Value.Split(',');
                            foreach (string s in strs)
                            {
                                string str = "value='" + s + "'";
                                attrHtml = attrHtml.Replace(str,str+" selected");
                            }
                        }
                    }else if(f1.Desc.CtrlType==BaseCtrlType.FileUpUpDoc){
                        if (!f1.Value.Equals(" "))
                        {
                            string val = Convert.ToString(f1.Value);
                            string[] strs = val.Split(';');
                            string html="";
                            for (int i = 0; i < strs.Length - 1; i++)
                            {
                                string[] ss = strs[i].Split(',');
                                string title = ss[0];
                                string url = ss[1];
                                string hidId = ss[2];
                                html+="<div>" + title + "<a href=\"javascript:\" flag=\"delete\" url=\"" + url + "\" onclick=\"deleteFileName(this,'"+hidId+"')\"><img src=\"../../Themes/WEC/del-icon.png\"></a></div>";
                            }
                            attrHtml = attrHtml.Replace("<div id='files' style='margin-bottom:10px;'></div>", "<div id='files' style='margin-bottom:10px;'>" + html + "</div>");
                        }
                    }
                    sb.Append("<dl><dt>").Append(f1.Desc.ZhName).Append("：</dt><!--").Append(f1.FieldName)
                        .Append("--><dd><span>");
                    sb.Append(attrHtml);
                    sb.Append("</span></dd></dl>");

                }
            }
        }
        catch (Exception ex)
        {
            Cs.Error("34" + ex.ToString());
        }
        return sb.ToString();
    }
    ITableImplement valObj = new ITableImplement();
    protected AttributeItem KeyID = null;
    protected List<DataBaseField> fieldList = new List<DataBaseField>();
    ITableImplement resultObj = new ITableImplement();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        base.InitModule(ref valObj, ref KeyID, ref fieldList);
        
        title = valObj._ZhName + "编辑";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
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
            try
            {
                if (string.IsNullOrEmpty(keyid))//新增
                {
                }
                else//修改
                {
                    ITableImplement cond1 = valObj.Clone(); cond1.SetValue(KeyID, keyid);
                    resultObj = BLLTable<ITableImplement>.Factory(conn).GetRowData(valObj, cond1);
                    if (resultObj == null)
                    {
                        ScriptHelper.Alert(this, "记录不存在");
                        ScriptHelper.CloseMe(this); return;
                    }
                    //string html = Convert.ToString(resultObj.GetValue(WEC_A_VOTE.Attribute.TITLE));
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
        if (valObj.IsNull())
        {
            //valObj.LoadAllAttributes(true);
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            ITableImplement valdata = valObj;//.Clone();

            foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
            {
                if (f1.TableName.ToLower() == valObj._TableName.ToLower())//本表字段
                {
                    string fieldValue;
                    if (TryGetRequest(f1, out fieldValue))
                    {
                        AttributeItem attr1 = new AttributeItem(f1);
                        valdata.SetValue(attr1, fieldValue);
                    }
                }
            }
            
            if (keyid != "")
            {
                valdata.SetValue(valdata.KeyID, Convert.ToDecimal(keyid));
                count = BLLTable<ITableImplement>.Factory(conn).Update(valdata, valdata.KeyID);
            }
            else
            {
                count = BLLTable<ITableImplement>.Factory(conn).Insert(valdata, valdata.KeyID);
                string ss=BLLTable.SQL_Test.ToString();
                keyid = Convert.ToString(valdata.GetValue(valdata.KeyID));

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
                //if (btn.ID.IndexOf("btnOK")!=-1)//保存退出
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';};window.close();", true);
                    }
                }
                //else  //仅保存
                {           
                   
                }
            }
            else
            {
                //如何处理
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
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
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationFK )//父表
        {
            return true;
        }
        return false;
    }

}

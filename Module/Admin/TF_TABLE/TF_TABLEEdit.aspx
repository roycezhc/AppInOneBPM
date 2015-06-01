<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEEdit.aspx.cs" Inherits="TF_TABLEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
       <asp:Literal ID="LitWF" runat="server" EnableViewState="false">
            <!--循环1-->
                <tr><td class='lbl'><label>{字段中文名}：</label></td>");
                    <td colspan='3' class='long'>
                   <!--Switch-->
                        <!--Case InputString--><!--文字-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:{字段js类型枚举},min:0,max:{字段标签长度},need:{字段是否必须}}"/></span>
                        <!--Case CheckBoxList--><!--复选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--图片上传-->
<span><input id="File1" name="{字段控件名}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--文档上传-->
<span><input name="{字段控件名}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML内容-->
<span><textarea cols="80" rows="6" name="{字段控件名}" ck="{type:{字段js类型枚举},min:0,max:{字段标签长度},need:{字段是否必须}}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--日期-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:3,need:{字段是否必须}}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--日期时间-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:3,need:{字段是否必须}}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--数字-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:1,min:{字段最小值},max:{字段最大值},need:{字段是否必须}}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--整数-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:2,min:{字段最小值},max:{字段最大值},need:{字段是否必须}}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--选择部门-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--选择本表记录-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--选择员工-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--单选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--下拉列表-->
<span><select name="{首字母大写字段名}"><!--options--></select></span>
                        
                        <!--Case Text--><!--大文本内容-->
<span><textarea cols="80" rows="6" name="{字段控件名}" ck="{type:{字段js类型枚举},min:0,max:3000,need:{字段是否必须}}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </td></tr>
            <!--结束循环1-->
       </asp:Literal>
       <asp:Literal ID="Lit_Finder" runat="server" EnableViewState="false">
            <!--循环1-->
                    <dl colname="{首字母大写表名}.{首字母大写字段名}">
                    <dt>{字段中文名}：</dt><dd>
                   <!--Switch-->
                        <!--Case InputString--><!--文字-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:{字段js类型枚举},min:0,max:{字段标签长度},need:{字段是否必须}}"/></span>
                        <!--Case CheckBoxList--><!--复选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--图片上传-->
<span><input id="{字段控件名}" name="{字段控件名}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--文档上传-->
<span><input name="{字段控件名}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML内容-->
<span><textarea cols="80" rows="6" name="{字段控件名}" ck="{type:{字段js类型枚举},min:0,max:{字段标签长度},need:{字段是否必须}}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--日期-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:3,need:{字段是否必须}}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--日期时间-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:3,need:{字段是否必须}}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--数字-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:1,min:{字段最小值},max:{字段最大值},need:{字段是否必须}}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--整数-->
<span><input value="{VALUE}" name="{字段控件名}" type="text" ck="{type:2,min:{字段最小值},max:{字段最大值},need:{字段是否必须}}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--选择部门-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--选择本表记录-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--选择员工-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{字段控件名}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--单选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--下拉列表-->
<span><select name="{首字母大写字段名}"><!--options--></select></span>
                        
                        <!--Case Text--><!--大文本内容-->
<span><textarea cols="80" rows="6" name="{字段控件名}" ck="{type:{字段js类型枚举},min:0,max:3000,need:{字段是否必须}}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </dd>
                 </dl>
            <!--结束循环1-->
       </asp:Literal>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>
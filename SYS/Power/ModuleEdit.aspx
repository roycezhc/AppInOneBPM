<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="sys_MenuInfoEdit" Title="系统导航信息" CodeFile="ModuleEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {

        var checker = new formChecker({ btnIDS: 'btnOK,_btnOK' });
    });

    function setpageDir(me) {
        var txt = $(me).parent().parent().next().find("input");
        if(txt.val()==""){
            txt.val(me.value);
        }
    }

    function selTablePage(me) {
        var result = window.showModalDialog('../bill/billsel.aspx?r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == '') return;
        var obj = eval(result);
        var hidUrl = $("input[id$='hidPageUrl']");
        var txtUrl = $("input[id$='txtPageUrl']");
        hidUrl.val("bill/billlist.aspx?billid=" + obj.ID);
        txtUrl.val("bill/billlist.aspx?billid=" + obj.ID);
    }
</script>
<style type="text/css">
.form dl dd input{width:300px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" style=" vertical-align:middle;">
<div class="titnav">
  <dl><dt><b><%=LanguageService.GetLanguageString("SystemMenuEdit", "系统菜单编辑")%></b></dt>
  <dd></dd></dl>

</div>
<div class="warn">
    <asp:Literal ID="litWarn" runat="server"></asp:Literal>

</div>
<div class="tool">
<ol><li><span><asp:Button ID="btnOK" runat="server" Text="保存" onclick="btnOK_Click" Width="60" /></span></li></ol>

</div>
    <div class="form" id="listform">
    <div>
        <dl>
            <dt><%=LanguageService.GetLanguageString("ModelName", "模块名称")%>：</dt>
            <dd><input id="txtModuleName" type="text" runat="server" ck="{need:1,len:240,dtype:0}"/></dd>
            
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("EnglishName", "英语名称")%>：</dt>
            <dd><input id="txtEN" type="text" runat="server" value="english" ck="{need:0,len:240,dtype:0}"/></dd>
            
        </dl>
        <!--模块类型：页面地址，表单模块，数据同步（后台计算服务）-->
         <dl>
            <dt><%=LanguageService.GetLanguageString("WebPageAddress", "页面地址")%>：</dt>
            <dd>
            <input onblur="setpageDir(this);" style="width:400px" id="txtPageUrl" type="text" runat="server" ck="{need:0,len:240,dtype:0}"/>
            <input id="hidPageUrl" type="hidden" runat="server" />
            <input style=" clear:both; width:auto; margin-top:5px; padding-top:2px;" id="btnSelTablePage" name="btnSelTablePage" type="button" onclick="selTablePage(this);" value="<%=LanguageService.GetLanguageString("Select Table Page","选择表单页")%>" />
            </dd>
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("NeedControlAccess", "控制权限")%>：</dt>
            <dd class="ckbs">
                <asp:RadioButtonList ID="rblNeedPower" runat="server" RepeatLayout="Flow">
                <asp:ListItem Value="1" Text="需要"></asp:ListItem>
                <asp:ListItem Value="0" Text="不需要" Selected="True"></asp:ListItem>
                </asp:RadioButtonList> 
            </dd>
        </dl>
         <dl>
            <dt><%=LanguageService.GetLanguageString("SerialNumber", "序号")%>：</dt>
            <dd><input id="txtSortNum" value="0" type="text" runat="server" ck="{need:1,len:999999999,dtype:1}"/>
            <%=LanguageService.GetLanguageString("SerialNumberHelper", "序号越小，越靠前")%>
            </dd>
        </dl>
        <dl style="display:none;">
            <dt><%=LanguageService.GetLanguageString("RelationWebPage", "相关页面")%>：</dt>
            <dd style="width:400px;">
                <textarea id="txtREALPAGES" cols="60" rows="6" style="width:400px;height:80px;" runat="server"></textarea><br />
                
                <span><%=LanguageService.GetLanguageString("Separated by '|', but checked one of the page when the page address corresponding to a page without permission button, button, fill out this check in the page address","多个以'|'隔开,当页面地址对应页无权限按钮，而是签入其中的页面有按钮，则在此填写签入页地址。") %></span></dd>
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("State", "状态")%>：</dt>
            <dd><select id="selState" runat="server" ck="{need:0}">
                <option value="1">正常</option>
                <option value="2">隐藏</option>
                <%--<option value="3">删除</option>--%>
              </select>
            </dd>
        </dl>
        <dl style="display:none;">
            <dt><%=LanguageService.GetLanguageString("ModelPicture", "模块图标")%>：</dt>
            <dd><input id="txtIcoUrl" type="text" runat="server" ck="{need:0,len:240,dtype:0}"/></dd>
        </dl>

    </div>
    <div class="clear"></div>
  </div>
 </div>
</asp:Content>



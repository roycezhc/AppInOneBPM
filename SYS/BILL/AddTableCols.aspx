<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_AddTableCols" CodeFile="AddTableCols.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
     var billid = "<%=billid %>";
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         var divs = $("div.grp");

         var aObjs = divs.find("a");
         for (var a = 0; a < aObjs.length; a++) {
             var aObj = $(aObjs[a]);
             aObj.bind("click", aObj, function (e) {
                 var ttt = e.data.text();
                 if (ttt == "展开") {
                     e.data.parent().next().show(); e.data.text("收起");

                 } else {
                     e.data.parent().next().hide(); e.data.text("展开");
                 }
             });

             aObj.parent().bind("dblclick", aObj, function (e) {
                 var ttt = e.data.text();
                 if (ttt == "展开") {
                     e.data.parent().next().show(); e.data.text("收起");

                 } else {
                     e.data.parent().next().hide(); e.data.text("展开");
                 }
             });
         }
         if (billid == "0") {
             $("#dlBILL_AFTREDTL").hide();
         }
     });
     function _FormView() {//alert("sss");
         var href = "BillView.aspx?BillID=" + billid + "&r=" + Math.random();
         window.parent.frames["ifrShow"].location.href = href;
     }

     function _SetItems(me) {
         var result = window.showModalDialog('COLITEMManage.aspx?ColID=<%=keyid %>&r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
     }

     function tabselallfield(me) {
         var fielddiv = $(me).parent().next();
         var fields = fielddiv.find("input");
         var i = 0;
         for (i = 0; i < fields.length; i++) {
             fields[i].checked = $(me)[0].checked;
         }
     }

     function selfield(me) {
         if (!$(me)[0].checked)
             $(me).parent().parent().parent().parent().prev().find("input")[0].checked = false;
     }

     function getCheckField() {
         var fields = $("#divDbTables").find("dl").find("input");
         var fieldNames = "";
         var i = 0;
         for (i = 0; i < fields.length; i++) {
             if (fields[i].checked)
                 fieldNames += fields[i].value + "|";
         }
         $("[id$=hidCheckFields]").val(fieldNames);
         return true;
     }
</script>
<style type="text/css">
.form dl dt{width:160px;}
.form .dbtable input{width:20px; background-color:transparent;}
.form .fieldcheckboxdl{ text-align:left; width:100%;}
.form .fieldcheckboxdl dl{text-align:left; width:100%;}
.form .fieldcheckboxdl dd{ padding-left:10px; text-align:left; width:100%;}
.form .fieldcheckboxdl input{text-align:left; width:20px; border:0px none #000;background-color:transparent;}
.form .fieldcheckboxdl label{ width:auto;}
.form .keyfield label{ background-color:Yellow;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="添加"
                onclick="btnOK_Click" OnClientClick="return getCheckField();"/></span></li>
    <li><span><input id="Button1" type="button" value="表单预览" onclick="_FormView();"/></span></li>
</ul>
</div>
<div class="tool seltool">
<ul>
<li>
  <label style="display:block; float:left; line-height:25px;">选择数据源：</label>
  <span>
    <asp:DropDownList ID="ddlDataSource" Width="100" runat="server" OnSelectedIndexChanged="ddlDataSource_OnSelectedIndexChanged" AutoPostBack="true">
    </asp:DropDownList>
  </span>
</li>
<li><span><asp:Button ID="btnRefreshDb" runat="server" Text="刷新" onclick="btnbtnRefreshDb_Click"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
       <input id="hidCheckFields" type="hidden" runat="server"/>
       <div id="divDbTables">
           <asp:Repeater ID="repTables" runat="server">
               <ItemTemplate>
               <%#GetShowTableInfo((AgileFrame.Common.DataBaseTable)Container.DataItem)%>
               </ItemTemplate>
           </asp:Repeater>
       </div>
       <div class="clear"></div>
    </div>
</div>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_BASEFORMShow" CodeFile="FORMShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
 <script src="../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../Lib/MyDP/selDate.js" type="text/javascript"></script>
    <script src="../Lib/JScript/urlHeper.js" type="text/javascript"></script>
    <script src="<%= ResolveUrl("~/lib/jquery/jquery-1.11.1.min.js")%>" type="text/javascript"></script>
<script src="<%= ResolveUrl("~/lib/jquery/jquery-ui-1.10.4.min.js") %>" type="text/javascript"></script>
<script src="<%= ResolveUrl("~/lib/jquery/jquery.jsPlumb-1.7.1-min.js") %>" type="text/javascript"></script>
<script src="<%= ResolveUrl("~/lib/StepCtr/StepCtrBase.js") %>" type="text/javascript"></script>
<link href="<%=theme %>/css/common.css" rel="stylesheet" type="text/css"/>
<link href="<%=theme %>/css/global.css" rel="stylesheet" type="text/css"/>
<link href="<%=theme %>/css/page.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript">
    <%=script %>
     String.prototype.replaceAll = stringReplaceAll;

     function stringReplaceAll(AFindText, ARepText) {
         raRegExp = new RegExp(AFindText, "g");
         return this.replace(raRegExp, ARepText)
     }

     $(function () {
        $(".tabs ul li:first").trigger("click");
         var dis = $("form").find("input[disabled='disabled']");
         dis.addClass("dis");

         var procid = '<%=PROCID %>';//只提醒一次
         if (procid == '0') {
             alert("系统提示：此单据未提交审批！");
             return;
         }else
            $("tbody.wfpath").find("dl dd a").trigger("click");//触发"审批记录按钮"
     });

       function showCkLog(me,stepid) {
           var wfid = '<%=WF_OBJ_ID %>';
           var procid = '<%=PROCID %>';
           if (procid == '0') {
               alert("未开始审批，无记录！");
               return;
           }
           var sss = $(me).attr("exd");// alert("Back.aspx?WFID=" + wfid + "&PROCID=" + procid + "&StepID=" + stepid + "&RECID=<%=PROCID %>&showlog=" + Math.random());
           if (sss != "2") {
               if (sss == undefined) {
                   $.ajax({
                       url: "Back.aspx?WFID=" + wfid + "&PROCID=" + procid + "&StepID=" + stepid + "&RECID=<%=recid %>&showlog=" + Math.random(),
                       cache: false,
                       success: function (svrData) {
                           //alert(svrData);
                           $(me).parent().parent().next().html(svrData);
                           $(me).attr("exd", "2");
                           $(me).parent().parent().next().show();
                       },
                       error: function (a, b, c) {
                           alert("sss");
                       }
                   });
               } else {
                   $(me).attr("exd", "2");
                   $(me).parent().parent().next().show();
               }
           } else {
               $(me).parent().parent().next().hide();
               $(me).attr("exd", "1");
           }
       }

       function GoClose(me) {
           if (me.value =="关闭")
           {
                window.close();
           }
           if (urlHelper.hadParaName("fromTab")) {
               parent.closeTab(urlHelper.getPValByName("fromTab"));
           } else { 
                window.history.back();
           }
       }

    function showhideproc(me) {
        var d = $(me).text(); //alert($(me).parent().parent().parent().next().html());
        if (d == "关闭") {
            $(me).parent().parent().parent().next().hide();
            $(me).text("展开");
        } else {
            $(me).parent().parent().parent().next().show();
            $(me).text("关闭");
        }
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

<%--<object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" name="wb" width="0"></object>--%>

<script type="text/javascript">
    function goPrint() {
        var url = window.location.href.toLowerCase();
        url = url.replace("formshow.aspx", "formprint.aspx");
        window.open(url);
    }
</script>
<div class="main">
   <div class="titnav">
        <dl><dt><b><%=title %></b></dt></dl>
     </div>
   <div class="warn">
    <asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
   </div>
   <div class="tabs">
        <ul><li><a>详细信息</a></li><li class="show"><a>审批过程与流程图</a></li></ul>
        <ol><li>
            <div class="tbill">
              <h2><asp:Literal ID="litTitle" runat="server">单据信息</asp:Literal></h2>
              <table cellpadding="0" cellspacing="0">
              <tbody>
              <asp:Literal ID="litDetail" runat="server"></asp:Literal>
              <asp:Literal ID="litAnnex" runat="server"></asp:Literal>
              </tbody>
              </table>

            </div>
            
        </li>
        <li class="show">

            <div class="tbill" style="margin: auto;margin-right: 5px;float: left;">
              <table cellpadding="0" cellspacing="0">
              <tbody><tr class="grp"><td colspan="4"><span>审批过程与流程图</span></td></tr></tbody>
              <tbody class="wfpath">
                <asp:Literal ID="litWFPath" runat="server"></asp:Literal>
              </tbody>
            
              </table>
                 
            </div>
            <div id="right" style=" left:auto; width:auto; position:relative;height:400px;">
                <%=htmlText %>
            </div>
            
        </li>
        </ol>

    </div>

   <div class="tool">
    <%--   <asp:Button ID="btnToORIG" runat="server" Text="Button" 
           onclick="btnToORIG_Click" />--%>
        <p>
            <span><asp:Button ID="btnSubmit" runat="server" Text="提交审批" 
                onclick="btnSubmit_Click"/></span>
            <span><input id="btnBack" value="返回" type="button" runat="server" onclick="GoClose(this);" /></span>
           <span><asp:Button ID="btnToCheck" runat="server" Text="马上审批" onclick="btnToCheck_Click"/></span>
           <span><asp:Button ID="btnStop" runat="server" Text="终止" 
                onclick="btnStop_Click" OnClientClick="return confirm('您确定要终止当前过程吗？');" /></span>
           <span><asp:Button ID="btnToEdit" runat="server" Text="修改" 
                onclick="btnToEdit_Click" /></span>

                <span><input type="button" name="button_print" value="打印" onclick="goPrint();"/></span>
        </p>
        
  </div>
</div>
</asp:Content>
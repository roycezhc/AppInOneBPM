<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_BASEFORMPrint" CodeFile="FORMPrint.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
 <script src="../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../Lib/MyDP/selDate.js" type="text/javascript"></script>
    <script src="../Lib/JScript/urlHeper.js" type="text/javascript"></script>
 <script type="text/javascript">
     String.prototype.replaceAll = stringReplaceAll;

     function stringReplaceAll(AFindText, ARepText) {
         raRegExp = new RegExp(AFindText, "g");
         return this.replace(raRegExp, ARepText)
     }

     $(function () {

         var dis = $("form").find("input[disabled='disabled']");
         dis.addClass("dis");

         var aobjs = $(".wfpath tr td dl dd a");
         aobjs.trigger("click");
     });

       function showCkLog(me,stepid) {
           var wfid = '<%=WFOBJ_ID %>';
           var procid = '<%=PROCID %>';
           if (procid == '0') {
               //alert("未开始审批，无记录！");
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

       function GoClose() {
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
    <link href="../Themes/Default/print.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" name="wb" width="0"></object> 
<script type="text/javascript">
    function SetPrintSettings() {
        //   --   advanced   features  
        factory.printing.SetMarginMeasure(2)   //   measure   margins   in   inches  
        factory.SetPageRange(false, 1, 3)   //   need   pages   from   1   to   3  
        factory.printing.printer = "HP   DeskJet   870C "
        factory.printing.copies = 2
        factory.printing.collate = true
        factory.printing.paperSize = "A4 "
        factory.printing.paperSource = "Manual   feed "
        //   --   basic   features  
        factory.printing.header = "This   is   MeadCo "
        factory.printing.footer = "Advanced   Printing   by   ScriptX "
        factory.printing.portrait = false
        factory.printing.leftMargin = 1.0
        factory.printing.topMargin = 1.0
        factory.printing.rightMargin = 1.0
        factory.printing.bottomMargin = 1.0
    }
    function printsetup() {
        //   打印页面设置
        var wb = document.getElementById("wb");
        execwb1(wb, 8, 1);
    }
    function printpreview() {
        //   打印页面预览  
        var wb = document.getElementById("wb");
        execwb1(wb, 7, 1);
    }
    function printit() {
        var wb = document.getElementById("wb");
        if (confirm('确定打印吗？ ')) {
            execwb1(wb, 6, 6);
        }
    }
    function execwb1(wb, n1, m1) {
        try {
           wb.execwb(n1, m1);
        }
        catch (e) {
            alert("打开打印机失败，请把此地址加入信任列表，以便于系统安装打印activeX控件，您可技术联系管理员");
        }
    }

</script> 
   
<div class="main print"> 
   <div class="tbill">
      <table cellpadding="0" cellspacing="0">
      <caption><asp:Literal ID="litTitle" runat="server">单据信息</asp:Literal></caption>
      <tbody>
      <asp:Literal ID="litDetail" runat="server"></asp:Literal>
      <asp:Literal ID="litAnnex" runat="server"></asp:Literal>
      </tbody>
      <tbody><tr class="grp"><td colspan="4"><span>审批过程与日志</span><a onclick="showhideproc(this);">关闭</a></td></tr></tbody>
      <tbody class="wfpath">
        <asp:Literal ID="litWFPath" runat="server"></asp:Literal>
      </tbody>
      </table>

    </div>
   
   <div class="tool">
        <p>
                <span><input type="button" name="button_print" value="打印" onclick="javascript:printit();"/></span>
                <span><input type="button" name="button_print" value="打印预览" onclick="javascript:printpreview();"/></span>
                <span><input type="button" name="button_print" value="打印设置" onclick="javascript:printsetup();"/></span>
        </p>
        
  </div>
</div>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Admin_STEP_RoateSetting" CodeFile="RoateSetting.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/jsPlugin/tabs/tabs.js" type="text/javascript"></script>
 <script type="text/javascript">
     function tabClick(tabObj, contObj) {
         var src = contObj.find("iframe").attr("src");//alert(src);
         if (src != undefined && src != "") {
             return;
         }
         var url = tabObj.attr("href") + "?PROCID=<%=procid %>&WFID=<%=wfid %>" + "&setpSetting=" + Math.random();
         url += "&STEP_ID=<%=stepid %>";
         contObj.find("iframe").attr("src", url);

         
     }
 </script>

    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tabs">
   <div>
      <a href="STEPEdit.aspx"><b>路由基本信息</b></a>
      <a href="NextSTEPS.aspx"><b>入口条件与后继节点</b></a>
      <a href="../STEP_ACTION/QianZi.htm"><b>路由结束时动作</b></a>
   </div>
   <div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto" src="STEPEdit.aspx?STEP_ID=<%=stepid %>&setpSetting=1"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
   </div>
</div>
</asp:Content>


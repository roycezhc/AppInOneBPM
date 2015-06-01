<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Admin_STEP_StepSetting" CodeFile="StepSetting.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/jsPlugin/tabs/tabs.js" type="text/javascript"></script>
 <script type="text/javascript">
     function tabClick(tabObj, contObj) {
         var src = contObj.find("iframe").attr("src");//alert(src);
         if (src != undefined && src != "") {
             return;
         }
         var url = tabObj.attr("href") + "?PROCID=<%=procid %>&WFID=<%=wfid %>" + "&setpSetting=" + Math.random();
         var previd = '<%=previd %>';
         if (tabObj.text() == "条件") {
             if (previd != '0') {
                 url += "&NextID=<%=stepid %>&STEP_ID=" + previd + "&from=2&PATH_TYPE=1";
                 contObj.find("iframe").attr("src", url);
             } else {
                 alert("此默认路线不能设置条件！");
             }
             
         } else {
             url += "&STEP_ID=<%=stepid %>";
             contObj.find("iframe").attr("src", url);
         }         
     }
 </script>

    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tabs">
   <div>
      <a href="STEPEdit.aspx"><b>任务基本属性</b></a>
      <a href="../CHECKER/CHECKERManage.aspx"><b>审核人(执行人)</b></a>      
      <a href="../NOTIFIER/NOTIFIERManage.aspx"><b>通知人</b></a>   
      <a href="../STEPFORM/SFManage.aspx"><b>处理表单</b></a>
      <a href="../CondSet.aspx"><b>条件</b></a>

      <a href="../STEP_ACTION/TiXing.htm"><b>激活时执行</b></a>
      <a href="../STEP_ACTION/Explorer.htm"><b>手动执行</b></a>
      <a href="../STEP_ACTION/QianZi.htm"><b>完成时执行</b></a>

   </div>
   <div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto" src="STEPEdit.aspx?STEP_ID=<%=stepid %>&setpSetting=1"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>

      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
      <div style="height:550px;"><iframe frameborder="0" scrolling="auto"></iframe></div>
   </div>
</div>
</asp:Content>


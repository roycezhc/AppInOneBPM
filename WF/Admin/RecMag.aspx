<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Admin_RecMag" CodeFile="RecMag.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <%--<script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>--%>
<script type="text/javascript">
    $(function () {
        bindWinResize(40);        
    });

    function doResize() {//重写了js里的函数
        var winH = $(window).height();
        $("div.left").height(winH - 20);
        $("div.right").height(winH - 20);
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
  <div class="lrlayout" style="border:solid 1px #999;">
    <div class="left" style="width:200px;border:none;">
       <div class="box2" runat="server">
           <dl><dt>流程导航</dt><dd></dd></dl>
           <ul>
              <asp:Literal ID="litWFS" runat="server"></asp:Literal>
           </ul>
       </div>
    </div>
    <div class="right" style="margin-left:202px;">
      <iframe src="RecManage.aspx" id="recmanage" name="recmanage"></iframe>
    </div>
  </div>
</asp:Content>


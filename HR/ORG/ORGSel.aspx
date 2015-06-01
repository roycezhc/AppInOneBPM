<%@ Page Title="机构选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_Dept_Sel" CodeFile="ORGSel.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/JScript/chxTree.js" type="text/javascript"></script>

<script type="text/javascript">
var CT=Chx.Tree;
var myTree;
$(function () {
    myTree = new CT.TreeView("treemag");
     CT.magParam.backSvrUrl = "ORGBack.aspx";

    $(window).bind("resize", null, function (e) {
        var h = $(window).height();
        $("#treemag").height(h - 10);
    });
});

//重写chxTree.js里的方法，执行特殊操作
function gotoPageByNode(tn) {
    var jsonStr = tn.getData(); 
    window.returnValue = "(" + jsonStr + ")"; //返回一个JSON格式的字符串。 alert(window.returnValue);
    window.close();
}

 function beforeShowMenu(curSelNode) {
     return false;
 }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
<div class="mytree" id="treemag">
        <ul><asp:Literal ID="litChnl" runat="server"></asp:Literal>
        </ul>
</div></div>
</asp:Content>


<%@ Page Title="部门选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_StationSelect" CodeFile="StationSelect.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/JScript/chxTree.js" type="text/javascript"></script>

<script type="text/javascript">
var CT=Chx.Tree;
var myTree;
$(function () {
    myTree = new CT.TreeView("treemag");
    CT.magParam.backSvrUrl = "STATIONBack.aspx<%=moreP %>";
    //CT.magParam.expNType = "dept";
 

    $(window).bind("resize", null, function (e) {
        var h = $(window).height();
        $("#treemag").height(h - 10);
    });
});

//重写chxTree.js里的方法，执行特殊操作
function gotoPageByNode(tn) {
    var jsonStr = tn.getData();
    if (jsonStr.indexOf("ntype:'dept'") != -1) {
        if (navigator.userAgent.indexOf("Chrome") < 0) {
            window.returnValue = "(" + jsonStr + ")"; //返回一个JSON格式的字符串。 alert(window.returnValue);
        } else {
            window.opener.returnValue = "(" + jsonStr + ")";
            window.opener.cb2();
        }
        window.close();
    }
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
    </div>
</div>
</asp:Content>


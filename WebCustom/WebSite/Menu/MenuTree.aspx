<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="MenuTree.aspx.cs" Inherits="WECAdmin_WebSite_Menu_MenuTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
<script src="../../../Lib/JQuery/jquery.min.js" type="text/javascript"></script>
<script src="../../../Lib/JScript/chxTree.js" type="text/javascript"></script>
<script src="../../../Lib/JScript/InitWH.js" type="text/javascript"></script>
<script type="text/javascript">
    var CT = Chx.Tree;
    var myTree;
    $(function () {
        myTree = new CT.TreeView("treemag");

        CT.magParam.editUrl = "MenuEdit.aspx";
        CT.magParam.manageUrl = "SiteColumnManage.aspx";
        CT.magParam.backSvrUrl = "MenuBack.aspx";
        CT.magParam.showUrl = "SiteColumnShow.aspx";
        CT.magParam.defaultUrl = "MenuEdit.aspx?toEdit=1";

        $("#btnAdd").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toAddSubNodePage();
        });

        $("#btnEdit").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toEditNodePage();
        });

        $("#btnDel").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.removeNode();

        });

        $("#btnUp").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toUp();
        });

        $("#btnDown").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toDown();

        });

        $("#btnSort").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "SiteColumnSort.aspx?PID=" + objData.id + "&tree=" + Math.random());
        });

        bindWinResize();
    });
    function doResize() {
        //InitDivH(3, new Array($("div.left"), $("div.right")));
        var wh = $(window).height();
        $("#treemag").height(wh - 10);
        $("#ifrMain").height(wh - 10);
    }
    function reShowSubNodes(reP) {
        if (reP == true) {
            var tn = CT.toTreeNode(myTree.getSelNode().parent().parent());
            tn.toReShowSubNodes();
        } else {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toReShowSubNodes();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="lrlayout">
    <div class="left" style="width:180px;height:auto;">
        <div class="mytree" id="treemag" style=" overflow:auto;">
             <ul><asp:Literal ID="litChnl" runat="server"></asp:Literal>
             </ul>
        </div>
     </div>
     <div class="right" style="margin-left:182px;height:auto;">
     <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>

 <div id="ulMenu" class="popUpMenu">
    <a href="#" id="btnAdd">添加菜单</a>
    <a href="#" id="btnEdit">修改菜单</a>
    <a href="#" id="btnUp">上移一位</a>
    <a href="#" id="btnDown">下移一位</a>
    <a href="#" id="btnDel">删除菜单</a>
    <a href="#" id="btnSort">排序子菜单</a>
 </div>
</asp:Content>


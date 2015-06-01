<%@ Page Title="知识管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUManage" CodeFile="KM_PART_STRUManage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../../Lib/JQuery/jquery.min.js"></script>
<script src="../../Lib/JScript/chxTree.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var CT = Chx.Tree;
    var myTree;
    $(function () {

        CT.magParam.editUrl = "KM_PART_STRUEdit.aspx";
        CT.magParam.manageUrl = "KM_PART_STRUManage.aspx";
        CT.magParam.backSvrUrl = "KM_PART_STRUBack.aspx";
        CT.magParam.showUrl = "KM_PART_STRUEdit.aspx";
        CT.magParam.defaultUrl = "KM_PART_STRUEdit.aspx";
        CT.magParam.expNType = "KM_PART_STRU";
        myTree = new CT.TreeView("treemag");

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
            $("#ifrMain").attr("src", "DeptSort.aspx?id=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });

        $("#btnManager").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "MANAGERManage.aspx?DEPT_ID=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });

        $("#btnStation").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "../Station/StationManage.aspx?id=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });

        bindWinResize();

    });
    function doResize() {
        //InitDivH(3, new Array($("div.left"), $("div.right")));
        var wh = $(window).height();
        $("#treemag").height(wh - 10);
        $("#ifrMain").height(wh - 10);
    }

    function reShowSubNodes() {
        var tn = CT.toTreeNode(myTree.getSelNode());
        tn.toReShowSubNodes();
    }

    function beforeShowMenu(liObj) {
        var dataObj = eval("(" + liObj.attr("data") + ")");
        $("#btnEdit").show(); $("#btnUp").show(); $("#btnDown").show(); $("#btnDel").show(); $("#btnManager").show();
        $("#btnStation").show();
        if (dataObj.id == "0") {
            $("#btnEdit").hide(); $("#btnUp").hide(); $("#btnDown").hide(); $("#btnDel").hide(); $("#btnManager").hide();
        }
        if (dataObj.ntype == "org") {
            $("#btnEdit").hide(); $("#btnUp").hide(); $("#btnDown").hide();
            $("#btnManager").hide(); $("#btnDel").hide();
        }
    }
</script>
<style type="text/css">
.mytree ul li.leaf div em{margin-left:0px;}
</style>
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
    <a href="#" id="btnAdd" power="newDept">添加</a>
    <a href="#" id="btnEdit" power="editDept">修改</a>
   <%-- <a href="#" id="btnUp">上移一行</a>
    <a href="#" id="btnDown">下移一行</a>--%>
    <%--<a href="#" id="btnManager" power="ManagerSet">领导配置</a>
    <a href="#" id="btnStation" power="StationMag">岗位配置</a>--%>
    <a href="#" id="btnDel" power="delDept">删除</a>
    <a href="#" id="btnSort">排序</a>
 </div>
</asp:Content>
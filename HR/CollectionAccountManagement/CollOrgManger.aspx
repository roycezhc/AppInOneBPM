<%@ Page Title="多系统组织机构综合管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CollectionAccountManagement_CollOrgManger2" CodeFile="CollOrgManger.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../../Lib/JQuery/jquery.min.js"></script>
<script src="../../Lib/JScript/chxTree.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var CT = Chx.Tree;
    var myTree;
    $(function () {

        CT.magParam.editUrl = "DeptEdit.aspx";
        CT.magParam.manageUrl = "DeptManage.aspx"; 
        CT.magParam.backSvrUrl = "DeptBack.aspx";
        CT.magParam.showUrl = "DeptEdit.aspx";
        CT.magParam.defaultUrl = "STAFFManage.aspx";
        CT.magParam.expNType = "dept";
        myTree = new CT.TreeView("treemag");

        $(window).bind("resize", null, function (e) {
            var h = $(window).height();
            var th = $(".titnav").height() + 2;
            $("#treemag").height(h - th);
            $(".right").height(h - th);
        });
        var h = $(window).height();
        var th = $(".titnav").height() + 2;
        $("#treemag").height(h - th);
        $(".right").height(h - th);

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

        $("#btnMove").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "MoveManage.aspx?KeyID=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });

        $("#btnOrgAdd").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "../ORG/ORGEdit.aspx?tree=" + Math.random());
        });
        $("#btnOrgEdit").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "../ORG/ORGEdit.aspx?KeyID=" + objData.id + "&tree=" + Math.random());
        });
        $("#btnOrgDel").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.removeNode();
        });
        bindWinResize();

    });
    function doResize() {
        //InitDivH(3, new Array($("div.left"), $("div.right")));
        var wh = $(window).height();
        var hh = $(".titnav").height();
        $("#treemag").height(wh - hh - 2);
        $("#ifrMain").height(wh - hh - 2);
    }

    function gotoMangerOrg() {
        $("#ifrMain").attr("src", "../ORG/ORGManage.aspx?tree=" + Math.random());
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

    function beforeShowMenu(liObj) {
        $("#btnAdd").hide();
        $("#btnEdit").hide();
        $("#btnDel").hide();
        $("#btnMove").hide();
        $("#btnOrgAdd").hide();
        $("#btnOrgEdit").hide();
        $("#btnOrgDel").hide();
        if (liObj == null) return;
        var dataObj = eval("(" + liObj.attr("data") + ")");
        if (dataObj.ntype == "root") {
            $("#btnOrgAdd").show();
        }
        else if (dataObj.ntype == "org") {
            $("#btnOrgEdit").show();
            $("#btnOrgDel").show();
            $("#btnAdd").show();
        }
        else if (dataObj.ntype == "dept") {
            $("#btnAdd").show();
            $("#btnEdit").show();
            $("#btnDel").show();
            $("#btnMove").show();
        }
    }

    function deviceManger() {
        $("#ifrMain").attr("src", "HR_CHECKWORKDEVICE/HR_CHECKWORKDEVICEManage.aspx?r=" + Math.random());
        //window.showModalDialog("HR_CHECKWORKDEVICE/HR_CHECKWORKDEVICEManage.aspx?r=" + Math.random(), "newwindow", "dialogHeight=500px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");
    }
</script>
<style type="text/css">
.mytree ul li.leaf div em{margin-left:0px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="titnav">
    <dl><dt><b><%=title %></b></dt><dd><a onclick='deviceManger();'>设备管理</a></dd></dl>
</div>
<div class="lrlayout">
    <div class="left" style="width:240px;height:auto;">
        <div class="mytree" id="treemag" style=" overflow:auto;">
             <ul><asp:Literal ID="litChnl" runat="server"></asp:Literal>
             </ul>
        </div>
     </div>
     <div class="right" style="margin-left:242px;height:auto;">
         <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>
 <div id="ulMenu" class="popUpMenu">
    <a href="#" id="btnOrgAdd" power="newOrg">添加机构</a>
    <a href="#" id="btnOrgEdit" power="editOrg">修改机构</a>
    <a href="#" id="btnOrgDel" power="delOrg">删除机构</a>
    <a href="#" id="btnAdd" power="newDept">添加部门</a>
    <a href="#" id="btnEdit" power="editDept">修改部门</a>
    <a href="#" id="btnMove" power="moveDept">转移部门</a>
    <a href="#" id="btnDel" power="delDept">删除部门</a>
 </div>
</asp:Content>


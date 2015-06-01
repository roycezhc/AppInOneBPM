<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CollectionAccountManagement_CollAccountManger2" CodeFile="CollAccountManger.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
<script src="../../Lib/JScript/chxTree.js" type="text/javascript"></script>
    <link href="../CheckWork/Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="../CheckWork/Uploadify/jquery_loadmask.js" type="text/javascript"></script>

<script type="text/javascript">
    var CT = Chx.Tree;
    var myTree;
    $(function () {
        myTree = new CT.TreeView("treemag");

        CT.magParam.backSvrUrl = "DeptBack.aspx<%=moreP %>";

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

        $("#btnReflesh").bind("click", function (event) {
            var tn = CT.toTreeNode(myTree.getSelNode());
            tn.toReShowSubNodes();
        });

        $("#btnAddOrg").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "OrgEdit.aspx?new=1&r=" + Math.random());
        });
        $("#btnEditOrg").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "OrgEdit.aspx?edit=1&id=" + objData.id + "&r=" + Math.random());
        });
        $("#btnDelOrg").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            if (!confirm("确定要删除组织: " + objData.name + " 和它的所有子集吗？"))
                return;
            $("#ifrMain").attr("src", "OrgEdit.aspx?del=1&id=" + objData.id + "&r=" + Math.random());
        });

        $("#btnAddDept").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "DeptEdit.aspx?new=1&r=" + Math.random());
        });
        $("#btnEditDept").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "DeptEdit.aspx?edit=1&id=" + objData.id + "&r=" + Math.random());
        });
        $("#btnDelDept").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            if (!confirm("确定要删除部门: " + objData.name + " 和它的所有子集吗？"))
                return;
            $("#ifrMain").attr("src", "DeptEdit.aspx?del=1&id=" + objData.id + "&r=" + Math.random());
        });

        $("#btnAddStaff").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "StaffEdit.aspx?new=1&r=" + Math.random());
        });
        $("#btnEditStaff").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            $("#ifrMain").attr("src", "StaffEdit.aspx?edit=1&id=" + objData.id + "&r=" + Math.random());
        });
        $("#btnDelStaff").bind("click", function (event) {
            var objData = eval('( ' + myTree.getSelNode().attr("data") + ') ');
            if (!confirm("确定要删除员工: " + objData.name + " 吗？"))
                return;
            $("#ifrMain").attr("src", "StaffEdit.aspx?del=1&id=" + objData.id + "&r=" + Math.random());
        });
        //$("#ifrMain")[0].src = "V_SchedulingSchClass/SchedulingShow.aspx?r=" + Math.random();
    });

    //重写chxTree.js里的方法，执行特殊操作
    function gotoPageByNode(tn) {
        $(".right").mask("正在载入，请稍后......");
        var jsonStr = tn.getData();
        var objData = eval('( ' + jsonStr + ') ');
        if (jsonStr.indexOf("ntype:'org'") != -1) {
            $("#ifrMain")[0].src = "OrgEdit.aspx?show=1&orgid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        else if (jsonStr.indexOf("ntype:'dept'") != -1) {
            $("#ifrMain")[0].src = "DeptEdit.aspx?show=1&deptid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        else if (jsonStr.indexOf("ntype:'man'") != -1) {
            $("#ifrMain")[0].src = "StaffEdit.aspx?show=1&staffid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        $(".right").unmask();
    }

    function beforeShowMenu(curSelNode) {
        $("#btnAddOrg").hide();
        $("#btnEditOrg").hide();
        $("#btnDelOrg").hide();
        $("#btnAddDept").hide();
        $("#btnEditDept").hide();
        $("#btnDelDept").hide();
        $("#btnAddStaff").hide();
        $("#btnEditStaff").hide();
        $("#btnDelStaff").hide();
        $("#btnReflesh").hide();
        var tn = Chx.Tree.toTreeNode(curSelNode);
        var jsonStr = tn.getData();
        var objData = eval('( ' + jsonStr + ') ');
        if (jsonStr.indexOf("ntype:'root'") != -1) {
            $("#btnAddOrg").show();
            $("#btnReflesh").show();
        } else if (jsonStr.indexOf("ntype:'org'") != -1) {
            $("#btnAddOrg").show();
            $("#btnAddDept").show();
            $("#btnEditOrg").show();
            $("#btnDelOrg").show();
            $("#btnReflesh").show();
        } else if (jsonStr.indexOf("ntype:'dept'") != -1) {
            $("#btnAddDept").show();
            $("#btnEditDept").show();
            $("#btnDelDept").show();
            $("#btnAddStaff").show();
            $("#btnReflesh").show();
        }
        else if (jsonStr.indexOf("ntype:'man'") != -1) {
            $("#ifrMain")[0].src = "DeptEdit.aspx?staffid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
            $("#btnEditStaff").show();
            $("#btnDelStaff").show();
            //$("#btnReflesh").show();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="lrlayout">
    <div class="left" style="width:200px;height:auto;">

        <div class="mytree" id="treemag" style=" overflow:auto;">
             <ul><asp:Literal ID="litChnl" runat="server"></asp:Literal>
             </ul>
        </div>
     </div>
     <div class="right" style="margin-left:200px;height:auto;">
         <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
    </div>
    <div id="ulMenu" class="popUpMenu">
        <a href="#" id="btnAddOrg" power="newOrg">新建组织</a>
        <a href="#" id="btnEditOrg" power="editOrg">修改组织</a>
        <a href="#" id="btnDelOrg" power="delOrg">删除组织</a>
        <a href="#" id="btnAddDept" power="newDept">新建部门</a>
        <a href="#" id="btnEditDept" power="editDept">修改部门</a>
        <a href="#" id="btnDelDept" power="delDept">删除部门</a>
        <a href="#" id="btnAddStaff" power="newStaff">新建员工</a>
        <a href="#" id="btnEditStaff" power="editStaff">修改员工</a>
        <a href="#" id="btnDelStaff" power="delStaff">删除员工</a>
        <a href="#" id="btnReflesh">刷新</a>
 </div>
</div>
</asp:Content>

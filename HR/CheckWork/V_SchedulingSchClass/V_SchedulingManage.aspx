<%@ Page Title="排班管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SH_CheckWork_SchedulingManage" CodeFile="V_SchedulingManage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
<script src="../../../Lib/JScript/chxTree.js" type="text/javascript"></script>
    <link href="../Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="../Uploadify/jquery_loadmask.js" type="text/javascript"></script>

<script type="text/javascript">
    var CT = Chx.Tree;
    var myTree;
    $(function () {
        myTree = new CT.TreeView("treemag");

        CT.magParam.backSvrUrl = "DeptBack.aspx<%=moreP %>";

        $(window).bind("resize", null, function (e) {
            var h = $(window).height();
            $("#treemag").height(h - 10);
            $(".right").height(h - 10);
        });
        var h = $(window).height();
        $("#treemag").height(h - 10);
        $(".right").height(h - 10);
    });

    //重写chxTree.js里的方法，执行特殊操作
    function gotoPageByNode(tn) {
        $(".right").mask("正在载入，请稍后......");
        var jsonStr = tn.getData();
        var objData = eval('( ' + jsonStr + ') ');
        if (jsonStr.indexOf("ntype:'org'") != -1) {
            $("#ifrMain")[0].src = "V_SchedulingSchClassBuild.aspx?orgid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        else if (jsonStr.indexOf("ntype:'dept'") != -1) {
            $("#ifrMain")[0].src = "V_SchedulingSchClassBuild.aspx?deptid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        else if (jsonStr.indexOf("ntype:'man'") != -1) {
            $("#ifrMain")[0].src = "V_SchedulingSchClassBuild.aspx?staffid=" + objData.id + "&name=" + encodeURI(objData.name) + "&r=" + Math.random();
        }
        $(".right").unmask();
    }

    function beforeShowMenu(curSelNode) {
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" style="width:980px">
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
     <div class="right" style="margin-left:195px;height:auto;">
     <iframe src="V_SchedulingSchClassBuild.aspx<%=idstr %>" id="ifrMain" frameborder="0"></iframe>
     </div>
    </div>
</div>
</asp:Content>

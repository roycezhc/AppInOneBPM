<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMATree" CodeFile="KM_KNMATree.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        var tnTime = null;
        var tnMan = null;
        var tv = new TV.Tree("treemag", {
            selNodeHandle: function (tn) {
                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                var objData = tn.getDataObj();
                var url = "KM_KNMAList.aspx";
                if (tn.getNTYPE() == "dept" || tn.getNTYPE() == "man") {
                    url = "KM_KNMAList.aspx?" + tn.getDataPara();
                    if (tnTime != null) {
                        var objData1 = tnTime.getDataObj();
                        url += "&typestr=" + objData1.typestr;
                    }
                    tnMan = tn;
                }

                $("#ifrMain").attr("src", url);

                return false;
            },
            pageBack: 'BackSvr.aspx?treepower=1', //设置异步处理的后台页面地址
            pageDefault: "KM_KNMAList.aspx",
            skin: "org"
            exdPath: 'aaa'
        });
        tv.addMenu("btnLogShow", "日志汇报", function (tn) {
            var objData = tn.getDataObj();
            var url = "LogList.aspx?id=" + objData.id + "&ntype=" + objData.ntype + "&preUel=&tree=" + Math.random();

            $("#ifrMain").attr("src", url);
            return false;
        });

        tv.addMenu("btnClearSelNode", "清除选择", function (tn) {
            tnTime = null;
            tnMan = null;
        });

        tv.beforeShowMenu = function () {
            var objData = this.getSelNode().getDataObj();
            var ntype = objData.ntype;
            $("#btnLogShow").hide();
            if (ntype == "man") {
                $("#btnLogShow").show();
            }
        }

        var tvTime = new TV.Tree("treemag1", {
            selNodeHandle: function (tn) {
                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                var objData = tn.getDataObj();
                var url = "KM_KNMAList.aspx?typestr=" + objData.typestr;
                if (tnMan != null) {
                    url += "&" + tnMan.getDataPara();
                }
                tnTime = tn;

                $("#ifrMain").attr("src", url);

                return false;
            },
            pageBack: 'BackSvr.aspx', //设置异步处理的后台页面地址
            pageDefault: "KM_KNMAList.aspx"
            exdPath: 'aaa'
        });

        tvTime.addMenu("btnClearSelNode", "清除选择", function (tn) {
            tnTime = null;
            tnMan = null;
        });
        
        bindWinResize();
    });
    function doResize() {
        InitDivH(3, new Array($("div.left"), $("div.right")));
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

<%@ Page Title="菜单管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_SYS_MenuManage" CodeFile="ModuleManage.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../../Lib/JQuery/jquery.min.js"></script>
<script src="../../Lib/jsPlugin/divTree/divTree.js?<%=System.DateTime.Now.Ticks %>" type="text/javascript"></script>
<script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>

<script type="text/javascript">

    $(function () {
        var tv = new TV.Tree("treemag", {
            selNodeHandle: function (tn) {
                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                var ntype = tn.getNTYPE();
                if (ntype == "root") {//点击根目录时
                    return false;
                }
                if (ntype == "mdl") {//点击叶节点时
                    //alert(tn.getDataPara());
                    $("#ifrMain").attr("src", "ModuleEdit.aspx?edit=1&" + tn.getDataPara());
                    //$("#ifrMain").attr("src", "ModuleShow.aspx?edit=1&" + tn.getDataPara());
                }
                return false;
            },
            ifrID: 'ifrMain',
            pageBack: 'ModuleBack.aspx', //设置异步处理的后台页面地址
            pageDefault: 'ModuleEdit.aspx',
            showDelete: true,
            checkBox: 0
        });

        //        tv.addMenu("btnUp", "上移一位", function (tn) {
        //            $("#ifrMain").attr("src", "ModuleEdit.aspx?edit=1&" + tn.getDataPara());
        //        });

        //        tv.addMenu("btnDown", "下移一位", function (tn) {
        //            $("#ifrMain").attr("src", "ModuleEdit.aspx?edit=1&" + tn.getDataPara());
        //        });

        tv.addMenu("btnSort", "排序子导航", function (tn) {
            var objData = tn.getDataObj();
            $("#ifrMain").attr("src", "ModuleSort.aspx?PID=" + objData.id + "&tree=" + Math.random());
        });

        tv.addMenu("editTB", "修改信息", function (tn) {
            $("#ifrMain").attr("src", "ModuleEdit.aspx?edit=1&" + tn.getDataPara());
        });
        tv.addMenu("addTB", "添加导航", function (tn) {
            $("#ifrMain").attr("src", "ModuleEdit.aspx?" + tn.getDataPara());
        });

        //自定义扩展按钮
        tv.addMenu("btnPowerDic", "权限字典", function (tn) {
            var objData = tn.getDataObj();
            $("#ifrMain").attr("src", "POWERDIC.aspx?MDL_ID=" + objData.id + "&tree=" + Math.random());
        });

        tv.addMenu("btnDataCols", "数据列", function (tn) {
            var objData = tn.getDataObj();
            $("#ifrMain").attr("src", "../ColSet/PAGE_TBFIND_COLSManage.aspx?MDL_ID=" + objData.id + "&tree=" + Math.random());
        });


        tv.beforeShowMenu = function () {
            var tn = this.getSelNode();
            //隐藏所有按钮
            this.hideMenuItem("addTB", "btnSort", "editTB", "btnDataCols", "btnPowerDic", "showDelete");
            var ntype = tn.getNTYPE();
            if (ntype == "root") {
                this.showMenuItem("addTB"); //根目录显示
            }
            if (ntype == "mdl") {//叶节点显示
                this.showMenuItem("addTB", "editTB", "showDelete", "btnSort", "btnPowerDic", "btnDataCols");
            }
        }
        bindWinResize();
    });

</script>

<script type="text/javascript">
    function doResize() {
        InitDivH(33, new Array($("div.left"), $("div.right")));
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="lrlayout">
    <div class="left" style="width:250px;">
        <div class="divtree" id="treemag">
             <ul>
             <li data="{id:'<%=appid %>',pid:'<%=appid %>',sc:0,name:'<%=this.Title %>模块管理',ntype:'root'}" ><div><b><em></em></b><a href='#'><%=this.Title %> 模块管理</a></div></li>
            <%-- <asp:Literal ID="litChnl" runat="server"></asp:Literal>--%>
             </ul>
        </div>
     </div>
     <div class="right" style="margin-left:252px;">
     <iframe src="ModuleManage_Index.aspx" id="ifrMain" frameborder="0" scrolling="auto">     
     </iframe>
     </div>
</div>
<%-- <div id="ulMenu" class="popUpMenu">
    <a href="#" id="btnAdd">添加导航</a>
    <a href="#" id="btnEdit">修改信息</a>
    <a href="#" id="btnPowerDic">权限字典</a>
    <a href="#" id="btnDataCols">数据列</a>
    <a href="#" id="btnUp">上移一位</a>
    <a href="#" id="btnDown">下移一位</a>
    <a href="#" id="btnDel">删除导航</a>
    <a href="#" id="btnSort">排序子导航</a>
 </div>--%>
</asp:Content>


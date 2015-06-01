<%@ Page Title="部门管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_DEPT_DeptManage" CodeFile="DeptManage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var tv = new TV.Tree("treemag", {
            selNodeHandle: function (tn) {
                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
            },
            pageBack: 'DeptBack.aspx', //设置异步处理的后台页面地址
            pageDefault: "../STAFF/STAFFManage.aspx",
            checkBox: 3,
            showClearCheck: true,
            skin: "org",
            exdPath: '<%=expPath %>'
        });
//        tv.addMenu("btnAdd", "添加", function (tn) {
//            var ids = tv.getCheckedIDS("id,ntype,pid"); //alert(ids);
//            var objData = tn.getDataObj();
//            if (ids == "") {
//                ids = objData.id + ":" + objData.ntype + ":" + escape(objData.name);
//            }
//            $("#ifrMain").attr("src", "TaskEdit.aspx?sels=" + ids + "&ntype=" + objData.ntype + "&id=" + objData.id);


//            var tn = CT.toTreeNode(myTree.getSelNode());
//            tn.toAddSubNodePage();

        //        });

        tv.addMenu("addTB", "新建", function (tn) {
            $("#ifrMain").attr("src", "DeptEdit.aspx?" + tn.getDataPara());
        });
        tv.addMenu("addTB", "修改", function (tn) {
            $("#ifrMain").attr("src", "DeptEdit.aspx?toEdit=1&" + tn.getDataPara());
        });

        tv.addMenu("btnManager", "领导配置", function (tn) {
            var objData = tn.getDataObj();
            $("#ifrMain").attr("src", "MANAGERManage.aspx?DEPT_ID=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });
        tv.addMenu("btnStation", "岗位配置", function (tn) {
            var objData = tn.getDataObj();
             $("#ifrMain").attr("src", "../Station/StationManage.aspx?id=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });
         tv.addMenu("btnMove", "转移部门", function (tn) {
            var objData = tn.getDataObj();
            $("#ifrMain").attr("src", "MoveManage.aspx?KeyID=" + objData.id + "&ntype=" + objData.ntype + "&name=" + escape(objData.name) + "&tree=" + Math.random());
        });

//        tv.beforeShowMenu = function () {
//            var objData = this.getSelNode().getDataObj();
//            var ntype = objData.ntype;
//            $("#btnSendTask").hide();
//            $("#btnLogShow").hide();
//            if (ntype == "dept" || ntype == "man") {
//                $("#btnSendTask").show();
//                if (ntype == "man") {
//                    $("#btnLogShow").show();
//                }
//            }
//        }
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
    <div class="left" style="width:220px;height:550px; overflow:auto;">
         <div class="divtree"><ul id="treemag">
            <li data="{id:'0',pid:'0',sc:0,name:'机构部门管理',ntype:'root'}" ><div><b><em></em></b><a href='#'>机构部门管理</a></div></li>
         </ul></div>
     </div>
     <div class="right" style="margin-left:222px;height:550px;">
     <iframe src="../STAFF/STAFFManage.aspx?id=<%=depid %>" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>
<%-- <div id="ulMenu" class="popUpMenu">
   <a href="#" id="btnSendTask"><%=faburw %></a>
   <a href="#" id="btnLogShow">查看汇报</a>
 </div>--%>
</asp:Content>


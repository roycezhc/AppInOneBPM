<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_STEPManage" CodeFile="STEPManage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script type="text/javascript">
        var wfid = '<%=wfid %>';
        var procid = '<%=procid %>';
        var paras = "WFID="+wfid+"&PROCID="+procid;
        $(function () {
            var tv = new TV.Tree("tree0000", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "proc" || ntype == "begin" || ntype == "end") {
                        return false;
                    }else {
                        $("#ifrMain").attr("src", "STEPEdit.aspx?edit=1&" + paras + "&STEP_ID=" + tn.getID() + "&" + tn.getDataPara());
                    }
                    return false;
                },
                pageBack: 'STEPBack.aspx', //设置异步处理的后台页面地址
                pageDefault: 'STEPEdit.aspx',
                showDelete: true,
                checkBox: 0,
                skin: 'proc',
                exdPath:wfid+","+procid
            });
            tv.addMenu("addStep", "新建节点", function (tn) {
                $("#ifrMain").attr("src", "STEPEdit.aspx?" + paras + "&"+ tn.getDataPara());
            });
            tv.addMenu("stepCheckers", "审核人", function (tn) {
                $("#ifrMain").attr("src", "../CHECKER/CHECKERManage.aspx?" + paras + "&STEP_ID=" + tn.getID() + "&" + tn.getDataPara());
            });
            tv.addMenu("stepForm", "维护栏目", function (tn) {
                $("#ifrMain").attr("src", "../STEPFORM/SFManage.aspx?" + paras + "&STEP_ID=" + tn.getID() + "&" + tn.getDataPara());
            });
            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();
                this.hideMenuItem("addStep", "stepCheckers", "stepForm");
                var ntype = tn.getNTYPE();
                if (ntype == "proc") {
                    this.showMenuItem("addStep"); 
                }
                if (ntype == "step") {
                    this.showMenuItem("stepCheckers", "stepForm");
                }
                if (ntype == "roate") {
                    this.showMenuItem("editTB");
                }
            }
        });
</script>
<style type="text/css">
ul.proc li div b em.begin{background:url(../../../lib/img/rit.gif) no-repeat 0 center;}

ul.proc li div b em.end{background:url(../../../lib/img/rit.gif) no-repeat 0 center;}

ul.proc li div b em.roate{background:url(../../../lib/img/mdl.gif) no-repeat 0 center;}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="titnav">
  <dl><dt><b><asp:Literal ID="litTitle" runat="server">流程节点配置</asp:Literal></b></dt>
  <dd><a href='../PROCESS/PROCESS_SET.aspx?WFID=<%=wfid %>'>过程配置</a><a href='../WFINFO/WFINFOManage.aspx'>返回流程管理</a></dd></dl>
</div>
<div id="lrlayout">
     <div style="width:200px;height:500px;">
        <ul class="divtree" id="tree0000">
            <li data="{id:'<%=wfid %>',pid:'0',name:'流程节点配置',ntype:'root',no:1,sc:0}"><div><b><em></em></b><a>流程节点配置</a></div></li>
        </ul>
     </div>
     <div style="height:500px;">
     <iframe src="" id="ifrMain" frameborder="0" scrolling="auto"></iframe>
     </div>
</div>
<script type="text/javascript">
    $("#lrlayout").Layout_LR({jianH:35,jianW:20});
  </script>
</asp:Content>


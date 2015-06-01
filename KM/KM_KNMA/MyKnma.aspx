    <%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="MyKnma" CodeFile="MyKnma.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var tv = new TV.Tree("treemag", {
            pageBack: 'BackSvr.aspx', //设置异步处理的后台页面地址
            pageDefault: "KM_KNMAList.aspx",
            exdPath: '<%=expPath %>'
        });
//        tv.addMenu("btnSendTask", "发布总结", function (tn) {
//            var objData = tn.getDataObj();
//            $("#ifrMain").attr("src", "KM_KNMAEdit.aspx?wktype=3&no=" + objData.no + "&typestr=" + objData.typestr);
//            return false;
//        });

        tv.beforeShowMenu = function () {
            var objData = this.getSelNode().getDataObj();
            var ntype = objData.ntype;
           
        }

    });
    
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="lrlayout">
    <div style="width:210px; overflow:auto;">
        <div class="divtree">
            <ul id="treemag">
            <%--<li data="{id:'0',pid:'0',sc:0,name:'知识库',ntype:'root'}" ><div><b><em></em></b><a href='#'>知识库</a></div></li>--%>
            <asp:Literal ID="litChnl" runat="server"></asp:Literal>
            </ul>
        </div>
        
     </div>
     <div>
     <iframe src="KM_KNMAList.aspx" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>

<script type="text/javascript">
    $("#lrlayout").Layout_LR({});
  </script>

</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_INDEXTBClient" CodeFile="IndexTBClient.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //alert($("select[id$='txtDEV']").val());
            var tv = new TV.Tree("treeBill", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "bill" || ntype == "bill-mx") {
                        $("#ifrMain").attr("src", "BILLEditTBClient.aspx?edit=1&" + tn.getDataPara());
                    }
                    if (ntype == "col") {
                        $("#ifrMain").attr("src", "ColEditTBClient.aspx?edit=1&" + tn.getDataPara());
                    }
                    return false;
                },                
                pageBack: 'BILLBackTBClient.aspx?DEV2=' + $("select[id$='txtDEV']").val(), //设置异步处理的后台页面地址
                showDelete: true,
                checkBox: 0
            });

            tv.addMenu("addBill", "新建表", function (tn) {
                $("#ifrMain").attr("src", "BILLEditTBClient.aspx?" + tn.getDataPara());
            });
            tv.addMenu("editBill", "字段列表", function (tn) {
                $("#ifrMain").attr("src", "COLManage.aspx?" + tn.getDataPara());
            });
            tv.addMenu("addCol", "新建字段", function (tn) {
                $("#ifrMain").attr("src", "ColEditTBClient.aspx?" + tn.getDataPara());
            });
            tv.addMenu("editCol", "修改字段", function (tn) {
                $("#ifrMain").attr("src", "ColEditTBClient.aspx?edit=1&" + tn.getDataPara());
            });

            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();
                this.hideMenuItem("addBill", "addSubBill", "editBill", "addCol", "editCol", "addTableCols");
                var ntype = tn.getNTYPE();
                if (ntype == "bill-root") {
                    this.showMenuItem("addBill");
                }
                if (ntype == "bill") {
                    this.showMenuItem("editBill", "addSubBill", "addCol", "addTableCols", "showDelete");
                }
                if (ntype == "bill-mx") {
                    this.showMenuItem("editBill", "addCol", "showDelete");
                }
                if (ntype == "col") {
                    this.showMenuItem("editCol", "showDelete");
                }
            }
        });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="lrlayout">
  <div style="width:350px; background:#ddd;">
        <span style=" height:18px; line-height:18px;">数据源:</span>
        <asp:DropDownList ID="txtDEV" style="width:150px;" runat="server" 
                onselectedindexchanged="txtDEV_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="AIO">主库数据源</asp:ListItem>
            <asp:ListItem Value="DEV1">其他设备1</asp:ListItem>
            <asp:ListItem Value="DEV2">其他设备2</asp:ListItem>
            <asp:ListItem Value="DEV3">其他设备3</asp:ListItem>
        </asp:DropDownList>
        <div class="divtree"><ul class="db" id="treeBill">     
        <li data="{id:'0',pid:'0',name:'物理表管理',ntype:'bill-root',no:1,sc:0}"><div><b><em></em></b><a>物理表管理</a></div></li>
    </ul></div>
  </div>
  <div><iframe src="" id="ifrMain" frameborder="0"></iframe></div>
</div> 
<script type="text/javascript">
    $("#lrlayout").Layout_LR({ jianH: 3 });
</script>

</asp:Content>

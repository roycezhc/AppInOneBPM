<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_WF_TBManage" CodeFile="TBManage_del.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var tv = new TV.Tree("tree0000", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "table-root") {
                        return false;
                    }
                    if (ntype == "table" || ntype == "table-mx") {
                        $("#ifrMain").attr("src", "TABLE/FIELD/FIELDManage.aspx?" + tn.getDataPara());
                    }
                    if (ntype == "field") {
                        $("#ifrMain").attr("src", "TABLE/FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
                    }

                    if (ntype == "form-root") {
                        return false;
                    }

                    if (ntype == "form" || ntype == "form-mx") {
                        $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNManage.aspx?" + tn.getDataPara());
                    }
                    if (ntype == "formcol") {
                        $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    return false;
                },
                pageBack: 'TBBack.aspx', //设置异步处理的后台页面地址
                showDelete: true,
                checkBox: 0
            });
            tv.addMenu("addTB", "新建表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?" + tn.getDataPara());
            });
            tv.addMenu("addSubTB", "添加明细表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?mx=1&" + tn.getDataPara());
            });

            tv.addMenu("editTB", "修改表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?edit=1&" + tn.getDataPara());
            });
            tv.addMenu("addField", "新建字段", function (tn) {
                $("#ifrMain").attr("src", "TABLE/FIELD/FIELDEdit.aspx?" + tn.getDataPara());
            });
            tv.addMenu("editField", "修改字段", function (tn) {
                $("#ifrMain").attr("src", "TABLE/FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
            });

            tv.addMenu("newFrom", "创建表单", function (tn) {
                $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
            });

            tv.addMenu("addSubForm", "创建子表单", function (tn) {
                $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
            });

            tv.addMenu("editForm", "修改表单", function (tn) {
                $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?edit=1&" + tn.getDataPara());
            });

            tv.addMenu("addCol", "创建栏目", function (tn) {
                $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?edit=1&" + tn.getDataPara());
            });

            //            tv.addMenu("formDesign", "表单设计", function (tn) {
            //                $("#ifrMain").attr("src", "FORM/FormDesign.aspx?" + tn.getDataPara());
            //            });

            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();
                this.hideMenuItem("addTB", "addSubTB", "editTB", "addField", "editField", "newFrom", "editForm", "editFormCol", "formDesign", "showDelete", "addSubForm","addCol");
                var ntype = tn.getNTYPE();
                if (ntype == "table-root") {
                    this.showMenuItem("addTB");
                }
                if (ntype == "table") {
                    this.showMenuItem("editTB", "addField", "showDelete", "addSubTB");
                }
                if (ntype == "table-mx") {
                    this.showMenuItem("editTB", "addField", "showDelete");
                }
                if (ntype == "field") {
                    this.showMenuItem("editField", "showDelete");
                }

                if (ntype == "form-root") {
                    this.showMenuItem("newFrom");
                }

                if (ntype == "form") {
                    this.showMenuItem("editForm", "formDesign", "showDelete", "addSubForm", "addCol");

                }
                if (ntype == "form-mx") {
                    this.showMenuItem("editForm", "showDelete", "addCol");
                    this.hideMenuItem("addSubForm", "formDesign");
                }
                if (ntype == "formcol") {
                    this.showMenuItem("editFormCol", "showDelete");
                }
            }
            bindWinResize();
        });
        function doResize() {
            InitDivH(33, new Array($("div.left"), $("div.right")));
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="titnav">
  <dl><dt><b>表单管理</b></dt><dd><a href='<%=preUrl %>'>返回</a></dd></dl>
</div>
<div class="lrlayout">
     <div class="left" style="width:240px;height:500px; overflow:auto;">
        <div class="divtree"><ul class="db" id="tree0000">
            <li data="{id:'0',pid:'0',name:'表管理',ntype:'table-root',no:1,sc:0}"><div><b><em></em></b><a>表管理</a></div></li>
            <li data="{id:'0',pid:'0',name:'表单管理',ntype:'form-root',no:1,sc:0}"><div><b><em></em></b><a>表单管理</a></div></li>
        </ul></div>
     </div>
     <div class="right" style="margin-left:242px;height:500px;">
     <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>
</asp:Content>


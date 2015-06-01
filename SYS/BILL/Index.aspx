<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_INDEX" CodeFile="Index.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var tv = new TV.Tree("treeBill", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "bill-root") {
                        $("#ifrMain").attr("src", "BILLManage.aspx?" + tn.getDataPara());
                    }
                    if (ntype == "bill" || ntype == "bill-mx") {
                        $("#ifrMain").attr("src", "BILLEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    if (ntype == "col") {
                        $("#ifrMain").attr("src", "ColEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    if (ntype == "syncol") {
                        $("#ifrMain").attr("src", "SynColEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    return false;
                },
                pageBack: 'BillBack.aspx', //设置异步处理的后台页面地址
                showDelete: true,
                checkBox: 0
            });
            tv.addMenu("BillReal", "关系列表", function (tn) {
                $("#ifrMain").attr("src", "BillReal/RELAManage.aspx?" + tn.getDataPara());
                //$("#lrlayout").children().show();
            });
            tv.addMenu("addBill", "新建表单", function (tn) {
                $("#ifrMain").attr("src", "BILLEdit.aspx?" + tn.getDataPara());
                //$("#lrlayout").children().show();
            });
            tv.addMenu("addSubBill", "建立子表单", function (tn) {
                $("#ifrMain").attr("src", "BILLEdit.aspx?mx=1&" + tn.getDataPara());
            });

            tv.addMenu("addSynCol", "新建物理字段", function (tn) {
                $("#ifrMain").attr("src", "SynCOLEdit.aspx?" + tn.getDataPara());
            });
            tv.addMenu("addCol", "新建逻辑字段", function (tn) {
                $("#ifrMain").attr("src", "ColEdit.aspx?" + tn.getDataPara());
            });

            tv.addMenu("billSet", "界面布局", function (tn) {
                $("#ifrMain").attr("src", "BillSet.aspx?BillID=" + tn.getID());
            });

            tv.addMenu("billColMange", "字段管理", function (tn) {
                $("#ifrMain").attr("src", "V_SYS_BILL_COL_SYN/V_SYS_BILL_COL_SYNManage.aspx?BillID=" + tn.getID());
            });

            var intocolIndex = 0;
            var curNode = null;
            tv.addMenu("addTableCols", "导入逻辑字段", function (tn) {
                var result = window.showModalDialog("TBColSel.aspx?DEV=AIO&billid=" + tn.getID() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=400px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面

                if (result == undefined || result == "") {
                    return;
                }
                curNode = tn;
                //alert(result);
                var objs = eval(result);
                intocolIndex = 0;
                intbCols(objs, tn.getID());
            });

            function intbCols(objs, billid) {
                if (intocolIndex <= objs.length - 1) {
                    var a = intocolIndex;
                    intocolIndex++;
                    if (objs[a].ntype == "col") {
                        $.get("BillBack.aspx?billid=" + billid + "&tb=" + objs[a].tb + "&pid=" + objs[a].pid + "&dev=" + objs[a].dev + "&id=" + objs[a].id + "&ntype=" + objs[a].ntype + "&intbCols=" + Math.random(), null, function (re) {
                            alert(re);
                            if (re == "ok") {
                                //alert(re);
                                intbCols(objs, billid);
                            } else {
                                alert("导入失败！");
                            }
                        });
                    } else {
                        intbCols(objs, billid);
                    }

                } else {

                    alert("导入完成。");
                    curNode.clearSubNodes();
                    curNode.getSubNodes();
                }
            }


            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();
                this.hideMenuItem("addBill", "addSubBill", "BillReal", "editBill", "addCol", "editCol", "addTableCols", "addSynCol", "editSynCol", "clearBill", "addSynCol", "billSet");
                var ntype = tn.getNTYPE();
                if (ntype == "bill-root") {
                    this.showMenuItem("addBill");
                }
                if (ntype == "bill") {
                    this.showMenuItem("editBill", "addSubBill", "addCol", "addTableCols", "showDelete", "clearBill", "billSet", "BillReal");
                }
                if (ntype == "bill-mx") {
                    this.showMenuItem("editBill", "addCol", "showDelete", "clearBill", "billSet", "addTableCols", "BillReal");
                }
                if (ntype == "col") {
                    this.showMenuItem("editCol", "showDelete", "addSynCol", "addSynCol");
                }
                if (ntype == "syncol") {
                    this.showMenuItem("editCol", "showDelete", "addSynCol", "editSynCol");
                }
            }
        });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="lrlayout">
  <div style="width:350px; background:#ddd;">
    <div class="divtree" style="width:350px;"><ul class="db" id="treeBill">
        <li data="{id:'0',pid:'0',name:'表单管理',ntype:'bill-root',no:1,sc:0}"><div><b><em></em></b><a>表单管理</a></div></li>
    </ul></div>
  </div>
  <%--<div style="width:400px; background:#ddd;"><iframe src="" id="ifrMain" frameborder="0"></iframe></div>--%>
  <div style="background:#eee;">
     <iframe src="" id="ifrMain" name="ifrShow" frameborder="0"></iframe>
  </div>
</div> 
<script type="text/javascript">
    $("#lrlayout").Layout_LR({ jianH: 3 });
  </script>

</asp:Content>


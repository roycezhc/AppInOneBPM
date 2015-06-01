<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TBColSel" CodeFile="TBColSel.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tv = null;
        $(function () {
            tv = new TV.Tree("treeBill", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                   
                    return false;
                },
                pageBack: 'BILLBackTB.aspx?tbs=<%=tbs %>', //设置异步处理的后台页面地址
                showDelete: true,
                checkBox: 2
            });

            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();

            }
        });

        function selsOK(me) {

            window.returnValue = tv.getCheckedObjStr("ntype,pid,dev,tb");
            //alert(window.returnValue);
            window.close();
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tool">
<ol><li><span>
    <input id="Button1" type="button" value="确定选择" onclick="selsOK(this);" /></span></li></ol>
</div>
<div class="divtree">
<ul class="db" id="treeBill">
    <li data="{id:'0',pid:'0',name:'表字段选择',ntype:'bill-root',no:1,sc:0}"><div><b><em></em></b><a>表字段选择</a></div></li>
</ul>
</div>

</asp:Content>


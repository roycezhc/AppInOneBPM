<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucUpFilesAtSubmit" CodeFile="wucUpFilesAtSubmit.ascx.cs" %>
<script type="text/javascript">
    var filenum = 0; //当前上传文件数
    $(function() {
        filenum = parseInt($("input[id$='hidOldNum']").val());
    });
    function valueChg(el) {
        var str = el.value;
        var exdname=str.substring(str.lastIndexOf("."),str.length);
        var files=".txt|.doc|.docx|.xls|.jpg|.png|.gif|.ppt|.zip|.rar";
        if (files.indexOf(exdname)!=-1) {
            $(el.parentNode).prepend("<b>" + str.substring(str.lastIndexOf("\\") + 1, str.length) + "</b>");
            $(el).hide();
            $(el).prev().show();
            $("input[id$='btnUpload']").trigger("submit");
        } else {
            alert("请选择适合的文件，如：.txt|.doc|.docx|.xls|.jpg|.png|.gif|.ppt|.zip|.rar");
        }
    }
    //添加一个上传文件输入框
    function addFile(el) {
        if (filenum < 15) {
            $(el).prev().append('<span><input type="file" runat="server" onchange="valueChg(this)" /><a onclick="delThis(this);">X</a><br></span>');
            filenum += 1;
        }
    }
    //删除当前已经选择的文件
    function delThis(el) {
        var delobj = el.parentNode;
        el.parentNode.parentNode.removeChild(delobj);
        filenum -= 1;
    }
    //删除旧的文件，根据保存在隐藏域里的文件路径
    function delOldFile(el, path) {
        var pp = el.parentNode.parentNode;
        var hidold = $(pp).prev()[0];
        hidold.value += hidold.value == "" ? path : "|" + path;
        var delobj = el.parentNode;
        pp.removeChild(delobj);
        filenum -= 1;
    }
</script>
<div class="upfiles">
    <input id="hidShowPathPre" type="hidden" runat="server" value="" />
    <input id="hidSavePath" type="hidden" runat="server" />
    <input id="hidOldNum" type="hidden" runat="server" value="0" />
    <input id="hidOldFiles" type="hidden" runat="server" />
    <input id="hidOldDel" type="hidden" runat="server" />
    <div id="divStuffs" runat="server"></div>
    <input id="btnAddUp" type="button" value="添　加" style="width:51px;" onclick="addFile(this);" runat="server" />
</div>

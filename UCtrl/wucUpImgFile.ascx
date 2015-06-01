<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucUpImgFile" CodeFile="wucUpImgFile.ascx.cs" %>

<script type="text/javascript">

    function valueChg(me) {
        var str = me.value;
        var ppp = $(me).parent(); //document.getElementById("").childNodes.length
        if (str != "") {
            str = str.substring(str.lastIndexOf("."), str.length).toLowerCase();
            var files = ppp.find("input[id$='hidInLawFile']").val(); //".jpg|.jpeg";
            if (files.indexOf(str) == -1) {
                ppp.find("input[id$='hidRightImgFile']").val("");
                alert("请选择适合的文件，如：" + files);
            } else {
                ppp.find("input[id$='hidRightImgFile']").val("ok"); //标记图片类型合法，可以上传
                var vvv = new viewImage();
                //alert($(me).prev().html());
                vvv.LoadImage(me, $(me).prev()[0]);
            }
        }

    }
</script>
<div id="divImgFile">
<input id="hidShowPathPre" type="hidden" runat="server" value="" />
<input id="hidSavePath" type="hidden" runat="server" />
<input id="hidRightImgFile" name="hidRightImgFile" type="hidden"  runat="server"/>
<input id="hidInLawFile" name="hidInLawFile" type="hidden" value=".jpg|.jpeg|.png"  runat="server"/>
<div id="preview_fake" style="width:100px;height:100px;">
     <img alt="" src="" width="100" height="100" style="width: 100px;height:100px;" id="imgShow" runat="server" />
</div>
<input ID="fileUpImg" runat="server" type="file" style="width:75px;" /><br />
<span style="width:150px;"><asp:Literal ID="lblWarn" runat="server">文件大小要<3M</asp:Literal></span>
</div>
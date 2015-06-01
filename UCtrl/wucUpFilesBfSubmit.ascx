<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucUpFilesBfSubmit" CodeFile="wucUpFilesBfSubmit.ascx.cs" %>
<script type="text/javascript">
//在由指定符号隔开的字符串中删除某个字符串
function RemoveFromString(str, movestr, chr) {
    var newstr = "";
    if (str.indexOf(chr) > 0) {
        var arr = new Array();
        arr = str.split(chr);
        for (i = 0; i < arr.length; i++) {
            if (arr[i] != movestr) {
                newstr += newstr == "" ? arr[i] : chr + arr[i];
            }
        }
    }
    else {
        if (str != movestr) {
            newstr = str;
        }
    }
    return newstr;
}

//删除当前已经选择的文件
function delFile_UpBf(el,name) {//alert(name);
    if(!confirm("确定要删除此文件吗？")){
       return;
   }
   var rootObj = $(el).parent().parent().parent();
    var delobj = el.parentNode;
    el.parentNode.parentNode.removeChild(delobj);
    var hid = rootObj.find("input[id$='hidFileNames']");
    var str=hid.val();//alert(str);
    
    hid.val(str);
    var path = rootObj.find("input[id$='hidSavePath']").val() + name;//alert(str); (path);
    str = RemoveFromString(str, path, ','); //alert(str);
    hid.val(str);
    var ajaxurl='<%=dirPre %>UCtrl/UpFilesBf.aspx?r='+Math.random()+'&delFile='+escape(path);//alert(ajaxurl);
    $.get(ajaxurl, function(data) {
        if (data != "yes") {
            alert(data);
        }
    });
}

function AddFile_UpBf(filename, pDivID) {
   var hid = $("#" + pDivID).find("input[id$='hidFileNames']");
   if(hid.val()!=""){
      hid.val(hid.val()+","+filename);
   }else{
      hid.val(filename);
   }
   $("#" + pDivID).find("div[class='divAnnex']").append("<span><b>" + filename + "</b><a onclick=\"delFile_UpBf(this,'" + filename + "');\">X</a></span>");
}

function getPrePath_UpBf(pDivID) {
    return $("#" + pDivID).find("input[id$='hidSavePath']").val();
}

function showWindow_UpBf(width, height, pDivID) {
    var posObj = $("#" + pDivID); 
    var offset = posObj.offset();
    var winWarn = posObj.next();// $("#tranDiv");
    winWarn.css({ top: (offset.top-30)+ "px", left: offset.left,height:posObj.height()});
    winWarn.show();
}

function closeBarWindow_UpBf(pDivID) {
    $("#" + pDivID).next().hide(); window.document.close();
}

function getLawFiles_UpBf(pDivID) {
    return $("#" + pDivID).find("input[id$='hidLawFiles']").val();
}

function setLawFiles(files) {
    var pdiv = '<%=upDiv.ClientID %>';
    $('#' + pdiv).find("input[id$='hidLawFiles']").val(files);
}

</script>
   
<div class="upfiles" id="upDiv" runat="server">
    <input id="hidShowPathPre" type="hidden" runat="server" value="" />
    <input id="hidSavePath" type="hidden" runat="server" />
    <input id="hidFileNames" type="hidden" runat="server"/>
    <div id="iFrame" runat="server"><iframe src='<%=dirPre %>UCtrl/UpFilesBf.aspx?pDiv=<%=upDiv.ClientID %>' frameborder="0" style="width:350px;height:25px;" scrolling="no"></iframe></div>
    <div class="divAnnex">
        <asp:Literal ID="litAnnex" runat="server"></asp:Literal>
    </div>
    <input id="hidLawFiles" type="hidden" runat="server" value=".txt|.doc|.docx|.xls|.jpg|.jpeg|.png|.gif|.ppt|.zip|.rar|.ppt"/>
</div>
<div class="tranDiv" style="position: absolute;display:none;background:#eee;border:solid 1px #600;">
   <div style="font-weight:bold;color:#600;">文件上传中，请等待……</div>
   <div>
     <img alt="" src="<%=dirPre %>Lib/Img/upfileImg.gif" style="border:none;" />
    </div> 
</div>
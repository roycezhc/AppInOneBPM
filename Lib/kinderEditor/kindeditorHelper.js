var projectName = document.getElementById("base").innerText;
document.write('<script src="' + projectName + 'Lib/kinderEditor/kindeditor-min.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<script src="' + projectName + 'Lib/kinderEditor/lang/zh_CN.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<script src="' + projectName + 'Lib/kinderEditor/plugins/video.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<script src="' + projectName + 'Lib/kinderEditor/plugins/music.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<script src="' + projectName + 'Lib/kinderEditor/plugins/smimage/smimage.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<link rel="stylesheet" type="text/css" href="' + projectName + 'Lib/kinderEditor/themes/default/default.css?r=' + Math.random() + '"" media="all" />');
document.write('<link rel="stylesheet" type="text/css" href="' + projectName + 'Lib/kinderEditor/themes/simple/simple.css?r=' + Math.random() + '"" media="all" />');

function creatKindEditor(id) {
    var editor1 = KindEditor.create(id, {
    uploadJson: projectName + 'lib/kinderEditor/asp.net/upload_json.ashx',
    fileManagerJson: projectName + 'lib/kinderEditor/asp.net/file_manager_json.ashx',
    items: [
        'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image'
            , 'table', 'hr', 'emoticons', 'baidumap', 'code', 'pagebreak',
        'link', 'unlink', 'music', 'video'],
    allowFileManager: true,
    afterBlur: function () { this.sync(); }
    });
    return editor1;
}

function creatSmImage(id, imgId, hidId, userID) {

    $(imgId).parent().parent().css('width', 'auto');

    KindEditor.ready(function (K) {
        var editor = K.editor({
            themeType: "simple",
            uploadJson: projectName + 'lib/kinderEditor/asp.net/upload_json.ashx',
            fileManagerJson: projectName + 'lib/kinderEditor/asp.net/file_manager_json.ashx',
            allowFileManager: true

        });

        if (K(imgId).attr("src") == '') {
            K(imgId).attr("src", projectName + 'lib/kinderEditor/themes/default/yulan.png');
        }

        K(hidId).val(K(imgId).attr("src"));

        K(id).click(function () {
            editor.loadPlugin('smimage', function () {
                editor.plugin.imageDialog({
                    imageUrl: K(imgId).attr("src"),
                    clickFn: function (url, title, width, height, border, align) {
                        if (K(imgId)) {
                            K(hidId).val(url);
                            K(imgId).attr('src', url);
                            K(imgId).show();
                        }
                        editor.hideDialog();
                    }
                });
            });
        });
    });
}
function deleteFileName(event,hidId) {
    $("#files").html($("#files").html().replace($(event).parent().get()[0].outerHTML, ""));

    if ($("#files").html() != "") {
        var arr = $("#files div").get();
        var html = "";
        for (i = 0; i < arr.length; i++) {
            var title = arr[i].innerText;
            var url = $(arr[i]).find("a").attr("url")
            html += "" + title + "," + url + "," + hidId + ";";
        }
        $(hidId).val(html);
    } else {
        $(hidId).val(" ");
    }
   
    deleteFile($(event).attr('url'));
}
function deleteFile(name) {
    $.ajax({
        url: "../../WECAdmin/WEC_A_VOTEDETAIL/Back.aspx",
        type: "post",
        data: { deleteFile: "true", fileName: name },
        success: function () {
            alert("文件删除成功");
        },
        error: function () {
            alert("文件删除失败");
        }
    });
}
function creatFileUpload(id,  hidId, userID) {

    KindEditor.ready(function (K) {
        var editor = K.editor({
            themeType: "simple",
            uploadJson: 'lib/kinderEditor/asp.net/upload_json.ashx',
            fileManagerJson: 'lib/kinderEditor/asp.net/file_manager_json.ashx',
            allowFileManager: true

        });
       
        K(id).click(function () {
            editor.loadPlugin('insertfile', function () {
                editor.plugin.fileDialog({
                    fileUrl: K("#keUrl").val(),
                    clickFn : function(url, title) {
                        K("#keUrl").val(url);
                        var url = K("#keUrl").val();
                        var title = K("#keTitle").val();
                        var html = $("#files").html();
                        //var title_str = title.substring(0,title.lastIndexOf("."));
                        var append = "<div>" + title + "<a href='javascript:' flag='delete' url='" + url + "' onclick=\"deleteFileName(this,'"+hidId+"');\"><img src='../../Themes/WEC/del-icon.png'/></a></div>";
                        $("#files").html(html + append);
                        $(hidId).val($(hidId).val()+""+title+","+url+","+hidId+";");
                        editor.hideDialog();
                    }
                });
            });
        });
    });
}
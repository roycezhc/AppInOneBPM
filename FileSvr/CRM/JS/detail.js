function openMore(me) {
    var txt = $(me).attr("class");
    if (txt == undefined || txt.indexOf("opened") == -1) {
        $(me).addClass("opened");
        $(me).parent().parent().next().show();
    } else {
        $(me).removeClass("opened");
        $(me).parent().parent().next().hide();
    }
    if (parent.document.URL != document.URL) {
        if (parent.autoFrameHeight) {
            parent.autoFrameHeight();
        }
    }
}

function iFrameHeight(ifrID) {
    var ifm = document.getElementById(ifrID);
    var subWeb = document.frames ? document.frames[ifrID].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
        $(ifm).height(subWeb.body.scrollHeight);
    }
}

function autoFrameHeight(me) {
   if (me.id != undefined) {
        iFrameHeight(me.id);
    }
}

function editThisDepart(me) {
    var spans = $(me).parent().parent().next().find("span");
    var i = 0;
    for (i = 0; i < spans.length; i++) {
        var spObj = $(spans[i])
        var itemStr = spObj.attr("Items");
        var id = spObj.attr("id");
        var s = id.lastIndexOf("_");
        if (s != -1) {
            id = id.substring(s + 1, id.length);
        }
        if (itemStr == undefined) {
            //alert(spObj.next().length);
            if (spObj.next().length > 0) {
                if (spObj.next()[0].tagName == "A") {
                    spObj.next().find("input[type='text']").val(spObj.text());
                    spObj.next().find("input[type='hidden']").val(spObj.attr("Value"));
                    spObj.next().show();
                } else {
                    if (!(spObj.next()[0].tagName == "INPUT" && spObj.next().attr("name") == id)) {
                        var txt = "<input type='text' value='" + spObj.text() + "' name='" + id + "' />";
                        spObj.after(txt);
                    } else {
                        spObj.next().show();
                    }
                }
            }
            else {
                var txt = "<input type='text' value='" + spObj.text() + "' name='" + id + "' />";
                spObj.after(txt);
            }


        } else {
            if (!(spObj.next().length > 0 && spObj.next()[0].tagName == "SELECT" && spObj.next().attr("name") == id)) {
                var sels = "<select name='" + id + "'";
                var arr = itemStr.split(',');
                for (var a = 0; a < arr.length; a++) {
                    var aaa = arr[a].split(':');
                    if (spObj.attr("Value") == aaa[0]) {
                        sels += "<option value='" + aaa[0] + "' selected>" + aaa[1] + "</option>";
                    } else {
                        sels += "<option value='" + aaa[0] + "'>" + aaa[1] + "</option>";
                    }
                }
                sels += "</select>";
                spObj.after(sels);
            } else {
                spObj.next().show();
            }
        }
        spObj.hide();
    }
    $(me).next().show();
    $(me).next().next().show();
    $(me).hide();
}

function saveThisDepart(me, backUrl) {
    var i = 0;
    var paras = {};
    var spans = $(me).parent().parent().next().find("span");

    var txts = $(me).parent().parent().next().find("input");
    for (i = 0; i < txts.length; i++) {
        var spObj = $(txts[i])
        var id = spObj.attr("name");

        if (spObj.parent()[0].tagName == "A") {
            paras[id] = spObj.parent().find("input[type='hidden']").val();
            spObj.parent().prev().html(spObj.parent().find("input[type='text']").val());
        } else {
            paras[id] = spObj.val();
            spObj.prev().html(spObj.val());
        }
    }

    var sels = $(me).parent().parent().next().find("select");
    for (i = 0; i < sels.length; i++) {
        var spObj = $(sels[i])
        var id = spObj.attr("name");
        paras[id] = spObj.val();
        spObj.prev().html(spObj[0].options[spObj[0].selectedIndex].text);
        spObj.prev().attr("Value", spObj.val());
    }

    var txtareas = $(me).parent().parent().next().find("textarea");
    for (i = 0; i < txtareas.length; i++) {
        var spObj = $(txtareas[i])
        var id = spObj.attr("name");
        paras[id] = spObj.val();
        spObj.prev().html(spObj.val());
    }
    paras["FieldKeyID"] = $("#hidKey").val();
    //alert(paras.FieldKeyID);
    //return; //

    $.ajax({
        url: backUrl + "?saveInfo=" + Math.random(),
        cache: false,
        data: paras,
        success: function (svrData) {
            if (svrData == "") {
                alert("保存失败！");
            } else {
                var reg = /^\d*$/;
                if (reg.test(svrData) == true) {
                    if (parseInt(svrData) > 0) {
                        var s = "";
                        if (msg != undefined) {
                            s = msg + "成功";
                        } else {
                            if (curObj) {
                                s = curObj.innerHTML + "成功";
                            } else {
                                s = "保存成功";
                            }
                        }

                    } else {
                        s = "保存失败";
                    }
                    s += "!";
                    alert(s);
                } else {
                    alert(svrData);
                }
            }

        },
        error: function (a, b, c) {

            alert(b);
        },
        complete: function (xht, sta) {
            txtareas.hide();
            txts.hide();
            sels.hide();
            spans.show();
        }
    });

    $(me).prev().show()
    $(me).next().hide();
    $(me).hide();
}

function cancelThisDepart(me) {
    var spans = $(me).parent().parent().next().find("span");
    var txts = $(me).parent().parent().next().find("input");
    var sels = $(me).parent().parent().next().find("select");
    var txtareas = $(me).parent().parent().next().find("textarea");
    txtareas.hide();
    txts.hide();
    sels.hide();
    spans.show();
    $(me).prev().prev().show();
    $(me).prev().hide();
    $(me).hide();
}
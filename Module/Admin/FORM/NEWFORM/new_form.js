$(function () {
    var isAdd = false;
    window.tablename=$("#data").attr("tablename");
    $("#tableList").bind("change", function () {
        var tablename = $(this).val();
        $.ajax({
            type: "post",
            url: "NEWFORMBack.aspx",
            data: { type: "getTemplateOptionsAndField", tableName: tablename },
            dataType:"json",
            success: function (data) {
                $("#templateList").html(data.html);
                //获取默认模板
                //  getDefaultTemplate(tablename == "-1" ? window.tablename : tablename);
                getSelectedTemplate(tablename == "-1" ? window.tablename : tablename, $("#data").attr("selectetempname"));
              //  $("#fieldList").html(data.fieldHtml);

                //$("#fieldList").find("div").draggable({
                //    helper: "clone",
                //    scope: "ss"
                //});
                //$("iframe").contents().find(".ke-content").bind("mouseenter", function (e1) {
                //    if ($(".ui-draggable-dragging").length < 1) {
                //        return;
                //    }
                //    var fieldName = $(".ui-draggable-dragging").attr("fieldName");
                //    var framecontent= $("iframe").contents().find(".ke-content");
                //    $(".ui-draggable-dragging").trigger("mouseup");
                //    framecontent.append("<div style='position:absolute;' id='field_div_moving'>{" + fieldName + "</div>");
                //    framecontent.find(":last").css("left", e1.pageX);
                //    framecontent.find(":last").css("top", e1.pageY);
                //    framecontent.bind("mousemove", function (e2) {
                //        framecontent.find(":last").css("left", e2.pageX);
                //        framecontent.find(":last").css("top", e2.pageY);
                //    });
                //    framecontent.bind("mousedown", function (e3) {
                //        if (e3.button == 2) {//右键则取消拖拉
                //            framecontent.unbind("mousemove");
                //            framecontent.unbind("mousedown");
                //            framecontent.find(":last").remove();
                //            ////取消拖拉后 右键是菜单
                //            //framecontent.unbind("contextmenu");
                //        } else {
                //            var tds = $("iframe").contents().find("body > table > tbody > tr > td");
                //            setTdContent(tds, e3, fieldName,0,0);
                //        }
                //    });
                //    framecontent.bind("mouseleave", function () {
                //        if (framecontent.find("#field_div_moving").length < 1) {
                //            return;
                //        }
                //        framecontent.unbind("mousemove");
                //        framecontent.unbind("mousedown");
                //        framecontent.find(":last").remove();
                //    });
                //    ////拖拉时右键 是取消拖拉
                //    //framecontent.bind("contextmenu", function () {
                //    //    return false;
                //    //});
                //});

            },
            error: function (err1, err2, err3) {
                console.log(err2);
            }
        });
    });

   
    $("#templateList").bind("change", function () {
        $.ajax({
            type: "post",
            url: "NEWFORMBack.aspx",
            data: { type: "getTemplateHtml", tableName: $("#tableList").val() == -1 ? $("#data").attr("tablename") : $("#tableList").val(), templateName: $("#templateList option:selected").text() },
            dataType:"html",
            success: function (data) {
                window.kindEditor.html(data);
            },
            error: function (err1, err2, err3) {
                console.log(err2);
            }
        });
    });
    $("#add").click(function () {
        // if ($("#tableList").val() != -1) {
        isAdd = true;
        $("#myModal").modal("show");
        //} else {
        //    alert("请选择表");
        //}
    });

    $("#save").click(function () {
        isAdd = false;
        if ($("#tableList").val() == $("#data").attr("tablename")) {
            $.ajax({
                type: "post",
                url: "NEWFORMBack.aspx",
                data: { type: "saveTemplateHtml", tableName: $("#data").attr("tablename"), templateName: $("#templateList option:selected").text(), templateHtml: window.kindEditor.html(),tableid:$("#data").attr("currtableid") },
                dataType: "json",
                success: function (data) {
                    alert(data.msg);
                }
            });
        }else{
            $("#myModal").modal("show");
        }
    });

    $("#recovery").click(function () {
        $.ajax({
            type: "post",
            url: "NEWFORMBack.aspx",
            data: { type: "recoveryDefault", tableName: $("#tableList").val() },
            dataType: "json",
            success: function (data) {
                $("#templateList option:eq(0)").insertAfter("<option value='0'>默认</option>");
            }
        });
    });

    $("#del").click(function () {
        if ($("#tableList").val() != $("#data").attr("tablename")) {
            alert("只能删除当前表单模板");
            return;
        }
        $.ajax({
            type: "post",
            url: "NEWFORMBack.aspx",
            data: { type: "delTemplate", tableName: $("#data").attr("tablename"), templateName: $("#templateList option:selected").text() },
            dataType: "json",
            success: function (data) {
                $("#templateList option[value=" + $("#templateList").val() + "]").remove();
            }
        });
    });

    $("#ok_template").click(function () {
        $("#myModal").modal("hide");
        var templateName = $("#templateName").val();
        if (isAdd) {
            $.ajax({
                type: "post",
                url: "NEWFORMBack.aspx",
                data: { type: "addTemplate", tableName: $("#data").attr("tablename"), templateName: templateName, tableid: $("#data").attr("currtableid") },
                dataType: "json",
                success: function (data) {
                    var temp_id = data.template_id;
                    if (data.template_id > 0) {
                        $("#templateList").append("<option value='" + data.template_id + "'>" + templateName + "</option>");
                    }
                    var tablename = $("#data").attr("tablename");
                    if ($("#tableList").find("option[value=" + tablename + "]").length == 0) {
                        $("#tableList").append("<option value='" + tablename + "'>" + $("#data").attr("zhtablename") + "</option>");
                    }
                    $("#tableList").val(tablename);
                    $.ajax({
                        type: "post",
                        url: "NEWFORMBack.aspx",
                        data: { type: "getTemplateOptionsAndField", tableName: $("#data").attr("tablename") },
                        dataType: "json",
                        success: function (data) {
                            $("#templateList").html(data.html);
                            $("#templateList").val(temp_id);
                            //显示默认模板
                            getDefaultTemplate($("#data").attr("tablename"));
                        }
                    });
                    alert(data.msg);
                },
                error: function (err1, err2, err3) {
                    console.log(err2);
                }
            });
        } else {
            $.ajax({
                type: "post",
                url: "NEWFORMBack.aspx",
                data: { type: "saveTemplateHtml", tableName: $("#data").attr("tablename"), templateName: templateName, templateHtml: $("#template_content").val(),tableid:$("#data").attr("currtableid") },
                dataType: "json",
                success: function (data) {
                    var temp_id = data.template_id;
                    alert(data.msg);
                    if (data.template_id != null) {
                        if (data.type=="add") {
                            $("#templateList").append("<option value='" + data.template_id + "'>" + templateName + "</option>");
                        } else if (data.type == "update") {
                            //不做改变
                        }
                        var tablename = $("#data").attr("tablename");
                        if ($("#tableList").find("option[value=" + tablename + "]").length == 0) {
                            $("#tableList").append("<option value='" + tablename + "'>" + $("#data").attr("zhtablename") + "</option>");
                        }
                        $("#tableList").val(tablename);
                        $.ajax({
                            type: "post",
                            url: "NEWFORMBack.aspx",
                            data: { type: "getTemplateOptionsAndField", tableName: $("#data").attr("tablename") },
                            dataType: "json",
                            success: function (data) {
                                console.log(data);
                                $("#templateList").html(data.html);
                                $("#templateList").val(temp_id);
                            },
                            error: function (err1, err2, err3) {
                            console.log(err2);
                        }
                        });
                    }
                },
                error: function (err1, err2, err3) {
                    console.log(err2);
                }
            });
        }
       $("#templateName").val("");
        
    });

    $("#cancel_template").click(function () {
        $("#myModal").modal("hide");
        $("#templateName").val("");
    });
    //选择模板
    $("#selectTp").click(function () {
        if ($("#tableList").val() != $("#data").attr("tablename")) {
            alert("请选择当前表单模板");
            return;
        }
        $.ajax({
            type: "post",
            url: "NEWFORMBack.aspx",
            data: { type: "saveTemplate", tableName: $("#data").attr("tablename"), templateName: $("#templateList option:selected").text() },
            dataType: "json",
            success: function (data) {
                alert("选择成功");
            }
        });
    });
    //获取默认模板
    // getDefaultTemplate($("#data").attr("tablename"));

    getSelectedTemplate($("#data").attr("tablename"), $("#data").attr("selectetempname"));
  
});

function getSelectedTemplate(tablename, templatename) {
    if (templatename == "") {
        return;
    }
    $.ajax({
        type: "post",
        url: "NEWFORMBack.aspx",
        data: { type: "getTemplateHtml", tableName: tablename, templateName: templatename },
        dataType: "html",
        success: function (data) {
            window.kindEditor.html(data);
        },
        error: function (err1, err2, err3) {
            console.log(err2);
        }
    });
}

function initDragView() {
    $("#fieldList").find("div").draggable({
           helper: "clone",
           scope: "ss"
      })
    $("iframe").contents().find(".ke-content").bind("mouseenter", function (e1) {
        if ($(".ui-draggable-dragging").length < 1) {
            return;
        }
        var fieldName = $(".ui-draggable-dragging").attr("fieldName");
        var framecontent = $("iframe").contents().find(".ke-content");
        $(".ui-draggable-dragging").trigger("mouseup");
        framecontent.append("<div style='position:absolute;' id='field_div_moving'>[" + window.tablename + "." + fieldName + "]" + "</div>");
        framecontent.find(":last").css("left", e1.pageX);
        framecontent.find(":last").css("top", e1.pageY);
        framecontent.bind("mousemove", function (e2) {
            framecontent.find(":last").css("left", e2.pageX);
            framecontent.find(":last").css("top", e2.pageY);
        });
        framecontent.bind("mousedown", function (e3) {
            if (e3.button == 2) {//右键则取消拖拉
                framecontent.unbind("mousemove");
                framecontent.unbind("mousedown");
                framecontent.find(":last").remove();
                ////取消拖拉后 右键是菜单
                //framecontent.unbind("contextmenu");
            } else {
                var tds = $("iframe").contents().find("body > table > tbody > tr > td");
                setTdContent(tds, e3, fieldName, 0, 0);
            }
        });
        framecontent.bind("mouseleave", function () {
            if (framecontent.find("#field_div_moving").length < 1) {
                return;
            }
            framecontent.unbind("mousemove");
            framecontent.unbind("mousedown");
            framecontent.find(":last").remove();
        });
    });
}

function setTdContent(tds, e, fieldName, startX, startY) {
    $.each(tds, function (i, td) {
        var table = $(td).parents("table").get(0);
        if (e.pageX >= (startX + table.offsetLeft + td.offsetLeft) && e.pageX <= (startX + table.offsetLeft + td.offsetLeft + td.offsetWidth) && e.pageY >= (startY + table.offsetTop + td.offsetTop) && e.pageY <= (startY + table.offsetTop + td.offsetTop + td.offsetHeight)) {
            //判断下 在td里面 是否还存在表格~
            var temptds = $(td).find(" table > tbody > tr > td");
            if (temptds.length > 0) {
                startX += table.offsetLeft + td.offsetLeft;
                startY += table.offsetTop + td.offsetTop;
                setTdContent(temptds, e, fieldName, startX, startY);
                return false;
            }
            if ($(td).html() == "<br>") {
                $(td).html("[" + window.tablename + "." + fieldName + "]");
                return false;
            } else {
                $(td).append("[" + window.tablename + "." + fieldName + "]");
                return false;
            }
        }
    });
}

function getDefaultTemplate(tableName){
    //请求~ 默认模板
    $.ajax({
        type: "post",
        url: "NEWFORMBack.aspx",
        data: { type: "getTemplateHtml", tableName: tableName, templateName: "默认" },
        dataType: "html",
        success: function (data) {
            window.kindEditor.html(data);
        },
        error: function (err1, err2, err3) {
            console.log(err2);
        }
    });
}
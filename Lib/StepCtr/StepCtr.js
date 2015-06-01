var SP = {
    wfid:0,
    procid:0
};
var stepName = "";
function save() {																
//	var connects = [];
//	$.each(jsPlumb.getAllConnections(), function (idx, connection) {
//		var cont = connection.getLabel();
//		connects.push({
//			ConnectionId: connection.id,
//			PageSourceId: connection.sourceId,
//			PageTargetId: connection.targetId,
//			SourceText: connection.source.innerText,
//			TargetText: connection.target.innerText,
//			SourceAnchor: connection.endpoints[0].anchor.type,
//			TargetAnchor: connection.endpoints[1].anchor.type,
//			ConnectText: $(cont).html()
//		});
//	});
    var blocks = [];
    var temp_str = "";
	$("#right .node").each(function (idx, elem) {
		var $elem = $(elem);
		blocks.push({
			STEP_ID: $elem.attr('id'),
			BLOCKX: parseInt($elem.css("left"), 10),
			BLOCKY: parseInt($elem.css("top"), 10)
		});
		temp_str += "{STEP_ID:" + $elem.attr('id') + ",BLOCKX:" + parseInt($elem.css("left"), 10) + ",BLOCKY:" + parseInt($elem.css("top"), 10) + "},"
	});
   
	var serliza = "[" + temp_str.substr(0, temp_str.length-1) + "]";
     $.ajax({
        url: "STEPATH_BACKNEW.aspx?module=saveStep&r=" + Math.random(),
        cache: false,
        data: "&jsonData=" + serliza,
        success: function (svrData) {
		    alert("保存成功！");
        },
        error: function (a, b, c) {
            alert(a);
        }
    });
}

function doubleclick(id,type) {
	$("#"+id).dblclick(function () {
//		var text = $(this).text();
//		$(this).html("");
//		$(this).append("<input type='text' value='" + text + "' />");
//		$(this).mouseleave(function () {
//			$(this).html($("input[type='text']").val());
//		});
        
        var url = "StepSetting.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + id + "&PREV_ID=0&r=" + Math.random();
        if (type == 2) {
            url = "RoateSetting.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_ID=" + id + "&r=" + Math.random();
        }
        var re=  window.open(url, "_blank", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");



	});
}
$(function () {
	$("#left").children().draggable({
		helper: "clone",
		scope: "ss"
	});
	$("#right").droppable({
		scope: "ss",
		drop: function (event, ui) {
			var left = parseInt(ui.offset.left - $(this).offset().left);
			var top = parseInt(ui.offset.top - $(this).offset().top);
            var blnFlag = 0;
			var name = ui.draggable[0].id;
            var node = $(this);

            //验证开始和结束节点的唯一性
            if (name == 'node0')
            {
                $("#right .node").each(function (idx, elem) {
			        if($(elem).attr('type')=="0")
                    {
                        alert("您已添加过开始节点,请勿重复添加！");
                        blnFlag = 1 ;
                    }
	            });
            }

            if (name == 'node3')
            {
                $("#right .node").each(function (idx, elem) {
			        if($(elem).attr('type')=="3")
                    {
                        alert("您已添加过结束节点,请勿重复添加！");
                        blnFlag = 1 ;
                    }
	            });
            }
            if (blnFlag == 1)
            {
                return;
            }
            //添加到服务端
            $.ajax({
                url: "STEPATH_BACKNEW.aspx?module=addStep&r=" + Math.random(),
                cache: false,
                data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&STEP_NAME=" + escape($(ui.helper).find("span:eq(0)").html()) + "&STEP_TYPE=" + name.replace("node","") + "&left=" + left.toString() + "&top=" + top.toString(),
                success: function (svrData) {
                    var id = svrData;
                   
                    switch (name) {
                        case "node0":

					        node.append('<div class="node node-start" type=0 id="' + id + '" ><span>' + "开始"+ '</span></div>');
					        $("#" + id).css("left", left).css("top", top);
        //					jsPlumb.addEndpoint(id, { anchors: "TopCenter" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "RightMiddle" }, hollowCircle);
					        jsPlumb.addEndpoint(id, { anchors: "BottomCenter" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "LeftMiddle" }, hollowCircle);
					        jsPlumb.draggable(id);
					        $("#" + id).draggable({ containment: "parent" });
					        doubleclick(id);
					        break;
                            /*<div class="node node-active" id="node1">
                <span>活动节点</span>
                <div class="active-content"><span>活动节点</span></div>
			</div>*/
				        case "node1":
				            node.append("<div class='node node-active' type=1 id='" + id + "'><span>" + "活动节点" + "</span><div class='active-content'><span>活动节点</span></div></div>");
					        $("#" + id).css("left", left).css("top", top);
					        jsPlumb.addEndpoint(id, { anchors: "TopCenter" }, solidCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "RightMiddle" }, hollowCircle);
					        jsPlumb.addEndpoint(id, { anchors: "BottomCenter" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "LeftMiddle" }, hollowCircle);
					//        jsPlumb.addEndpoint(id, hollowCircle);
					        jsPlumb.draggable(id);
					        $("#" + id).draggable({ containment: "parent" });
					        doubleclick(id);
					        break;
				            /*<div class="node node-route" id="node2">
                <span>路由节点</span>
                <div class="route-content"><span>路由节点</span></div>
			</div>*/
                        case "node2":
                           // <div class="node roate" id="node2">路由节点</div>
				          //  node.append("<div class='node node-route' type=2 id='" + id + "'><span>路由节点</span><div class='route-content'><span>路由节点</span></div></div>");
                            node.append("<div class='node roate' id='" + id + "'><span>路由节点</span></div>");
                            $("#" + id).css("left", left).css("top", top);
					        jsPlumb.addEndpoint(id, { anchors: "TopCenter" }, solidCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "RightMiddle" }, hollowCircle);
					        jsPlumb.addEndpoint(id, { anchors: "BottomCenter" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "LeftMiddle" }, hollowCircle);
					 //       jsPlumb.addEndpoint(id, hollowCircle);
					        jsPlumb.draggable(id);
					        $("#" + id).draggable({ containment: "parent" });
					        doubleclick(id,2);
					        break;
				        case "node3":
				            /*<div class="node node-end" id="node3">
                <span>结束</span>
                <div class="active-end"><span>结束</span></div>
			</div>*/
				            //if (j > 0)
                            //{
                            //    alert("您已添加过结束节点,请勿重复添加！");
                            //    break;
				            //}
				            if (!$("#right div.node-end")) {
				                alert("您已添加过结束节点,请勿重复添加！");
				                break;
				            }
				            node.append('<div class="node node-end" type=3 id="' + id + '" ><span>' + "结束" + '</span><div class="active-end"><span>结束</span></div></div>');
					        $("#" + id).css("left", left).css("top", top);
					        jsPlumb.addEndpoint(id, { anchors: "TopCenter" }, solidCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "RightMiddle" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "BottomCenter" }, hollowCircle);
        //					jsPlumb.addEndpoint(id, { anchors: "LeftMiddle" }, hollowCircle);
					        jsPlumb.draggable(id);
					        $("#" + id).draggable({ containment: "parent" });
					        doubleclick(id);
					        break;
			        }
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
		}
	});
	$("#right").on("mouseenter", ".node", function () {
		$(this).append('<img src="../../../themes/th/img/close2.png"  style="position: absolute;" />');
		if ($(this).hasClass('radius')) {
			$("img").css("left", 58).css("top", 0);
		} 
        else {
			$("img").css("left", 100).css("top", -10);
		}
	});
	$("#right").on("mouseleave", ".node", function () {
		$("img").remove();
	});
	$("#right").on("click", "img", function () {
	    var node = $(this).parent();
		if (confirm("确定要删除吗?")) {
            $.ajax({
                url: "STEPATH_BACKNEW.aspx?module=delStep&r=" + Math.random(),
                cache: false,
                data: "&STEP_ID=" + node.attr("id"),
                success: function (svrData) {
			        jsPlumb.removeAllEndpoints(node.attr("id"));
			        node.remove();
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
		}
	});
    //添加链接事件
	jsPlumb.bind("connection", function (connection, originalEvent) {

        var sourceType = $("#" + connection.sourceId).attr("type");
        var targetType = $("#" + connection.targetId).attr("type");

        if (sourceType == "1"&&targetType == "1")
        {
            alert("活动节点的一下节点不能为活动节点，请选择路由节点！");
            setTimeout(function () {
                jsPlumb.detach(connection.connection);
            }, 300);
            return;
        }
        //if (sourceType == "2") {
        //    var html = "<select class='agreeCls'><option value='0'>同意</option><option value='1'>不同意</option></select>";
        //    setTimeout(function () {
        //        connection.connection.getOverlay("label").setLabel(html);
        //        $(".agreeCls").on("click", function (event) {
        //            event.stopPropagation();
        //        });
        //    }, 300);
        //}
        if (connection.sourceId == connection.targetId)
        {
            alert("自身节点不能作为自身下一节点！");
            //jsPlumb.detach(connection);
            setTimeout(function () {
                jsPlumb.detach(connection.connection);
            }, 300);
            return;
        } 

        $.ajax({
            url: "STEPATH_BACKNEW.aspx?module=addConnect&r=" + Math.random(),
            cache: false,
            data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&SourceId=" + connection.sourceId + "&TargetId=" + connection.targetId + "&SourceAnchor=" + connection.sourceEndpoint.anchor.type + "&TargetAnchor=" + connection.targetEndpoint.anchor.type + "&nodeType=" +sourceType,
            success: function (svrData) {
			        
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
	});
	var _time = null;

    //备注连线
//	jsPlumb.bind("dblclick", function (conn, originalEvent) {
//		clearTimeout(_time);
//		var str = conn.getLabel();
//		if (str == null) {
//			conn.setLabel("<input type='text' value=' ' />");
//		} else {
//			conn.setLabel("<input type='text' value='" + $(str).text() + "' />");
//		}
//		$("input[type='text']").mouseleave(function () {
//			if ($(this).val().trim() == "") {
//				conn.setLabel("");
//			} else {
//				conn.setLabel("<span style='display:block;padding:10px;opacity: 0.5;height:auto;background-color:white;border:1px solid #346789;text-align:center;font-size:12px;color:black;border-radius:0.5em;'>" + $(this).val() + "</span>");
//			}
//		});
//	});

////删除链接事件
//jsPlumb.bind("connectionDetached", function(info) {
//   alert("bbb")
//});
	//$(".node").bind("mousedown",function () {
	//    window.clickNodeId = $(this).attr("id");
	//});
	//$(".node").bind("mouseup", function () {
	//    window.clickNodeId = "";
	//});
	//$(".node").bind("mousemove", function (e) {
	//    if (window.clickNodeId && window.clickNodeId != "") {
	//        if (window.preX) {
	//           var left= e.pageX - window.preX;
	//           var top = e.pageY - window.preY;
	//           $(".node:not(#" + window.clickNodeId + ")").each(function (index, obj) {
	//               var l=$(obj).css("left") ;
	//               $(obj).css("left", parseInt(l) + left+"px");
	//               var t=$(obj).css("top") + top
	//               $(obj).css("top", parseInt(t) + top + "px");
	//               console.log(l + " " + t);
	//           });
	//        }
	//        window.preX = e.pageX;
	//        window.preY = e.pageY;
	//        //console.log(e.pageX+" "+e.pageY);
	//    }
	//});
    //删除连线
	jsPlumb.bind("click", function (conn, originalEvent) {
		clearTimeout(_time);
		_time = setTimeout(function () {
			if (confirm("确定删除吗？	"))
                $.ajax({
                    url: "STEPATH_BACKNEW.aspx?module=delConnect&r=" + Math.random(),
                    cache: false,
                    data: "wfid=" + SP.wfid + "&procid=" + SP.procid + "&SourceId=" + conn.sourceId + "&TargetId=" + conn.targetId,
                    success: function (svrData) {
			            jsPlumb.detach(conn);
                    },
                    error: function (a, b, c) {
                        alert(a);
                    }
                });
				
		}, 300);

	});
});

function updateStepName(id) {
    var obj=$("#" + id);
    var type = obj.attr("type");
    obj.find("span").html(stepName);
    showTooltip(obj.find("span:eq(0)"), 4);
    showTooltip(obj.find("span:eq(1)"),4);
}

////基本连接线样式
//var connectorPaintStyle = {
//	lineWidth: 4,
//	strokeStyle: "#61B7CF",
//	joinstyle: "round",
//	outlineColor: "white",
//	outlineWidth: 2
//};
//// 鼠标悬浮在连接线上的样式
//var connectorHoverStyle = {
//	lineWidth: 4,
//	strokeStyle: "#216477",
//	outlineWidth: 2,
//	outlineColor: "white"
//};
//var endpointHoverStyle = {
//	fillStyle: "#216477",
//	strokeStyle: "#216477"
//};
////空心圆端点样式设置
//var hollowCircle = {
//	endpoint: ["Dot", { radius: 8 }],  //端点的形状
//	connectorStyle: connectorPaintStyle,//连接线的颜色，大小样式
//	connectorHoverStyle: connectorHoverStyle,
//	paintStyle: {
//		strokeStyle: "#1e8151",
//		fillStyle: "transparent",
//		radius: 7,
//		lineWidth: 2
//	},		//端点的颜色样式
//	//anchor: "AutoDefault",
//	isSource: true,	//是否可以拖动（作为连线起点）
//	connector: ["Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
//	isTarget: true,	//是否可以放置（连线终点）
//	maxConnections: -1,	// 设置连接点最多可以连接几条线
//	connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
//};
////实心圆样式
//var solidCircle = {
//	endpoint: ["Dot", { radius: 8 }],  //端点的形状
//	paintStyle: { fillStyle: "rgb(122, 176, 44)" },	//端点的颜色样式
//	connectorStyle: { strokeStyle: "rgb(97, 183, 207)", lineWidth: 4 },	  //连接线的颜色，大小样式
//	isSource: true,	//是否可以拖动（作为连线起点）
//	connector: ["Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }], //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
//	isTarget: true,		//是否可以放置（连线终点）
//	//anchor: "AutoDefault",
//	maxConnections: 3,	// 设置连接点最多可以连接几条线
//	connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
//};
////右折线
//var rightConnector = {
//	connector: "Flowchart",
//	anchors: ["RightMiddle", "LeftMiddle"],
//	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
//	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
//	endpoint: ["Dot", { radius: 1 }]
//};
////右直线
//var rightStraightConnector = {
//	connector: "Straight",
//	anchors: ["RightMiddle", "LeftMiddle"],
//	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
//	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
//	endpoint: ["Dot", { radius: 1 }]
//};

////上折线
//var upConnector = {
//	connector: "Flowchart",
//	anchors: ["TopCenter", "BottomCenter"],
//	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
//	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
//	endpoint: ["Dot", { radius: 1 }]
//};

//var downConnector = {
//	connector: "Flowchart",
//	anchors: ["BottomCenter", "TopCenter"],
//	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
//	//paintStyle: { lineWidth: 2, strokeStyle: "#61b7cf", joinstyle: "round", outlineColor: "white", outlineWidth: 2 },
//	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
//	endpoint: ["Dot", { radius: 1 }]
//};

//var flowConnector = {
//	connector: "Flowchart",
//	//anchors: ["BottomCenter", "TopCenter"],
//	paintStyle: { lineWidth: 2, strokeStyle: "#61B7CF", fillStyle: "transparent" },
//	//paintStyle: { lineWidth: 2, strokeStyle: "#61b7cf", joinstyle: "round", outlineColor: "white", outlineWidth: 2 },
//	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
//	endpoint: ["Dot", { radius: 1 }],
//	editable:true;
//};

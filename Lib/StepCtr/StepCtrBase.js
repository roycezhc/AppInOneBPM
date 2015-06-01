//基本连接线样式
var connectorPaintStyle = {
	lineWidth: 2,
	strokeStyle: "#61B7CF",
	joinstyle: "round",
	outlineColor: "white",
	outlineWidth: 2,
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
};
// 鼠标悬浮在连接线上的样式
var connectorHoverStyle = {
	lineWidth: 4,
	strokeStyle: "#216477",
	outlineWidth: 2,
	outlineColor: "white"
};
var endpointHoverStyle = {
	fillStyle: "#216477",
	strokeStyle: "#216477"
};
//空心圆端点样式设置 有注释
var hollowCircleLabel = {
	endpoint: "Dot",  //端点的形状
	connectorStyle: connectorPaintStyle,//连接线的颜色，大小样式
	connectorHoverStyle: connectorHoverStyle,
	paintStyle: {
		strokeStyle: "#1e8151",
		fillStyle: "transparent",
		radius: 7,
		lineWidth: 2
	},		//端点的颜色样式
	//anchor: "AutoDefault",
	isSource: true,	//是否可以拖动（作为连线起点）
	connector: ["Flowchart", { stub: [1, 20], gap: 10, cornerRadius: 5, alwaysRespectStubs: false }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
	//isTarget: true,	//是否可以放置（连线终点）
	maxConnections: 3,	// 设置连接点最多可以连接几条线
	connectorOverlays: [
        ["Arrow", { width: 10, length: 10, location: 1 }],
        ["Label", {
	        location: 0.7,
	        id: "label",
	        cssClass: "aLabel"
	    }]]
};
//空心圆端点样式设置 无注释
var hollowCircle = {
    endpoint: "Dot",  //端点的形状
    connectorStyle: connectorPaintStyle,//连接线的颜色，大小样式
    connectorHoverStyle: connectorHoverStyle,
    paintStyle: {
        strokeStyle: "#1e8151",
        fillStyle: "transparent",
        radius: 7,
        lineWidth: 2
    },		//端点的颜色样式
    //anchor: "AutoDefault",
    isSource: true,	//是否可以拖动（作为连线起点）
    connector: ["Flowchart", { stub: [1, 20], gap: 10, cornerRadius: 5, alwaysRespectStubs: false }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
    //isTarget: true,	//是否可以放置（连线终点）
    maxConnections: 5,	// 设置连接点最多可以连接几条线
    connectorOverlays: [
        ["Arrow", { width: 10, length: 10, location: 1 }]]
};
//空心圆端点样式设置 无注释 无法拉
var hollowCircle2 = {
    endpoint: "Dot",  //端点的形状
    connectorStyle: connectorPaintStyle,//连接线的颜色，大小样式
    connectorHoverStyle: connectorHoverStyle,
    paintStyle: {
        strokeStyle: "#1e8151",
        fillStyle: "transparent",
        radius: 7,
        lineWidth: 2
    },		//端点的颜色样式
    //anchor: "AutoDefault",
    isSource: false,	//是否可以拖动（作为连线起点）
    connector: ["Flowchart", { stub: [1, 20], gap: 10, cornerRadius: 5, alwaysRespectStubs: false }],  //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
    //isTarget: true,	//是否可以放置（连线终点）
    maxConnections: 5,	// 设置连接点最多可以连接几条线
    connectorOverlays: [
        ["Arrow", { width: 10, length: 10, location: 1 }]]
};

//实心圆样式
var solidCircle = {
	endpoint: "Dot",  //端点的形状
	paintStyle: {
	    fillStyle: "rgb(122, 176, 44)",
	    radius: 7
	},	//端点的颜色样式
	connectorHoverStyle: connectorHoverStyle,
	connectorStyle: connectorPaintStyle,//{ strokeStyle: "rgb(97, 183, 207)", lineWidth: 4 },	  //连接线的颜色，大小样式
	//isSource: true,	//是否可以拖动（作为连线起点）
	connector: ["Flowchart", { stub: [10, 20], gap: 10, cornerRadius: 5, alwaysRespectStubs: false }], //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
	isTarget: true,		//是否可以放置（连线终点）
	//anchor: "AutoDefault",
	maxConnections: 5,	// 设置连接点最多可以连接几条线
	connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
};

//实心圆样式 无法拉
var solidCircle2 = {
    endpoint: "Dot",  //端点的形状
    paintStyle: {
        fillStyle: "rgb(122, 176, 44)",
        radius: 7
    },	//端点的颜色样式
    connectorHoverStyle: connectorHoverStyle,
    connectorStyle: connectorPaintStyle,//{ strokeStyle: "rgb(97, 183, 207)", lineWidth: 4 },	  //连接线的颜色，大小样式
    //isSource: true,	//是否可以拖动（作为连线起点）
    connector: ["Flowchart", { stub: [10, 20], gap: 10, cornerRadius: 5, alwaysRespectStubs: false }], //连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
    isTarget: false,		//是否可以放置（连线终点）
    //anchor: "AutoDefault",
    maxConnections: 5,	// 设置连接点最多可以连接几条线
    connectorOverlays: [["Arrow", { width: 10, length: 10, location: 1 }]]
};

//右折线
var rightConnector = {
	connector: "Flowchart",
	anchors: ["RightMiddle", "LeftMiddle"],
	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
	endpoint: ["Dot", { radius: 1 }]
};
//右直线
var rightStraightConnector = {
	connector: "Straight",
	anchors: ["RightMiddle", "LeftMiddle"],
	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
	endpoint: ["Dot", { radius: 1 }]
};

//上折线
var upConnector = {
	connector: "Flowchart",
	anchors: ["TopCenter", "BottomCenter"],
	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
	endpoint: ["Dot", { radius: 1 }]
};

var downConnector = {
	connector: "Flowchart",
	anchors: ["BottomCenter", "TopCenter"],
	paintStyle: { lineWidth: 1, strokeStyle: "#000000" },
	//paintStyle: { lineWidth: 2, strokeStyle: "#61b7cf", joinstyle: "round", outlineColor: "white", outlineWidth: 2 },
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
	endpoint: ["Dot", { radius: 1 }]
};

var flowConnector = {
    connector: ["Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }],
	//anchors: ["BottomCenter", "TopCenter"],
	paintStyle: { lineWidth: 2, strokeStyle: "#61B7CF" },
	//paintStyle: { lineWidth: 2, strokeStyle: "#61b7cf", joinstyle: "round", outlineColor: "white", outlineWidth: 2 },
	overlays: [["Arrow", { width: 10, length: 10, location: 1 }]],
	endpoint: ["Dot", { radius: 4 }]

};

//"Flowchart", { stub: [40, 60], gap: 10, cornerRadius: 5, alwaysRespectStubs: true }

$(function () {
    //d调用后 直接 为div加上title 就可以显示tooltip
    $(document).tooltip();
    //在开始之前，先遍历所有节点，如果字符串大于4，就添加title，并将text改为前面4个字符..
    $(".node").each(function (index, obj) {
        $(obj).find("span").each(function (i2, o2) {
            showTooltip($(o2), 4);
        });
    });
})
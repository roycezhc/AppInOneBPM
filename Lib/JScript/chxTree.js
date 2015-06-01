var Chx=function(){};
Chx.Tree=function(){
    var _curSelNode=null;//鼠标右击时选择的节点
    var _tvID="";
    var _reTemp="";//存储处理结果的临时变量
};
Chx.Tree.magParam={
        editUrl: "",
        showUrl: "",
        manageUrl:"",
        backSvrUrl:"",
        sortUrl:"",
        defaultUrl:'',
        expNType:''
};
//创建树节点
Chx.Tree.toTreeNode = function(jLiNode) {
     var tn=new Chx.Tree.TreeNode();
     tn.setJDomNode(jLiNode);
     return tn;
 };
 Chx.Tree.getBackSvrUrl = function (moreUrl) {
     if (Chx.Tree.magParam.backSvrUrl.indexOf("?") != -1) {
         return Chx.Tree.magParam.backSvrUrl + "&expNType=" + Chx.Tree.magParam.expNType + "&" + moreUrl;
     } else {
         return Chx.Tree.magParam.backSvrUrl + "?expNType=" + Chx.Tree.magParam.expNType + "&" + moreUrl;
     }
 }

 Chx.Tree.TreeView = function (tvid) {
     //alert($("#" + tvid).find("ul li ul li b").length);
     $("#" + tvid).find("ul li ul li b").trigger("mousedown"); //alert("sssssssss");
     this.getSelNode = function () { return Chx.Tree._curSelNode; };
     this.setSelNode = function (selNode) { Chx.Tree._curSelNode = selNode; };
     var _id;
     this.getID = function () { return _id; };
     this.setID = function (newID) { _id = newID; };
     var _name;
     this.getName = function () { return _name; };
     this.setName = function (newName) { _name = newName; };

     if (arguments.length > 0) {
         Chx.Tree._tvID = arguments[0];
         _id = arguments[0];
         initSubNodesEvent($("#" + _id));
     }
     if (arguments.length > 1) {
         _urlEdit = arguments[1];
     }
     if (arguments.length > 2) {
         _urlManage = arguments[2];
     }
     if (arguments.length > 3) {
         _urlDelete = arguments[3];
     }
     if (arguments.length > 4) {
         _urlSort = arguments[4];
     }

 }
/////////////////////////////////////////////////////////////////
 Chx.Tree.TreeNode = function () {
     var _rootid;
     this.getRootID = function () {
         if (_rootid == undefined || _rootid == "") {
             var dataObj = eval("(" + _data + ")");
             return dataObj.rid;
         } else {
             return _rootid;
         }
     };
     this.setRootID = function (rid) { _rootid = rid; };
     var _id;
     this.getID = function () { return _id; };
     this.setID = function (newID) { _id = newID; };
     var _name;
     this.getName = function () { return _name; };
     this.setName = function (newName) {
         _name = newName;
         if (_jDomNode != null && _jDomNode != undefined) {
             _jDomNode.find("a:first").text(newName);
         }
     };
     var _data;
     this.getData = function () { return _data; };
     this.setData = function (newDD) {
         _data = newDD;
         var dataObj = eval("(" + _data + ")");
         _id = dataObj.id;
         _name = dataObj.name;
     };
     var _jDomNode; //当前节点对象对应的LI标记DOM对象
     this.getJDomNode = function () { return _jDomNode; };
     this.setJDomNode = function (jdom) {
         _jDomNode = jdom;
         _id = jdom.attr("id");
         _name = jdom.find("a:first").text();
         _data = jdom.attr("data");
     };

     if (arguments.length > 0) {
         if (arguments[0][0].tagName == "LI") {
             var jdom = arguments[0];
             _jDomNode = jdom;
             _id = jdom.attr("id");
             _name = jdom.find("a:first").text();
             _data = jdom.attr("data");
         }
     }
     Chx.Tree.TreeNode.prototype.toAddSubNodePage = function () {
         if (this.hadExpendNode() == false) {
             this.showSubNodes();
         }
         var url = Chx.Tree.magParam.editUrl;
         var tndata = eval('( ' + this.getData() + ') ');
         if (url.indexOf("?") != -1) {
             url += "&tree=1&";
         } else {
             url += "?tree=1&";
         }
         url += JsonToPara(tndata);
         //window.frames["ifrMain"].window.location.href = url;
         $("#ifrMain").attr("src", url);
     }

     Chx.Tree.TreeNode.prototype.toEditNodePage = function () {
         var url = Chx.Tree.magParam.editUrl;
         var tndata = eval('( ' + this.getData() + ') ');
         if (url.indexOf("?") != -1) {
             url += "&tree=1&";
         } else {
             url += "?tree=1&";
         }
         url += "toEdit=1&" + JsonToPara(tndata);
         $("#ifrMain").attr("src", url);
     }
     //添加子节点
     Chx.Tree.TreeNode.prototype.addSubNode = function (tn) {
         var _jDomNode = this.getJDomNode();

         var pdataObj = eval("(" + _jDomNode.attr("data") + ")");
         pdataObj.sc = parseInt(pdataObj.sc) + 1;
         _jDomNode.attr("data", JsonToStr(pdataObj));

         var tndata = tn.getData();
         var tndataObj = eval("(" + tndata + ")");
         var emcls = "";
         if (tndataObj.clsname != undefined && tndataObj.clsname != "") {
             emcls = " class='" + tndataObj.clsname + "'"
         }
         if (emcls == "") {
             emcls = "class='node_" + pdataObj.ntype + "'";
         }
         var ulObj = _jDomNode.find("ul:first");
         var liHtml = "<li id=\"node_" + tn.getID() + "\" data=\"" + tndata + "\" class='last leaf'><div><b></b><em" + emcls + "></em><a href=''>" + tn.getName() + "</a></div></li>";
         //alert(liHtml);
         if (ulObj.length > 0) {
             ulObj.append(liHtml);
         } else {
             _jDomNode.append("<ul>" + liHtml + "</ul>");
         }
         var newNode = _jDomNode.find("li[id='node_" + tn.getID() + "']");
         tn.setJDomNode(newNode);
         initNodeEvent(newNode);
         setLast(newNode.prev(), false);
     };
     //添加子节点
     Chx.Tree.TreeNode.prototype.toShowSubNodes = function (tnObjDataStr) {
         // alert(tnObjDataStr);
         if (tnObjDataStr != "") {
             var _jDomNode = this.getJDomNode(); //alert(tnObjDataStr);
             var arr = eval(tnObjDataStr);
             if (arr.length > 0) {
                 var ulObj = _jDomNode.find("ul:first");
                 var liHtml = ""; var licls = "";
                 for (var i = 0; i < arr.length; i++) {
                     licls = "";
                     if (i == arr.length - 1) {
                         licls = "last";
                     }
                     if (arr[i].sc == 0) {
                         if (licls != "") { licls += " "; }
                         licls += "leaf";
                     }
                     var emcls = "";
                     if (arr[i].clsname != undefined && arr[i].clsname != "") {
                         emcls = " class='" + arr[i].clsname + "'"
                     }
                     if (licls != "") { licls = " class='" + licls + "'"; }
                     if (emcls == "") {
                         if (arr[i].ntype != undefined && arr[i].ntype != "") {
                             emcls = " class='node_" + arr[i].ntype + "'"
                         }
                     }
                     //alert(emcls);
                     liHtml += "<li " + licls + " id='node_" + arr[i].id + "' data=\"" + JsonToStr(arr[i]) + "\"><div><b></b><em " + emcls + "></em><a href=''>" + arr[i].name + "</a></div></li>";
                 }
                 if (ulObj.length > 0) {
                     ulObj.append(liHtml);
                 } else {
                     _jDomNode.append("<ul>" + liHtml + "</ul>");
                 }
                 initSubNodesEvent(_jDomNode);
             }

         }
     };
     //显示所有子节点
     Chx.Tree.TreeNode.prototype.showSubNodes = function () {
         var _jDomNode = this.getJDomNode();
         var para = eval("(" + _jDomNode.attr("data") + ")"); // alert(_jDomNode.attr("data"));
         //        if (parseInt(para.sc) == 0) {
         //            return;
         //        }
         var sta = _jDomNode.attr("exp");
         if (sta == undefined) {
             sta = 0;
         } else {
             sta = parseInt(sta);
         }
         if (sta <= 1) {
             if (sta == 0) {
                 //alert(Chx.Tree.magParam.backSvrUrl + "?ShowSubNodes=" + Math.random());
                 //alert(Chx.Tree.getBackSvrUrl("ShowSubNodes=" + Math.random()));
                 var url = Chx.Tree.getBackSvrUrl("ShowSubNodes=" + Math.random());
                 $.get(url, para, function (data) {
                     //alert(data);
                     Chx.Tree.toTreeNode(_jDomNode).toShowSubNodes(data);
                 });
             }
             _jDomNode.find("ul:first").show();
             this.setOpened(true);
         } else {
             _jDomNode.find("ul:first").hide();
             this.setOpened(false);
         }
     };

     //重新显示所有子节点
     Chx.Tree.TreeNode.prototype.toReShowSubNodes = function () {
         var _jDomNode = this.getJDomNode(); //alert(_jDomNode.html());
         var sta = _jDomNode.attr("exp");
         if (sta == undefined) {
             sta = 0;
         } else {
             sta = parseInt(sta);
         }
         if (sta >= 1) {
             _jDomNode.find("ul:first").empty(); _jDomNode.attr("exp", "0");
         } else {
             _jDomNode.find("ul:first").show();
         }
         Chx.Tree.toTreeNode(_jDomNode).showSubNodes();
     };

     //设置当前节点为打开（关闭）状态
     Chx.Tree.TreeNode.prototype.setOpened = function (isopened) {
         var _jDomNode = this.getJDomNode();
         if (isopened == true) {
             _jDomNode.removeClass("leaf");
             _jDomNode.attr("exp", "2");
             _jDomNode.find("div:first").addClass("opened");
         } else {
             _jDomNode.removeClass("leaf");
             _jDomNode.attr("exp", "1");
             _jDomNode.find("div:first").removeClass("opened");
         }
     }
     //删除当前节点
     Chx.Tree.TreeNode.prototype.removeNode = function () {
         var _jDomNode = this.getJDomNode();
         var para = eval("(" + _jDomNode.attr("data") + ")");
         if (para.sc > 0 && para.sc < 999999) {
             alert("存在子节点，不能删除！");
             return;
         }

         $.get(Chx.Tree.getBackSvrUrl("DelNodeID=" + Math.random()), para, function (data) {
             var reg = /^-?\d*$/;
             if (reg.test(data) == true) {
                 if (parseFloat(data) > 0) {
                     var pNode = _jDomNode.parent(); //ul
                     _jDomNode.remove();

                     var pdataObj = eval("(" + pNode.parent().attr("data") + ")");
                     pdataObj.sc = parseInt(pdataObj.sc) - 1;
                     pNode.parent().attr("data", JsonToStr(pdataObj));

                     var subLIS = pNode.children();
                     if (subLIS.length > 0) {
                         setLast($(subLIS[subLIS.length - 1]), true);
                     } else {
                         setLeaf(pNode.parent(), true);
                     }
                     alert("删除成功！");
                 } else {
                     alert("删除失败！");
                 }
             } else {
                 alert(data);
             }
         });

     }
     //当前节点上移一位
     Chx.Tree.TreeNode.prototype.toUp = function () {
         var _jDomNode = this.getJDomNode();
         var dataObjPre = eval("(" + _jDomNode.prev().attr("data") + ")");
         var dataObj = eval("(" + _jDomNode.attr("data") + ")");
         var sortPara = { chgid1: dataObj.id, chgsort1: dataObjPre.no, chgid2: dataObjPre.id, chgsort2: dataObj.no };
         $.get(Chx.Tree.getBackSvrUrl("UpdateSort=" + Math.random()), sortPara, function (data) {
             var _jDomNode = Chx.Tree._curSelNode;
             if (data == "ok") {
                 var temp = dataObj.no;
                 dataObj.no = dataObjPre.no;
                 dataObjPre.no = temp;
                 _jDomNode.attr("data", JsonToStr(dataObj));
                 _jDomNode.prev().attr("data", JsonToStr(dataObjPre));
                 if (isLastNode(_jDomNode)) {
                     setLast(_jDomNode, false);
                     setLast(_jDomNode.prev(), true);
                 }
                 _jDomNode.prev().before(_jDomNode);
                 //alert("上移序号成功！");
             } else {
                 alert(data);
             }
         });
     }
     //当前节点下移一位 //jinsj 在divTree中实现
     Chx.Tree.TreeNode.prototype.toDown = function () {
         var _jDomNode = this.getJDomNode();
         var dataObjPre = eval("(" + _jDomNode.next().attr("data") + ")");
         var dataObj = eval("(" + _jDomNode.attr("data") + ")"); //
         var sortPara = { chgid1: dataObj.id, chgsort1: dataObjPre.no, chgid2: dataObjPre.id, chgsort2: dataObj.no };
         //alert(Chx.Tree.magParam.backSvrUrl + "?UpdateSort=" + Math.random());
         $.get(Chx.Tree.getBackSvrUrl("UpdateSort=" + Math.random()), sortPara, function (data) {
             var _jDomNode = Chx.Tree._curSelNode;
             if (data == "ok") {
                 var dataObjPre = eval("(" + _jDomNode.next().attr("data") + ")");
                 var dataObj = eval("(" + _jDomNode.attr("data") + ")");
                 var temp = dataObj.no;
                 dataObj.no = dataObjPre.no;
                 dataObjPre.no = temp;
                 _jDomNode.attr("data", JsonToStr(dataObj));
                 _jDomNode.next().attr("data", JsonToStr(dataObjPre));
                 if (isLastNode(_jDomNode.next())) {
                     setLast(_jDomNode.next(), false);
                     setLast(_jDomNode, true);
                 }
                 _jDomNode.next().after(_jDomNode);
                 //alert("下移序号成功！");
             } else {
                 alert(data);
             }
         });
     }
     //设置节点为选中（不选中）状态
     Chx.Tree.TreeNode.prototype.setSelected = function (isSel) {
         var _jDomNode = this.getJDomNode();
         if (isSel == true) {
             var subLIS = _jDomNode.parent().children();
             for (var a = 0; a < subLIS.length; a++) {
                 $(subLIS[a]).removeClass("sel");
             }
             _jDomNode.addClass("sel");
         } else {
             _jDomNode.removeClass("sel");
         }

     }
     //是否已经展开节点
     Chx.Tree.TreeNode.prototype.hadExpendNode = function () {
         var _jDomNode = this.getJDomNode();
         var sta = _jDomNode.attr("exp");
         if (sta == undefined) {
             sta = 0;
         } else {
             sta = parseInt(sta);
         }
         if (sta == 2) {
             return true;
         } else {
             var ddd = $(_jDomNode.children()[0]);
             if (ddd.attr("class") == "opened") {
                 return true;
             }
             return false;
         }
     };
     //************////////////////////////////////////////////////////////////////////
     //jinsj
     //内部私有方法
     //把指定节点设置为最后一个节点
     function setLast(jquryLiNode, islast) {
         if (islast == true) {
             jquryLiNode.addClass("last");
         } else {
             jquryLiNode.removeClass("last");
         }
     }
     //把指定节点设置为叶节点
     function setLeaf(jquryLiNode, isleaf) {
         if (isleaf == true) {
             var divObj = jquryLiNode.find("div:first");
             if (divObj.attr("class").indexOf('root') == -1) {
                 jquryLiNode.addClass("leaf");
             }
         } else {
             jquryLiNode.removeClass("leaf");
         }
     }
     //判断当前节点是否是最后一个节点
     function isLastNode(curNode) {
         var subLIS = curNode.parent().children();
         if (curNode.attr("id") == subLIS[subLIS.length - 1].id) {
             return true;
         }
         return false;
     }
 }
//****************************************************************************************************
//操作页面编辑完成后调用此方法完成新增节点
 function addSubNodeForOprPage(dataStr) {
    //window.history.forward();
    var ptn=Chx.Tree.toTreeNode(Chx.Tree._curSelNode);
    var tn=new Chx.Tree.TreeNode();tn.setData(dataStr);
    ptn.addSubNode(tn);
    //alert(tn.getID()+"|"+tn.getData()+"|");
    ptn.setOpened(true);
    //window.location.replace("../../ok.aspx");
}

//操作页面编辑完成后调用此方法完成新增节点
function editNodeForOprPage(dataStr) {

    window.history.forward();
    var dataObj=eval("("+dataStr+")");
    var tn=Chx.Tree.toTreeNode(Chx.Tree._curSelNode);
    tn.setData(dataStr);
    tn.setName(dataObj.name);
}

//****************************************************************************************************
//将特定的JSON对象转化为对应的JSON字符串，用户保存在节点DATA属性里
function JsonToStr(objData){
    //return "{rid:'"+objData.rid+"',id:'"+objData.id+"',pid:'"+objData.pid+"',no:"+objData.no+",sc:"+objData.sc+",name:'"+objData.name+"'}";
    var str = "{";
    for (var el in objData) {
        if (str.length > 1) {
            str += ",";
        }
        str += el.toString() + ":'" + objData[el.toString()] + "'";
    }
    str += "}";
    return str;
}
function JsonToPara(tndata) {
//    var paraStr = "rid=" + tndata.rid + "&id=" + tndata.id + "&pid=" + tndata.pid + "&sc=" + tndata.sc + "&no=" + tndata.no;
//    if(tndata.hasOwnProperty("CType")){
//        paraStr += "&CType=" + tndata.CType;
//    }
    //    return paraStr;
    var str = "";
    for (var el in tndata) {
        if (str.length > 1) {
            str += "&";
        }
        str += el.toString() + "=" + escape(tndata[el.toString()]);
    }
    return str;
}

function initSubNodesEvent(nodeObj){
    var lis = nodeObj.find("li");//alert(lis.length);
    for(var i=0;i<lis.length;i++){
        initNodeEvent($(lis[i]));
    }
}
function initNodeEvent(jLiDom){
    jLiDom.bind("mousedown", jLiDom, function (event) {
        var binder = event.data;
        nodeEventOperate(event, binder);
        return false;
    });
    var dataStr = jLiDom.attr("data");
    var dataObj = eval("(" + dataStr + ")");


    var pdata = jLiDom.parent().parent().attr("data");
    if (pdata != undefined && pdata.indexOf("id:") != -1) {
        var pdataObj = eval("(" + pdata + ")"); //alert(Chx.Tree.magParam.expNType+ "&&" + Chx.Tree.magParam.expNType + "||" + Chx.Tree.magParam.expNType);
            if (Chx.Tree.magParam.expNType != "" && (dataObj.ntype == Chx.Tree.magParam.expNType || pdataObj.ntype != Chx.Tree.magParam.expNType)) {
                var divcls = jLiDom.find("div:first").attr("class");
                //alert(divcls+"---");
                if (divcls == undefined || divcls.indexOf("opened") == -1) {
                    jLiDom.find("b").trigger("mousedown");
                }
            }
    }
}
function nodeEventOperate(event,binder){
        var oldSelNode=Chx.Tree._curSelNode;
        if(oldSelNode!=null&&oldSelNode!=undefined){//久的选择节点设置为未选中
             var oldTN=Chx.Tree.toTreeNode(oldSelNode);
             oldTN.setSelected(false);
         }
         if (event.srcElement != undefined) {
             Chx.Tree._curSelNode = binder;
         }
        var me=$(event.target);
        var tag=me[0].tagName;
        var tn=Chx.Tree.toTreeNode(binder);
       
        if(event.which==3){
            showMenu(me);
            tn.setSelected(true);
        }else{
            if(tag=="B"||tag=="EM"){
                tn.showSubNodes();
            }else{
                tn.setSelected(true);
                if (binder.attr("class").indexOf("root") == -1) {
                    gotoPageByNode(tn);
                }
            }
        }
}

function beforClick(tndata){}

function gotoPageByNode(tn) {

    var tndata = eval('( ' + tn.getData() + ') '); // alert(tndata.id);
    beforClick(tndata);
    var url = Chx.Tree.magParam.defaultUrl; //alert(tn.getData());
    if (url == "") {
        return;
    }
    if (url.indexOf("?") != -1) {
        url += "&";
    } else {
        url += "?";
    }
    url += JsonToPara(tndata) + "&tree=" + Math.random();//alert(url);
    $("#ifrMain").attr("src", url);
}

function beforeShowMenuDefault(curSelNode) {
    if (curSelNode == null)
        return;
    if(curSelNode.prev().length>0){
       $("#btnUp").show();
    }else{
       $("#btnUp").hide();
    }
    if(curSelNode.next().length>0){
       $("#btnDown").show();
    }else{
       $("#btnDown").hide();
    }
}
function beforeShowMenu(curSelNode){
    
}
//显示菜单
function showMenu(posObj){
    var curSelNode=Chx.Tree._curSelNode;
    beforeShowMenuDefault(curSelNode);
    beforeShowMenu(curSelNode);
    var offset = posObj.offset();
    menuCont=$("#ulMenu");
    menuCont.css({ top: offset.top + posObj.height() + "px", left: offset.left });
    menuCont.show();
}
function hideMenu(){
     $("#ulMenu").hide();
}

$(document).bind("contextmenu",function(e){
      return false;
});

$(document).bind("mouseup",function(e){
     if(e.which!=3){
         hideMenu();
     }
    
});
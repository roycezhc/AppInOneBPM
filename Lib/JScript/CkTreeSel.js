//.net的树形控件每个TABLE构造一个节点，因此此代码每个节点也通过此TABLE构造一个TreeNode
//取消选择子节点 不影响上级节点
var Chx = function () { };
Chx.CkTreeSel = function () {
};
Chx.CkTreeSel.Paras = {
    tvID: "tvMdl", //树形控件的客户端ID
    UnCheckedParent: true,
    CheckedParent: false
};
//TABLE转化为TreeNode
Chx.CkTreeSel.toTreeNode = function (tbObj) {
    var tn = new Chx.Tree.TreeNode(tbObj); //
    return tn;
};

//初始化选择控件
Chx.CkTreeSel.initEvents = function () {
    var ppp = $("div[id*='" + Chx.CkTreeSel.Paras.tvID + "']").find("input[type='checkbox']");
    //alert(Chx.CkTreeSel.Paras.tvID);
    for (var i = 0; i < ppp.length; i++) {
        var pObj = $(ppp[i]);
        pObj.bind("click", pObj, function (e) {
            var tn = getNodeByCk(e.data);
            tn.setSubNodesCheck();
            if (Chx.CkTreeSel.Paras.CheckedParent == true) {
                tn.setParentNodesChecked();
            }
        });
    }
};
//节点类
Chx.CkTreeSel.TreeNode = function (jdom) {
    var _Node; //当前节点对应的TABLE对象
    var _NodeC; //包含当前节点的容器对象DIV
    var _SubNodeC; //子节点的容器对象DIV

    //根据TABLE对象初始化TreeNode数据
    this.setNode = function (jdom) {
        //alert(jdom.attr("tagName"));
        _Node = jdom;
        _NodeC = _Node.parent();
        _SubNodeC = _Node.next();
        //alert(_SubNodeC.length); alert("aaa");
        if (_SubNodeC.length == 0 || _SubNodeC[0].tagName != "DIV") {
            _SubNodeC = null;
        }
    };
    if (arguments.length > 0) {
        this.setNode(jdom);
    }
    //得到当前节点对应的TABLE对象
    this.getNode = function () { return _Node; };
    //包含当前节点的容器对象DIV
    this.getNodeC = function () { return _NodeC; };
    //子节点的容器对象DIV
    this.getSubNodeC = function () { return _SubNodeC; };

    //获取当前节点的选择状态
    this.getChecked = function () {
        var isCk = _Node.find("input[type='checkbox']").attr("checked");
        return (isCk == "checked" || isCk == true);
    }
    //获取子节点数组
    Chx.CkTreeSel.TreeNode.prototype.getSubNodes = function () {
        var nodeC = this.getSubNodeC();
        if (nodeC == null) {
            return null;
        }
        var nodes = new Array();
        var tbs = nodeC.children();
        for (var i = 0; i < tbs.length; i++) {
            var tn = new Chx.CkTreeSel.TreeNode($(tbs[i]));
            nodes.push(tn);
        }
        return nodes;
    }
    //获取父节点
    Chx.CkTreeSel.TreeNode.prototype.getParentNode = function () {
        var _PNode = this.getNode().parent().prev();
        if (_PNode.length == 0 || _PNode[0].tagName != "TABLE") {
            return null;
        } else {
            var _ParentNode = new Chx.CkTreeSel.TreeNode(_PNode);
            return _ParentNode;
        }
    }

    //设置节点的选择状态，不给参数，执行反选；给参数则设置为参数的值
    Chx.CkTreeSel.TreeNode.prototype.setChecked = function (isChecked) {
        var node = this.getNode();
        var ck = node.find("input[type='checkbox']");
        if (isChecked != undefined) {
            ck.attr("checked", isChecked);
        }
        else {
            if (ck.attr("checked") == true) {
                ck.attr("checked", false);
            } else {
                ck.attr("checked", true);
            }
        }
    }

    //当选择当前节点时，递归选中所有父节点
    Chx.CkTreeSel.TreeNode.prototype.setParentNodesChecked = function () {

        var pNode = this.getParentNode();
        if (pNode == null) {
            return;
        }
        var ck = this.getChecked(); //alert(ck);
        if (ck == true) {
            pNode.setChecked(true);
        } else {
            if (pNode.isOneSubNodeChecked()) {
                pNode.setChecked(true);
            } else {
                if (Chx.CkTreeSel.Paras.UnCheckedParent == true) {
                    pNode.setChecked(false);
                }
            }
        }
        if (pNode.isRoot() == false) {
            pNode.setParentNodesChecked();
        }
    }

    //根据当前节点设置所有子节点的选择状态
    Chx.CkTreeSel.TreeNode.prototype.setSubNodesCheck = function () {
        var nodes = this.getSubNodes();
        if (nodes == null) {
            return;
        }
        var ck = this.getNode().find("input[type='checkbox']").attr("checked");
        ck = (ck == "checked" || ck == true);
        for (var i = 0; i < nodes.length; i++) {
            nodes[i].getNode().find("input[type='checkbox']").attr("checked", ck);
        }
    }

    //判断是否所有子节点已经被选中
    Chx.CkTreeSel.TreeNode.prototype.isAllSubNodesChecked = function (isChecked) {
        var nodeC = this.getSubNodeC();
        if (nodeC == null) {
            return true;
        }
        var tbs = nodeC.children();
        for (var i = 0; i < tbs.length; i++) {
            var tb = $(tbs[i]);
            if (tb.length > 0 && tb[0].tagName == "TABLE") {
                var cks = tb.find("input[type='checkbox']");
                if (isChecked == true) {
                    if (cks.attr("checked") == false) {
                        return false;
                    }
                } else {
                    if (cks.attr("checked") == true) {
                        return false;
                    }
                }
            }
        }
        return true;
    }
    //判断是否至少有一个子节点被选中
    Chx.CkTreeSel.TreeNode.prototype.isOneSubNodeChecked = function () {
        var nodeC = this.getSubNodeC();
        if (nodeC == null) {
            return true;
        }
        var tbs = nodeC.children();
        for (var i = 0; i < tbs.length; i++) {
            var tb = $(tbs[i]);
            if (tb.length > 0 && tb[0].tagName == "TABLE") {
                var cks = tb.find("input[type='checkbox']");
                if (cks.attr("checked") == true) {
                    return true;
                }
            }
        }
        return false;
    }
    //是否为叶节点
    Chx.CkTreeSel.TreeNode.prototype.isLeaf = function () {
        var nodeC = this.getSubNodeC();
        return nodeC == null;
    }
    //是否为根节点
    Chx.CkTreeSel.TreeNode.prototype.isRoot = function () {
        return this.getNodeC().attr("id") == Chx.CkTreeSel.Paras.tvID;
    }
}

//根据选择框获取对应的TreeNode
function getNodeByCk(me) {
    me = me.parent();
    if (me.length > 0 && me[0].tagName == "TABLE") {
        var tn = new Chx.CkTreeSel.TreeNode(me);
        return tn;
    }
    return getNodeByCk(me);
}
var TV = {};
TV.selNode = null;

TV.maxWidth = 0;
//把JSON对象转为为对应的JSON格式字符串
TV.jsonToStr = function (objData) {
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
//把JSON对象转化为连接参数字符串
TV.jsonToPara = function (tndata) {
    var str = "";
    for (var el in tndata) {
        if (str.length > 1) {
            str += "&";
        }
        str += el.toString() + "=" + escape(tndata[el.toString()]);
    }
    return str;
}


//树和节点类的原型类，定义通用的方法。
TV.TreePrototype = function () {
    this.Msg = function (msg) {
        alert(msg);
    }

    this.beforeShowMenuDefault = function () {
        var tn = this.getSelNode();
        if (tn.getSC() <= 0) {
            this.hideMenuItem("btn_sort");
        } else {
            this.showMenuItem("btn_sort");
        }
        if (tn.first()) {
            this.hideMenuItem("btn_up");
        } else {
            this.showMenuItem("btn_up");
        }
        if (tn.last()) {
            this.hideMenuItem("btn_down");
        } else {
            this.showMenuItem("btn_down");
        }
    }
    this.beforeShowMenu = function () {

    }

    this.getBackUrl = function (url, morepara) {
        if (url.indexOf("?") == -1) {
            return url + "?" + morepara;
        } else {
            return url + "&" + morepara;
        }
    }

};

TV.showSubNodes = function (dataStr) {//新增
    var tn = TV.selNode;
    if (dataStr.indexOf("[") != 0) {
        dataStr = "[" + dataStr + "]";
    }
    var arr = eval(dataStr);
    tn.addSubNodes(arr);
}
TV.editNodeInfo = function (dataStr) {//编辑
    if (dataStr.indexOf("(") != 0) {
        dataStr = "(" + dataStr + ")";
    }
    var obj = eval(dataStr);
    var tn = TV.selNode;
    tn.editNode(obj);

}
TV.selBox = function (meObj, tn) {
    var liEL = meObj.parent().parent().parent().parent();
    //alert(meObj.attr("checked"));
    if (meObj.attr("checked") == "checked") {
        liEL.find("input[type='checkbox']").attr("checked", true);
    } else {
        liEL.find("input[type='checkbox']").attr("checked", false);
    }
    //alert(tn.getID());

}

TV.Tree = function (id, option) {
    var tv = this;
    if (id == undefined) {
        alert("请将树形容器元素的ID作为参数传入。");
        return;
    }
    //默认参数 zlg 配置重点
    var defaultOptions = {
        ifrID: 'ifrMain',
        pageBack: 'DeptBack.aspx',
        pageDefault: 'DeptEdit.aspx',
        checkBox: 0, //0不显示，1显示在叶节点，2显示在父节点，3所有
        showUp: true, //false,
        showDown: true, //false,
        showSort: true, //false,
        showRefresh: true, //true,
        showClearCheck: true, //false,
        showDelete: true, //false,
        exdPath: '', //自动展开的ID路径，多个路径用"|"隔开，每个路径以0开始，如：0,1,2,3|0,1,2
        exdTypes: '',
        skin: '',
        selNodeHandle: function (tn) { return true; } //选中节点触发的事件，用户可以自定义此事件代码。参数为树节点对象，非jquery活dom对象
    }


    var opts = defaultOptions;
    if (option != undefined) {
        opts = $.extend(opts, option);
    }

    //树形插件容器对象
    var containerEL = $("#" + id);
    if (containerEL.length > 0 && containerEL[0].tagName != "UL") {
        containerEL = containerEL.find("ul:first");
    }
    if (opts.skin != "") {
        containerEL.addClass(opts.skin);
    }

    var exdPathArr = new Array();

    if (opts.exdPath != "") {
        var arr = new Array(opts.exdPath);
        if (opts.exdPath.indexOf('|') != -1) {
            arr = opts.exdPath.split('|');
            for (var i = 0; i < arr.length; i++) {
                exdPathArr.push(arr[i].split(','));
            }
        } else {
            exdPathArr.push(opts.exdPath.split(','));
        }
        //        for (var i = 0; i < arr.length; i++) {
        //            var temp = arr[i].split(',');
        //            var aaa = new Array();
        //            for (var a = 0; a < temp.length; a++) {
        //                if (!(a > 0 && (temp[a].toString() == '0' || temp[a].toString() == ''))) {
        //                    aaa.push(temp[a]);
        //                }
        //            }
        //            exdPathArr.push(aaa);
        //        }
    }
    var _selNode = null; //选中的节点
    this.getSelNode = function () {
        return _selNode;
    }

    var setSelNode = function (node) {
        if (node == undefined || node == null) {
            TV.selNode.getEL().removeClass("sel");
            _selNode = null;
            TV.selNode = null;

        } else {
            _selNode = node;
            TV.selNode = node;
            TV.selNode.getEL().addClass("sel");
        }
    }
    var menuDiv = $("<div class='divtree-menu'></div>");
    $("form:first").append(menuDiv);

    //显示菜单
    this.showMenu = function (posObj) {
        //alert(_selNode);
        this.beforeShowMenuDefault();
        this.beforeShowMenu();
        var offset = posObj.offset();
        var winH = $(window).height();
        var top = offset.top;
        if (winH - top - 35 < menuDiv.height()) {
            top = top - menuDiv.height() - 25;
        }
        menuDiv.css({ top: top + posObj.height() + "px", left: offset.left });
        menuDiv.show();
    }
    this.hideMenu = function () {
        menuDiv.hide();
    }
    this.addMenu = function (id, text, click) {
        var btnObj = $("<input type='button' id='" + id + "' value='" + text + "' />");
        var firstChd = menuDiv.find("input:first");
        if (firstChd.length > 0) {
            firstChd.after(btnObj);
        } else {
            menuDiv.append(btnObj);
        }
        btnObj.bind("mousedown", btnObj, function (e) {
            click(_selNode);
        });
    }
    this.hideMenuItem = function () {
        var args = arguments;
        for (var i = 0; i < args.length; i++) {
            menuDiv.find("input[id='" + args[i] + "']").hide();
        }
    }
    this.showMenuItem = function () {
        var args = arguments;
        for (var i = 0; i < args.length; i++) {
            menuDiv.find("input[id='" + args[i] + "']").show();
        }
    }
    this.getCheckedIDS = function (vals) {
        var cks = containerEL.find("input:checked");
        var ids = "";
        cks.each(function (i) {
            var id = $(this).val();
            var str = $(this).parent().parent().parent().parent().attr("data");
            var obj = eval("(" + str + ")");
            if (id == "" || id == undefined) {
                id = obj.id;
            }
            if (vals != "") {
                var arr = null;
                if (vals.indexOf(",") != -1) {
                    arr = vals.split(',');
                } else {
                    arr = new Array(vals);
                }

                for (var a = 0; a < arr.length; a++) {
                    if (arr[a] == "name") {
                        id = id + ":" + obj.name;
                    }
                    if (arr[a] == "ntype") {
                        id = id + ":" + obj.ntype;
                    }
                    if (arr[a] == "pid") {
                        id = id + ":" + obj.pid;
                    }
                }
            }

            ids = id;
        });

        return ids;
    }
    this.getCheckedObjStr = function (vals) {
        var cks = containerEL.find("input:checked");
        var ids = "";
        cks.each(function (i) {
            var str = $(this).parent().parent().parent().parent().attr("data");
            var obj = eval("(" + str + ")");
            if (ids != "") {
                ids += ",";
            }
            ids += "{id:'" + obj.id + "'";
            for (var el in obj) {
                var elname = el.toString();
                if (elname != "id" && vals.indexOf(elname) != -1) {
                    ids += "," + elname + ":'" + obj[elname] + "'";
                }
            }
            //            if (vals.indexOf("ntype") != -1) {
            //                ids += ",ntype:'" + obj.ntype + "'";
            //            }
            //            if (vals.indexOf("name") != -1) {
            //                ids += ",name:'" + obj.name + "'";
            //            }
            //            if (vals.indexOf("pid") != -1) {
            //                ids += ",pid:'" + obj.pid + "'";
            //            }
            ids += "}";
        });

        return "[" + ids + "]";
    }
    this.getCheckedObjs = function (vals) {
        return eval(this.getCheckedObjStr(vals));
    }

    //通过JSON对象获取生成树节点对象
    var getELByDataObj = function (obj, level, sc) {
        var liHtml = "";
        var leafcls = "";
        if (obj.sc == 0) {
            leafcls += " class='leaf'";
        }
        var emcls = "";
        if (obj.clsname != undefined && obj.clsname != "") {
            emcls = " class='" + arr[i].clsname + "'"
        }
        if (emcls == "") {
            if (obj.ntype != undefined && obj.ntype != "") {
                var tpclass = obj.ntype;
                if (tpclass.indexOf('-') != -1) {
                    tpclass = tpclass.split('-')[0];
                }
                emcls = " class='" + tpclass + "'"
            }
        }
        if (level != undefined) {
            obj.level = level;
        }
        if (sc != undefined) {
            obj.sc = sc;
        } //alert(emcls);
        var emCode = "<em" + emcls + "></em>";
        if (opts.checkBox > 0) {
            emCode = "<em" + emcls + "><input type='checkbox' value='" + obj.id + "'/></em>";
            //bcls += " style='width:45px;'";
        }
        liHtml = "<li data=\"" + TV.jsonToStr(obj) + "\"><div" + leafcls + "><b>" + emCode + "</b><a href='#'>" + obj.name + "</a><a style='color:green;'>" + (obj.note == undefined ? "" : obj.note) + "</a></div></li>";

        return $(liHtml);
    }

    //初始化根节点信息和事件
    var _RootLIS = containerEL.children(); //.find("li");

    var bindNodeEvent = function (el) {
        var aObj = el.find("a");
        var bObj = el.find("b:first");
        aObj.bind("mousedown", aObj, function (e) {
            e.stopPropagation();
            var el = e.data.parent().parent();
            if (_selNode != null) {
                //_selNode.getEL().removeClass("sel");
                setSelNode();
            }
            setSelNode(new TreeNode(el));
            //el.addClass("sel");
            if (e.which != 3) {
                //页面上有设置过selNodeHandle时nnn为FALSE，未设置时为TRUE
                var nnn = opts.selNodeHandle(_selNode);
                if (nnn != false) {
                    var url = opts.pageDefault;
                    url += url.indexOf("?") == -1 ? "?" : "&";
                    $("iframe[id='" + opts.ifrID + "']").attr("src", url + _selNode.getDataPara());
                }

            } else {
                tv.showMenu(e.data);
            }
            return false;
        });
        bObj.bind("mouseup", bObj, function (e) {
            if (_selNode != null) {
                _selNode.getEL().removeClass("sel");
                setSelNode();
            }
            e.stopPropagation();
            if (e.which != 3) {

                var el = e.data.parent().parent();
                var tn = new TreeNode(el);
                setSelNode(tn);
                if (!_selNode.leaf() && (opts.exdTypes == "" || opts.exdTypes.indexOf(tn.getNTYPE()) != -1)) {
                    if (_selNode.opened() == false) {
                        _selNode.getSubNodes();
                    } else {
                        if (e.target.tagName != "INPUT") {
                            _selNode.opened(false);
                        }
                    }
                }
            }
            tv.hideMenu();
            return false;
        });

        var ckBoj = el.find("input[type='checkbox']");
        if (ckBoj.length > 0) {
            var tnode = new TreeNode(el);
            ckBoj.bind("click", { me: ckBoj, tn: tnode }, function (e) {
                TV.selBox(e.data.me, e.data.tn);
            });
        }
    }

    var expendIndex = 0; //当前展开到哪个树 ID路径
    var expendPath = function (el) {

        if (exdPathArr.length > expendIndex) {
            var pathArr = exdPathArr[expendIndex];

            if (pathArr.length > 0) {
                var obj = eval("(" + el.attr("data") + ")"); // alert(obj.id+"--"+pathArr);
                if (obj.id == pathArr[0]) {
                    el.find("b").trigger('mouseup');
                    if (pathArr.length == 1) {//展开到最后路径表示的节点
                        el.addClass("sel");
                        setSelNode(new TreeNode(el));
                    }
                    pathArr.splice(0, 1); //删除已展开的节点在数组里的 节点ID，原来 1，2，3，删除后 2，3

                }
            } else {
                expendIndex++;
                if (_RootLIS.length > expendIndex) {
                    exdPathArr[expendIndex].splice(0, 1);
                    $(_RootLIS[expendIndex]).find("b").trigger('mouseup');
                }
            }
        }
    }


    var TreeNode = function (Obj) {
        var _EL = Obj;

        var dataObj = null;
        if (Obj.length > 0 && Obj[0].tagName == 'LI') {
            var ddd = Obj.attr("data"); //{id:'0',pid:'0',name:'表单管理',ntype:'TF_FORM-root',no:'1',sc:'0',level:'0'}
            dataObj = eval("(" + ddd + ")");
        } else {
            alert("创建节点参数对象异常！" + ddd);
            return;
        }
        this.getOpts = function () { return opts; }
        this.getEL = function () { return _EL; }
        this.getDataObj = function () { return dataObj; }

        this.getDataPara = function () { return TV.jsonToPara(dataObj) + "&tree=" + Math.random(); }

        this.getData = function () { return Obj.attr("data"); }
        this.setData = function (data) { Obj.attr("data", data); }

        //以下是树必须有的属性
        this.getNote = function () { try { return Obj.find("div").find("a")[1].innerHTML; } catch (e) { return e; } }
        this.setNote = function (note) { try { Obj.find("div").find("a")[1].innerHTML = note; } catch (e) { } }

        var _ID = dataObj.id || "";
        this.getID = function () { return _ID; }
        this.setID = function (id) { _ID = id; } // nid; }

        var _PID = dataObj.pid || "";
        this.getPID = function () { return _PID; }
        this.setPID = function (pid) { _PID = pid; }

        var _NAME = dataObj.name || "";
        this.getNAME = function () { return _NAME; }
        this.setNAME = function (name) {
            _NAME = name;
            _EL.find("a:first").text(name); //a 的 name
        }

        var _SC = dataObj.sc == undefined ? -1 : dataObj.sc;
        this.getSC = function () {
            if (_SC == -1) {
                return _EL.find("ul:first").children().length;
            }
            else {
                return _SC;
            }
        }
        this.setSC = function (sc) { _SC = sc; }
        this.getSNUM = function () {
            return _EL.find("ul:first").children().length;
        }

        var _NO = dataObj.no || 0;
        this.getNO = function () { return _NO; }
        this.setNO = function (no) { _NO = no; }

        var _LEVEL = dataObj.level || 0;
        this.getLEVEL = function () { return _LEVEL; }
        this.setLEVEL = function (level) { _LEVEL = level; }

        var _NTYPE = dataObj.ntype || 0;
        this.getNTYPE = function () { return _NTYPE; }
        this.setNTYPE = function (level) { _NTYPE = level; }

    }
    TreeNode.prototype = new TV.TreePrototype();
    TreeNode.prototype.opened = function (opended, _EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        if (opended == undefined) {
            var clsname = _EL.find("b:first").attr("class");
            if (clsname != undefined && clsname.indexOf("opened") != -1) {
                return true;
            } else {
                return false;
            }
        } else {
            if (opended == true) {
                _EL.find("b:first").addClass("opened");
                _EL.find("ul:first").show();
                if (this.last()) {
                    _EL.addClass("last-open");
                }
            } else {
                _EL.find("b:first").removeClass("opened");
                _EL.find("ul:first").hide();
                if (this.last()) {
                    _EL.removeClass("last-open");
                }
            }
        }
    }


    TreeNode.prototype.leaf = function (isleaf, _EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        if (isleaf == undefined) {
            var cls = _EL.attr("class");
            if (cls != undefined && cls.indexOf("leaf") != -1) {
                return true;
            }
            return false;
        } else {
            if (isleaf == true) {
                _EL.find("div:first").addClass("leaf");
            } else {
                _EL.find("div:first").removeClass("leaf");
            }
        }
    }
    //jinsj
    TreeNode.prototype.last = function (isLast, _EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        if (isLast == undefined) {
            var cls = _EL.attr("class");
            if (cls != undefined && cls.indexOf("last") != -1) {
                return true;
            }
            return false;
        } else {
            if (isLast == true) {
                _EL.addClass("last");
            } else {
                _EL.removeClass("last");
            }
        }
    }

    TreeNode.prototype.first = function (_EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        return _EL.prev().length == 0;
    }

    TreeNode.prototype.loaded = function (isloaded, _EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        if (isloaded == undefined) {
            return _EL.find("div:first").attr("loaded") == "yes";
        } else {
            if (isloaded == true) {
                _EL.find("div:first").attr("loaded", "yes");
            } else {
                _EL.find("div:first").attr("loaded", "no");
            }
        }
    }

    TreeNode.prototype.isRoot = function (_EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        var pObj = _EL.parent();
        if (pObj.length > 0) {
            var clsname = pObj.attr("class");
            if (pObj[0].tagName == "UL" && clsname != undefined && clsname.indexOf("divtree") != -1) {
                return true;
            }
        }
        return false;
    }

    TreeNode.prototype.getSubNodes = function () {
        if (this.loaded() == false) {
            var opts = this.getOpts();
            var url = this.getBackUrl(opts.pageBack, "getSubNodes=" + Math.random()); //后台页面通过此参数判断是否去获取下级节点数据
            //alert(this.getDataObj().id);
            var tn = this;
            //alert(tn.getDataPara());
            $.get(url, this.getDataObj(), function (dataStr) {
                //alert(dataStr);
                if (dataStr.indexOf("[") != 0) {
                    dataStr = "[" + dataStr + "]";
                }
                if (dataStr.length > 1)
                    tn.addSubNodes(eval(dataStr));
            });

            this.loaded(true);
        }
        this.opened(true);

        return false;
    }
    TreeNode.prototype.addSubNodes = function (objArr) {
        if (objArr.length > 0) {
            for (var i = 0; i < objArr.length; i++) {
                this.addSubNode(objArr[i], i == objArr.length - 1);
            }
            this.leaf(false); //this.ec
            // this.opened(true);
            this.setSC(objArr.length);
        } else {
            this.leaf(true);
        }
    }
    TreeNode.prototype.addSubNode = function (obj, last) {
        var el = getELByDataObj(obj, this.getLEVEL() + 1);

        var _EL = this.getEL();
        var ulObj = _EL.find("ul:first");
        if (ulObj.length == 0) {
            ulObj = $("<ul></ul>");
            _EL.append(ulObj);
        }
        ulObj.append(el);
        if (last == true) {
            el.addClass("last");
        }
        if (el.prev().length > 0) {
            el.prev().removeClass("last");
        }
        bindNodeEvent(el);

        expendPath(el);

        var textObj = el.find("a:first");
        //window.status = TV.maxWidth;
        var textW = textObj.parent().text().length * 18 + el.offset().left + 50;
        if (TV.maxWidth == 0) {
            TV.maxWidth = textW;
            if (containerEL.width() < textW) {
                containerEL.width(textW);
            }
        } else {
            if (TV.maxWidth < textW) {
                TV.maxWidth = textW;
                if (containerEL.width() < textW) {
                    containerEL.width(textW);
                }
            }
        }

        //        if (TV.maxWidth == 0) {
        //            TV.maxWidth = textObj.width();// containerEL.width(textW);
        //        } else {
        //            if (TV.maxWidth < textObj.width()) {
        //                TV.maxWidth = textObj.width(); //containerEL.width(textW);
        //            }
        //        }
        //        window.status = TV.maxWidth;
    }
    TreeNode.prototype.prevNode = function (_EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        var p = _EL.prev();
        if (p.length > 0) {
            return new TreeNode(p);
        }
        return null;
    }

    TreeNode.prototype.editNode = function (obj) {

        var tn = TV.selNode;
        tn.setNAME(obj.name);
        try {
            tn.setSC(obj.sc);
        } catch (e) { alert(5); }
        try {
            tn.setPID(obj.pid);
        } catch (e) { alert(4); }
        try {
            tn.setNO(obj.no);
        } catch (e) { alert(3); }
        try {
            tn.setNTYPE(obj.ntype);
        } catch (e) { alert(2); }
        //zlg 不需要
        //        try {
        //            tn.setID(obj.id);
        //        } catch (e) {
        //            //alert(1);
        //        }
        try {
            var tnData = tn.getData();
            var dataJson = eval("(" + tnData + ")");
            //dataJson.id = obj.id; //obj.name;//bug
            dataJson.name = obj.name;
            tn.setData(tnData); //TV.jsonToStr(dataJson)); //.setData(obj); //tn
            tn.setNote((obj.note == undefined || obj.note == null) ? "" : obj.note); //"[]"
        } catch (e) { }
    }
    TreeNode.prototype.delNode = function (_EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        if (this.last()) {
            var _prevNode = this.prevNode(_EL);

            if (_prevNode != null) {
                _prevNode.last(true);
            }
            setSelNode(_prevNode);
        }
        _EL.remove();
    }

    TreeNode.prototype.clearSubNodes = function (_EL) {
        if (_EL == undefined) {
            _EL = this.getEL();
        }
        _EL.find("ul").remove();
        this.opened(false);
        this.loaded(false);
    }

    var btnObj = null;
    if (opts.showRefresh) {
        btnObj = $("<input type='button' id='btn_refresh' value='刷新' />");
        menuDiv.append(btnObj);
        btnObj.bind("mousedown", btnObj, function (e) {
            if (_selNode.isRoot()) {
                var href = window.location.href;
                var hash = location.hash;
                if (hash != "") {
                    href = href.substring(0, href.indexOf(hash));
                }
                if (href.indexOf("?") != -1) {
                    var a = href.indexOf("r=");
                    if (a > 0) {
                        href = href.substring(0, a) + "r=" + Math.random(); //;new String().substring(
                    } else {
                        href += "&r=" + Math.random();
                    }
                } else {
                    href += "?r=" + Math.random();
                }
                window.location.href = href;
            } else {
                _selNode.clearSubNodes();
                _selNode.getSubNodes();
            }
        });
    }
    if (opts.showSort) {
        btnObj = $("<input type='button' id='showSort' value='排序子节点' />");
        menuDiv.append(btnObj);
        btnObj.bind("mousedown", btnObj, function (e) {
            //alert(_selNode);
        });
    }
    if (opts.showUp) {
        btnObj = $("<input type='button' id='showUp' value='上移节点' />");
        menuDiv.append(btnObj);
        btnObj.bind("mousedown", btnObj, function (e) {
            //alert(_selNode);
        });
    }
    if (opts.showDown) {
        btnObj = $("<input type='button' id='showDown' value='下移节点' />");
        menuDiv.append(btnObj);
        btnObj.bind("mousedown", btnObj, function (e) {
            //alert(_selNode);
        });
    }
    if (opts.showClearCheck && opts.checkBox > 0) {
        btnObj = $("<input type='button' id='showClearCheck' value='清除选择' />");
        menuDiv.append(btnObj);
        btnObj.bind("mousedown", btnObj, function (e) {
            var cks = containerEL.find("input:checked");
            cks.attr("checked", false);
        });
    }

    if (opts.showDelete) {
        btnObj = $("<input type='button' id='showDelete' power='delete' value='删除' />");
        menuDiv.append(btnObj);
        var tv = this;
        btnObj.bind("mousedown", btnObj, function (e) {
            var url = tv.getBackUrl(opts.pageBack, "deleteNode=" + Math.random());
            //alert(tv.getSelNode().getDataObj());
            //var selNode=
            $.get(url, tv.getSelNode().getDataObj(), function (dataStr) {
                if (dataStr.indexOf("{") == 0) {
                    var obj = eval("(" + dataStr + ")");
                    var msg = "";
                    if (obj.re > 0) {
                        msg = obj.msg || "删除成功！";
                        tv.getSelNode().delNode();
                        tv.hideMenu();

                    } else {
                        msg = obj.msg || "删除失败！";
                    }
                    alert(msg);
                } else {
                    alert(dataStr);
                }
            });
            tv.hideMenu();
        });
    }

    $(document).bind("contextmenu", function (e) {
        return false;
    });

    $(document).bind("mouseup", function (e) {
        if (e.which != 3) {
            tv.hideMenu();
        }

    });
    $(document).bind("mousedown", function (e) {
        if (e.which != 3) {
            tv.hideMenu();
        }

    });

    _RootLIS.each(function (i) {
        var dataObj = eval("(" + $(this).attr("data") + ")");
        if (dataObj.level == undefined) {
            dataObj.level = 0;
        }
        $(this).attr("data", TV.jsonToStr(dataObj));

        var hadSub = $(this).find("ul").length > 0;
        if (hadSub == true) {
            $(this).find("b:first").addClass("opened");
        }
        var isRoot = $(this).parent().attr("id") == containerEL.attr("id");
        var isFirst = $(this).prev().length == 0;
        var isLast = $(this).next().length == 0;
        if (isRoot) {
            if (isFirst) {
                $(this).addClass("root-first");
            }
            if (isLast) {
                $(this).addClass("root-last");
            }
            $(this).find("div:first").addClass("root");
        }
        bindNodeEvent($(this));

        var subs = $(this).find("ul").children();
        if (i == 0 && subs.length == 0) {
            expendPath($(this));
        }
        //alert(subs.length);
        if (subs.length > 0) {
            $(this).find("div:first").attr("loaded", 'yes');
            for (var a = 0; a < subs.length; a++) {
                bindNodeEvent($(subs[a])); //alert(a + "==" + subs.length - 1);
                if (a == subs.length - 1) {
                    $(subs[a]).addClass("last"); // alert($(subs[a]).html());
                }
            }
        }

    });


    setSelNode(new TreeNode(containerEL.find("li:first"))); //初始化第一个节点
    // alert(_selNode.getEL().prev().length);
};
TV.Tree.prototype = new TV.TreePrototype();

var js = document.getElementsByTagName("script"); //alert();
var jsPath = "";

for (var i = 0; i < js.length; i++) {
    if (js[i].src.toLowerCase().indexOf("divtree/divtree.js") != -1) {
        jsPath = js[i].src.substring(0, js[i].src.lastIndexOf("/") + 1);
        break;
    }
}

var headObj = document.getElementsByTagName("head")[0];
var css = document.createElement("link");
css.setAttribute("rel", "stylesheet");
css.setAttribute("type", "text/css");
css.setAttribute("href", jsPath + "divTree.css");
headObj.appendChild(css);


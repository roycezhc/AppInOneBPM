//    注释:type=0文本字符串，1数字含小数，2表示整数，3表示日期，4邮箱，5电话号码，6手机,   7身份证，8邮政编码，9IP地址格式
//    10 QQ 11 旺旺 12 网址
//分别对应:        string     decimal     number    date      email  phone     mobile   icard   postcode   ip
//ck="{type:0,min:0,max:9999,need:1,len:6,decnum:5,msg:'提示信息',reg:'\d'}"；
//分别表示 验证数据类型，最小值min(type=0,1,2,3有效)，最大值max(type=0,1,2,3且len没有值时有效)，need是否必须，
//decnum小数位个数(type=1有效)，msg提示信息,reg正则表达式，len 整数长度
//注意：当type==2并且设置了len，max无效，输入长度不能小于给定的值
////修改时间：2012-03-19  陈焕许
function formChecker(pObj) {
    //pObj={formID:'',btnIDS:'',blurEvt:false}
    //alert(pObj.formID);
    var preDir = pObj.preDir||"/WebSite/";

    var formObj = null;
    if (pObj.formID != undefined && pObj.formID != "") {
        formObj = $("#" + pObj.formID);
    } else {
        formObj = $("div.form");
    }
    if (formObj.length <= 0) {
        formObj = $("div.bill");
    }
    var setCtrlNeed = function (obj) {
        var cls = obj.attr("class");
        try {
            if (cls == undefined || cls == "" || cls.indexOf("need") == -1) {
                obj.addClass("need");
            }
//            //obj[0].value = "";
//            var read = obj.attr("readonly");
//            if (read == undefined || read == "" || read == false) {
//                obj[0].focus();
//            } else {
//               // setTimeout(delClassByObj(obj),2000);
//            }
            //obj[0].select();
        } catch (e) {

        }
    };

    var _delClassByObj = function (obj) {
        //return function (obj) {
            obj.removeClass("need");
        //}
    }
    var delClassByObj = function (obj) {
        return _delClassByObj(obj);
    }

    if (arguments.length == 0) {
        alert("表单验证对象声明要求必须有一个参数，表示按钮ID。");
    }

    var check0 = function (obj, min, max, colname, msg) {
        var val = obj.val();
        var vlen = val.length;
        if (vlen < min) {
            msg = msg == "" ? colname + '必须输入长度大于' + min + '的字符串！' : msg;
            alert(msg); setCtrlNeed(obj);
            return false;
        }

        if (vlen > max) {
            msg = msg == "" ? colname + '必须输入长度小于' + max + '的字符串！' : msg;
            alert(msg); setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //数字，含小数
    var check1 = function (obj, min, max, decnum, colname, msg) {
        var val = obj.val();
        //alert("^-?\\d{1,12}(\\.\\d{0," + decnum + "})?$");
        var numReg = new RegExp("^-?\\d{1,12}(\\.\\d{0," + decnum + "})?$");

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "必须是小数位小于" + decnum + "位的数字！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        val = parseFloat(val);
        if (val < min) {
            msg = msg == "" ? colname + '必须是大于' + min + '的数字！' : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        if (val > max) {
            msg = msg == "" ? colname + '必须是小于' + max + '的数字！' : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };

    //整数
    var check2 = function (obj, min, max, colname, msg, len) {
        var val = obj.val();
        min = min == 0 ? 1 : min;
        var numReg =/^\d{1,12}$/;
        if (len > 0) {
            numReg = new RegExp("^\\d{1," + len + "}$");
        }
        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "必须是整数！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        val = parseFloat(val);
        if (val < min) {
            msg = msg == "" ? colname + '必须是大于' + min + '的整数！' : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        if (len > 0) {
            if (val.length < len) {
                alert("请输入少于" + len + "个的数字!");
                return false;
            }
        } else {
            if (val > max) {
                msg = msg == "" ? colname + '必须是小于' + max + '的整数！' : msg;
                alert(msg);
                setCtrlNeed(obj);
                return false;
            }
        }
        return true;
    };
    //日期
    var check3 = function (obj, min, max, colname, msg) {

        return true;
    };
    //邮箱
    var check4 = function (obj, colname, msg) {
        var val = obj.val();
        if (val.length > 30) {
            alert("邮箱地址长度不能大于30！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /^\w{3,}@\w+(\.\w+)+$/;
        if (colname == "") { colname = "邮箱"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //电话号码
    var check5 = function (obj, colname, msg) {
        var val = obj.val();
        if (val.length > 13) {
            alert("电话号码地址长度不能大于13！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /^(\d{3,4}-\d{6,8}|\d{6,8})$/;
        if (colname == "") { colname = "电话号码"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //手机
    var check6 = function (obj, colname, msg) {
        var val = obj.val();
        if (val.length != 11) {
            alert("手机号码必须是11位数字！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /^\d{11}$/;
        if (colname == "") { colname = "手机号码"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确，必须是11位数字！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //身份证
    var check7 = function (obj, colname, msg) {
        var val = obj.val();
        if (val.length > 18) {
            alert("身份证长度不能大于18！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
        if (colname == "") { colname = "身份证"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //邮政编码
    var check8 = function (obj, colname, msg) {

        var val = obj.val();
        if (val.length > 6) {
            alert("邮政编码长度不能大于6！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /^[1-9][0-9]{5}$/;
        if (colname == "") { colname = "邮政编码"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //IP地址
    var check9 = function (obj,colname, msg) {
        var val = obj.val();
        if (val.length > 20) {
            alert("IP地址长度不能大于20！");
            setCtrlNeed(obj);
            return false;
        }
        var numReg = /^((?:(?:25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d?\d))$/;
        if (colname == "") { colname = "IP地址"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //QQ
    var check10 = function (obj, colname, msg) {
        var val = obj.val();
     
        var numReg = /^[1-9]\d{4,8}$/;
        if (colname == "") { colname = "QQ"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //旺旺
    var check11 = function (obj, colname, msg) {
        var val = obj.val();

        var numReg = /^[1-9]\d{4,8}$/;
        if (colname == "") { colname = "旺旺"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };
    //网址
    var check12 = function (obj, colname, msg) {
        var val = obj.val();
        var numReg = /^(((ht|f)tp(s?))\:\/\/)?(www.|[a-zA-Z].)[a-zA-Z0-9\-\.]+\.(com|edu|gov|mil|net|org|biz|info|name|museum|us|ca|uk)(\:[0-9]+)*(\/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$/;
      //  var numReg = /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?/;
        if (colname == "") { colname = "网址"; }

        if (!numReg.test(val)) {
            msg = msg == "" ? colname + "格式不正确！" : msg;
            alert(msg);
            setCtrlNeed(obj);
            return false;
        }
        return true;
    };

    var checkOne = function (obj) {
        
        var ckStr = obj.attr("ck"); //alert(ckStr);
        var ckObj = null;
        if (ckStr == undefined || ckStr == "") {
            return true;
        } else {
            ckObj = eval("(" + ckStr + ")");
        }
        var type = ckObj.type || ckObj.dtype || 0;
        var min = ckObj.min || 0;
        var max = ckObj.max || ckObj.len || 999999;
        var decnum = ckObj.decnum || 5;
        var msg = ckObj.msg || '';
        var reg = ckObj.reg || ''; //在控件里给reg设置正在表达式时，所有"\",都要用"\\"表示才可以。
        var need = ckObj.need || 0;
        var colname = ckObj.colname || '';
        var len = ckObj.len || 0;
        var val = obj.val();
        if (need == 1 && val == "") {
            setCtrlNeed(obj);
            return false;
        }

        if (need == 0 && val == "") {
            //alert("ddd");
            return true;
        }
        //alert(type);
        if (reg != "") {
            //alert(reg);
            var regObj = new RegExp(reg, "g");
            var re = regObj.test(val);
            if (re == false) {
                setCtrlNeed(obj);
                return false;
            }
            return true;
        }

        if (type == 0) {
            return check0(obj, min, max, colname, msg);
        }
        if (type == 1) {
            return check1(obj, min, max, decnum, colname, msg);
        }
        if (type == 2) {
            return check2(obj, min, max, colname, msg, len);
        }
        if (type == 3) {
            return check3(obj, min, max, colname, msg);
        }
        if (type == 4) {
            return check4(obj, colname, msg);
        }
        if (type == 5) {

            return check5(obj, colname, msg);
        }
        if (type == 6) {
            return check6(obj, colname, msg);
        }
        if (type == 7) {
            return check7(obj, colname, msg);
        }
        if (type == 8) {
            return check8(obj, colname, msg);
        }
        if (type == 9) {
            return check9(obj, colname, msg);
        }if (type == 10) {
            return check10(obj, colname, msg);
        }if (type == 11) {
            return check11(obj, colname, msg);
        }if (type == 12) {
            return check12(obj, colname, msg);
        }

        return true
    };
    if (pObj.blurEvt == true) {
        var txts = formObj.find("input[type='text']");
        var i = 0;
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                if (checkOne(e.data) == false) {
                    return false;
                } else {
                    e.data.removeClass("need");
                }
            });
//            txtObj.bind("focus", txtObj, function (e) {
//                e.data[0].select();
//            });
        }

        txts = formObj.find("input[type='password']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                if (checkOne(e.data) == false) {
                    return false;
                } else {
                    e.data.removeClass("need");
                }
            });
            txtObj.bind("focus", txtObj, function (e) {
                e.data[0].select();
            });
        }

        txts = formObj.find("textarea");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                if (checkOne(e.data) == false) {
                    return false;
                } else {
                    e.data.removeClass("need");
                }
            });
        }

        txts = formObj.find("select");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("change", txtObj, function (e) {
                if (checkOne(e.data) == false) {
                    return false;
                } else {
                    e.data.removeClass("need");
                }
            });
        }
    }


    if (pObj.btnIDS != undefined && pObj.btnIDS != "") {
        if (pObj.btnIDS.indexOf(',') != -1) {
            var btnids = pObj.btnIDS.split(',');
            for (var b = 0; b < btnids.length; b++) {
                var btnObj = $("input[id$='" + btnids[b] + "']");
                btnObj.bind("click", btnObj, function (e) {
                    //checkLogin();
                    var rrr = checkForm();
                    if (rrr == false) {
                        return false;
                    } else {
                        e.data.val('正在提交...');
                        window.setTimeout(setBtnEnabled(e.data, 100));
                    }
                });
            }
        } else {
            var btnObj = $("input[id$='" + pObj.btnIDS + "']");
            btnObj.bind("click", btnObj, function (e) {
                //checkLogin();
                var rrr = checkForm();
                if (rrr == false) {
                    return false;
                } else {
                    e.data.val('正在提交...');
                    window.setTimeout(setBtnEnabled(e.data, 100));
                }
            });
        }
    }

    var setBtnEnabled = function (btnObj) {
        return function () {
            btnObj.attr("disabled", 'disabled');
            //btnObj.css("background","#aaaaaa");
        }
    }

    var checkLogin = function () {
        $.ajax({
            type: "GET",
            url: preDir + "SYS/SYSBack.aspx?IsTimeOut=1",
            async: false,
            success: function (msg) {
                if (msg == "1") {
                    var result = window.showModalDialog(preDir + "Login.aspx?ckPass=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
                }
            },
            error: function () { }
        });
    }

    var checkForm = function () {
        var i = 0;
        var re = true;
        var txts = formObj.find("input[type='text']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (checkOne(txtObj) == false) {
                re = false;
            } else {
                txtObj.removeClass("need");
            }
        }
        txts = formObj.find("input[type='password']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (checkOne(txtObj) == false) {
                re = false;
            } else {
                txtObj.removeClass("need");
            }
        }
        txts = formObj.find("textarea");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (checkOne(txtObj) == false) {
                re = false;
            } else {
                txtObj.removeClass("need");
            }
        }
        txts = formObj.find("select");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (checkOne(txtObj) == false) {
                re = false;
            } else {
                txtObj.removeClass("need");
            }
        }
        //alert(re);
        if (re == true) {
            re = _myCheck();
        }
        return re;
    }

    this.checkFormInfo = function () {
        return checkForm();
    };
}

function _myCheck() {
    return true;
}

function selNamesByThis(me) {
    var txt1 = $("input[id$='txtSNAME']");
    var txt2 = $("input[id$='txtRNAME']");
    if (txt1.val() == "") {
        txt1.val(me.value);
    }
    if (txt2.val() == "") {
        txt2.val(me.value);
    }
}

function setDisabled(ctrl) {
    if (ctrl[0].tagName == "INPUT") {
        ctrl.attr("readonly", "readonly");
        ctrl.css("background", "#dddddd");
    } else {
        var selObj = ctrl[0];
        
//        var opts = selObj.options;
//        var val = opts[0].value;
//        var txt = opts[0].innerHTML;
        //var iii = selObj.selectedIndex;
        ctrl.bind("mousedown", ctrl, function (e) {
           // selObj.selectedIndex = iii;
            alert("不能修改");
            return false;
        });
//        while (opts.length > 0) {
//            opts.remove(0);
//        }

//        var li = new Option(txt, val);
//        selObj.options.add(li);

        ctrl.css("background", "#dddddd");
    }
}
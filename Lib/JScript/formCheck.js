//例子：ck="{type:0,min:0,max:9999,need:1,reg:'\d'}"；
//type:string|decimal|number|date|email|phone|mobile|icard|postcode|ip
// min: 最小值(长度)(type=decimal,number标识值大小，其他标识字符长度)
// max: 最大值(长度)(type=decimal,number标识值大小，其他标识字符长度)
//need: 是否必须，
// acc: 小数位个数(type=decimal有效)
// reg: 正则表达式
//noval:未填写时的值，默认为空。
////修改时间：2012-12-13  陈焕许
function formChecker(pObj) {
    //pObj={btnIDS:'',formID:''}
    var preDir = pObj.preDir || "/WebSite/";
    var formObj = null;
    if (pObj.formID != undefined && pObj.formID != "") {
        formObj = $("#" + pObj.formID);
    } else {
        formObj = $("div.form");
    }
    if (formObj.length <= 0) {
        formObj = $("div.bill");
    }
    if (formObj.length <= 0) {
        formObj = $("div.tbill");
    }
    if (arguments.length == 0) {
        alert("表单验证对象声明要求必须有一个参数'btnIDS'，表示按钮ID。");
    }

    var getCkMsg = function (ckObj) {
        return "请输入数字";
    }

    var setCtrlNeed = function (txtObj) {
        var cls = txtObj.attr("class"); //alert(cls);
        try {
            if (cls == undefined || cls == "" || cls.indexOf("need") == -1) {
                txtObj.addClass("need");
            }
        } catch (e) {

        }
        txtObj.attr("ckOK", 'no');
    };
    var setWarnMsg = function (txtObj, ckObj, msg) {
        var cls = txtObj.attr("class"); //alert(cls);
        msg = msg || "输入不合法";
        try {
            if (cls == undefined || cls == "" || cls.indexOf("warn") == -1) {
                txtObj.addClass("warn");
            }
            var divWarn = formObj.find("div.ckwarn");
            if (divWarn.length == 0) {
                divWarn = $("<div class='ckwarn' onclick='_hideWarn(this);'><a>" + msg + "</a></div>");
                formObj.append(divWarn);
            } else {
                divWarn.find("a").html(msg);
                divWarn.show();
            }
            var txtOff = txtObj.parent().offset();
            divWarn.css({ left: txtOff.left + "px", top: (txtOff.top - divWarn.height()-3) + 'px' });
            //divWarn.css({ left:"222px", top:'333px' });
        } catch (e) {

        }
        txtObj.attr("ckOK", 'no');
    }
    var clearWarn = function (txtObj) {
        txtObj.removeClass("need"); txtObj.removeClass("warn");
        formObj.find("div.ckwarn").hide();
        txtObj.attr("ckOK",'yes');
    }


    var checkInput = function (txtObj) {
        var ckData = txtObj.attr("ck");
        if (ckData == undefined || ckData == "") {
            return true;
        }
        var ckObj = eval("(" + ckData + ")");
        var noVal = ckObj.noval || "";
        var txtVal = txtObj.val();
        //alert(ckObj.need);
        if ((ckObj.need == 'yes' || ckObj.need == '1') && txtVal == noVal) {
            setCtrlNeed(txtObj); return false;
        }
        var reg = ckObj.reg || "";
        if (reg != "") {
            var regObj = new RegExp(reg, "g");
            var re = regObj.test(txtVal);
            if (re == false) {
                setWarnMsg(txtObj, ckObj, '输入内容格式不合法！'); return false;
            }
        }

        var min = ckObj.min || 0;
        var max = ckObj.max || 9999999;
        if (ckObj.type == "string" || ckObj.type == "nvarchar" || ckObj.type == "varchar" || ckObj.type == "nchar") {
            if (txtVal.length < min || txtVal.length > max) {
                var msg = txtVal.length < min ? "输入的文字必须大于" + min : "输入的文字必须小于" + max;
                setWarnMsg(txtObj, ckObj, msg); return false;
            }
        }
        if (ckObj.type == "number" || ckObj.type == "int" || ckObj.type == "bigint" || ckObj.type == "long" || ckObj.type == "tinyint") {
            var numReg = /^\d{1,12}$/;
            if (!numReg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj,"输入整数的格式不正确"); return false;
            }
            if (parseFloat(txtVal) < min || parseFloat(txtVal) > max) {
                var msg = txtVal.length < min ? "输入的整数必须大于" + min : "输入的整数必须小于" + max;
                setWarnMsg(txtObj, ckObj,msg); return false;
            }
        }
        if (ckObj.type == "decimal" || ckObj.type == "numeric" || ckObj.type == "float" || ckObj.type == "double") {
            var acc = ckObj.acc || 10;
            var numReg = new RegExp("^-?\\d{1,12}(\\.\\d{0," + acc + "})?$");
            if (!numReg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, "输入数字的格式不正确"); return false;
            }
            if (parseFloat(txtVal) < min || parseFloat(txtVal) > max) {
                var msg = txtVal.length < min ? "输入的数字必须大于" + min : "输入的数字必须小于" + max;
                setWarnMsg(txtObj, ckObj,msg); return false;
            }
        }
        if (ckObj.type == "date" || ckObj.type == "datetime") {
            var reg = /^[1-3]\d{3}-(0?[1-9]|1[1-2])-(0?[1-9]|[1-2][1-9]|3[0-1])$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj,'输入日期格式不正确!'); return false;
            }
        }
        if (ckObj.type == "email") {
            var reg = /^\w{3,}@\w+(\.\w+)+$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入邮箱地址格式不正确!'); return false;
            }
        }
        if (ckObj.type == "phone") {
            var reg = /^(\d{3,4}-\d{6,8}|\d{6,8})$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入电话号码格式不正确!'); return false;
            }
        }
        if (ckObj.type == "mobile") {
            var reg = /^\d{11}$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入手机号码格式不正确!'); return false;
            }
        }
        if (ckObj.type == "icard") {
            var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入身份证格式不正确!'); return false;
            }
        }
        if (ckObj.type == "postcode") {
            var reg = /^[1-9][0-9]{5}$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入邮政编码格式不正确!'); return false;
            }
        }
        if (ckObj.type == "ip") {
            var reg = /^((?:(?:25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d?\d))$/;
            if (!reg.test(txtVal)) {
                setWarnMsg(txtObj, ckObj, '输入IP地址格式不正确!'); return false;
            }
        }
        clearWarn(txtObj);
        return true
    }

    if (true) {
        var txts = formObj.find("input[type='text']");
        var i = 0;
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                checkInput(e.data);
            });
        }

        txts = formObj.find("input[type='password']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                checkInput(e.data);
            });
        }

        txts = formObj.find("textarea");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("blur", txtObj, function (e) {
                checkInput(e.data);
            });
        }

        txts = formObj.find("select");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            txtObj.bind("change", txtObj, function (e) {
                checkInput(e.data);
            });
        }
    }

    var _checkForm = function () {
        var isOk = true;
        var i = 0;
        var re = true;
        var txts = formObj.find("input[type='text']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (txtObj.attr("ckOK") == "no") {
                re = false;
            } else {
                re = checkInput(txtObj);
            }
            if (re == false) { isOk = false; }
        }
        txts = formObj.find("input[type='password']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (txtObj.attr("ckOK") == "no") {
                re = false;
            } else {
                re = checkInput(txtObj);
            } if (re == false) { isOk = false; }
        }
        txts = formObj.find("input[type='textarea']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (txtObj.attr("ckOK") == "no") {
                re = false;
            } else {
                re = checkInput(txtObj);
            } if (re == false) { isOk = false; }
        }
        txts = formObj.find("input[type='select']");
        for (i = 0; i < txts.length; i++) {
            var txtObj = $(txts[i]);
            if (txtObj.attr("ckOK") == "no") {
                re = false;
            } else {
                re = checkInput(txtObj);
            } if (re == false) { isOk = false; }
        }
        //alert(isOk);
        if (isOk == true) {
            isOk = _myCheck();
        }
        return isOk;
    }

    if (pObj.btnIDS != undefined && pObj.btnIDS != "") {
        if (pObj.btnIDS.indexOf(',') != -1) {
            var btnids = pObj.btnIDS.split(',');
            for (var b = 0; b < btnids.length; b++) {
                var btnObj = $("input[id$='" + btnids[b] + "']");
                btnObj.bind("click", btnObj, function (e) {
                    var rrr = _checkForm();
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
                var rrr = _checkForm();
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

   

    this.checkForm = function () {
        return _checkForm();
    };
    this.checkFormInfo = function () {
        return _checkForm();
    };
}
///////////////////////////////////////////////

function _hideWarn(me) {
    $(me).hide();
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
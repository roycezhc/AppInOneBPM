var selectedID = "";
var selInfo = "";
var _selERR = "";
var _selOK = true;
$(function () {
    //Sel_Load();
});
function Sel_Load() {
    var trs = $("div.tblist").find("table tbody").find("tr");
    for (var i = 0; i < trs.length; i++) {
        var trObj = $(trs[i]);
        trObj.bind("click", trObj, function (e) {
            selThis(e.data, trs);
            trs.removeClass("sel");
            e.data.addClass("sel");
        });
        trObj.bind("dblclick", trObj, function (e) { //作为选择窗体时生效，双击直接选中行，并关闭窗体
            selThis(e.data, trs);
            selok();
        });

        trObj.bind("mouseover", trObj, function (e) {
            trs.removeClass("over");
            e.data.addClass("over");
        });
    }
}
function selOK_E(id) { };
function selOK_B(id) { };
/*选中并返回*/
function selok() {
    if (selInfo == "") {
        alert('请至少选择一个');
        return;
    }
    if (_selOK == false) {
       selOK_B(selectedID);
        return;
    }
    if (_selERR != "") {
            alert(_selERR);
            _selERR = "";
             return;
         }
         selOK_E(selectedID);
         
    if (window.opener != null) {
        if (opener.getSelInfo) {
            opener.getSelInfo(selInfo);
            window.opener = null;
            window.open('', '_self');
            window.close();
        }
        window.opener.returnValue = selInfo;
        if (window.opener.cb) {
            window.opener.cb();
        }
        window.close();
    } else {
        //alert(selInfo);
        //if (window.location.search.indexOf("modlg=") != -1) {
        //alert(window.opener);
            window.returnValue = selInfo; //返回一个JSON格式的字符串。 
            window.close();
//        } else {
//            if (parent.getSelInfo) {
//                parent.getSelInfo(selInfo);
//            }
//            if (parent.closeIfrWin) {
//                parent.closeIfrWin();
//            } else {
//                window.returnValue = selInfo; //返回一个JSON格式的字符串。 alert(window.returnValue);
//                window.close();
//            }
//        }
    }
}

function selThis(el, trs) {
    
    var tds = el.children();
    var b = selThis_B(tds);
    if (b == false) {
        return;
    } 
    var tdIndex = 0;
    var tdObj = $(tds[tdIndex]);
    if (tdObj.find("a").length > 0) {
        tdIndex += 1;
    }
    if (tdObj.text() == "" || tdObj.text() == "&nbsp;") {
        tdIndex += 1;
    }


    selectedID = $(tds[tdIndex]).text();// alert(b);
    setSelInfo(tds, tdIndex);
    //alert(selInfo);
    trs.removeClass("sel");
    el.addClass("sel");
}

function selThis_B(tds) {
    return true;
}

function setSelInfo(tds, index) {
    
    selInfo = "({ID:'" + selectedID + "',Name:'" + $(tds[index + 1]).text() + "'})"; //选中td第一格
}

function sel(me, table) {
    try {
        var result;
        if (table.indexOf('.') != -1)
            result = window.showModalDialog(table, 'modlg_window', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');
        else
            //result = window.showModalDialog('/site/WECAdmin/' + table + '/' + table + 'Sel.aspx?r=' + Math.random(), 'modlg_window', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');
            result = window.showModalDialog('/WECAdmin/' + table + '/' + table + 'Sel.aspx?r=' + Math.random(), 'modlg_window', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=no;');
        if (!result) { result = window.returnValue; }
        if (result == undefined || result == '')
            return;
        //alert(result)
        var obj = eval(result);
        var puts = $(me).parent().find('input');
        puts[0].value = obj.ID;
        puts[1].value = obj.Name;
    } catch (ex) {
        //document.write(ex.message);
        alert(ex.message);
    }
}

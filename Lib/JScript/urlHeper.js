var urlHelper = {};
urlHelper.hadParaName = function (name) {
    return window.location.search.indexOf(name + "=") != -1;
}
urlHelper.getPValByName = function (name) {
    name = name + "=";
    var str = window.location.search; //a=1&ddd=2
    var a = str.indexOf(name);
    if (a == -1) {
        return "";
    } else {
        str = str.substring(a + name.length, str.length);
        var c = str.indexOf("&");
        c = c == -1 ? str.length : c;
        str = str.substr(0, c);
        return str;
    }
}
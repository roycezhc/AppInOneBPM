/* cookie-start */
//cookie操作 if(getCookie('vip') == 2)
function getCookie(check_name) {
    var a_all_cookies = document.cookie.split(';');
    var a_temp_cookie = '';
    var cookie_name = '';
    var cookie_value = '';
    var b_cookie_found = false;
    for (i = 0; i < a_all_cookies.length; i++) {
        a_temp_cookie = a_all_cookies[i].split('=');
        cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
        if (cookie_name == check_name) {
            b_cookie_found = true;
            if (a_temp_cookie.length > 1)
                cookie_value = unescape(a_temp_cookie[1].replace(/^\s+|\s+$/g, ''));
            return cookie_value;
        }
        a_temp_cookie = null;
        cookie_name = '';
    }
    if (!b_cookie_found)
        return null;
}

//setCookie('vip',1,new Date('2010/10/10'),'/');
function setCookie(sName, sValue, oExpires, sPath, sDomain, bSecure) {
    if (oExpires == undefined) {
        var d = new Date(); 
        d.setHours(d.getHours() + 1);
        oExpires = d;
    }
    try {
        var sCookie = sName + "=" + sValue;
        if (oExpires)
            sCookie += "; expires=" + oExpires.toGMTString();
        else {
            var exp = new Date(); 
            exp.setTime(exp.getTime() + Days * 1);
            sCookie += "; expires=" + exp.toGMTString();
        }
        if (sPath)
            sCookie += "; path=" + sPath;
        if (sDomain)
            sCookie += "; domain=" + sDomain;
        if (bSecure)
            sCookie += "; secure";
        document.cookie = sCookie;
    }
    catch (e) { }
}

function addCookie(cookieName, value) {
    var his = getCookie(cookieName);
    if (!his) {
        his = '';
        setCookie(cookieName, value);
    }
    else {
        var ch = his.charAt(his.length - 1);
        if (ch != '`') his += '`';
        if (cookieName.indexOf(value + '`') == -1) {
            setCookie(cookieName, his + value + '`');
        }
    }
    return his;
}

function removeCookie(cookieName, value) {
    var his = getCookie(cookieName);
    if (his) {
        his = his.replaceAll(value + '`', '');
        setCookie(cookieName, his);
    }
}
/* cookie-end */
//wcp
/*对colorpane进行操作*/
var ColorHex=new Array('00','33','66','99','CC','FF') 
var SpColorHex=new Array('FF0000','00FF00','0000FF','FFFF00','00FFFF','FF00FF') 
var current=null
function initcolor(evt) {
    var colorTable = ''
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 6; j++) {
            colorTable = colorTable + '<tr height=15>'
            colorTable = colorTable + '<td width=15 style="background-color:#000000">'
            if (i == 0) {
                colorTable = colorTable + '<td width=15 style="cursor:pointer;background-color:#' + ColorHex[j] + ColorHex[j] + ColorHex[j] + '" onclick="doclick(this.style.backgroundColor)">'
            }
            else {
                colorTable = colorTable + '<td width=15 style="cursor:pointer;background-color:#' + SpColorHex[j] + '" onclick="doclick(this.style.backgroundColor)">'
            }
            colorTable = colorTable + '<td width=15 style="background-color:#000000">'
            for (k = 0; k < 3; k++) {
                for (l = 0; l < 6; l++) {
                    colorTable = colorTable + '<td width=15 style="cursor:pointer;background-color:#' + ColorHex[k + i * 3] + ColorHex[l] + ColorHex[j] + '" onclick="doclick(this.style.backgroundColor)">'
                }
            }
        }
    }
    colorTable = '<table border="0" cellspacing="0" cellpadding="0" style="border:1px #000000 solid;border-bottom:none;border-collapse: collapse;width:337px;" bordercolor="000000">'
    + '<tr height=20><td colspan=21 bgcolor=#ffffff style="font:12px tahoma;padding-left:2px;">'
    + ''
    + '<span style="float:right;padding-right:3px;cursor:pointer;" onclick="colorclose()">×关闭</span>'
    + '</td></table>'
    + '<table border="1" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="000000" style="cursor:pointer;">'
    + colorTable + '</table>';
    var color3 = document.getElementById("colorpane");
    if (color3 != undefined && color3 != null) {
        color3.innerHTML = colorTable;
        var current_x = document.getElementById("inputcolor").offsetLeft;
        var current_y = document.getElementById("inputcolor").offsetTop;
        //alert(current_x + "-" + current_y) 
        color3.style.left = current_x + "px";
        color3.style.top = current_y + "px";
    }
}
function doclick(obj){
    $("#inputcolor")[0].style.backgroundColor = obj;
    var v = $("#colorpane").next();
    if(v == null || v == undefined || v.length < 1)
        return;
    v[0].value = obj;
    colorclose();
} 
function colorclose(){ 
    color3.style.display = "none"; 
    //alert("ok"); 
}
function coloropen() {
    color3.style.display = ""; 
}
if($("#inputcolor")!=undefined && $("#inputcolor")!=null){
    window.onload = initcolor;
}
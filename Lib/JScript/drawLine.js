function testDrawCurve() {
    document.getElementById('div1').innerHTML = drawCurve();
}
function testDrawArc() {
    document.getElementById('div1').innerHTML = drawArc(150, 150, 100, 0, 270, "viloet")
}
function testDrawCircle() {
    document.getElementById('div1').innerHTML = drawCircle(200, 200, 150, "blue");
}
function drawCircle(x0, y0, radius, color) {
    return drawArc(x0, y0, radius, 0, 360, color)
}
function testDrawLine() {
    document.getElementById('div1').innerHTML = drawLine(100, 200, 500, 200, "yellow") + drawLine(300, 100, 300, 400, "black") + drawLine(600, 400, 100, 100, "violet") + drawLine(10, 50, 300, 200, "red");
    alert(drawLine(10, 50, 300, 200, "red"));
}
function testDrawRectangle() {
    document.getElementById('div1').innerHTML = drawRectangle(200, 100, 600, 200, "blue") + drawRectangle(100, 200, 400, 500, "red")
}
function testDrawPie() {
    document.getElementById('div1').innerHTML = drawPie(300, 200, 120, 0, 45, "red");
}

function drawLine(x0, y0, x1, y1, color) {

    var rs = " ";
    if (y0 == y1)     //画横线 
    {
        rs = " <table   style= 'top: " + y0 + ";left: " + x0 + ";position:absolute '> <td   bgcolor= " + color + "   height=3   width= " + Math.abs(x1 - x0) + "> </td> </table> ";
    }
    else if (x0 == x1)     //画竖线 
    {
        rs = " <table   style= 'top: " + y0 + ";left: " + x0 + ";position:absolute '> <td   bgcolor= " + color + "   width=1   height= " + Math.abs(y1 - y0) + "> </td> </table> ";
    }
    else {
        var lx = x1 - x0;
        var ly = y1 - y0;
        var l = Math.sqrt(lx * lx + ly * ly);
        rs = new Array();
        for (var i = 0; i < l; i += 1) {
            var p = i / l;
            var px = x0 + lx * p;
            var py = y0 + ly * p;
            rs[rs.length] = " <table   style= 'top: " + py + ";left: " + px + ";position:absolute '> <td   bgcolor= " + color + "   height=3> </td> </table> ";
        }
        rs = rs.join(" ");
    }
    return rs
}
function drawRectangle(x0, y0, x1, y1, color) {
    if (x0 == x1 || y0 == y1) return;
    if (x0 > x1) { var t = x0; x0 = x1; x1 = t }
    if (y0 > y1) { var t = y0; y0 = y1; y1 = t }
    return " <table   style= 'top: " + y0 + ";left: " + x0 + ";position:absolute '> <td   bgcolor= " + color + "   width= " + (x1 - x0) + "   height= " + (y1 - y0) + "> </td> </table> ";
}
function drawPie(x0, y0, radius, startAngle, endAngle, color) {
    var rs = drawArc(x0, y0, radius, startAngle, endAngle, color)
    startAngle = startAngle / 360 * Math.PI * 2;
    endAngle = endAngle / 360 * Math.PI * 2;
    var startx = Math.sin(startAngle) * radius + x0;
    var endx = Math.sin(endAngle) * radius + x0;
    var starty = Math.cos(startAngle) * radius + y0;
    var endy = Math.cos(endAngle) * radius + y0;
    rs += drawLine(x0, y0, startx, starty, color)
    rs += drawLine(x0, y0, endx, endy, color)
    return rs;
}
function drawArc(x0, y0, radius, startAngle, endAngle, color) {
    rs = new Array();
    tmpar = new Array();
    startAngle = startAngle / 360 * Math.PI * 2;
    endAngle = endAngle / 360 * Math.PI * 2;
    for (var i = startAngle; i < endAngle; i += (1 / radius)) {
        var dx = Math.sin(i) * radius + x0;
        var dy = Math.cos(i) * radius + y0;
        rs[rs.length] = " <table   style= 'top: " + dy + ";left: " + dx + ";position:absolute '> <td   bgcolor= " + color + "   height=3> </td> </table> ";
    }
    return (rs.join(" "));
}
function drawCurve() {
    var rs = new Array();
    for (var i = 0; i < 2 * Math.PI; i += .02) {
        var x = 300 - Math.sin(i) * 100
        var y = 300 - Math.cos(i) * 100
        rs[rs.length] = " <table   style= 'top: " + x + ";left: " + (i * 100 + 90) + ";position:absolute '> <td   bgcolor=blue   height=3> </td> </table> ";
        rs[rs.length] = " <table   style= 'top: " + y + ";left: " + (i * 100 + 90) + ";position:absolute '> <td   bgcolor=violet   height=3> </td> </table> ";
    }
    return rs.join(" ");
} 
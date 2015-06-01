var x = window.x || {};
x.creat = function (t, b, c, d, s, id) {
    this.t = t;
    this.b = b;
    this.c = c;
    this.d = d;
    this.op = 1;
    this.id = id;
    this.div = document.createElement("div");
    this.div.style.height = "40px";
    this.div.style.width = "100px";
    this.div.style.background = "#1982d1";
    this.div.style.position = "absolute";
    this.div.style.left = "50%";
    this.div.style.marginLeft = "-50px"
    this.div.style.marginTop = "-20px"
    this.div.innerText = s;
    this.div.style.fontSize = "18"
    this.div.style.lineHeight = this.div.style.height
    this.div.style.textAlign = "center";
    this.div.style.fontWeight = "bold";
    //this.div.style.border="solid red 1px"; 
    this.div.style.color = "#fff"
    this.div.style.top = (this.b + "%");
    document.getElementById(id).appendChild(this.div);
    this.run();
}
x.creat.prototype = {
    run: function () {
        var me = this;
        this.div.style.top = -this.c * (this.t / this.d) * (this.t / this.d) + this.b + "%";
        this.t++;
        this.q = setTimeout(function () { me.run() }, 25)
        if (this.t == this.d) {
            clearTimeout(me.q);
            setTimeout(function () { me.alpha(); }, 1000);
        }
    },
    alpha: function () {
        var me = this;
        if ("\v" == "v") {
            this.div.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=" + this.op * 100 + ")";
            this.div.style.filter = "alpha(opacity=" + this.op * 100 + ")";
            ;
        }
        else { this.div.style.opacity = this.op }
        this.op -= 0.02;
        this.w = setTimeout(function () { me.alpha() }, 25)
        if (this.op <= 0) {
            clearTimeout(this.w);
            document.getElementById(this.id).removeChild(me.div);
        }
    }
}
function showMsg(str, id) {
    new x.creat(1, 50, 25, 30, str, id);
}
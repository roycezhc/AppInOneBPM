<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_BillSet" CodeFile="BillSet.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/JQuery/ui/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
    <script src="../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <link href="../../Themes/Default/global.css" rel="stylesheet" type="text/css" />
    <link href="../../Themes/Default/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        var arrTHPosObj = {}; //存放表头TH位置的信息，用于在鼠标移动到上方获取该TH元素对象
        var thDragDiv =null; //模拟拖动TH的DIV元素对象
        var thObj = null; //即将被脱离的TH元素对象
        var dragTH = false;
        //初始化表头TH的事件
        function initThEvent() {
            var ths = $("#tblist").find("th");
            ths.each(function (i) {
                var aObj = $(this);
                aObj.bind("mousedown", aObj, function (e) {
                    var idstr = e.data.attr("id");
                    if (idstr == undefined || idstr == "") {
                        return false;
                    }
                    var idarr = idstr.split('_');

                    var aOff = e.data.offset();
                    var recPos = { x1: aOff.left, x2: aOff.left + e.data.width(), y1: aOff.top, y2: aOff.top + e.data.height() };
                    var posObj = { obj: e.data, pos: recPos };

                    thObj = posObj.obj;
                    var w = posObj.pos.x2 - posObj.pos.x1;
                    var h = posObj.pos.y2 - posObj.pos.y1;


                    thDragDiv.width(w);
                    thDragDiv.height(h);
                    thDragDiv.css({ top: (posObj.pos.y1 + 2) + "px", left: (posObj.pos.x1 + 2) + "px" });
                    thDragDiv.html(posObj.obj.html());
                    thDragDiv.attr("data", "{oldY:" + posObj.pos.y2 + ",text:'" + posObj.obj.text() + "',id:'" + idarr[1] + "'}");
                    posObj.obj.addClass("removed");
                    thDragDiv.show();
                    dragTH = true;
                });
            });
        }

        //记录各个TH的具体位置，用于鼠标移动到顶部自动获取TH对象,justForTH:是否只初始化表头TH位置信息
        function initPosData(justForTH) {
            var ths = $("#tblist").find("th");
            ths.each(function (i) {
                var aObj = $(this);
                var aOff = aObj.offset();
                var recPos = { x1: aOff.left, x2: aOff.left + aObj.width(), y1: aOff.top, y2: aOff.top + aObj.height() };
                var posObj = { obj: aObj, pos: recPos };

                arrTHPosObj[aObj.attr("id")] = posObj; //alert(arrTHPosObj[aObj.attr("id")].pos.x1);
            });
            if (justForTH != true) {
                var billcols = $("#tbill").find("td");
                billcols.each(function (i) {
                    var tdObj = $(this);
                    if (tdObj.attr("class") == "label") {
                        var aOff = tdObj.offset();
                        var recPos = { x1: aOff.left, x2: aOff.left + tdObj.width(), y1: aOff.top, y2: aOff.top + tdObj.height() };
                        var posObj = { obj: tdObj, pos: recPos };

                        arrTHPosObj[tdObj.attr("id")] = posObj;
                    } else {
                        tdObj.bind("dblclick", tdObj, function (e) {
                            var preTD = e.data.prev();
                            lblObj = preTD.find("label");
                            if (lblObj.length > 0) {
                                var colid = lblObj.attr("id").split('_')[1];
                                var result = window.showModalDialog("COLFormEdit.aspx?COL_ID=" + colid + "&billid=106&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
                                if (result == undefined || result == "") {
                                    return;
                                } else {
                                    var dataObj = eval(result);
                                    lblObj.html(dataObj.DISPLAY_NAME);
                                }
                            }
                        });
                    }
                });
            }
           
        }
        var liDragObj = null;
        var dragLI = false;

        //初始化左边表单栏目所在LI对象的事件，支持拖动效果
        function initLeftColEvt() {
            var lis = $("div.billset").find("li");
            lis.each(function (i) {
                var liObj = $(this);
                liObj.bind("mousedown", liObj, function (e) {
                    var idstr = e.data.attr("id");
                    if (idstr == undefined || idstr == "") {
                        return false;
                    }
                    var idarr = idstr.split('_');
                    var aOff = e.data.offset();
                    var recPos = { x1: aOff.left, x2: aOff.left + e.data.width(), y1: aOff.top, y2: aOff.top + e.data.height() };
                    liDragObj = e.data;
                    var w = recPos.x2 - recPos.x1;
                    var h = recPos.y2 - recPos.y1;

                    thDragDiv.width(w);
                    thDragDiv.height(h);
                    thDragDiv.css({ top: (recPos.y1 + 2) + "px", left: (recPos.x1 + 2) + "px" });
                    thDragDiv.html(e.data.html());
                    thDragDiv.attr("data", "{oldY:" + recPos.y2 + ",text:'" + e.data.text() + "',id:'" + idarr[1] + "',colname:'" + liObj.attr("colname") + "'}");
                    thDragDiv.show();
                    dragLI = true;
                });
            });
        }
        //根据位置获取对应的元素
        function getElByPos(x,y) {
            for (var key in arrTHPosObj) {
                var posObj = arrTHPosObj[key];
                if (posObj.pos.x1 < x && posObj.pos.x2 > x && posObj.pos.y1 < y && posObj.pos.y2 > y) {
                    return posObj.obj;
                }
            }
            return null;
        }
        function clearColCont(me) {
            alert($("#menu").attr("tdid"));
        }

        function delCol(me) {

        }


        function showMenu(e) {
            $("#menu").css({ top: e.pageY + "px", left: e.pageX + "px" });
            var tdObj = getTDByTarget(e.target);
            $("#menu").attr("tdid", tdObj.attr("id"));
            $("#menu").show();
        }

        function initBillCols() {
            var billObj = $("#tbill");

            var cols = $("#tbill").find("td.label");
            cols.each(function (i) {
                var colObj = $(this);
                initBillCol(colObj);
            });

            billObj.bind("mousedown", billObj, function (e) {
                $("#menu").hide();
            });

            billObj.bind("mouseup", billObj, function (e) {
               // alert(e.which);
                if (e.which == 3) {
                    showMenu(e);
                } else {
                    var billObj = e.data;
                    var billoff = billObj.offset();

                    billObj.css("cursor", "auto");
                    var oldid = billObj.attr("moveid"); //alert(oldid);
                    if (oldid != "" && oldid != undefined) {
                        var newTD = getTDByTarget(e.target);
                        var newid = newTD[0].id;
                        if (oldid != newid) {
                            var oldTD = billObj.find("td[id='" + oldid + "']");
                            var newstr1 = newTD.html();
                            var newstr2 = newTD.next().html();
                            var oldstr1 = oldTD.html();
                            var oldstr2 = oldTD.next().html();

                            newTD.html(oldstr1);
                            newTD.next().html(oldstr2);

                            oldTD.html(newstr1);
                            oldTD.next().html(newstr2);
                        }
                    }
                    billObj.attr("moveid", "");
                }
            });
        }

        function initBillCol(colObj) {
            colObj.bind("mousedown", colObj, function (e) {
                //var billObj = e.data.parent().parent();
                $("#tbill").css("cursor", "move");
                $("#tbill").attr("moveid", e.data.attr("id"));
            });
            
        }

        function getTDByTarget(tag) {
            if (tag.tagName == "TD") {
                return $(tag);
            }
            if (tag.tagName == "LABEL") {
                return $(tag).parent();
            }
        }

        $(function () {
            thDragDiv = $("div.thdrag"); //模拟拖动TH的DIV元素对象

            $(document).bind("contextmenu", function (e) {
                return false;
            });
            initThEvent();
            initPosData();
            initLeftColEvt();

            initBillCols();

            thDragDiv.bind("mouseup", thDragDiv, function (e) {
                if (dragTH) {
                    var dddObj = eval("(" + e.data.attr("data") + ")");
                    if (dddObj.oldY < e.pageY) {
                        if (thObj != null) {
                            thObj.remove();
                            e.data.hide();
                            $("#li_" + dddObj.id).removeClass("inhead");
                            initPosData(true); //经过移动，需要重新设置表头位置信息
                        }
                    } else {
                        thObj.removeClass("removed");
                        var toTH = getElByPos(e.pageX, e.pageY);
                        if (toTH[0].id != thObj[0].id) {
                            toTH.before(thObj);
                            initPosData(true); //经过移动，需要重新设置表头位置信息
                        }
                        e.data.hide();
                    }
                    dragTH = false;
                }
                //alert(dragLI);
                if (dragLI) {
                    var y = e.pageY;
                    var x = e.pageX;
                    e.data.hide();
                    var colData = eval("(" + e.data.attr("data") + ")");
                    var tdObj = getElByPos(x, y);
                    if (tdObj != null) {
                        if (tdObj[0].tagName == "TD") {
                            var hadTD = $("#tbill").find("label[id='col_" + colData.id + "']");
                            if (hadTD.length > 0) {
                                alert("表单里已经存在此栏目！");
                            } else {
                                tdObj.html("<label id='col_" + colData.id + "'>" + colData.text + "：</label>");
                                tdObj.next().html("{" + colData.colname + "}");
                                $("#li_" + colData.id).addClass("inbill");
                            }
                        } else {
                            var hadTD = $("#tblist").find("th[id='th_" + colData.id + "']");
                            if (hadTD.length > 0) {
                                alert("已经存在此栏目表头！");
                            } else {
                                tdObj.after("<th>" + colData.text + "</th>");
                                alert(colData.id);
                                $("#li_" + colData.id).addClass("inhead");
                            }
                        }
                    }
                    dragLI = false;
                }
            });

            var oldTHOver = null;
            var oldTDLabel = null;
            $(document).bind("mousemove", function (e) {
                var y = e.pageY;
                var x = e.pageX;
                thDragDiv.css({ top: y + "px", left: x });
                if (dragTH) {

                    if (oldTHOver != null) {
                        oldTHOver.removeClass("over");
                    }
                    oldTHOver = getElByPos(x, y);
                    if (oldTHOver != null) {
                        oldTHOver.addClass("over");
                    }

                }


                if (dragLI == true) {
                    if (oldTDLabel != null) {
                        oldTDLabel.removeClass("over");
                    }
                    oldTDLabel = getElByPos(x, y);
                    if (oldTDLabel != null) {
                        oldTDLabel.addClass("over");
                        window.status = oldTDLabel[0].id;
                    }
                }
                //}

            });

            $("div,ul, li,a").disableSelection(); //界面不可选择
        });

</script>
<style type="text/css">
td.sel{ background:#eee;}
.billset{margin:5px 0 0 5px;}
.billset ul,li ol{padding:0;margin:0;}
.billset ul li{line-height:25px;border:solid 1px #aaa;}
.billset ul li a{ display:block;color:#fff; background:#666; cursor:pointer; text-indent:5px;}
.billset ul li.inhead a{color:#666; background:#aaa;}
.billset ul li.inbill a{font-weight:bold;}

.menu{ position:absolute;top:100px;left:100px;border:solid 1px #669; display:none;}
.menu a{ display:block;color:#111; background:#eee; cursor:pointer;}

.thdrag{border:solid 1px #ddd; position:absolute;top:10px;left:10px; display:none; background:#eee;}

#tblist th{ cursor:pointer;}
#tblist th.over{ background:#fee;}
#tblist th.removed{ background:#ddd;}

#tbill td{width:150px;}
#tbill td.label{ background:#eee;width:125px; text-align:right;}
#tbill td.over{background:#fff;}

#billdesin h3{margin:0;line-height:30px;color:#009; background:#eef;}

#menu{ position:absolute;top:0;left:0;display:none;border:outset 1px #789; background:#eee;width:120px;}
#menu a{ cursor:pointer; display:block;line-height:22px;height:22px;border:solid 1px #ddd;color:#111;width:100%; text-align:center;}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="lrlayout">
  <div style="width:250px; background:#ddd;">
    <div class="billset">
    <ul>
          <asp:Repeater ID="repBillCol" runat="server">
          <ItemTemplate>
           <li <%#((SYS_BILL_COL)Container.DataItem).BILL_ISHEADER=="1"?"class='inhead'":"" %> id="li_<%#((SYS_BILL_COL)Container.DataItem).COL_ID%>" colname='<%#((SYS_BILL_COL)Container.DataItem).COL_NAME %>'><a><%#showCHName(((SYS_BILL_COL)Container.DataItem))%></a></li>
          </ItemTemplate>
         </asp:Repeater>
      </ul>
    </div>
  </div>
  <div style="text-align:center;">
    <div id="billdesin" style="width:750px;margin:auto;">
      <h3>表单表头配置</h3>
      <div class="tblist">
          <table id="tblist">
            <asp:Literal ID="litList" runat="server"></asp:Literal>
          </table>
      </div>
      <h3>编辑表单配置</h3>
      <div class="tool">
        <ol><li><span><input id="Button1" type="button" value="button" /></span></li></ol>
      </div>
        
      <div class="tbill">
           <h2>某某某表单</h2>
           <table id="tbill">
               <asp:Literal ID="litView" runat="server"></asp:Literal>
           </table>
      </div>
     
    </div>
  </div>
</div> 
<div id="menu">
   <a onclick="clearColCont(this);"><span>清空列</span></a>
   <a onclick="delCol(this);"><span>删除行</span></a>
</div>
<div class="thdrag"></div>
<script type="text/javascript">
    $("#lrlayout").Layout_LR({ jianH: 3 });
  </script>

</asp:Content>


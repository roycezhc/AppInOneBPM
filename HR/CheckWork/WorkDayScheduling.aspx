<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CheckWork_WorkDayScheduling" CodeFile="WorkDayScheduling.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="../../Lib/DHX/dhtmlxgrid.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/dhtmlxgrid_skins.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/dgrid-css.css" rel="stylesheet" type="text/css" />

    <script src="../../Lib/MyDP/seldate.js" type="text/javascript"></script>

    <script src="../../Lib/DHX/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/dhtmlxgrid.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/dhtmlxgridcell.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/excells/dhtmlxgrid_excell_link.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/ext/dhtmlxgrid_start.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/tl-grid/trainquerycommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/tl-grid/dhtmlxgrid_splt.js" type="text/javascript"></script>

    <link href="Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="Uploadify/jquery_loadmask.js" type="text/javascript"></script>

    <script type="text/javascript">
        var mygrid = null;
        Date.prototype.getWeekName = function () {
            var d = this.getDay();
            var arr = ["日", "一", "二", "三", "四", "五", "六"];
            return arr[d];
        }

        $(function () {
            $(window).resize(function () { tblistReSize('gridbox1') });
        });

        function tblistReSize(meclass) {
            var toolWid = $(".tool")[0].offsetWidth;
            var toolHei = $(".tool")[0].offsetHeight;
            var findHei = $(".topfindl")[0].offsetHeight;
            var titHei = $(".titnav")[0].offsetHeight;
            
            var isresize = false;
            if ($("#" + meclass).width() != toolWid - 2) {
                $("#" + meclass).width(toolWid - 2); // [0].style.width = Math.floor(toolWid) + "px";
                isresize = true;
            }
            if ($("#" + meclass).height() != $(window).height() - toolHei - findHei - titHei - 4) {
                $("#" + meclass).height($(window).height() - toolHei - findHei - titHei - 4); // [0].style.height = Math.floor($(window).height() - toolHei) + "px";
                isresize = true;
            }
            if ($("#" + meclass).height() != $(window).height() - toolHei - findHei - titHei - 4) {
                $("#" + meclass).height($(window).height() - toolHei - findHei - titHei - 10); // [0].style.height = Math.floor($(window).height() - toolHei) + "px";
                isresize = true;
            }
            if (mygrid == null )
                return;
            try {
                mygrid.setSizes();
                var gboxWid = $("#gridbox1")[0].offsetWidth;
                var gboxLeftWid = $("#gridbox1").find("div.gridbox")[0].offsetWidth;
                var gboxTab = $("#gridbox1").find("table");
                //gboxTab.width(gboxWid - gboxLeftWid - 3);
                gboxTab[0].style.width = (gboxWid - gboxLeftWid - 3) + "px";
                //gboxTab[1].width = (gboxWid - gboxLeftWid - 3) + "px";
                //gboxTab[2].width = (gboxWid - gboxLeftWid - 3) + "px";
            } catch (e) { }
        }

        function dateDuibi(a, b) {
            var arr = a.split("-");
            var starttime = new Date(arr[0], arr[1], arr[2]);
            var starttimes = starttime.getTime();
            var arrs = b.split("-");
            var lktime = new Date(arrs[0], arrs[1], arrs[2]);
            var lktimes = lktime.getTime();
            if (starttimes > lktimes) {
                alert('起始时间大于结束时间。');
                return false;
            }
            else if (Math.floor((lktimes - starttimes) / (24 * 3600 * 1000)) < 3) {
                alert('请查询4天以上。');
                return false;
            }
            else if (lktime == NaN || lktimes == NaN) {
                return false;
            }
            else
                return true;
        }


        function checkFindTime(sid,eid) { 
            var isOk = false;
            try {
                var stime = $("#cphBody_" + sid).val();
                var etime = $("#cphBody_" + eid).val();
                if (stime == undefined || stime == null || stime == "" || etime == undefined || etime == null || etime == "") {
                    isOk = false;
                }
                else {
                    return dateDuibi(stime, etime);
                }
            }
            catch (e) {
                isOk = false;
            }
            if(!isOk){
                alert("请正确输入起止时间！");
            }
            return isOk;
        }
        var tip = { $: function (ele) {
            if (typeof (ele) == "object")
                return ele;
            else if (typeof (ele) == "string" || typeof (ele) == "number")
                return document.getElementById(ele.toString());
            return null;
        },
            mousePos: function (e) {
                var x, y;
                var e = e || window.event;
                return { x: e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft, y: e.clientY + document.body.scrollTop + document.documentElement.scrollTop };
            },
            start: function (obj) {
                var self = this;
                var t = self.$("mjs:tip");
                obj.onmousemove = function (e) {
                    var mouse = self.mousePos(e);
                    t.style.left = mouse.x + 10 + 'px';
                    t.style.top = mouse.y + 10 + 'px';
                    t.innerHTML = obj.getAttribute("tag");
                    t.style.display = '';
                }
                obj.onmouseout = function () {
                    t.style.display = 'none';
                }
            }
        }

        function clearfindinput(me) {
            $(me).parent().parent().parent().find(".toolselascx input").val("");
        }
    </script>
    <style type="text/css">
        .tool .toolselascx{margin:0px; padding:0px; float:left; width:160px; text-align:left; clear:right;}
        .tool .toolselascx span{ margin:0px; padding:0px; width:100%; height:20px; line-height:20px; border: 0px none #fff; }
        .tool .toolselascx span a{line-height:22px; float:left;}
        .tool .toolselascx span .selshowinput{background-color:#fff; height:18px; width:50%; float:left; line-height:18px; border:1px solid #aad;}
        .tool .toolselascx span input.sel{border:none;background:url(../../Themes/Default/img/find.gif) center center no-repeat;height:20px;width:25px; cursor:pointer;}
    
        /*报表显示重要css*/
        .ui-ck-oneday{width:25px;height:20px; margin: -1px 0px 1px -4px;padding:0px 0px 0px 0px;background-color:#aacc77; }
        .ui-ck-oneday .od-working{float:left;clear:right;display:inline-block;margin-left:0px;height:20px;}
        
        .ui-ck-oneday .od-bfwork{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#fff;}
        .ui-ck-oneday .od-unworking{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; }
        .ui-ck-oneday .od-afwork{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#fff;}
        .ui-ck-oneday .od-invalidwork{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#fff;}

        .ui-ck-oneday .od-bfwork-onehdday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#89DBB6;}
        .ui-ck-oneday .od-unworking-onehdday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; }
        .ui-ck-oneday .od-afwork-onehdday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#89DBB6;}
        .ui-ck-oneday .od-invalidwork-onehdday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#89DBB6;}

        .ui-ck-oneday .od-bfwork-onewkday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#6596D1;}
        .ui-ck-oneday .od-unworking-onewkday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; }
        .ui-ck-oneday .od-afwork-onewkday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#6596D1;}
        .ui-ck-oneday .od-invalidwork-onewkday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#6596D1;}

        .ui-ck-oneday .od-bfwork-onechday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#FD8FA5;}
        .ui-ck-oneday .od-unworking-onechday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; }
        .ui-ck-oneday .od-afwork-onechday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#FD8FA5;}
        .ui-ck-oneday .od-invalidwork-onechday{float:left;clear:right;display:inline-block;margin-left:0px; height:20px; background-color:#FD8FA5;}

        .ui-ck-onehdday{background-color:#D7F3E6;}
        .ui-ck-onewkday{background-color:#DFE9F5;}
        .ui-ck-onechday{background-color:#FEEAEE; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul style=" width:100%;">
            <li class="toolselascx"><selStaff:wucSelStaff ID="selStaff" LeftText="员工:" SWidth="55%" runat="server" /></li>
            <li class="toolselascx"><uc1:wucseldept ID="selDept" LeftText="部门:" SWidth="50%" runat="server" /></li>
            <li class="toolselascx"><span><a>起始时间:</a><input class="selshowinput" id="txtStartTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li class="toolselascx"><span><a>结束时间:</a><input class="selshowinput" id="txtEndTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><asp:Button ID="btnFind" Text="查询" runat="server" OnClientClick="return checkFindTime('txtStartTime','txtEndTime');" onclick="btnFind_Click"/></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><input id="btnClear" value="清空" type="button" onclick="clearfindinput(this);"/></span></li>
            <li style=" float:left; text-align:left; clear:right; display:none;"><span><asp:Button ID="btnOut" Text="导出" runat="server" OnClientClick="return checkFindTime('txtStartTime','txtEndTime');" onclick="btnFind_Click"/></span></li>
        </ul>
    </div>
    <div id="gridbox1"	style="text-align:left;background-color: white;width:1000px;height:500px; overflow: hidden;"></div>
    <script type="text/javascript">
          
          function createGrid1() {
              mygrid = new dhtmlXGridObject('gridbox1');
              mygrid.setImagePath("../../lib/DHX/imgs/");
              mygrid.setHeader(<%=m_header1 %>);
              mygrid.attachHeader(<%=m_header2 %>);
              mygrid.setInitWidths(<%=m_width %>);
              mygrid.setColAlign(<%=m_align %>);
              mygrid.enableMultiselect(true);
              mygrid.enableKeyboardSupport(true);
              mygrid.enableResizing(<%=m_resizelist %>);
              mygrid.setEditable(false);
              mygrid.init();
              mygrid.splitAt(7);
              mygrid.setSizes();
              mygrid.setSkin("light");
              mygrid.setSizes(); 
          }

          var m_step = 0;
          function loadGrid(){
              if(mygrid == null || mygrid == undefined)
                  return;
              switch(m_step)
              {
                  <%=m_rows %>
                  default:
                      $("#gridbox1 .objbox").unmask();
                      break;
              }
          }

          function synLoadGrid(){
              $("#gridbox1").html("");
              createGrid1();
              m_step = 0;
              loadGrid();
          }
          window.onload = function () {
              synLoadGrid();
              tblistReSize('gridbox1');
          }
    </script>
<div id="mjs:tip" class="tip" style="position:absolute;left:0;top:0;display:none;text-align:left;background-color:#ffeeaa; border:1px solid #eee"></div>
</asp:Content>







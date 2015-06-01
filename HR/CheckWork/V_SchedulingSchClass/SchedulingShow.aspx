<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_SchedulingShow" CodeFile="SchedulingShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<%@ Register src="../../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <script src="../../../Lib/MyDP/seldate.js" type="text/javascript"></script>
    <link rel='stylesheet' type='text/css' href='../fullcalendar-1-5-3/demos/cupertino/theme.css' />
    <link rel='stylesheet' type='text/css' href='../fullcalendar-1-5-3/fullcalendar/fullcalendar.css' />
    <link rel='stylesheet' type='text/css' href='../fullcalendar-1-5-3/fullcalendar/fullcalendar.print.css' media='print' />
    <script type='text/javascript' src='../fullcalendar-1-5-3/jquery/jquery-ui-1-8-17.custom.min.js'></script>
    <script type='text/javascript' src='../fullcalendar-1-5-3/fullcalendar/fullcalendar.js' charset="GBK"></script>
    <link href="../Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="../Uploadify/jquery_loadmask.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager();
        $(function () {
            manager.initBodyRows();
            manager.initFindDL();
            //manager.initPageSizeEvt("txtPageNum");
            bindWinResize(40);
        });

        function selAll(me) {
            var cheds = $("#tbodylist").find("input[type='checkbox']");
            for (var i = 0; i < cheds.length; i++)
                cheds[i].checked = $(me)[0].checked;
        }

        function editSch() {
            var editurl = 'V_SchedulingManage.aspx?r=' + Math.random();
            var staffid = $("#cphBody_hidstaffid").val();
            var deptid = $("#cphBody_hiddeptid").val();
            var orgid = $("#cphBody_hidorgid").val();
            var name = $("#cphBody_hidname").val();
            if (staffid != "")
                editurl += "&staffid=" + staffid;
            if (deptid != "")
                editurl += "&deptid=" + deptid;
            if (orgid != "")
                editurl += "&orgid=" + orgid;
            if (name != "")
                editurl += "&name=" + encodeURI(name);
            _recordWindowWidth = 1000;
            _recordWindowHeight = 650;
            manager.editRecord(encodeURI(editurl));
        }

        function clearfindinput(me) {
            $(me).parent().parent().parent().find(".toolselascx input").val("");
        }

        var eventUrl = "DoWork.aspx";
        $(document).ready(function () {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var isEventDraging = false;
            var selEventID = "";

            $('#external-events div.external-event').each(function () {
                // create an Event Object
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim($(this).text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                $(this).data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });
            });

            $('#calendar').fullCalendar({
                theme: true,
                header: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: false,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');

                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" 
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
                },
                events: {
                    events: function (start, end, callback) {
                        try {
                            $('#calendar').mask("正在加载......");
                            if (start.getDate() == 1) {
                                $("#cphBody_dll_Year").val(start.getFullYear());
                                $("#cphBody_dll_Month").val(start.getMonth() + 1);
                            }
                            else if (start.getMonth() + 1 == 12) {
                                $("#cphBody_dll_Year").val(start.getFullYear() + 1);
                                $("#cphBody_dll_Month").val(1);
                            }
                            else {
                                $("#cphBody_dll_Year").val(start.getFullYear());
                                $("#cphBody_dll_Month").val(start.getMonth() + 2);
                            }
                        } catch (e) { }
                        $.ajax({
                            url: eventUrl + "?r=" + Math.random(),
                            dataType: 'xml',
                            data: {
                                // our hypothetical feed requires UNIX timestamps
                                start: start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate() + " " + start.getHours() + ":" + start.getMinutes() + ":" + start.getSeconds(), //Math.round(start.getTime()),
                                end: end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate() + " " + end.getHours() + ":" + end.getMinutes() + ":" + end.getSeconds(), //Math.round(end.getTime())
                                type: $("#cphBody_dll_Type").val(),
                                staffid: $("#cphBody_hidstaffid").val(),
                                deptid: $("#cphBody_hiddeptid").val(),
                                orgid: $("#cphBody_hidorgid").val()
                            },
                            success: function (doc) {
                                var events = [];
                                m_DayTypes.clear();
                                $(doc).find('event').each(function (i) {
                                    events.push({
                                        id: $(this).children('id').text(),
                                        title: $(this).children('title').text(),
                                        start: $(this).children('start').text(),
                                        end: $(this).children('end').text(), // will be parsed
                                        color: $(this).children('color').text(),
                                        allDay: false
                                    });
                                    var ddate = $(this).children('date').text();
                                    if (m_DayTypes.contains(ddate)) {
                                        if (m_DayTypes._hash[ddate].type < $(this).children('type').text()) {
                                            m_DayTypes._hash[ddate].type = $(this).children('type').text();
                                            m_DayTypes._hash[ddate].typename = $(this).children('typename').text();
                                        }
                                    }
                                    else {
                                        m_DayTypes.add(ddate, { date: $(this).children('date').text(), type: $(this).children('type').text(), typename: $(this).children('typename').text() });
                                    }
                                });
                                callback(events);
                                renderDayType(start);
                                try {
                                    $('#calendar').unmask();

                                } catch (e) { }
                            },
                            error: function (a, b, c) {
                                alert(b);
                                try {
                                    $('#calendar').unmask();
                                } catch (e) { }
                            },
                            complete: function (xht, sta) {
                                if (sta == "error") alert(sta);
                                try {
                                    $('#calendar').unmask();
                                } catch (e) { }
                            }
                        });
                    }
                },
                eventClick: function (calEvent, jsEvent, view) {
                    //单击日程事项出发事件
                    isEventDraging = false;
                    selEventID = "";
                },
                eventMouseover: function (event, jsEvent, view) {
                },
                eventDragStart: function (event, jsEvent, ui, view)
                { },
                eventDragStart: function (event, jsEvent, ui, view) {
                    isEventDraging = true;
                    selEventID = event.id;
                },
                eventDragStop: function (event, jsEvent, ui, view) {
                    isEventDraging = false;
                    selEventID = "";
                },
                eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
                }
            });
            $("#eventTrash").mouseenter(function (e) {
                if (isEventDraging)
                    $(e)[0].currentTarget.style.backgroundColor = "red";
            });
            $("#eventTrash").mouseleave(function (e) {
                $(e)[0].currentTarget.style.backgroundColor = "#eee";
                if (isEventDraging && selEventID != "") {
                    $('#calendar').fullCalendar("removeEvents", selEventID);
                }
            });
            $(".fc-button-prevYear").click(function () {
            });
            $(".fc-button-prev").click(function () {
            });
            $(".fc-button-nextYear").click(function () {
            });
            $(".fc-button-next").click(function () {
            });
            $(".fc-button-today").click(function () {
            });
            $(".fc-button-refresh").click(function () {
            });
        });

        function selChange() {
            $('#calendar').fullCalendar("gotoDate", $("#cphBody_dll_Year").val(), $("#cphBody_dll_Month").val() - 1);
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
                    t.innerHTML = $(obj).find("div").html();
                    t.style.display = '';
                }
                obj.onmouseout = function () {
                    t.style.display = 'none';
                }
            }
        }

    </script>
    <style type="text/css">
        .tool .toolselascx
        {
            margin: 0px;
            padding: 0px;
            float: left;
            width: 160px;
            text-align: left;
            clear: right;
        }
        .tool .toolselascx span
        {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 20px;
            line-height: 20px;
            border: 0px none #fff;
        }
        .tool .toolselascx span a
        {
            line-height: 22px;
            float: left;
        }
        .tool .toolselascx span .selshowinput
        {
            background-color: #fff;
            height: 18px;
            width: 50%;
            float: left;
            line-height: 18px;
            border: 1px solid #aad;
        }
        .tool .toolselascx span input.sel
        {
            border: none;
            background: url(../../../Themes/Default/img/find.gif) center center no-repeat;
            height: 20px;
            width: 25px;
            cursor: pointer;
        }
        #calendar
        {
            float:left;
            width: 800px;
            margin:0 0 0 0;
        }
        .right
        {
            float:left;
            width: 200px;
            height:600px;
            margin: 0 0 0 5px;
            border: 1px solid #bbc;
            background-color:#def;
        }
        .right h2
        {
            height:30px;
            line-height:30px;
            font-size:large;
            background-color:#abc;
            margin-bottom:0px;
        }
         .right dl{ margin:0; padding:0; display:inline-block; width:100%; height:20px;}
         .right dl dt{ width:70px; height:20px; display:inline-block; padding:0px 3px 0px 3px; line-height:20px; text-align:right;}
         .right dl dd{ width:110px;  height:20px; display:inline-block;padding:0px 3px 0px 3px;line-height:20px;text-align:left;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidstaffid" type="hidden" runat="server" />
    <input id="hiddeptid" type="hidden" runat="server" />
    <input id="hidorgid" type="hidden" runat="server" />
    <input id="hidname" type="hidden" runat="server" />
<div class="main" style=" min-width:1010px;">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         <div class="clear"></div>
    </div>
    <div class="tool" style=" height:25px;">
       <ul style=" width:100%;">
            <li><span><input id="btnBuild" type="button" value="排班生成管理" onclick=" editSch();"  /></span></li>
            <li><span><select id="dll_Year" runat="server" onchange="selChange()"></select><a style=" line-height:18px;">年</a></span></li>
            <li><span><select id="dll_Month" runat="server" onchange="selChange()"></select><a style=" line-height:18px;">月</a></span></li>
            <li><span><a style=" line-height:18px;">值班类型:</a><select id="dll_Type" runat="server" onchange="selChange()"></select></span></li>
        </ul>
    </div>
    <div id='calendar'></div>
    <div class='right'>
        <h2>班次列表</h2>
        <div class="tblist" style="height:560px; max-height:600px;">
         <table cellpadding="0" cellspacing="0" id="tbList" >
            <thead>
                <tr>
                    <td>班次名称</td><!--班次时段名称-->
                    <td>班次信息</td><!--值班时段-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td><%#((HR_SchClass)Container.DataItem).SchName%></td>
                    <td onmouseover="tip.start(this)"  style=" cursor:pointer; background-color:<%#((HR_SchClass)Container.DataItem).Color%>">
                        <div style=" display:none;">
                            班次名称:<%#((HR_SchClass)Container.DataItem).SchName%><br />
                            时段:<%#((HR_SchClass)Container.DataItem).StartHour%>:<%#((HR_SchClass)Container.DataItem).StartMin%>-<%#((HR_SchClass)Container.DataItem).EndHour%>:<%#((HR_SchClass)Container.DataItem).EndMin%><br />
                            计算量值:<%#((HR_SchClass)Container.DataItem).SchNumber%><br />
                            量值单位:<%#formhelper.GetOptionText(HR_SchClass.Attribute.SchUnit, ((HR_SchClass)Container.DataItem).SchUnit)%><br />
                            是否计算为加班:<%#((HR_SchClass)Container.DataItem).IsOverTime ? "是" : "否"%><br />
                            签到时间:<%#(!((HR_SchClass)Container.DataItem).CheckIn ? "不签到" : (((HR_SchClass)Container.DataItem).CheckInHour1 + ":" + ((HR_SchClass)Container.DataItem).CheckInMin1 + "-" + ((HR_SchClass)Container.DataItem).CheckInHour2 + ":" + ((HR_SchClass)Container.DataItem).CheckInMin2))%><br />
                            签退时间:<%#(!((HR_SchClass)Container.DataItem).CheckOut ? "不签退" : (((HR_SchClass)Container.DataItem).CheckOutHour1 + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin1 + "-" + ((HR_SchClass)Container.DataItem).CheckOutHour2 + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin2))%><br />
                            计迟到/早退分钟数:<%#((HR_SchClass)Container.DataItem).LateMinutes%>/<%#((HR_SchClass)Container.DataItem).EarlyMinutes%><br />
                        </div>
                    </td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    </div>
<div id="mjs:tip" class="tip" style="position:absolute;left:0;top:0;display:none;text-align:left;background-color:#ffeeaa; border:1px solid #eee"></div>
    <asp:Literal ID="litScript" runat="server"></asp:Literal>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_SchedulingManage" CodeFile="SchedulingManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<%@ Register src="../../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        function showatooltip(me) {
            var div3 = $("#tableatooltip");
            div3[0].innerHTML = $(me)[0].tag;
            div3[0].style.display = 'block';
            div3[0].style.left = event.clientX + 1;
            div3[0].style.top = event.clientY + 1;
            div3[0].style.position = "absolute";
        }

        function selAll(me) {
            var cheds = $("#tbodylist").find("input[type='checkbox']");
            for (var i = 0; i < cheds.length; i++)
                cheds[i].checked = $(me)[0].checked;
        }


        function hideatooltip() {
            $("#tableatooltip")[0].style.display = 'none';
        }

        function clearfindinput(me) {
            $(me).parent().parent().parent().find(".toolselascx input").val("");
        }

        var eventUrl = "V_SchedulingSchClass/DoWork.aspx";
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
                    left: 'prevYear,prev,next,nextYear,refresh today',
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
                        } catch (e) { }
                        $.ajax({
                            url: eventUrl,
                            dataType: 'xml',
                            data: {
                                // our hypothetical feed requires UNIX timestamps
                                start: start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate() + " " + start.getHours() + ":" + start.getMinutes() + ":" + start.getSeconds(), //Math.round(start.getTime()),
                                end: end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate() + " " + end.getHours() + ":" + end.getMinutes() + ":" + end.getSeconds(), //Math.round(end.getTime())
                                type: $("#cphBody_dll_Type").val()
                            },
                            success: function (doc) {
                                var events = [];
                                //alert(start);
                                //alert(end);
                                $(doc).find('event').each(function (i) {
                                    events.push({
                                        id: $(this).children('id').text(),
                                        title: $(this).children('title').text(),
                                        start: $(this).children('start').text(),
                                        end: $(this).children('end').text(), // will be parsed
                                        color: $(this).children('color').text(),
                                        allDay: false
                                    });
                                });
                                callback(events);
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
            background: url(../../Themes/Default/img/find.gif) center center no-repeat;
            height: 20px;
            width: 25px;
            cursor: pointer;
        }
        .body
        {
            text-align: center;
            font-size: 13px;
            font-family: "Lucida Grande" ,Helvetica,Arial,Verdana,sans-serif;
        }
        #wrap
        {
            width: 800px;
            margin: 0 auto;
        }
        
        .left
        {
            display: block;
            float: left;
            width: 130px;
            margin-right: 5px;
        }
        
        #external-events
        {
            width: 100%;
            padding: 0 10px;
            border: 1px solid #ccc;
            margin-bottom: 5px;
            background: #eee;
            text-align: left;
        }
        
        #external-events h4
        {
            font-size: 16px;
            margin-top: 0;
            padding-top: 1em;
        }
        
        .external-event
        {
            /* try to mimick the look of a real event */
            margin: 10px 0;
            padding: 2px 4px;
            background: #3366CC;
            color: #fff;
            font-size: .85em;
            cursor: pointer;
        }
        
        #external-events p
        {
            margin: 1.5em 0;
            font-size: 11px;
            color: #666;
        }
        
        #external-events p input
        {
            margin: 0;
            vertical-align: middle;
        }
        
        #eventTrash
        {
            height: 200px;
            width: 100%;
            padding: 0 10px;
            border: 1px solid #ccc;
            background: #eee;
            text-align: left;
            cursor: pointer;
        }
        
        .eventTrashWorking
        {
            background-color: Red;
        }
        
        #eventTrash h4
        {
            font-size: 16px;
            margin-top: 0;
            padding-top: 1em;
            padding-left: 10px;
        }
        
        #calendar
        {
            float: right;
            width: 800px;
            margin:5px 0 0 0;
        }
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
    <div class="tool" style=" height:25px;">
       <ul style=" width:100%;">
            <li><span><input power="editV_SchedulingSchClass" id="btn_Edit" type="button" value="排班表编辑" onclick="manager.editRecord('HR_Scheduling/HR_SchedulingEdit.aspx');" /></span></li>
            <li><span><input id="btnBuild" type="button" value="批量生成排班表" onclick="manager.editRecord('V_SchedulingSchClass/V_SchedulingSchClassBuild.aspx');"  /></span></li>
            <li><span><select id="dll_Year" runat="server" onchange="selChange()"></select><a style=" line-height:18px;">年</a></span></li>
            <li><span><select id="dll_Month" runat="server" onchange="selChange()"></select><a style=" line-height:18px;">月</a></span></li>
            <li><span><a style=" line-height:18px;">值班类型:</a><select id="dll_Type" runat="server" onchange="selChange()"></select></span></li>
        </ul>
    </div>
    <div class='body'>
        <div id='wrap'>
        <!--
        <div class="left" style=" display:none;">
            <div id='external-events'>
                <h4>
                    班次列表</h4>
                 <asp:Repeater ID="repList" runat="server">
                       <ItemTemplate>
                       <div class='external-event' style=" background-color:<%#((HR_SchClass)Container.DataItem).Color%>;">
                           <%#((HR_SchClass)Container.DataItem).SchName%>
                       </div>
                      </ItemTemplate>
                  </asp:Repeater>
            </div>
            <div id='eventTrash'><h4>班次黑洞</h4></div>
        </div>
        -->
        <div id='calendar'></div>
        <div style='clear: both'></div>
    </div>
    </div>
<div id="tableatooltip" style="display:none; text-align:left; background-color:#ffeeaa; border:1px solid #eee"></div>
</div>
    <asp:Literal ID="litScript" runat="server"></asp:Literal>
</asp:Content>

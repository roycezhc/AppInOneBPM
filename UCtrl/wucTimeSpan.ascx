<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucTimeSpan" CodeFile="wucTimeSpan.ascx.cs" %>
<span>
<select id="selType" runat="server" onchange="selTypeChg(this);" style="width:80px;">
<option value="4">周</option>
<option value="3">月</option>
<option value="2">季度</option>
<option value="1">年度</option>
<option value="0">自定义</option>
<%--
<option value="11">项目任务</option>
<option value="12">项目协助任务</option>--%>
</select>
<select id="selYear" runat="server" style="width:70px;">
<%--<option value="2010">2010年</option>
<option value="2011">2011年</option>--%>
<option value="2012">2012年</option>
<option value="2013">2013年</option>
<option value="2014">2014年</option>
<option value="2015">2015年</option>
<option value="2016">2016年</option>
<option value="2017">2017年</option>
<option value="2018">2018年</option>
<option value="2019">2019年</option>
<option value="2020">2020年</option>
</select>
<select id="selJD" runat="server" style="display:none;width:70px;">
<option value="1">一季度</option>
<option value="2">二季度</option>
<option value="3">三季度</option>
<option value="4">四季度</option>
</select>
<select id="selMonth" runat="server" style="display:none;width:60px;">
<option value="1">1月</option>
<option value="2">2月</option>
<option value="3">3月</option>
<option value="4">4月</option>
<option value="5">5月</option>
<option value="6">6月</option>
<option value="7">7月</option>
<option value="8">8月</option>
<option value="9">9月</option>
<option value="10">10月</option>
<option value="11">11月</option>
<option value="12">12月</option>
</select>
<select id="selWeek" runat="server" style="display:none;width:70px;">
<option value="1">第一周</option>
<option value="2">第二周</option>
<option value="3">第三周</option>
<option value="4">第四周</option>
<option value="5">第五周</option>
</select>
<span><%=selWeekInfo %></span>
<span id="spanBeginTime" style="display:none;">
开始于<input id="txtBeginTime" style="width:70px" type="text" runat="server" ck="{need:0,dtype:3}" onclick="setday(this);" />
结束于<input id="txtEndTime" style="width:70px" type="text" runat="server" ck="{need:0,dtype:3}"  onclick="setday(this);"/></span>
</span>
<script type="text/javascript">
    $(function () {
        selTypeChg($("select[id$='selType']")[0]);
        //chx 这里做下赋值
        $("#selYear").attr("value", "<%=selYear.Value %>");
        $("#selJD").attr("value", "<%=selJD.Value %>");
        $("#selMonth").attr("value", "<%=selMonth.Value %>");
        $("#selWeek").attr("value", "<%=selWeek.Value %>");
    });
    function selTypeChg(me) {
        //if(me == undefined)return;
        var yObj = $(me).next();
        var jdObj = yObj.next();
        var mObj = jdObj.next();
        var wObj = mObj.next();
        var spanBeginTime = wObj.next(); //$("#spanBeginTime");
        
        jdObj.show(); mObj.show(); wObj.show(); yObj.show();
        spanBeginTime.hide();

        if (me.value == "0") {
            spanBeginTime.show(); //$(me).hide();
            yObj.hide(); jdObj.hide(); mObj.hide(); wObj.hide(); yObj.hide();
        }
        else if (me.value == "1") {
            jdObj.hide(); mObj.hide(); wObj.hide();
        } else if (me.value == "2") {
            mObj.hide(); wObj.hide(); //yObj.hide();
        } else if (me.value == "3") {
            wObj.hide(); jdObj.hide();
        } else if (me.value == "4") {
            jdObj.hide();
        } else if (me.value == "11") {
            yObj.hide(); jdObj.hide(); mObj.hide(); wObj.hide(); yObj.hide();
        } else if (me.value == "12") {
            yObj.hide(); jdObj.hide(); mObj.hide(); wObj.hide(); yObj.hide();
        }
    }
    
</script>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucDateTime" CodeFile="wucDateTime.ascx.cs" %>
<script type="text/javascript">
function isNum(el,min,max){
   if(el.value==""){return;}
    var re=/\d{1,2}/.test(el.value);//alert(re);
    if(re==true){
       var a=parseInt(el.value);
       if(!(a>=min&&a<=max)){
          alert("请输入"+min+"到"+max+"之间的值");
          el.value="00";el.focus();
       }
    }else{
        alert("请输入数字！");
        el.value="00";el.focus();
    }
}
</script>
<span style="font-size:12px;">
<input id="txtDate" name="txtDate" onclick="setday(this);" runat="server" type="text" style="width:70px; cursor:default;" readonly="readonly" />
&nbsp;<input id="txtHour" type="text" value="12"  onkeyup="isNum(this,0,24);"  runat="server" style="width:30px;" />：<input id="txtMinute" type="text" value="00"  onkeyup="isNum(this,0,59);" runat="server" style="width:30px;"/>：<input id="txtSecond" type="text" value="00"  onkeyup="isNum(this,0,59);" runat="server" style="width:30px;"/>
</span>
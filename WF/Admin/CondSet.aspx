<%@ Page Title="条件设置" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_WorkFlow_CondSet" CodeFile="CondSet.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
 <script src="../../Lib/JScript/myJsCore.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
       
     $("#selColOpr").bind("change",function(event){
           var selCol2=$("select[id$='selCol2']");
           if(event.target.value==""){
              selCol2.hide();
           }else{
              selCol2.show();
           }
     });
});

function showNote(el){
   var divEl=$(el).parent().next();
   if($(el).text()=="显示使用说明"){
       $(el).text("隐藏使用说明");
       divEl.show();
   }else{
       $(el).text("显示使用说明");
       divEl.hide();
   }
}

var selCol1=null;
var selColOpr=null;
var selCol2=null;
var selOpr=null;
var txtVal = null;
var hidVal = null;

var curSelHid=null;
$(function(){
     selCol1=$("select[id$='selCol1']");
     selColOpr=$("#selColOpr");
     selCol2=$("select[id$='selCol2']");
     selOpr=$("#selReOpr");
     txtVal = $("#txtValue");
     hidVal = $("#hidValue");
});


//添加一个条件
function addCond(el){
     if(selCol1.val()==""){
         alert("必须选择第一个字段名！");return;
     }
     var val=txtVal.val();
     if(val==""){
        alert("请输入对应的值！");return;
     }
     var ppp=/[|\}\{\]\[+\-=∈⊙≠≮≯≤≥\>\<]/;
     if(ppp.test(val)){
        alert("填写的值不能包含：'|+-=∈⊙≠≮≯≤≥><}{]['");return;
     }
    var condData = createDataObj();
     var hidNum=$("#hidCondNum");
     var condNum=parseInt(hidNum.val())+1;
     hidNum.val(condNum);//alert(condNum);
     var htmlStr=createCondHtml(condData,condNum);
     if(htmlStr!=""){
         var divCond=$("#divCondition");
         divCond.append(htmlStr);
         if(curSelHid!=null){
              curSelHid.removeClass("sel"); $("#btnEditCond").hide();
         }
     }
     initSort();
}
//创建JSON对象字符串
function createDataObj(){
       var condData="{";
       condData+="Col1:'"+selCol1.val()+"',";
       condData+="ColOpr:'"+selColOpr.val()+"',";
       condData+="Col2:'"+selCol2.val()+"',";
       condData+="ReOpr:'"+selOpr.val()+"',";

       if (hidVal.val() != '') {
           condData += "Re:'" + hidVal.val() + "',";
           condData += "Hide:'" + txtVal.val() + "'}";
       }
       else {
           condData += "Re:'" + txtVal.val() + "',";
           condData += "Hide:''}";
       }
      
       return condData;
}
function createCondHtml(condData,condNum){
    var dataObj = eval("(" + condData + ")");
    var str=createCondText(dataObj);
    var html="<tr id='tr_"+condNum+"'><td><span>"+condNum+"</span></td><td><input name='txtCond_"+condNum+"' readonly='readonly' type='text' value='"+str+"' title=\""+condData+"\" /></td>";
    html+="<td><a href='#' onclick='editCond(this);'>修改</a>&nbsp;&nbsp;<a href='#' onclick='delCond(this);'>删除</a></td></tr>";
    return html;
}
function createCondText(dataObj){
    var str=dataObj.Col1;
    if(dataObj.Col2!=""&&dataObj.ColOpr!=""){
        if(dataObj.Col1==dataObj.Col2){
            alert("做加减操作的两个字段不能相同。");
            return "";
        }
        str+=dataObj.ColOpr+dataObj.Col2;
    }
    str+=dataObj.ReOpr+dataObj.Re;
    return str;
}

function selCol1Chg(){
   bindEventToValText();
}

function delCond(el){
    if(confirm("确实要删除此条件吗？")){
        var trObj=$(el).parent().parent();
        trObj.remove();initSort();
    }
}
//编辑显示原来条件
function editCond(el){
   var hids=$(el).parent().prev().find("input");//alert(hids.attr("title"));
   var valObj=eval("("+hids.attr("title")+")");
   selCol1.val(valObj.Col1);
   selColOpr.val(valObj.ColOpr);
   selCol2.val(valObj.Col2);
   selOpr.val(valObj.ReOpr);

   if (valObj.Hide != '' && valObj.Hide != undefined) {
       txtVal.val(valObj.Hide);
       hidVal.val(valObj.Re);
   } else {
       txtVal.val(valObj.Re);
       hidVal.val(valObj.Hide);
   }
   
   if(valObj.ColOpr!=""){
      selCol2.show();
   }else{
      selCol2.hide();
   }
   if(curSelHid!=null){
      curSelHid.removeClass("sel");
   }
   curSelHid=$(el).parent().parent();
   $("#btnEditCond").show();$("#btnEditCancel").show();
   curSelHid.addClass("sel");
   bindEventToValText();
}
function bindEventToValText() {
    var colName=selCol1.val();
    txtVal.unbind("click");
    if(selColOpr.val()!=""){
        txtVal.unbind("click");return;
    }
    selColOpr.attr("disabled",true);
    if (colName.indexOf("DEPT_NAME") != -1 || colName.indexOf("DEPT_ID") != -1) {
        txtVal.bind("click", txtVal[0], function (event) {
            hidVal.val('');
            txtVal.val('');
            var vals = event.target.value;
            var win = window.showModalDialog("../../HR/DEPT/DeptSels.aspx?rrr" + Math.random(), "", "dialogHeight: 580px; dialogWidth: 500px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
            if (win != "" && win != undefined) {
                event.target.value = ""; 
                var arr = eval(win);
                var hidIds;
                hidIds = '';
                for (var i = 0; i < arr.length; i++) {
                    if (i > 0) { event.target.value += ","; hidIds += ","; }
                    event.target.value += arr[i].DptName; hidIds += arr[i].DptID;
                }
                hidVal.val(hidIds);
            }
        });
   }else{
      selColOpr.attr("disabled",false);
   }
}
//完成编辑操作
function editCondComp(){
    if(curSelHid!=null){
        var condData=createDataObj();
        var hids=curSelHid.find("input");
        $("#btnEditCond").hide();$("#btnEditCancel").hide();
        var dataObj=eval("("+condData+")");
        var str=createCondText(dataObj);
        $(hids[0]).val(str);
         $(hids[0]).attr("title",condData);
        curSelHid.removeClass("sel");txtVal.val("");
    }
}
function editCancel(){
    $("#btnEditCond").hide();$("#btnEditCancel").hide();txtVal.val("");
    curSelHid.removeClass("sel");
}

function initSort(){
    var trs=$("#divCondition").find("tr");
    for(var i=1;i<=trs.length;i++){
        var sp=$(trs[i-1]).find("span");
        var newStr=i;
        sp.text(newStr);
    }
}

function insertVal(val){
   $("#txtValue").val(val);
}
function selCol1_onclick() {

}

function selCol1_onclick() {

}

</script>
<style type="text/css">
#divCondition tr td input{border:none; background:none;width:90%;}
#divCondition tr.sel{background:#eef;}
#divCondition tr.sel td input{font-weight:700;width:90%;}
.rowsform{width:100%;border:solid 1px #999;text-align:left;}
.rowsform fieldset{margin:5px 10px 0 5px;border:solid 1px #ccc;padding:4px;}
.rowsform fieldset legend{font-weight:bold;}
.rowsform h2,h3,.note,div{clear:both;padding:0;margin:0;width:100%;}
.rowsform h2,h3{ text-align:center;line-height:20px;font-weight:bold;font-size:12px; background:#aaa;}
.rowsform h4{padding:3px 0; text-indent:10px;margin:0; font-weight:normal;}
.rowsform h4 a{color:#009;}
.rowsform h3 input{ font-weight:bold;color:#900;}
.rowsform .note{text-align:left;text-indent:8px;line-height:20px;color:#600;}
.rowsform input,textarea{border:solid 1px #999;background:#fff;}
.rowsform div{ text-indent:10px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<%--<div class="topnav">
<dl><dt></dt><dd>条件设置</dd></dl>
<ul>
<li><a class="toclose" onclick="history.back();"><span>返回</span></a></li>

</ul>
</div>--%>
<div style="text-align:center;">
<div class="rowsform" style="width:700px; margin:0 auto 0 auto;">
     <h2>
         <asp:Literal ID="litStep" runat="server"></asp:Literal>&nbsp;条件生成器</h2>
     <fieldset>
        <legend><a href="#" onclick="showNote(this);">显示使用说明</a></legend>
         <div class="note" style="display:none;">
            条件列表处用于存储全部条件，每一行为一个条件，条件的标号就是其行号。如果不设置条件公式，所有条件之间均为“与”的关系如果设置条件公式，条件公式中需要引用条件列表中的条件，引用方法为在中括号中加入条件的行号。
            <br />例如：
            <br />“满足条件1或者条件2”的条件公式为：1 or 2
            <br />“满足条件1或者条件2，且满足条件3”的条件公式为：(1 or 2) and 3
            <br />“满足条件1，且不满足条件2”的条件公式为：1 and !2
        </div>
     </fieldset>     
     
     <fieldset>
     <legend><b>单条件生成：</b></legend>
      <div><strong>流程字段：</strong>
            <select id="selCol1"  style="width:150px;" onchange="selCol1Chg();" onclick="return selCol1_onclick()">
                 <option value="">无</option>
                <asp:Literal ID="litCol1" runat="server"></asp:Literal>
             </select>
             <select id="selColOpr" disabled="disabled" style="width:50px;">
                 <option value="">无</option>
                 <option value="-">减</option>
                 <option value="+">加</option>
             </select>
             <select id="selCol2" style="width:150px;display:none;">
                 <option value="">无</option>
                 <asp:Literal ID="litCol2" runat="server"></asp:Literal>
             </select>
          <select id="selReOpr" style="width:90px;">
             <option value="=">等于</option>
             <option value="∈">包含于</option>
             <option value="⊙">包含</option>
             <option value="≠">不等于</option>
             <option value="≮">不包含于</option>
             <option value="≯">不包含</option>
             <option value="≤">小于等于</option>
             <option value="≥">大于等于</option>
             <option value="<">小于</option>
             <option value=">">大于</option>
             <option value="『">开始于</option>
             <option value="』">结束于</option>
          </select>
     </div>
     <div>
     <textarea id="txtValue" cols="60" style="width:480px;" rows="3" style="margin-left:55px;"></textarea>
     <input type="hidden" id="hidValue" />
      <a href="#" class="x-btn"><span><input id="btnEditCond" type="button" value="修改" onclick="editCondComp(this);" style="width:40px;display:none;" /></span></a>
            <a href="#" class="x-btn"><span><input id="btnEditCancel" type="button" value="取消" onclick="editCancel(this);" style="width:40px;display:none;" /></span></a>
            <a href="#" class="x-btn"><span><input id="btnAddCond" type="button" value="添加" onclick="addCond(this);" style="width:40px;" /></span></a>
     </div>
     <h4><b>插入对象</b>：<a onclick="insertVal('#CHECKER#');">审核人</a></h4>
     </fieldset>
    
     <fieldset>
     <legend><b>条件列表：</b></legend>
     <div>&nbsp;满足以下条件：本活动
         <select id="selIsShow" runat="server" style="width:70px;">
             <option value="show">有效</option>
             <option value="hide">无效</option>
         </select>
    </div>
     <div class="tblist" style="min-height:200px;height:200px; overflow:auto;border-bottom:none;">
       <table cellpadding="0" cellspacing="0">
       <thead>
       <tr><td style="width:40px;">编号</td><td style="width:460px;">条件描述</td><td style="width:90px;">操作</td></tr>
       </thead>
       <tbody id="divCondition">
         <asp:Literal ID="litConds" runat="server"></asp:Literal>
       </tbody>
       </table>
     </div>
     </fieldset>
     <fieldset>
        <legend>条件公式编辑：</legend>
        <div><input id="txtGongShi" type="text" autocomplete="off" value="" runat="server" style="width:650px;" /></div>
        <div class="note">转入条件公式(条件与逻辑运算符之间需空格，如1 and 2</div>
     </fieldset><br />
     <h3>
        <a href="#" class="x-btn"><span><asp:Button ID="btnOK" runat="server" Text="保存设置" onclick="btnOK_Click"  Width="81" /></span></a>
        <a href="#" class="x-btn"><span><asp:Button ID="btnBack" runat="server" Text="取消" Width="51" /></span></a>
     </h3>
</div>
</div>
<input id="hidCondNum" name="hidCondNum" type="hidden" value="<%=condNum %>" />
 </asp:Content>


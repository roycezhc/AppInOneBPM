<%@ Page Title="客户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="PRCS_CusSel" CodeFile="CusSel.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
<script src="../Lib/JQuery/jquery.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 var selinfo="";
 var trs=null;
function selok()
{
   if(selinfo!=""){
       window.returnValue=selinfo;//返回员工ID，员工姓名，部门ID，部门名，Email
       //alert(selinfo);
       window.close();
   }
}
function selThis(el){
     for(var a=0;a<trs.length;a++){
           $(trs[a]).css({color:"#000",background:"none"});
     }
     el.css({color:"#fff",background:"#669"});
     var tds=el.find("td");
     selinfo=tds[0].innerHTML+","+tds[1].innerHTML;
}

$(function(){
    trs=$("#tbody-rows").find("tr");
    for(var i=0;i<trs.length;i++){
        $(trs[i]).bind("click",trs[i],function(e){
            selThis($(e.data));
        });
        $(trs[i]).bind("dblclick",trs[i],function(e){
            selThis($(e.data));selok();
        });
    }
});

function clearCond(){
    $("#liKey").children()[0].value="";
}
</script>
<script type="text/javascript">
    function keyDown() {
        var e = event.srcElement;

        if (event.keyCode == 13) {
            document.getElementById("btnFind").focus();
            document.getElementById("btnFind").click();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="topnav">
   <dl><dt></dt><dd>专家选择</dd></dl>
   <ul>
   <li>姓名：</li>
   <li>
       <input id="txtKey" type="text" runat="server" onkeydown="keyDown();" /></li>
   <li>
   <a href="#" class="x-btn"><span>
       <asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span></a>
        <a href="#" class="x-btn"><span>
       <asp:Button ID="btnAll" runat="server" Text="全部" OnClientClick="clearCond();" onclick="btnFind_Click" Width="48" /></span></a>
   </li>
   </ul>
</div>
<div class="head-cont">
        <div class="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td>专家ID</td><td>专家名</td><%--<td>职位</td><td>描述</td>--%>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                      <td><%#Eval("Cus_ID")%></td>
                      <td><%#Eval("Cus_Name")%></td>
                      <%--<td><%#Eval("Job")%></td>
                      <td><%#Eval("RelationTxt")%></td>--%>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</div>
<div class="topnav" style="text-align:center;">
<a href="#" class="x-btn"><span>
       <input id="btnSelOK" type="button" onclick="selok();" value="确定选择" />
   </span></a>
</div>
</asp:Content>


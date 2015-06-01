<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_ColFormular" CodeFile="ColFormular.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {


        });

        function selCol(me) {
            var colname = $(me).attr("data");
            var txt = $("textarea[id$='txtFormular']"); //$("#txtFormular");
            var oldVal=txt.val();
            var laststr=oldVal.substr(oldVal.length-1,1);
            if (laststr == "" || laststr == "+" || laststr == "-" || laststr == "*" || laststr == "/") {
                txt.val(oldVal + colname);
            } else {
//                var rrr = new RegExp(colname + "[\+|\-|\*|/]");
//                if (oldVal != "") {
//                    oldVal = oldVal.replace(rrr, "");
//                }
//                txt.val(oldVal);
            }
            
            //var sss = new String();
            //sss.substring(
        }
        function selFH(me) {
            var fh = $(me).val();
            var txt = $("textarea[id$='txtFormular']");// $("#txtFormular");
            var oldVal=txt.val();
            var laststr=oldVal.substr(oldVal.length-1,1);
            if (laststr == "" || laststr == "+" || laststr == "-" || laststr == "*" || laststr == "/") {

            } else {
                txt.val(oldVal + fh);
            }
        }

        function setOk(me) {
            window.returnValue = $("textarea[id$='txtFormular']").val(); //$("#txtFormular").val();
            window.close();
        }
    </script>

    <style type="text/css">
    #ulfh li a{font-weight:bold;padding:0 5px;}
    #ulCol li{line-height:22px;margin-left:5px;}
    #ulCol li a:hover{ background:#f00;color:#fff;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="warn">
    <textarea id="txtFormular" cols="1" rows="1" style="height:100px;width:90%;overflow:scroll;" 
                            runat="server" ck="{need:0,len:950,type:0}" /><br />
    <input id="Button1" type="button"
        value="确定" onclick="setOk(this);" />
</div>
<div id="lr">
  <div style="width:400px; background:#ddd;">
     <ul id="ulCol">
         <asp:Repeater ID="Repeater1" runat="server">
         <ItemTemplate>
         <li><a href="#" data="<%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %>.<%#((SYS_BILL_COL)Container.DataItem).COL_NAME %>" onclick="selCol(this);"><%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %>-<font color='blue'><%#((SYS_BILL_COL)Container.DataItem).COL_NAME %></font>-<font color='green'><%#((SYS_BILL_COL)Container.DataItem).COL_NOTE %></font></a></li>
         </ItemTemplate>
         </asp:Repeater> 
     </ul>
  </div>
  <div style="background:#eee;">
    <ul id="ulfh">
    <li><input id="Button2" type="button" value="+" onclick="selFH(this);" style="width:40px;" /></li>
    <li><input id="Button3" type="button" value="-" onclick="selFH(this);" style="width:40px;" /></li>
    <li><input id="Button4" type="button" value="*" onclick="selFH(this);" style="width:40px;" /></li>
    <li><input id="Button5" type="button" value="/" onclick="selFH(this);" style="width:40px;" /></li>
    </ul>
  </div>
</div> 
<script type="text/javascript">
    $("#lr").Layout_LR({ jianH: 30 });
  </script>

</asp:Content>


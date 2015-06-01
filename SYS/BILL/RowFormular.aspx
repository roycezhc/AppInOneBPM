<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_RowFormular" CodeFile="RowFormular.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(function () {


        });

        function selCol(me) {
            var colname = $(me).attr("data");
            if (colname != undefined && colname!="") {
                window.returnValue = colname;
                window.close();
            }

        }

    </script>

    <style type="text/css">
    #ulfh li a{font-weight:bold;padding:0 5px;}
    #ulCol li{line-height:22px;margin-left:5px;}
    #ulCol li a:hover{ background:#f00;color:#fff;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<%--<div class="warn">
    <input id="txtFormular" type="text" style="width:70%;font-size:16px;" /><input id="Button1" type="button"
        value="确定" onclick="setOk(this);" />
</div>--%>
<div id="lr">
     <ul id="ulCol">
         <asp:Repeater ID="Repeater1" runat="server">
         <ItemTemplate>
         <li><a href="#" data="<%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %>.<%#((SYS_BILL_COL)Container.DataItem).COL_NAME %>" onclick="selCol(this);"><%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %>-<font color='blue'><%#((SYS_BILL_COL)Container.DataItem).COL_NAME %></font>-<font color='blue'><%#((SYS_BILL_COL)Container.DataItem).COL_NOTE %></font></a></li>
         </ItemTemplate>
         </asp:Repeater> 
     </ul>
</div>

</asp:Content>


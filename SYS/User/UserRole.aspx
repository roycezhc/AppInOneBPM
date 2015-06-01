<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_UserRole" CodeFile="UserRole.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var selectedID = "";
    var selTR = null;
    $(function () {
        var trs = $("#tbodyList").find("tr");
        for (var i = 0; i < trs.length; i++) {
            var trObj = $(trs[i]);
            trObj.bind("click", trObj, function (e) {
                selTR = e.data;
                var tds = selTR.children();
                selectedID = $(tds[0]).text();
                trs.removeClass("sel");
                e.data.addClass("sel");
            });

            trObj.bind("mouseover", trObj, function (e) {
                trs.removeClass("over");
                e.data.addClass("over");
            });
        }
    });

    function _addOneAndReturn(id) {
        var hidObj = $("input[id$='hidMulIDS']");
        var oldIDS = hidObj.val();
        var temp = "," + oldIDS + ",";
        if (temp.indexOf("," + id + ",") != -1) {
            alert("您所选的记录已经存在！");
        } else {
            if (oldIDS != "") {
                oldIDS += "," + id;
            } else {
                oldIDS = id;
            }
        }
        hidObj.val(oldIDS);
        return oldIDS;
    }

    function _getSelRealIDS() {
        return $("input[id$='hidMulIDS']").val();
    }

    function _delOneSetHidden(id) {
        var hidObj = $("input[id$='hidMulIDS']");
        var oldIDS = hidObj.val();
        var re = "";
        if (oldIDS.indexOf(",") != -1) {
            var arr = oldIDS.split(',');
            for (var a = 0; a < arr.length; a++) {
                if (id != arr[a]) {
                    re += re == "" ? arr[a] : "," + arr[a];
                }
            }
        } else {
            if (id != oldIDS) {
                re = oldIDS;
            }
        }
        hidObj.val(re);
    }

    function _delOneAndReturn() {
        if (selectedID == "") {
            alert("请选择一条记录！");
            return "";
        }
        _delOneSetHidden(selectedID);
        selTR.remove();
        return selectedID;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidOneID" type="hidden" runat="server" /><!--一对多关系中一那个表的主键-->
<input id="hidMulIDS" type="hidden" runat="server" /><!--一对多关系中多那个表的主键-->
<div class="main100">
     <div class="tblist">
         <table cellpadding="0" cellspacing="0">
            <thead >
                <tr>
                    <td><%=SYS_ROLE.Attribute.ROLE_ID._ZhName %></td>
                    <td><%=SYS_ROLE.Attribute.ROLE_NAME._ZhName %></td>
                    <td><%=SYS_ROLE.Attribute.CREATER._ZhName %></td>
                    <td><%=SYS_ROLE.Attribute.CREATIME._ZhName %></td>
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_ID%></td>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_NAME%></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATER%></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATIME%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>
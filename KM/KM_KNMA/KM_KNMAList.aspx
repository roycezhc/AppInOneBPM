<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAList" CodeFile="KM_KNMAList.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b>知识列表</b></dt><dd><a href='<%=preUrl %>'>返回</a></dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool">
        <ul>

        </ul>
        <ol>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ScoreID">
                    <td class="first"></td>
                    <td>操作</td>
                    <td>类别</td>
                    <td>名称</td>
                    <td>文档编号</td>
                    <td>安全级</td>
                    <td>修改用户</td>
                    <td>修改时间</td>
                    <td>录入人员</td>
                    <td>录入时间</td>
                    <td>作者</td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><input type="image" value="增删改" src="#" /></td>
                    <td><%#((KM_KNMA)Container.DataItem).UP_TYPE%></td>
                    <td><%#((KM_KNMA)Container.DataItem).KNMA_NAME%>%</td>
                    <td>文档编号</td>
                    <td><%#((KM_KNMA)Container.DataItem).S_LEVEL%></td>
                    <td><%#((KM_KNMA)Container.DataItem).EDIT_USER%></td>
                    <td><%#((KM_KNMA)Container.DataItem).EDIT_TIME%></td>
                    <td><%#((KM_KNMA)Container.DataItem).ADD_USER%></td>
                    <td><%#((KM_KNMA)Container.DataItem).ADD_TIME%></td>
                    <td><%#((KM_KNMA)Container.DataItem).AUTHOR%></td>
                </tr>
                <tr>
                <td class="first"></td>
                <td colspan="10">
                <%#((KM_KNMA)Container.DataItem).CONTENT%>
                </td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
            <tfoot>
               
            </tfoot>
         </table>
    </div>
</div>
</asp:Content>
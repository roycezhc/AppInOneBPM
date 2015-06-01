<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLITEMManage" CodeFile="COLITEMManage.aspx.cs" %>
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
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input power="newSYS_BILL_COLITEM" id="btn_New" type="button" value="新建" onclick="manager.newRecord('COLITEMEdit.aspx?ColID=<%=pid %>');" /></span></li>
            <li><span><input power="editSYS_BILL_COLITEM" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('COLITEMEdit.aspx?ColID=<%=pid %>');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('COLITEMBack.aspx');" /></span></li>
        </ul>

    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ITEM_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="SYS_BILL_COLITEMManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    <td data="{colname:'<%=SYS_BILL_COLITEM.Attribute.ITEM_ID.LongName%>',show:1}"><%=SYS_BILL_COLITEM.Attribute.ITEM_ID._ZhName %></td><!--数据列选项-->
           <%--         <td data="{colname:'<%=SYS_BILL_COLITEM.Attribute.COL_ID.LongName%>',show:1}"><%=SYS_BILL_COLITEM.Attribute.COL_ID._ZhName %></td><!--所属列ID-->
                    --%>
                    <td data="{colname:'<%=SYS_BILL_COLITEM.Attribute.TXT.LongName%>',show:1}"><%=SYS_BILL_COLITEM.Attribute.TXT._ZhName %></td><!--选项名-->
                    <td data="{colname:'<%=SYS_BILL_COLITEM.Attribute.VAL.LongName%>',show:1}"><%=SYS_BILL_COLITEM.Attribute.VAL._ZhName %></td><!--选项值-->
<%--                    
                    <td data="{colname:'<%=SYS_BILL_COLITEM.Attribute.SHOW_COL_REAL.LongName%>',show:1}"><%=SYS_BILL_COLITEM.Attribute.SHOW_COL_REAL._ZhName %></td><!--根据其他列值是否显示此选项-->--%>
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            <td>{ITEM_ID}</td>
           <%-- <td>{COL_ID}</td>--%>
            <td>{TXT}</td>
            <td>{VAL}</td>
           <%-- <td>{SHOW_COL_REAL}</td>--%>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL_COLITEM)Container.DataItem).ITEM_ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_BILL_COLITEM)Container.DataItem).PATH, ((SYS_BILL_COLITEM)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).ITEM_ID %></td>
                  <%--  <td><%#((SYS_BILL_COLITEM)Container.DataItem).COL_ID %></td>--%>
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).TXT %></td>
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).VAL %></td>
                    <%--<td><%#((SYS_BILL_COLITEM)Container.DataItem).SHOW_COL_REAL %></td>--%>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>
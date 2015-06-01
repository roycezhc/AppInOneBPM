<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="RELAManage.aspx.cs" Inherits="SYS_BILL_RELAManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
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
            <li><span><input power="newSYS_BILL_RELA" id="btn_New" type="button" value="新建" onclick="manager.newRecord('RELAEdit.aspx?BillID=<%=billid %>');" /></span></li>
            <li><span><input power="editSYS_BILL_RELA" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('RELAEdit.aspx?BillID=<%=billid %>');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelID('RELABack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="REAL_ID">
                    <td class="first"></td>
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.REAL_ID.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.REAL_ID._ZhName%></td><!--表单ID-->
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.TABLE_COL_PK.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.TABLE_COL_PK._ZhName %></td><!--主键字段-->
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.TABLE_COL_FK.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.TABLE_COL_FK._ZhName %></td><!--外键字段-->
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.RELATION_TYPE.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.RELATION_TYPE._ZhName %></td><!--关联类型-->
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.RELATION_TABLE.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.RELATION_TABLE._ZhName %></td><!--第三方关联表-->
                    <td data="{colname:'<%=SYS_BILL_RELA.Attribute.RELATION_NAME.LongName%>',show:1}"><%=SYS_BILL_RELA.Attribute.RELATION_NAME._ZhName %></td><!--关系名-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
            <td class="first"></td>
            <td>{REAL_ID}</td>
            <td>{TABLE_COL_PK}</td>
            <td>{TABLE_COL_FK}</td>
            <td>{RELATION_TYPE}</td>
            <td>{RELATION_TABLE}</td>
            <td>{RELATION_NAME}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((SYS_BILL_RELA)Container.DataItem).REAL_ID%></td>
                    <td><%#((SYS_BILL_RELA)Container.DataItem).TABLE_COL_PK %></td>
                    <td><%#((SYS_BILL_RELA)Container.DataItem).TABLE_COL_FK %></td>
                    <td><%#FormHelper.GetText(SYS_BILL_RELA.Attribute.RELATION_TYPE, ((SYS_BILL_RELA)Container.DataItem).RELATION_TYPE)%></td>
                    <td><%#((SYS_BILL_RELA)Container.DataItem).RELATION_TABLE %></td>
                    <td><%#((SYS_BILL_RELA)Container.DataItem).RELATION_NAME %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>
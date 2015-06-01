<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUReal" CodeFile="KM_PART_STRUReal.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
<script type="text/javascript">
   

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidOneID" type="hidden" runat="server" /><!--一对多关系中一那个表的主键-->
<input id="hidMulIDS" type="hidden" runat="server" /><!--一对多关系中多那个表的主键-->
<div class="main">
     <div class="tblist" style="height:auto;">
         <table cellpadding="0" cellspacing="0">
            <thead >
                <tr>
                    <td class="<%=hideEditLinkClsName %>">&nbsp;</td>
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_ID._ZhName %></td><!--PART_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_NAME._ZhName %></td><!--PART_NAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.K_PART_ID._ZhName %></td><!--K_PART_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_CONTENT._ZhName %></td><!--PART_CONTENT-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_CLASS_ID._ZhName %></td><!--PART_CLASS_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_EA_SIGN._ZhName %></td><!--PART_EA_SIGN-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_AUTHOR._ZhName %></td><!--PART_AUTHOR-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_IS_READ._ZhName %></td><!--PART_IS_READ-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.IDPATH._ZhName %></td><!--IDPATH-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.KNAME._ZhName %></td><!--KNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SNAME._ZhName %></td><!--SNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.RNAME._ZhName %></td><!--RNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SUB_NUM._ZhName %></td><!--SUB_NUM-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM._ZhName %></td><!--SUBOBJECT_NUM-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.USE_FLAG._ZhName %></td><!--USE_FLAG-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP1._ZhName %></td><!--EXP1-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP2._ZhName %></td><!--EXP2-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP3._ZhName %></td><!--EXP3-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP4._ZhName %></td><!--EXP4-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="<%#hideEditLinkClsName %>">
                    <a href="KM_PART_STRUFEdit.aspx?PART_ID=<%#((KM_PART_STRU)Container.DataItem).PART_ID %>">编辑</a>
                    <a href="" data="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>">移除</a>
                    </td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_NAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).K_PART_ID %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_PART_STRU)Container.DataItem).PART_CONTENT) %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_CLASS_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_EA_SIGN %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_AUTHOR %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_IS_READ %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).IDPATH %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).KNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).RNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUB_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUBOBJECT_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).USE_FLAG %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP4 %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>
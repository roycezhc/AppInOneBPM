<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAReal" CodeFile="KM_KNMAReal.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem" %>
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
                    
                    
                    <td><%=KM_KNMA.Attribute.KNMA_ID._ZhName %></td><!--知识标识-->
                    
                    
                    <td><%=KM_KNMA.Attribute.KNMA_NAME._ZhName %></td><!--知识标题-->
                    
                    
                    <td><%=KM_KNMA.Attribute.P_KNMA_ID._ZhName %></td><!--父级ID-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CONTENT._ZhName %></td><!--知识内容-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CLASS_ID._ZhName %></td><!--知识类别-->
                    
                    
                    <td><%=KM_KNMA.Attribute.UP_TYPE._ZhName %></td><!--上传文档类型-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EA_SIGN._ZhName %></td><!--审批标志-->
                    
                    
                    <td><%=KM_KNMA.Attribute.AUTHOR._ZhName %></td><!--作者-->
                    
                    
                    <td><%=KM_KNMA.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    
                    
                    <td><%=KM_KNMA.Attribute.DEPT_ID._ZhName %></td><!--部门编号-->
                    
                    
                    <td><%=KM_KNMA.Attribute.ADD_TIME._ZhName %></td><!--文件录入时间-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EDIT_TIME._ZhName %></td><!--文件编辑时间-->
                    
                    
                    <td><%=KM_KNMA.Attribute.PATH_ID._ZhName %></td><!--上级编号-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CAN_EDIT._ZhName %></td><!--允许共同编辑-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CAN_COMMENTS._ZhName %></td><!--允许评论-->
                    
                    
                    <td><%=KM_KNMA.Attribute.ADD_USER._ZhName %></td><!--录入人-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EDIT_USER._ZhName %></td><!--编辑人-->
                    
                    
                    <td><%=KM_KNMA.Attribute.S_LEVEL._ZhName %></td><!--安全级别-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP1._ZhName %></td><!--自定义1-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP2._ZhName %></td><!--自定义2-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP3._ZhName %></td><!--自定义3-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP4._ZhName %></td><!--自定义4-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="<%#hideEditLinkClsName %>">
                    <a href="KM_KNMAFEdit.aspx?KNMA_ID=<%#((KM_KNMA)Container.DataItem).KNMA_ID %>">编辑</a>
                    <a href="" data="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>">移除</a>
                    </td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).KNMA_ID %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).KNMA_NAME %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).P_KNMA_ID %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).CONTENT %></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CLASS_ID, ((KM_KNMA)Container.DataItem).CLASS_ID)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.UP_TYPE, ((KM_KNMA)Container.DataItem).UP_TYPE)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.EA_SIGN, ((KM_KNMA)Container.DataItem).EA_SIGN)%></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).AUTHOR %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#(((KM_KNMA)Container.DataItem).ADD_TIME == DateTime.MinValue) ? "" : ((KM_KNMA)Container.DataItem).ADD_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((KM_KNMA)Container.DataItem).EDIT_TIME == DateTime.MinValue) ? "" : ((KM_KNMA)Container.DataItem).EDIT_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).PATH_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CAN_EDIT, ((KM_KNMA)Container.DataItem).CAN_EDIT)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CAN_COMMENTS, ((KM_KNMA)Container.DataItem).CAN_COMMENTS)%></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).ADD_USER %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_KNMA)Container.DataItem).EDIT_USER) %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).S_LEVEL %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP4 %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>
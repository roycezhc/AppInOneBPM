<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksShow.aspx.cs" Inherits="Ec_blocksShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>：</dt><%--Blockid--%>
               <dd>
               
                    <asp:Label id="txtBlockid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>：</dt><%--模块id--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>：</dt><%--显示区域名称--%>
               <dd>
               
                    <asp:Label id="txtBlocklabel" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>：</dt><%--显示顺序--%>
               <dd>
               
                    <asp:Label id="txtSequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>：</dt><%--标题--%>
               <dd>
               
                    <asp:Label id="txtShow_title" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>：</dt><%--是否可见--%>
               <dd>
               
                    <asp:Label id="txtVisible" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>：</dt><%--Create_--%>
               <dd>
               
                    <asp:Label id="txtCreate_view" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>：</dt><%--Edit_vi--%>
               <dd>
               
                    <asp:Label id="txtEdit_view" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>：</dt><%--Detail_--%>
               <dd>
               
                    <asp:Label id="txtDetail_view" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_MODELShow.aspx.cs" Inherits="WEC_MODELShow" %>
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
               <dt><%=WEC_MODEL.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.TYPE.ZhName %>：</dt><%--类型--%>
               <dd>
               
                    <asp:Label id="txtTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.PIC_URL.ZhName %>：</dt><%--图片地址--%>
               <dd>
               
                    <asp:Label id="txtPIC_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.PATH.ZhName %>：</dt><%--模版路径--%>
               <dd>
               
                    <asp:Label id="txtPATH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_MODEL.Attribute.NAME.ZhName %>：</dt><%--标题--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
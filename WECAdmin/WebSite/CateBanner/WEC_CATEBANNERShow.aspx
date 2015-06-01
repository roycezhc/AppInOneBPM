<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CATEBANNERShow.aspx.cs" Inherits="WEC_CATEBANNERShow" %>
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
               <dt><%=WEC_CATEBANNER.Attribute.ID.ZhName %>£º</dt><%--±àºÅ--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.AID.ZhName %>£º</dt><%--¹«ÖÚºÅ±àºÅ--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.PIC_URL.ZhName %>£º</dt><%--Í¼Æ¬µØÖ·--%>
               <dd>
               
                    <asp:Label id="txtPIC_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.OUT_URL.ZhName %>£º</dt><%--Á´½ÓµØÖ·--%>
               <dd>
               
                    <asp:Label id="txtOUT_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.SORT_ID.ZhName %>£º</dt><%--ÅÅÐò--%>
               <dd>
               
                    <asp:Label id="txtSORT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.STATUS.ZhName %>£º</dt><%--×´Ì¬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CATEBANNER.Attribute.ADDTIME.ZhName %>£º</dt><%--Ìí¼ÓÊ±¼ä--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
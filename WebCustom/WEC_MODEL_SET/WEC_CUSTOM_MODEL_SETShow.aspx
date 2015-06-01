<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_MODEL_SETShow.aspx.cs" Inherits="WEC_CUSTOM_MODEL_SETShow" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
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
   <div class="relationlist">
       <%-- <%if(valObj.DataBaseTable()!=null)
              foreach (DataBaseTable dt1 in valObj.DataBaseTable().SubTable)
              {
                  %>
                  <a href=""><%=dt1.ZhName %>,<%=dt1.IDField %><%=dt1.NameField %></a>
                  <%
              }%>--%>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.ID.ZhName %>£º</dt><%--±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_MODEL_SET_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.A_ID.ZhName %>£º</dt><%--¹«ÖÚºÅ±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_MODEL_SET_A_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.M_ID.ZhName %>£º</dt><%--Ä£°æ±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_MODEL_SET_M_ID' runat='server'></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_WEB_SETShow.aspx.cs" Inherits="WEC_CUSTOM_WEB_SETShow" %>
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
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.ID.ZhName %>£º</dt><%--±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_WEB_SET_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.STAFF_ID.ZhName %>£º</dt><%--ÓÃ»§±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_WEB_SET_STAFF_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.A_ID.ZhName %>£º</dt><%--ÍøÕ¾±àºÅ--%>
               <dd>
               
                    <asp:Label id='txtWEC_CUSTOM_WEB_SET_A_ID' runat='server'></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
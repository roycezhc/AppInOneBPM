<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_APPShow.aspx.cs" Inherits="SYS_APPShow" %>
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
               <dt><%=SYS_APP.Attribute.APP_ID.ZhName %>：</dt><%--APP_ID--%>
               <dd>
               
                    <asp:Label id='txtAPP_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.APP_NAME.ZhName %>：</dt><%--APP_NAM--%>
               <dd>
               
                    <asp:Label id='txtAPP_NAME' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.APP_LABEL.ZhName %>：</dt><%--应用系统名--%>
               <dd>
               
                    <asp:Label id='txtAPP_LABEL' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.DEFAULT_URL.ZhName %>：</dt><%--内部首页地址--%>
               <dd>
               
                    <asp:Label id='txtDEFAULT_URL' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.DEFAULT_URL_NAME.ZhName %>：</dt><%--内部首页名称--%>
               <dd>
               
                    <asp:Label id='txtDEFAULT_URL_NAME' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.IsBigSystem.ZhName %>：</dt><%--是否独立系统--%>
               <dd>
               
                    <asp:Label id='txtIsBigSystem' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.Note.ZhName %>：</dt><%--备注--%>
               <dd>
               
                    <asp:Label id='txtNote' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_APP.Attribute.APP_IMG.ZhName %>：</dt><%--图标--%>
               <dd>
               
                    <asp:Label id='txtAPP_IMG' runat='server'></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
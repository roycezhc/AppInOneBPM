<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CTRL_TYPEShow" CodeFile="CTRL_TYPEShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
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
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE.ZhName %>£º</dt><%--CTRL_TYPE--%>
               <dd>
                
                    <asp:Label id="txtCTRL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE.ZhName %>£º</dt><%--P_CTRL_TYPE--%>
               <dd>
                
                    <asp:Label id="txtP_CTRL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_NAME.ZhName %>£º</dt><%--ÀàÐÍÃû--%>
               <dd>
                
                    <asp:Label id="txtCTRL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_CTRL_TYPE.Attribute.EL_HTML.ZhName %>£º</dt><%--EL_HTML--%>
               <dd>
               
                    <asp:Label id="txtEL_HTML" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_CTRL_TYPE.Attribute.SORT_NO.ZhName %>£º</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_CTRL_TYPE.Attribute.JS_CODE.ZhName %>£º</dt><%--JS_CODE--%>
               <dd>
               
                    <asp:Label id="txtJS_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
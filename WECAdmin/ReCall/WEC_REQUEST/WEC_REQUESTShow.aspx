<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTShow.aspx.cs" Inherits="WEC_REQUESTShow" %>
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
               <dt><%=WEC_REQUEST.Attribute.TID.ZhName %>：</dt><%--回复ID--%>
               <dd>
               
                    <asp:Label id="txtTID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>：</dt><%--公众号ID--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.KEYWORD.ZhName %>：</dt><%--关键字--%>
               <dd>
               
                    <asp:Label id="txtKEYWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.MATCH_TYPE.ZhName %>：</dt><%--匹配类型--%>
               <dd>
               
                    <asp:Label id="txtMATCH_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.MEMO.ZhName %>：</dt><%--内容--%>
               <dd>
               
                    <asp:Label id="txtMEMO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.KIND.ZhName %>：</dt><%--回复类型--%>
               <dd>
               
                    <asp:Label id="txtKIND" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
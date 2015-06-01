<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUEST_DETAILShow.aspx.cs" Inherits="WEC_REQUEST_DETAILShow" %>
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
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ID.ZhName %>：</dt><%--详细ID--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TID.ZhName %>：</dt><%--回复ID--%>
               <dd>
               
                    <asp:Label id="txtTID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TITLE.ZhName %>：</dt><%--标题--%>
               <dd>
               
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID.ZhName %>：</dt><%--排序--%>
               <dd>
               
                    <asp:Label id="txtSORT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.PICURL.ZhName %>：</dt><%--图片地址--%>
               <dd>
               
                    <asp:Label id="txtPICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID.ZhName %>：</dt><%--业务类型--%>
               <dd>
               
                    <asp:Label id="txtTYPE_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE.ZhName %>：</dt><%--业务值--%>
               <dd>
               
                    <asp:Label id="txtTYPE_VALUE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
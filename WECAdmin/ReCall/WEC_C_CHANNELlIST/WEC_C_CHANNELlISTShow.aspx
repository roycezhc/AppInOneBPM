<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTShow.aspx.cs" Inherits="WEC_C_CHANNELlISTShow" %>
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
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>：</dt><%--渠道名称--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>：</dt><%--渠道url--%>
               <dd>
               
                    <asp:Label id="txtURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>：</dt><%--渠道备注--%>
               <dd>
               
                    <asp:Label id="txtREMARK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>：</dt><%--渠道分类--%>
               <dd>
               
                    <asp:Label id="txtCATEGORY_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>：</dt><%--二维码样式--%>
               <dd>
               
                    <asp:Label id="txtQRCODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>：</dt><%--备注信息--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>：</dt><%--渠道所在地区--%>
               <dd>
               
                    <asp:Label id="txtADDRESS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>：</dt><%--渠道类型--%>
               <dd>
               
                    <asp:Label id="txtTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>
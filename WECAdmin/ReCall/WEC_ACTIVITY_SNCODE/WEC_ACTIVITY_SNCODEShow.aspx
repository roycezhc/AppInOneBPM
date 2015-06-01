<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITY_SNCODEShow.aspx.cs" Inherits="WEC_ACTIVITY_SNCODEShow" %>
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
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.ZhName %>：</dt><%--SN码--%>
               <dd>
               
                    <asp:Label id="txtSN_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.ZhName %>：</dt><%--奖品类别--%>
               <dd>
               
                    <asp:Label id="txtAWARD_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.ZhName %>：</dt><%--领取者手机号--%>
               <dd>
               
                    <asp:Label id="txtPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.ZhName %>：</dt><%--领取者微信码--%>
               <dd>
               
                    <asp:Label id="txtWX_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.ZhName %>：</dt><%--中奖时间--%>
               <dd>
               
                    <asp:Label id="txtZJ_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.ZhName %>：</dt><%--使用时间--%>
               <dd>
               
                    <asp:Label id="txtSY_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.ZhName %>：</dt><%--活动ID--%>
               <dd>
               
                    <asp:Label id="txtA_ID" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>